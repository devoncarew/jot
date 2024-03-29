/// To create a new [Workspace], see [Workspace.fromPackage].
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
import 'src/signature.dart';
import 'src/utils.dart';
import 'workspace.dart';

class Jot {
  final Directory inDir;
  final Directory outDir;
  final bool signature;

  final Logger logger;

  late final Analyzer analyzer;
  late final HtmlTemplate htmlTemplate;

  Jot({
    required this.inDir,
    required this.outDir,
    this.signature = false,
    Logger? logger,
  }) : logger = logger ?? Logger.standard();

  Future<void> generate() async {
    if (!outDir.existsSync()) {
      outDir.createSync(recursive: true);
    }

    var stats = Stats()..start();

    htmlTemplate = await HtmlTemplate.createDefault();
    analyzer =
        Analyzer.packages(includedPaths: [p.normalize(inDir.absolute.path)]);

    var progress = logger.progress('Resolving public libraries');
    var workspace = await _buildWorkspace();
    progress.finish();

    // build model
    workspace.api.finish();

    // generate
    logger.stdout('');
    logger.stdout('Generating docs...');

    // generate docs
    final generator = Generator(
      workspace: workspace,
      outDir: outDir,
      logger: logger,
      stats: stats,
    );
    await generator.generate();

    if (signature) {
      final sigOut = Directory(p.join(outDir.parent.path, 'sig'))..createSync();
      final sig = MarkdownSignature(
          workspace: workspace, outDir: sigOut, logger: logger, stats: stats);
      sig.generate();
    }

    stats.stop();

    logger.stdout('');
    // "1,347 symbols, 82% have documentation, 4 libraries, 8MB of html, 0.3s"
    logger.stdout('Wrote docs to ${p.relative(outDir.path)} in '
        '${stats.elapsedSeconds}s (${stats.fileCount} files, '
        '${stats.sizeDesc}).');
  }

  Future<DocServer> serve(int port) async {
    htmlTemplate = await HtmlTemplate.createDefault();
    analyzer =
        Analyzer.packages(includedPaths: [p.normalize(inDir.absolute.path)]);

    var progress = logger.progress('Resolving public libraries');
    var workspace = await _buildWorkspace();
    progress.finish();

    // build model
    workspace.api.finish();

    logger.stdout('');

    var server = DocServer(jot: this, workspace: workspace);
    await server.start(port);
    return server;
  }

  Future<Workspace> _buildWorkspace() async {
    var workspace = Workspace.fromPackage(htmlTemplate, inDir);
    var packageName = workspace.name.substring('package:'.length);

    final libDirPath = p.join(inDir.path, 'lib');

    // TODO: build up the api and the workspace separately; we need a better
    // picture of the API before we start assigning elements to pages

    await for (var resolvedLibrary in analyzer.resolvedPublicLibraries()) {
      var libraryPath = resolvedLibrary.element.source.fullName;

      var dartLibraryPath = p.relative(libraryPath, from: libDirPath);
      var htmlOutputPath = '${p.withoutExtension(dartLibraryPath)}.html';

      var libraryContainer = workspace.addChild(WorkspaceDirectory(
        workspace,
        dartLibraryPath,
      ));

      var library = workspace.api
          .addLibrary(resolvedLibrary.element, workspace.name, dartLibraryPath);

      libraryContainer.mainFile = WorkspaceFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        libraryGenerator(library),
      )..importScript = 'package:$packageName/$dartLibraryPath';

      workspace.api.addResolution(library, libraryContainer.mainFile!);

      for (var itemContainer in library.allChildrenSorted.whereType<Items>()) {
        var path =
            '${p.withoutExtension(dartLibraryPath)}/${itemContainer.name}.html';
        var docFile = WorkspaceFile(
          libraryContainer,
          itemContainer.name,
          path,
          itemsGenerator(itemContainer),
        );
        libraryContainer.addChild(docFile);
        workspace.api.addResolution(itemContainer, docFile);
      }
    }

    workspace.api.packages.first.version = workspace.version;
    workspace.api.packages.first.description = workspace.description;

    return workspace;
  }
}

class DocServer {
  final Jot jot;
  Workspace workspace;
  late final HttpServer _server;

  DocServer({
    required this.jot,
    required this.workspace,
  });

  int get port => _server.port;

  Logger get logger => jot.logger;

  Response _notFound(Request request) {
    return Response.notFound('404 - page not found: ${request.url.path}');
  }

  Future<Response> _contentHandler(Request request) async {
    var filePath = request.url.path;
    if (!filePath.endsWith('.html')) return _notFound(request);

    // Check for changed dart sources.
    if (await jot.analyzer.reanalyzeChanges()) {
      workspace = await jot._buildWorkspace();
      workspace.api.finish();
    }

    var file = workspace.getForPath(filePath);
    if (file == null) {
      return _notFound(request);
    } else {
      var pageContents = await file.generatePageContents();
      var fileContents =
          await workspace.generateWorkspacePage(file, pageContents);
      return Response.ok(fileContents, headers: headersFor(filePath));
    }
  }

  Future<Response> _resourcesHandler(Request request) {
    var path = request.url.path;

    return loadResourceDataAsBytes(path).then((data) {
      return Response.ok(data, headers: headersFor(path));
    }).onError((error, _) {
      return _notFound(request);
    });
  }

  Handler _loggingHandler(Handler handler) {
    final ansi = logger.ansi;

    return (Request request) async {
      final timer = Stopwatch()..start();
      final response = await handler(request);
      timer.stop();

      final ms = timer.elapsedMilliseconds;
      final size = ((response.contentLength ?? 0) + 512) ~/ 1024;
      final code = response.statusCode;
      final path = request.url.path;

      logger.stdout(
        '${ansi.blue}${ms.toString().padLeft(3)}ms '
        '${size.toString().padLeft(3)}k${ansi.none} '
        '${ansi.green}${ansi.bullet}${ansi.none} $code $path',
      );

      return response;
    };
  }

  Future<void> start(int port) async {
    var app = Router(notFoundHandler: _contentHandler);
    app.get('/', (Request request) {
      return Response.movedPermanently('index.html');
    });
    app.get('/favicon.ico', (Request request) async {
      return Response.ok(await loadResourceDataAsBytes('dart.png'),
          headers: headersFor('dart.png'));
    });
    app.get('/_resources/index.json', (Request request) async {
      return Response.ok(workspace.api.index.toJson(),
          headers: headersFor(request.url.path));
    });
    app.get('/_resources/nav.json', (Request request) async {
      return Response.ok(workspace.generateNavData(),
          headers: headersFor(request.url.path));
    });
    app.mount('/_resources', Router(notFoundHandler: _resourcesHandler).call);

    _server = await shelf_io.serve(
      _loggingHandler(app.call),
      'localhost',
      port,
    );
    logger.stdout(
        'Serving docs at http://${_server.address.host}:${_server.port}/.');
  }

  Future<void> dispose() => _server.close();
}
