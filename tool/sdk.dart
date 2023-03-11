import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:args/args.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:jot/jot.dart';
import 'package:jot/src/analysis.dart';
import 'package:jot/src/html.dart';
import 'package:jot/src/utils.dart';
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

  bool help = results['help'];
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

  var outDir = Directory(results['output']);

  await generate(sdkDir, outDir);
}

Future<void> generate(Directory sdkDir, Directory outDir) async {
  var log = Logger.standard();

  if (!outDir.existsSync()) outDir.createSync(recursive: true);

  var versionFile = File(p.join(sdkDir.path, 'version'));
  final version = versionFile.readAsStringSync().trim();

  log.stdout('SDK ${sdkDir.path}');
  log.stdout('Version $version');
  log.stdout('Generating SDK documentation...');
  log.stdout('');

  // parse the libraries file
  var librariesFile = File(p.join(sdkDir.path, 'lib', 'libraries.json'));
  var libraries =
      jsonDecode(librariesFile.readAsStringSync()) as Map<String, dynamic>;

  // set up the analysis context
  var analysisHelper = AnalysisHelper.sdk(sdkDir);

  // create the workspace
  var htmlTemplate = await HtmlTemplate.initDir(outDir);
  var workspace = DocWorkspace('Dart SDK', htmlTemplate: htmlTemplate);
  workspace.footer = 'Dart SDK $version';
  workspace.mainFile = DocFile(
    workspace,
    'Dart SDK',
    'index.html',
    markdownGenerator(File(p.join(sdkDir.path, 'lib', 'api_readme.md'))),
  );

  // TODO: categorize into regular, experimental, and deprecated libraries

  final libDir = Directory(p.join(sdkDir.path, 'lib'));
  for (var dir in libDir.listSyncSorted().whereType<Directory>()) {
    var name = dir.name;
    if (name.startsWith('_')) continue;

    var libraryUri = libraryUriFor(name, libraries);
    if (libraryUri == null) continue;

    print('dart:$name, $libraryUri');

    var libFile = File(p.join(libDir.path, libraryUri));
    var libraryElement =
        await analysisHelper.getLibraryByUri(libFile.uri.toString());

    var packageContainer = workspace.addChild(DocContainer(
      workspace,
      'dart:$name',
    )) as DocContainer;

    packageContainer.mainFile = DocFile(
      workspace,
      'dart:$name',
      '$name.html',
      libraryGenerator(libraryElement.element),
    );

    var exportNamespace = libraryElement.element.exportNamespace;
    var elements = exportNamespace.definedNames.values
        .where((element) => element.isPublic);

    for (var clazz in elements.whereType<InterfaceElement>()) {
      var path = '$name/${clazz.name}.html';
      packageContainer.addChild(DocFile(
        packageContainer,
        clazz.name,
        path,
        interfaceElementGenerator(clazz),
      ));
    }
  }

  log.stdout('');

  // generate
  // todo: generation stats
  workspace.generate(outDir, logger: log);
}

String? libraryUriFor(String name, Map<String, dynamic> libraries) {
  for (var key in libraries.keys) {
    var value = libraries[key];
    if (value is Map && value.containsKey('libraries')) {
      var info = value['libraries'] as Map<String, dynamic>;
      if (info.containsKey(name)) {
        return (info[name] as Map<String, dynamic>)['uri'];
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

  print('usage: dart bin/jot.dart <options> [<sdk directory>]');
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
