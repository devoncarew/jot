import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:jot/api.dart';
import 'package:jot/src/analysis.dart';
import 'package:jot/src/html.dart';
import 'package:jot/src/render.dart';
import 'package:jot/workspace.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

// TODO: test the other methods for LinkedCodeRenderer

void main() {
  group('LinkedCodeRenderer', () {
    testWithSource('handleConstructor', '''
class A {
  A();
}
''', (TestProject project) {
      final interfaceItem = project.firstClassItem;
      final item = interfaceItem.allChildren
          .firstWhere((item) => item.element is ConstructorElement);

      final renderer = LinkedCodeRenderer(
          project.resolver, project.resolver.fileFor(interfaceItem.element)!);
      final result = renderer.render(GroupType.constructor, item);

      expect(result, '<pre class="declaration"><code>A()</code></pre>');
    });

    testWithSource('handleField', '''
class A {
  final String foo = 'bar';
}
''', (TestProject project) {
      final interfaceItem = project.firstClassItem;
      final item = interfaceItem.allChildren
          .firstWhere((item) => item.element is FieldElement);

      final renderer = LinkedCodeRenderer(
          project.resolver, project.resolver.fileFor(interfaceItem.element)!);
      final result = renderer.render(GroupType.field, item);

      expect(result, '<pre class="declaration"><code>String foo</code></pre>');
    });

    testWithSource('handleAccessor', '''
String get foo => 'bar';
''', (TestProject project) {
      final library = project.firstLibrary;
      final item = library.allChildren
          .firstWhere((item) => item.element is PropertyAccessorElement);

      final renderer = LinkedCodeRenderer(
          project.resolver, project.resolver.fileFor(library.element)!);
      final result = renderer.render(GroupType.accessor, item);

      expect(
          result, '<pre class="declaration"><code>String get foo</code></pre>');
    });
  });
}

void testWithSource(
  String description,
  String source,
  void Function(TestProject) body,
) {
  test(description, () async {
    final project = TestProject({'main.dart': source});

    try {
      await project.init();

      body(project);
    } finally {
      project.dispose();
    }
  });
}

class TestProject {
  final Directory dir;
  final Map<String, String> sources;

  late final DocWorkspace workspace;
  late final Analyzer analyzer;

  TestProject(this.sources) : dir = Directory.systemTemp.createTempSync();

  String get libDirPath => p.join(dir.path, 'lib');

  Directory get outDir => Directory(p.join(dir.path, 'doc', 'api'));

  Resolver get resolver => workspace.api!.resolver;

  List<LibraryItemContainer> get libraries =>
      workspace.api!.packages.first.libraries;

  LibraryItemContainer get firstLibrary => libraries.first;

  Items get firstClassItem => firstLibrary.allChildren
      .firstWhere((item) => item.element is InterfaceElement) as Items;

  void _create() {
    final pubspec = File(p.join(dir.path, 'pubspec.yaml'));
    pubspec.writeAsStringSync('name: testing');

    Directory(libDirPath).createSync();

    for (final entry in sources.entries) {
      final file = File(p.join(libDirPath, entry.key));
      file.writeAsStringSync(entry.value);
    }
  }

  Future<void> init() async {
    _create();

    // TODO: simplify the work for setting up a package

    final htmlTemplate = await HtmlTemplate.initDir(outDir);
    workspace = DocWorkspace.fromPackage(htmlTemplate, dir);
    var packageName = workspace.name.substring('package:'.length);
    workspace.api = Api();

    analyzer =
        Analyzer.packages(includedPaths: [p.normalize(dir.absolute.path)]);

    await for (var resolvedLibrary in analyzer.resolvedPublicLibraries()) {
      var libraryPath = resolvedLibrary.element.source.fullName;

      var dartLibraryPath = p.relative(libraryPath, from: libDirPath);
      var htmlOutputPath = '${p.withoutExtension(dartLibraryPath)}.html';

      var libraryContainer = workspace.addChild(DocContainer(
        workspace,
        dartLibraryPath,
      ));

      var library = workspace.api!
          .addLibrary(resolvedLibrary.element, workspace.name, dartLibraryPath);

      libraryContainer.mainFile = DocFile(
        workspace,
        dartLibraryPath,
        htmlOutputPath,
        emptyContentGenerator,
      )..importScript = 'package:$packageName/$dartLibraryPath';

      workspace.api!.addResolution(library, libraryContainer.mainFile!);

      for (var itemContainer in library.allChildrenSorted.whereType<Items>()) {
        var path =
            '${p.withoutExtension(dartLibraryPath)}/${itemContainer.name}.html';
        var docFile = DocFile(
          libraryContainer,
          itemContainer.name,
          path,
          emptyContentGenerator,
        );
        libraryContainer.addChild(docFile);
        workspace.api!.addResolution(itemContainer, docFile);
      }

      workspace.api!.finish();
    }
  }

  void dispose() {
    dir.deleteSync(recursive: true);
  }
}
