import 'dart:io';

import 'package:args/args.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:jot/jot.dart';
import 'package:jot/src/analysis.dart';
import 'package:jot/src/api.dart';
import 'package:jot/src/generate.dart';
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
  final version = _parserSdkVersion(versionFile);

  log.stdout('SDK ${sdkDir.path}');
  log.stdout('Version $version');
  log.stdout('');

  log.stdout('Resolving SDK libraries...');

  // // todo:
  // // parse the libraries file
  // var librariesFile = File(p.join(sdkDir.path, 'lib', 'libraries.json'));
  // var libraries =
  //     jsonDecode(librariesFile.readAsStringSync()) as Map<String, dynamic>;

  // set up the analysis context
  var analysisHelper = AnalysisHelper.sdk(sdkDir);

  // create the workspace
  var stats = Stats()..start();
  var htmlTemplate = await HtmlTemplate.initDir(outDir, stats: stats);
  var workspace = DocWorkspace('Dart SDK', htmlTemplate: htmlTemplate);
  workspace.footer = 'Dart SDK $version';
  workspace.mainFile = DocFile(
    workspace,
    'Readme',
    'index.html',
    markdownGenerator(File(p.join(sdkDir.path, 'lib', 'api_readme.md'))),
  );
  final api = Api();
  workspace.api = api;

  // TODO: categorize into regular, experimental, and unstable libraries
  final libs = Libs();

  final libDir = Directory(p.join(sdkDir.path, 'lib'));
  for (var lib in [
    ...libs.stableLibs,
    ...libs.unstableLibs,
    ...libs.experimentalLibs,
  ]) {
    log.stdout('  dart:${lib.name} [${lib.maturity}]');

    var libFile = File(p.join(libDir.path, lib.uri));
    var libraryElement =
        await analysisHelper.getLibraryByUri(libFile.uri.toString());

    DocContainer parent = workspace;

    // introduce new containers for non-stable libraries
    if (lib.maturity != 'stable') {
      final maturityTitle = titleCase(lib.maturity);

      if (workspace.getChild(maturityTitle) != null) {
        parent = workspace.getChild(maturityTitle) as DocContainer;
      } else {
        parent = workspace.addChild(DocContainer(
          workspace,
          maturityTitle,
        )) as DocContainer;
      }
    }

    var packageContainer = parent.addChild(DocContainer(
      parent,
      'dart:${lib.name}',
    )) as DocContainer;

    var library = api.addLibrary('sdk', libraryElement.element);

    packageContainer.mainFile = DocFile(
      packageContainer,
      'dart:${lib.name}',
      '${lib.name}.html',
      libraryGenerator(library),
    );

    api.addResolution(libraryElement.element, packageContainer.mainFile!);

    for (var itemContainer in library.allChildren.whereType<ItemContainer>()) {
      var path = '${lib.name}/${itemContainer.name}.html';
      var docFile = packageContainer.addChild(DocFile(
        packageContainer,
        itemContainer.name,
        path,
        itemContainerGenerator(itemContainer),
      )) as DocFile;
      api.addResolution(itemContainer.element, docFile);
    }
  }

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

