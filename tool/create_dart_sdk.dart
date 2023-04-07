import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:jot/api.dart';
import 'package:jot/src/analysis.dart';
import 'package:jot/src/generate.dart';
import 'package:jot/src/html.dart';
import 'package:jot/src/utils.dart';
import 'package:jot/workspace.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  var parser = createArgsParser();
  ArgResults results;

  try {
    results = parser.parse(args);
  } catch (e) {
    printUsage(parser, e);
    exit(64);
  }

  var help = results['help'] as bool;
  if (help) {
    printUsage(parser);
    exit(0);
  }

  var rest = results.rest;
  var sdkDir = rest.isEmpty ? detectSdk : Directory(rest.first);
  if (!sdkDir.existsSync()) {
    stderr.writeln("error: '${sdkDir.path}' does not exist.");
    exit(1);
  }

  validateSdk(sdkDir);

  var outDir = Directory(results['output'] as String);

  await generate(sdkDir, outDir);
}

Future<void> generate(Directory sdkDir, Directory outDir) async {
  var log = Logger.standard();

  if (!outDir.existsSync()) outDir.createSync(recursive: true);

  var versionFile = File(p.join(sdkDir.path, 'version'));
  final version = _parserSdkVersion(versionFile);

  log.stdout('SDK ${sdkDir.path}');
  log.stdout('Version $version');
  log.stdout('');

  log.stdout('Resolving SDK libraries...');

  // parse the libraries file
  var librariesFile = File(p.join(sdkDir.path, 'lib', 'libraries.json'));
  var libraries =
      jsonDecode(librariesFile.readAsStringSync()) as Map<String, dynamic>;

  var libNames = Directory(p.join(sdkDir.path, 'lib'))
      .listSyncSorted()
      .whereType<Directory>()
      .map((d) => d.name)
      .where((name) => !name.startsWith('_'))
      .where((name) => libraryUriFor(name, libraries) != null)
      .toList();

  const knownVmLibs = {
    'cli',
    'ffi',
    'io',
    'isolate',
    'mirrors',
  };

  const knownWebLibs = {
    'html',
    'indexed_db',
    'js',
    'js_util',
    'svg',
    'web_audio',
    'web_gl',
  };

  var vmLibs = libNames.toSet().intersection(knownVmLibs).toList()..sort();
  var webLibs = libNames.toSet().intersection(knownWebLibs).toList()..sort();
  var coreLibs = (libNames.toSet()
        ..removeAll(webLibs)
        ..removeAll(vmLibs))
      .toList();

  // set up the analysis context
  var analyzer =
      Analyzer.packages(includedPaths: [p.normalize(sdkDir.absolute.path)]);

  // create the workspace
  var stats = Stats()..start();
  var htmlTemplate = await HtmlTemplate.initDir(outDir, stats: stats);
  var workspace = DocWorkspace('Dart SDK', htmlTemplate: htmlTemplate);
  workspace.footer = 'Dart SDK $version';
  workspace.mainFile = DocFile(
    workspace,
    'Readme',
    'index.html',
    createMarkdownGenerator(File(p.join(sdkDir.path, 'lib', 'api_readme.md'))),
  );
  final api = Api();
  workspace.api = api;

  final libDir = Directory(p.join(sdkDir.path, 'lib'));
  for (var entry in {'Core': coreLibs, 'VM': vmLibs, 'Web': webLibs}.entries) {
    var categoryName = entry.key;
    var libNames = entry.value;

    var categoryContainer =
        workspace.addChild(DocContainer(workspace, categoryName));

    for (var libName in libNames) {
      var libUrl = libraryUriFor(libName, libraries)!;

      var libFile = File(p.join(libDir.path, libUrl));
      var libraryElement =
          await analyzer.getLibraryByUri(libFile.uri.toString());

      var packageContainer = categoryContainer
          .addChild(DocContainer(categoryContainer, 'dart:$libName'));

      var library =
          api.addLibrary(libraryElement.element, 'Dart SDK', 'dart:$libName');
      var file = DocFile(packageContainer, 'dart:$libName', '$libName.html',
          libraryGenerator(library));
      file.importScript = file.name;
      packageContainer.mainFile = file;

      api.addResolution(libraryElement.element, packageContainer.mainFile!);

      for (var itemContainer in library.allChildrenSorted.whereType<Items>()) {
        var path = '$libName/${itemContainer.name}.html';
        var docFile = packageContainer.addChild(DocFile(
          packageContainer,
          itemContainer.name,
          path,
          itemsGenerator(itemContainer),
        ));
        api.addResolution(itemContainer.element, docFile);
      }
    }
  }

  // build model
  api.finish();
  var indexFile = File(p.join(outDir.path, 'resources', 'index.json'));
  indexFile.writeAsStringSync(workspace.api!.index.toJson());
  stats.genFile(indexFile);

  // generate
  log.stdout('');
  log.stdout('Generating docs...');

  await workspace.generate(outDir, logger: log, stats: stats);

  stats.stop();

  log.stdout('');
  // "1,347 symbols, 82% have documentation, 4 libraries, 8MB of html, 0.3s"
  log.stdout('Wrote docs to ${p.relative(outDir.path)} in '
      '${stats.elapsedSeconds}s (${stats.fileCount} files, '
      '${stats.sizeDesc}).');
}

String _parserSdkVersion(File versionFile) {
  var version = versionFile.readAsStringSync().trim();
  if (version.contains(' ')) {
    version = version.substring(0, version.indexOf(' '));
  }
  if (version.contains('-edge.')) {
    // Dart SDK 3.0.0-edge.3ad45940d6e...a585d088639f5
    version = version.substring(0, version.lastIndexOf('.'));
  }
  return version;
}

String? libraryUriFor(String name, Map<String, dynamic> libraries) {
  for (var key in libraries.keys) {
    var value = libraries[key];
    if (value is Map && value.containsKey('libraries')) {
      var info = value['libraries'] as Map<String, dynamic>;
      if (info.containsKey(name)) {
        return (info[name] as Map<String, dynamic>)['uri'] as String?;
      }
    }
  }

  return null;
}

ArgParser createArgsParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this command help.',
    )
    ..addOption(
      'output',
      abbr: 'o',
      defaultsTo: 'doc/sdk',
      help: 'Configure the output directory.',
    );
}

void printUsage(ArgParser parser, [Object? error]) {
  if (error != null) {
    print(error);
  } else {
    print('Generate API documentation for the Dart SDK.');
  }

  print('');

  print('usage: dart tool/create_dart_sdk.dart <options> [<sdk directory>]');
  print('');
  print(parser.usage);
}

Directory get detectSdk {
  final vm = Platform.resolvedExecutable;
  // <dart-sdk>/bin/dart
  return Directory(p.dirname(p.dirname(vm)));
}

void validateSdk(Directory sdk) {
  var versionFile = File(p.join(sdk.path, 'version'));
  if (!versionFile.existsSync()) {
    stderr.writeln('Invalid SDK (${sdk.path}) - missing version file');
    exit(1);
  }

  var librariesFile = File(p.join(sdk.path, 'lib', 'libraries.json'));
  if (!librariesFile.existsSync()) {
    stderr.writeln('Invalid SDK (${sdk.path}) - missing libraries file');
    exit(1);
  }
}