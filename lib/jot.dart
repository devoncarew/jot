import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as p;

import 'src/analysis.dart';
import 'src/model.dart';

// todo: hoist to another isolate to get better progress reporting

// todo: handle globals for stats and logs

class Jot {
  final Directory inDir;
  final Directory outDir;

  Jot({required this.inDir, required this.outDir});

  Future<void> generate() async {
    var log = Logger.standard();

    var workspace = Workspace.fromPackage(inDir);

    Progress? progress = log.progress('resolving public libraries');

    void cancelProgress() {
      progress?.finish();
      progress = null;
    }

    var libraries = <ResolvedLibraryResult>[];

    var helper = AnalysisHelper(inDir);
    var docGroup = workspace.groups.first;

    await for (var lib in helper.resolvedPublicLibraries()) {
      cancelProgress();

      var libPath = lib.element.source.fullName;
      var relPath = p.relative(libPath, from: inDir.path);
      log.stdout('  $relPath');

      libraries.add(lib);

      docGroup.addFile(LibraryFile(File(libPath), lib));
    }

    cancelProgress();
    log.stdout('');

    if (libraries.isEmpty) {
      log.stderr('No libraries found to document.');
      exit(1);
    }

    // build model
    progress = log.progress('generating docs');
    // todo: build model and stuff
    progress!.finish();

    // todo: generation
    if (workspace.single) {
      var group = workspace.groups.first;
      group.generate(outDir);
    } else {
      // todo: write workspace file(s)

      for (var group in workspace.groups) {
        var dir = Directory(p.join(outDir.path, group.name));
        dir.createSync();
        group.generate(dir);
      }
    }

    // todo: print entrypoint, time, api and generation stats
    // "1,347 symbols, 82% have documentation, 4 libraries, 8MB of html, 0.3s"
  }
}