// TODO: temporary until the SDK gets an undated libraries.json file
final Map<String, Map<String, Object>> sdkLibraries = {
  "async": {
    "uri": "async/async.dart",
    "categories": ["client", "server"],
    "maturity": "stable"
  },
  "cli": {
    "uri": "cli/cli.dart",
    "categories": ["server"],
    "maturity": "unstable"
  },
  "collection": {
    "uri": "collection/collection.dart",
    "categories": ["client", "server", "embedded"],
    "maturity": "stable"
  },
  "convert": {
    "uri": "convert/convert.dart",
    "categories": ["client", "server"],
    "maturity": "stable"
  },
  "core": {
    "uri": "core/core.dart",
    "categories": ["client", "server", "embedded"],
    "maturity": "stable"
  },
  "developer": {
    "uri": "developer/developer.dart",
    "categories": ["client", "server", "embedded"],
    "maturity": "unstable"
  },
  "ffi": {
    "uri": "ffi/ffi.dart",
    "categories": ["server"],
    "maturity": "stable"
  },
  "html": {
    "uri": "html/dart2js/html_dart2js.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "indexed_db": {
    "uri": "indexed_db/dart2js/indexed_db_dart2js.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "io": {
    "uri": "io/io.dart",
    "categories": ["server"]
  },
  "isolate": {
    "uri": "isolate/isolate.dart",
    "categories": ["client", "server"],
    "maturity": "stable"
  },
  "js": {
    "uri": "js/js.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "js_util": {
    "uri": "js_util/js_util.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "math": {
    "uri": "math/math.dart",
    "categories": ["client", "server", "embedded"],
    "maturity": "stable"
  },
  "mirrors": {
    "uri": "mirrors/mirrors.dart",
    "categories": ["client", "server"],
    "maturity": "unstable"
  },
  "svg": {
    "uri": "svg/dart2js/svg_dart2js.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "typed_data": {
    "uri": "typed_data/typed_data.dart",
    "categories": ["client", "server", "embedded"],
    "maturity": "stable"
  },
  "web_audio": {
    "uri": "web_audio/dart2js/web_audio_dart2js.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "web_gl": {
    "uri": "web_gl/dart2js/web_gl_dart2js.dart",
    "categories": ["client"],
    "maturity": "stable"
  },
  "_async_await_error_codes": {
    "uri": "_internal/js_runtime/lib/synced/async_await_error_codes.dart",
    "documented": false
  },
  "_dart2js_runtime_metrics": {
    "uri": "_internal/js_runtime/lib/dart2js_runtime_metrics.dart",
    "documented": false
  },
  "_foreign_helper": {
    "uri": "_internal/js_runtime/lib/foreign_helper.dart",
    "documented": false
  },
  "_http": {"uri": "_http/http.dart", "documented": false},
  "_interceptors": {
    "uri": "_internal/js_runtime/lib/interceptors.dart",
    "documented": false
  },
  "_internal": {"uri": "internal/internal.dart", "documented": false},
  "_js": {
    "uri": "js/_js.dart",
    "categories": ["client"],
    "documented": false
  },
  "_js_annotations": {"uri": "js/_js_annotations.dart", "documented": false},
  "_js_embedded_names": {
    "uri": "_internal/js_runtime/lib/synced/embedded_names.dart",
    "documented": false
  },
  "_js_helper": {
    "uri": "_internal/js_runtime/lib/js_helper.dart",
    "documented": false
  },
  "_js_names": {
    "uri": "_internal/js_runtime/lib/js_names.dart",
    "documented": false
  },
  "_js_primitives": {
    "uri": "_internal/js_runtime/lib/js_primitives.dart",
    "documented": false
  },
  "_js_shared_embedded_names": {
    "uri": "_internal/js_shared/lib/synced/embedded_names.dart",
    "documented": false
  },
  "_js_types": {
    "uri": "_internal/js_shared/lib/js_types.dart",
    "documented": false
  },
  "_late_helper": {
    "uri": "_internal/js_runtime/lib/late_helper.dart",
    "documented": false
  },
  "_load_library_priority": {
    "uri": "_internal/js_runtime/lib/synced/load_library_priority.dart",
    "documented": false
  },
  "_metadata": {"uri": "html/html_common/metadata.dart", "documented": false},
  "_native_typed_data": {
    "uri": "_internal/js_runtime/lib/native_typed_data.dart",
    "documented": false,
    "implementation": true
  },
  "_recipe_syntax": {
    "uri": "_internal/js_shared/lib/synced/recipe_syntax.dart",
    "documented": false
  },
  "_rti": {"uri": "_internal/js_shared/lib/rti.dart", "documented": false},
  "html_common": {
    "uri": "html/html_common/html_common.dart",
    "categories": ["client"],
    "maturity": "stable",
    "documented": false,
    "implementation": true
  },
  "js_interop": {
    "uri": "js_interop/js_interop.dart",
    "categories": ["client"],
    "maturity": "experimental",
  },
  "wasm": {
    "uri": "wasm/wasm_types.dart",
    "categories": ["client"],
    "maturity": "experimental",
  },
  "nativewrappers": {
    "uri": "html/dartium/nativewrappers.dart",
    "categories": ["client"],
    "documented": false,
    "implementation": true
  }
};

class Libs {
  final List<Lib> libs = [];

  Libs() {
    for (var name in sdkLibraries.keys.toList()..sort()) {
      // "core": {
      //   "uri": "core/core.dart",
      //   "categories": ["client", "server", "embedded"],
      //     'core', 'web;, 'cli'?
      //   "maturity": "stable"
      // },

      var lib = sdkLibraries[name]!;
      var uri = lib['uri'] as String;
      var maturity = lib['maturity'] as String?; // ?? 'stable'
      var categories = (lib['categories'] as List?) ?? [];
      var documented = (lib['documented'] as bool?) ?? true;
      var implementation = (lib['implementation'] as bool?) ?? false;

      if (documented && !implementation) {
        libs.add(Lib(
          name,
          uri,
          maturity: maturity ?? 'stable',
          categories: categories.cast<String>(),
        ));
      }
    }
  }

  Iterable<Lib> get stableLibs => libs.where((lib) => lib.maturity == 'stable');

  Iterable<Lib> get unstableLibs =>
      libs.where((lib) => lib.maturity == 'unstable');

  Iterable<Lib> get experimentalLibs =>
      libs.where((lib) => lib.maturity == 'experimental');
}

class Lib {
  final String name;
  final String uri;
  final String maturity;
  final List<String> categories;

  Lib(this.name, this.uri, {required this.maturity, required this.categories});
}
