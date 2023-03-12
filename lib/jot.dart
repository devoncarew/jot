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
import 'src/workspace.dart';

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

    var htmlTemplate = await HtmlTemplate.initDir(outDir);
    var workspace = DocWorkspace.fromPackage(htmlTemplate, inDir);
    // todo:
    var packageName = workspace.name.substring('package:'.length);
    var api = Api();

    Progress? progress = log.progress('resolving public libraries');

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
      )) as DocContainer;

      var library = api.addLibrary(packageName, resolvedLibrary.element);

      packageContainer.mainFile = DocFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        libraryGenerator(library),
      );

      for (var itemContainer
          in library.allChildren.whereType<ItemContainer>()) {
        var path =
            '${p.withoutExtension(dartLibraryPath)}/${itemContainer.name}.html';
        packageContainer.addChild(DocFile(
          packageContainer,
          itemContainer.name,
          path,
          itemContainerGenerator(itemContainer),
        ));
      }
    }

    cancelProgress();
    log.stdout('');

    // build model
    progress = log.progress('generating docs');
    // todo: build model and stuff
    progress!.finish();

    // todo: generation stats
    workspace.generate(outDir, logger: log);

    // todo: print entrypoint, time, api and generation stats
    // "1,347 symbols, 82% have documentation, 4 libraries, 8MB of html, 0.3s"
  }
}
