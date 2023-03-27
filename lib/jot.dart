/// Woot there some docs.
///
/// To create a new [DocWorkspace], see [DocWorkspace.fromPackage].
///
/// To generate docs, see [DocWorkspace.generate].

import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:jot/src/html.dart';
import 'package:path/path.dart' as p;

import 'src/analysis.dart';
import 'src/api.dart';
import 'src/generate.dart';
import 'src/utils.dart';
import 'src/workspace.dart';

export 'src/api.dart';
export 'src/workspace.dart';

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
    var workspace = DocWorkspace.fromPackage(htmlTemplate, inDir);
    var packageName = workspace.name.substring('package:'.length);
    var api = Api();
    workspace.api = api;

    Progress? progress = log.progress('Resolving public libraries');

    void cancelProgress() {
      progress?.finish();
      progress = null;
    }

    var helper = AnalysisHelper.package(inDir);

    final libDirPath = p.join(inDir.path, 'lib');

    await for (var resolvedLibrary in helper.resolvedPublicLibraries()) {
      cancelProgress();

      var libraryPath = resolvedLibrary.element.source.fullName;
      log.stdout('  ${p.relative(libraryPath, from: inDir.path)}');

      var dartLibraryPath = p.relative(libraryPath, from: libDirPath);
      var htmlOutputPath = '${p.withoutExtension(dartLibraryPath)}.html';

      var packageContainer = workspace.addChild(DocContainer(
        workspace,
        dartLibraryPath,
      ));

      var library = api.addLibrary(packageName, resolvedLibrary.element);

      packageContainer.mainFile = DocFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        libraryGenerator(library),
      )..importScript = 'package:$packageName/$dartLibraryPath';

      api.addResolution(resolvedLibrary.element, packageContainer.mainFile!);

      for (var itemContainer in library.allChildrenSorted.whereType<Items>()) {
        var path =
            '${p.withoutExtension(dartLibraryPath)}/${itemContainer.name}.html';
        var docFile = DocFile(
          packageContainer,
          itemContainer.name,
          path,
          itemContainer is ExtensionElementItems
              ? extensionElementGenerator(itemContainer)
              : interfaceElementGenerator(
                  itemContainer as InterfaceElementItems),
        );
        packageContainer.addChild(docFile);
        api.addResolution(itemContainer.element, docFile);
      }
    }

    cancelProgress();
    log.stdout('');

    // build model
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
}
