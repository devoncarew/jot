import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:collection/collection.dart';
import 'package:jot/src/html.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;

import 'markdown.dart';
import 'utils.dart';

// todo: for single package workspaces, hoist readme content into index.html

// todo: put together a stub html page
// todo: put together a stub css file

class Workspace {
  final List<DocGroup> groups = [];

  Workspace();

  factory Workspace.fromPackage(Directory dir) {
    var workspace = Workspace();
    workspace.addGroup(DocGroup.fromPackage(dir));
    return workspace;
  }

  bool get single => groups.length == 1;

  String get pageTitle {
    // todo:
    return 'package:${groups.first.name}';
  }

  void addGroup(DocGroup group) {
    groups.add(group);
    group.workspace = this;
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

  Future<void> generate(Directory dir);
}

class MarkdownFile extends DocFile {
  @override
  final File sourceFile;

  MarkdownFile(this.sourceFile);

  @override
  String get relativePath => p.relative(sourceFile.path, from: parent.dir.path);

  String get basename => sourceFile.name;

  @override
  Future<void> generate(Directory dir) async {
    var file =
        File(p.join(dir.path, '${p.withoutExtension(relativePath)}.html'));
    if (!file.parent.existsSync()) {
      file.parent.createSync(recursive: true);
    }

    var template = await htmlTemplateData;
    var content = sourceFile.readAsStringSync();
    var pageContent = convertMarkdown(content);

    // Create the toc for markdown header elements.
    var toc = StringBuffer();
    var headerElements = markdownHeaders(content);
    // todo: lower header elements should be nested in an <ul class="nav">
    for (var h in headerElements) {
      toc.writeln(
        '<li class="toc-entry nav-item toc-${h.tag}">'
        '  <a class="nav-link" href="#${h.generatedId}">${h.textContent}</a>'
        '</li>',
      );
    }

    var data = templateSubtitute(
      template,
      pageTitle: parent.workspace.pageTitle,
      pageContent: pageContent,
      toc: toc.toString(),
    );

    file.writeAsStringSync(data);

    // todo: use logger
    print('  ${p.relative(file.path, from: parent.dir.path)}');
  }
}

class LibraryFile extends DocFile {
  @override
  final File sourceFile;
  final ResolvedLibraryResult libraryResult;

  LibraryFile(this.sourceFile, this.libraryResult);

  @override
  String get relativePath =>
      p.relative(sourceFile.path, from: p.join(parent.dir.path, 'lib'));

  @override
  Future<void> generate(Directory dir) async {
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

class DocGroup {
  final Directory dir;
  final List<DocFile> files = [];
  late final yaml.YamlMap pubspec;
  late final Workspace workspace;

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

  Future<void> generate(Directory dir) async {
    for (var file in files) {
      await file.generate(dir);
    }
  }
}
