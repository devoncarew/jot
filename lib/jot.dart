/// Woot there some docs.

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:jot/src/html.dart';
import 'package:path/path.dart' as p;

import 'src/analysis.dart';
import 'src/model.dart';

export 'src/model.dart';

// todo: hoist to another isolate to get better progress reporting

class Jot {
  final Directory inDir;
  final Directory outDir;

  Jot({required this.inDir, required this.outDir});

  Future<void> generate() async {
    var log = Logger.standard();

    // todo: move DocWorkspace.fromPackage into here
    var htmlTemplate = await HtmlTemplate.initDir(outDir);
    var workspace = DocWorkspace.fromPackage(htmlTemplate, inDir);

    Progress? progress = log.progress('resolving public libraries');

    void cancelProgress() {
      progress?.finish();
      progress = null;
    }

    var helper = AnalysisHelper(inDir);

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

      packageContainer.mainFile = DocFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        libraryGenerator(resolvedLibrary),
      );

      var exportNamespace = resolvedLibrary.element.exportNamespace;
      var elements = exportNamespace.definedNames.values
          .where((element) => element.isPublic);

      for (var clazz in elements.whereType<InterfaceElement>()) {
        var path = '${p.withoutExtension(dartLibraryPath)}/${clazz.name}.html';
        packageContainer.addChild(DocFile(
          packageContainer,
          clazz.name,
          path,
          interfaceElementGenerator(clazz),
        ));
      }

      // todo: also handle exports

      // InterfaceElement

      // for (var clazz in resolvedLibrary.element.topLevelElements
      //     .whereType<ClassElement>()) {
      //   print('class ${clazz.name}');

      //   // workspace.addChild(DocFile(
      //   //   workspace,
      //   //   todo,
      //   //   todo,
      //   //   classGenerator(clazz),
      //   // ));
      // }
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
