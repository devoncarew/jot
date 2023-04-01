/// To create a new [DocWorkspace], see [DocWorkspace.fromPackage].
///
/// To generate docs, see [DocWorkspace.generate].
library;

import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as p;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import 'api.dart';
import 'src/analysis.dart';
import 'src/generate.dart';
import 'src/html.dart';
import 'src/utils.dart';
import 'workspace.dart';

// todo: hoist to another isolate to get better progress reporting

class Jot {
  final Directory inDir;
  final Directory outDir;

  Jot({required this.inDir, required this.outDir});

  Future<void> generate() async {
    var log = Logger.standard();

    if (!outDir.existsSync()) {
      outDir.createSync(recursive: true);
    }

    var stats = Stats()..start();

    var htmlTemplate = await HtmlTemplate.initDir(outDir, stats: stats);
    var analysisHelper = AnalysisHelper.package(inDir);

    var progress = log.progress('Resolving public libraries');
    var workspace = await _buildWorkspace(htmlTemplate, analysisHelper);
    progress.finish();

    // build model
    workspace.api!.finish();

    // generate
    log.stdout('');
    log.stdout('Generating docs...');

    // generate docs
    // todo: switch this to use a Generator instance
    await workspace.generate(outDir, logger: log, stats: stats);

    stats.stop();

    log.stdout('');
    // "1,347 symbols, 82% have documentation, 4 libraries, 8MB of html, 0.3s"
    log.stdout('Wrote docs to ${p.relative(outDir.path)} in '
        '${stats.elapsedSeconds}s (${stats.fileCount} files, '
        '${stats.sizeDesc}).');
  }

  Future<void> serve(int port) async {
    var log = Logger.standard();

    var htmlTemplate = await HtmlTemplate.initDir(outDir, writeResouces: false);
    var analysisHelper = AnalysisHelper.package(inDir);

    var progress = log.progress('Resolving public libraries');
    var workspace = await _buildWorkspace(htmlTemplate, analysisHelper);
    progress.finish();

    // build model
    workspace.api!.finish();

    log.stdout('');

    Response notFound(Request request) {
      return Response.notFound('404 - page not found: ${request.url.path}');
    }

    Future<Response> echoRequest(Request request) async {
      var filePath = request.url.path;
      if (!filePath.endsWith('.html')) return notFound(request);

      // check for changed dart sources
      if (await analysisHelper.reanalyzeChanges()) {
        workspace = await _buildWorkspace(htmlTemplate, analysisHelper);
        workspace.api!.finish();
      }

      var file = workspace.getForPath(filePath);
      if (file == null) {
        return notFound(request);
      } else {
        log.stdout('${request.requestedUri}');

        var pageContents = await file.generatePageContents();
        var fileContents =
            await workspace.generateWorkspacePage(file, pageContents);
        return Response.ok(fileContents, headers: _headersFor(filePath));
      }
    }

    Future<Response> resourcesHandler(Request request) {
      var path = request.url.path;

      return _loadResourceData(path).then((data) {
        return Response.ok(data, headers: _headersFor(path));
      }).onError((error, _) {
        return notFound(request);
      });
    }

    var app = Router(notFoundHandler: echoRequest);
    app.get('/', (Request request) {
      return Response.movedPermanently('index.html');
    });
    app.get('/favicon.ico', (Request request) async {
      return Response.ok(await _loadResourceData('dart.png'),
          headers: _headersFor('dart.png'));
    });
    app.mount('/resources', Router(notFoundHandler: resourcesHandler).call);

    var server = await shelf_io.serve(app.call, 'localhost', port);
    log.stdout(
        'Serving docs at http://${server.address.host}:${server.port}/.');
    log.stdout('');
  }

  Future<DocWorkspace> _buildWorkspace(
      HtmlTemplate htmlTemplate, AnalysisHelper analysisHelper) async {
    var workspace = DocWorkspace.fromPackage(htmlTemplate, inDir);
    var packageName = workspace.name.substring('package:'.length);

    final libDirPath = p.join(inDir.path, 'lib');

    workspace.api = Api();

    await for (var resolvedLibrary
        in analysisHelper.resolvedPublicLibraries()) {
      var libraryPath = resolvedLibrary.element.source.fullName;

      var dartLibraryPath = p.relative(libraryPath, from: libDirPath);
      var htmlOutputPath = '${p.withoutExtension(dartLibraryPath)}.html';

      var packageContainer = workspace.addChild(DocContainer(
        workspace,
        dartLibraryPath,
      ));

      var library =
          workspace.api!.addLibrary(packageName, resolvedLibrary.element);

      packageContainer.mainFile = DocFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        libraryGenerator(library),
      )..importScript = 'package:$packageName/$dartLibraryPath';

      workspace.api!
          .addResolution(resolvedLibrary.element, packageContainer.mainFile!);

      for (var itemContainer in library.allChildrenSorted.whereType<Items>()) {
        var path =
            '${p.withoutExtension(dartLibraryPath)}/${itemContainer.name}.html';
        var docFile = DocFile(
          packageContainer,
          itemContainer.name,
          path,
          // todo: clean up the modeling here
          itemContainer is ExtensionElementItems
              ? extensionElementGenerator(itemContainer)
              : interfaceElementGenerator(
                  itemContainer as InterfaceElementItems),
        );
        packageContainer.addChild(docFile);
        workspace.api!.addResolution(itemContainer.element, docFile);
      }
    }

    return workspace;
  }
}

Future<Uint8List> _loadResourceData(String name) async {
  var packageUri = Uri.parse('package:jot/resources/$name');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsBytesSync();
}

const _mimeMap = {
  'css': 'text/css',
  'html': 'text/html',
  'js': 'text/javascript',
  'png': 'image/png',
  'svg': 'image/svg+xml',
};

Map<String, Object> _headersFor(String path) {
  var ext = p.extension(path).toLowerCase();
  var mime =
      (ext.startsWith('.') ? _mimeMap[ext.substring(1)] : null) ?? 'text/plain';
  return {'content-type': mime};
}
