import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:jot/src/utils.dart';
import 'package:path/path.dart' as p;

class AnalysisHelper {
  late final Directory _rootDir;

  late AnalysisContextCollection _collection;

  AnalysisHelper.package(Directory packageDir) {
    _rootDir =
        Directory(p.join(p.canonicalize(packageDir.absolute.path), 'lib'));
    _collection = AnalysisContextCollection(
      includedPaths: [_rootDir.path],
      resourceProvider: PhysicalResourceProvider.INSTANCE,
    );
  }

  AnalysisHelper.sdk(Directory sdkDir) {
    _rootDir = Directory(p.join(p.canonicalize(sdkDir.absolute.path), 'lib'));
    _collection = AnalysisContextCollection(
      includedPaths: [_rootDir.path],
      resourceProvider: PhysicalResourceProvider.INSTANCE,
    );
  }

  AnalysisContext get context => _collection.contexts.first;

  Stream<ResolvedLibraryResult> resolvedPublicLibraries() async* {
    for (var file in _publicFiles) {
      var lib = await context.currentSession
          .getResolvedLibrary(file.absolute.path) as ResolvedLibraryResult;

      // todo: filter out parts

      yield lib;
    }
  }

  Iterable<File> get _publicFiles sync* {
    final srcPath = p.join(_rootDir.path, 'src');

    for (var file in _rootDir
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

  Future<LibraryElementResult> getLibraryByUri(String uri) async {
    var result = await context.currentSession.getLibraryByUri(uri);
    return result as LibraryElementResult;
  }
}
