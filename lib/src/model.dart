import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;

import 'utils.dart';

class Workspace {
  final List<DocGroup> groups = [];

  Workspace();

  factory Workspace.fromPackage(Directory dir) {
    var workspace = Workspace();
    workspace.addGroup(DocGroup.fromPackage(dir));
    return workspace;
  }

  bool get single => groups.length == 1;

  void addGroup(DocGroup group) {
    groups.add(group);
  }

  @override
  String toString() => 'Workspace ${groups.join(', ')}';
}

abstract class DocFile {
  late DocGroup parent;

  File get sourceFile;

  String get name => relativePath;

  String get relativePath;

  @override
  String toString() => name;

  void generate(Directory dir) {
    var file =
        File(p.join(dir.path, '${p.withoutExtension(relativePath)}.html'));
    if (!file.parent.existsSync()) {
      file.parent.createSync(recursive: true);
    }

    file.writeAsStringSync('<html><body><p>$name</p></body></html>');

    // todo: use logger
    print('  ${p.relative(file.path, from: parent.dir.path)}');
  }
}

class MarkdownFile extends DocFile {
  @override
  final File sourceFile;

  MarkdownFile(this.sourceFile);

  @override
  String get relativePath => p.relative(sourceFile.path, from: parent.dir.path);

  String get basename => sourceFile.name;
}

class LibraryFile extends DocFile {
  @override
  final File sourceFile;
  final ResolvedLibraryResult libraryResult;

  LibraryFile(this.sourceFile, this.libraryResult);

  @override
  String get relativePath =>
      p.relative(sourceFile.path, from: p.join(parent.dir.path, 'lib'));
}

class DocGroup {
  final Directory dir;
  final List<DocFile> files = [];
  late final yaml.YamlMap pubspec;

  DocGroup(this.dir) {
    pubspec =
        yaml.loadYaml(File(p.join(dir.path, 'pubspec.yaml')).readAsStringSync())
            as yaml.YamlMap;
  }

  String get name => pubspec['name'];

  DocFile? get indexContent {
    return files
        .whereType<MarkdownFile>()
        .firstWhereOrNull((f) => f.basename == 'README.md');
  }

  factory DocGroup.fromPackage(Directory dir) {
    var group = DocGroup(dir);
    for (var file in dir.listSyncSorted().whereType<File>()) {
      if (p.extension(file.path) == '.md') {
        group.addFile(MarkdownFile(file));
      }
    }
    return group;
  }

  void addFile(DocFile file) {
    file.parent = this;
    files.add(file);
  }

  @override
  String toString() => name;

  void generate(Directory dir) {
    for (var file in files) {
      file.generate(dir);
    }
  }
}
