import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:path/path.dart' as p;

import 'utils.dart';

bool isPublic(Element element) => !element.name!.startsWith('_');

class AnalysisHelper {
  final Directory projectDir;
  late final Directory _libDir;

  AnalysisHelper(this.projectDir) {
    _libDir =
        Directory(p.join(p.canonicalize(projectDir.absolute.path), 'lib'));
  }

  Directory get libDir => _libDir;

  Stream<ResolvedLibraryResult> resolvedPublicLibraries() async* {
    final collection = AnalysisContextCollection(
      includedPaths: [_libDir.path],
      resourceProvider: PhysicalResourceProvider.INSTANCE,
    );

    final context = collection.contexts.single;

    for (var file in _publicFiles) {
      var lib = await context.currentSession
          .getResolvedLibrary(file.absolute.path) as ResolvedLibraryResult;

      // todo: filter out parts

      yield lib;
    }
  }

  Iterable<File> get _publicFiles sync* {
    final srcPath = p.join(libDir.path, 'src');

    for (var file in libDir
        .listSyncSorted(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))) {
      if (p.isWithin(srcPath, file.path)) {
        continue;
      }

      if (file.name.startsWith('_')) {
        continue;
      }

      yield file;
    }
  }
}
