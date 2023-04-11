/// To create a new [DocWorkspace], see [DocWorkspace.fromPackage].
///
/// To generate docs, see [DocWorkspace.generate].
library;

import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as p;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import 'api.dart';
import 'src/analysis.dart';
import 'src/generate.dart';
import 'src/html.dart';
import 'src/server.dart';
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
    var analyzer =
        Analyzer.packages(includedPaths: [p.normalize(inDir.absolute.path)]);

    var progress = log.progress('Resolving public libraries');
    var workspace = await _buildWorkspace(htmlTemplate, analyzer);
    progress.finish();

    // build model
    workspace.api!.finish();
    // TODO: change this to writeIndex() in the generator
    var indexFile = File(p.join(outDir.path, 'resources', 'index.json'));
    indexFile.writeAsStringSync(workspace.api!.index.toJson());
    stats.genFile(indexFile);

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
    var analyzer =
        Analyzer.packages(includedPaths: [p.normalize(inDir.absolute.path)]);

    var progress = log.progress('Resolving public libraries');
    var workspace = await _buildWorkspace(htmlTemplate, analyzer);
    progress.finish();

    // build model
    workspace.api!.finish();

    log.stdout('');

    Response notFound(Request request) {
      return Response.notFound('404 - page not found: ${request.url.path}');
    }

    Future<Response> contentHandler(Request request) async {
      var filePath = request.url.path;
      if (!filePath.endsWith('.html')) return notFound(request);

      // check for changed dart sources
      if (await analyzer.reanalyzeChanges()) {
        workspace = await _buildWorkspace(htmlTemplate, analyzer);
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
        return Response.ok(fileContents, headers: headersFor(filePath));
      }
    }

    Future<Response> resourcesHandler(Request request) {
      var path = request.url.path;

      return loadResourceDataAsBytes(path).then((data) {
        return Response.ok(data, headers: headersFor(path));
      }).onError((error, _) {
        return notFound(request);
      });
    }

    var app = Router(notFoundHandler: contentHandler);
    app.get('/', (Request request) {
      return Response.movedPermanently('index.html');
    });
    app.get('/favicon.ico', (Request request) async {
      return Response.ok(await loadResourceDataAsBytes('dart.png'),
          headers: headersFor('dart.png'));
    });
    app.get('/resources/index.json', (Request request) async {
      return Response.ok(workspace.api!.index.toJson(),
          headers: headersFor(request.url.path));
    });
    app.mount('/resources', Router(notFoundHandler: resourcesHandler).call);

    // TODO: move most of this to a server class
    var server = await shelf_io.serve(app.call, 'localhost', port);
    log.stdout(
        'Serving docs at http://${server.address.host}:${server.port}/.');
    log.stdout('');
  }

  Future<DocWorkspace> _buildWorkspace(
      HtmlTemplate htmlTemplate, Analyzer analysisHelper) async {
    var workspace = DocWorkspace.fromPackage(htmlTemplate, inDir);
    var packageName = workspace.name.substring('package:'.length);

    final libDirPath = p.join(inDir.path, 'lib');

    workspace.api = Api();

    // TODO: build up the api and the workspace separately; we need a better
    // picture of the API before we start assigning elements to pages

    await for (var resolvedLibrary
        in analysisHelper.resolvedPublicLibraries()) {
      var libraryPath = resolvedLibrary.element.source.fullName;

      var dartLibraryPath = p.relative(libraryPath, from: libDirPath);
      var htmlOutputPath = '${p.withoutExtension(dartLibraryPath)}.html';

      var libraryContainer = workspace.addChild(DocContainer(
        workspace,
        dartLibraryPath,
      ));

      var library = workspace.api!
          .addLibrary(resolvedLibrary.element, workspace.name, dartLibraryPath);

      libraryContainer.mainFile = DocFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        libraryGenerator(library),
      )..importScript = 'package:$packageName/$dartLibraryPath';

      workspace.api!.addResolution(library, libraryContainer.mainFile!);

      for (var itemContainer in library.allChildrenSorted.whereType<Items>()) {
        var path =
            '${p.withoutExtension(dartLibraryPath)}/${itemContainer.name}.html';
        var docFile = DocFile(
          libraryContainer,
          itemContainer.name,
          path,
          itemsGenerator(itemContainer),
        );
        libraryContainer.addChild(docFile);
        workspace.api!.addResolution(itemContainer, docFile);
      }
    }

    return workspace;
  }
}
