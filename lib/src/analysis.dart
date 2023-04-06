// import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:path/path.dart' as p;

class Analyzer {
  late AnalysisContextCollection _collection;
  late ResourceProvider resourceProvider;

  int _lastCheckedMillis = DateTime.now().millisecondsSinceEpoch;

  /// Create an analysis context using the given paths.
  ///
  /// Note that all paths must the absolute. These are assumed to the paths to
  /// packages; for these packages, only the code in `lib/` will be analyzed.
  Analyzer.packages({
    required List<String> includedPaths,
    ResourceProvider? resourceProvider,
  }) {
    this.resourceProvider =
        resourceProvider ?? PhysicalResourceProvider.INSTANCE;

    _collection = AnalysisContextCollection(
      includedPaths: [
        ...includedPaths.map((path) => p.join(path, 'lib')),
      ],
      resourceProvider: this.resourceProvider,
    );
  }

  AnalysisContext get context => _collection.contexts.first;

  Stream<ResolvedLibraryResult> resolvedPublicLibraries() async* {
    for (var file in _publicFiles) {
      var lib = await context.currentSession.getResolvedLibrary(file.path)
          as ResolvedLibraryResult;

      // todo: filter out parts

      yield lib;
    }
  }

  /// Check for any changed files and reanalyze changes.
  ///
  /// Returns `true` if any changed files had been detected.
  Future<bool> reanalyzeChanges() async {
    var hasChanges = false;

    var context = _collection.contexts.first;

    final currentMillis = DateTime.now().millisecondsSinceEpoch;

    for (var path in context.contextRoot
        .analyzedFiles()
        .where((path) => path.endsWith('.dart'))) {
      var modificationStamp =
          context.contextRoot.resourceProvider.getFile(path).modificationStamp;

      if (modificationStamp > _lastCheckedMillis) {
        hasChanges = true;
        context.changeFile(path);
      }
    }

    _lastCheckedMillis = currentMillis;

    await context.applyPendingFileChanges();

    return hasChanges;
  }

  Iterable<File> get _publicFiles sync* {
    for (var context in _collection.contexts) {
      var root = context.contextRoot;
      var src = root.root.getChildAssumingFolder('src');

      for (var path in context.contextRoot
          .analyzedFiles()
          .where((path) => path.endsWith('.dart'))) {
        if (src.contains(path)) continue;

        // todo: ignore file who's name starts with '_'?

        yield root.resourceProvider.getFile(path);
      }
    }

    // final srcPath = p.join(_rootDir.path, 'src');

    // for (var file in _rootDir
    //     .listSyncSorted(recursive: true)
    //     .whereType<File>()
    //     .where((f) => f.path.endsWith('.dart'))) {
    //   if (p.isWithin(srcPath, file.path)) {
    //     continue;
    //   }

    //   if (file.name.startsWith('_')) {
    //     continue;
    //   }

    //   yield file;
    // }
  }

  Future<LibraryElementResult> getLibraryByUri(String uri) async {
    var result = await context.currentSession.getLibraryByUri(uri);
    return result as LibraryElementResult;
  }
}
