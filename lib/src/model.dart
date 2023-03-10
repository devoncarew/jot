import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;

import 'html.dart';
import 'markdown.dart';
import 'utils.dart';

typedef FileContentGenerator = Future<GenerationResults> Function(
    DocWorkspace workspace, DocFile file);

class GenerationResults {
  final String contents;
  final Outline? outline;

  GenerationResults(this.contents, [this.outline]);
}

FileContentGenerator emptyContentGenerator =
    (DocWorkspace workspace, DocFile file) =>
        Future.value(GenerationResults(''));

FileContentGenerator markdownGenerator(File markdownFile) {
  return (DocWorkspace workspace, DocFile file) async {
    var content = markdownFile.readAsStringSync();
    var results = convertMarkdown(content);
    return GenerationResults(results.html, results.outline);
  };
}

FileContentGenerator plaintextGenerator(File markdownFile) {
  return (DocWorkspace workspace, DocFile file) async {
    var content = markdownFile.readAsStringSync();
    var pageContent = htmlEscape.convert(content);
    return GenerationResults('<pre>$pageContent</pre>');
  };
}

FileContentGenerator libraryGenerator(ResolvedLibraryResult resolvedLibrary) {
  return (DocWorkspace workspace, DocFile file) async {
    var exportNamespace = resolvedLibrary.element.exportNamespace;
    var elements = exportNamespace.definedNames.values
        .where((element) => element.isPublic);

    var buf = StringBuffer();

    var packageRef = '${file.parentPackage!.name}/${file.name}';
    buf.writeln('<pre><code>$packageRef</code></pre>');

    var docs = resolvedLibrary.element.documentationComment;
    if (docs != null) {
      buf.writeln('<p>${stripDartdoc(docs)}</p>');
    }

    buf.writeln([
      '<ul>',
      // ...resolvedLibrary.element.topLevelElements
      //     .map((e) => '<li>${e.name}</li>'),
      ...elements.map((e) => '<li>${e.name}</li>'),
      // ...resolvedLibrary.element.libraryExports
      //     .map((e) => '<li>${e.name}</li>'),
      '</ul>',
    ].join('\n'));

    return GenerationResults(buf.toString());
  };
}

FileContentGenerator interfaceElementGenerator(InterfaceElement clazz) {
  return (DocWorkspace workspace, DocFile file) async {
    var buf = StringBuffer('<pre>${clazz.name}</pre>');
    var docs = clazz.documentationComment;
    if (docs != null) {
      buf.writeln('<p>${stripDartdoc(docs)}</p>');
    }
    return GenerationResults(buf.toString());
  };
}

abstract class DocEntity {
  final DocEntity? parent;
  final String name;

  DocEntity(this.parent, this.name);

  DocWorkspace get workspace => parent!.workspace;

  DocContainer? get parentPackage => parent?.parentPackage;

  Future<void> generate(Directory dir, {required Logger logger});

  Iterable<DocEntity> get breadcrumbs {
    var result = <DocEntity>[];
    DocEntity? item = this;

    while (item != null) {
      result.add(item);
      item = item.parent;
    }

    return result.reversed;
  }

  @override
  String toString() => name;
}

class DocFile extends DocEntity {
  final String path;
  final FileContentGenerator contentGenerator;

  DocFile(super.parent, super.name, this.path, this.contentGenerator);

  @override
  Future<void> generate(Directory dir, {required Logger logger}) async {
    var page = await contentGenerator(workspace, this);
    var fileContents = await workspace.generateWorkspacePage(this, page);
    var file = File(p.join(dir.path, path));
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(fileContents);

    logger.stdout('  $path');
  }

  @override
  String toString() => 'DocFile $name';
}

class DocContainer extends DocEntity {
  final bool isGroup;
  final bool isPackage;

  final List<DocEntity> children = [];

  DocFile? mainFile;

  DocContainer(
    super.parent,
    super.name, {
    this.isGroup = false,
    this.isPackage = false,
  }) {
    // TODO: have a default mainfile?
  }

  @override
  DocContainer? get parentPackage => isPackage ? this : parent?.parentPackage;

  DocEntity addChild(DocEntity entity) {
    children.add(entity);
    return entity;
  }

  @override
  Future<void> generate(Directory dir, {required Logger logger}) async {
    // todo: always generate an index file

    // mainFile
    await mainFile?.generate(dir, logger: logger);

    // children
    for (var child in children) {
      await child.generate(dir, logger: logger);
    }
  }

  @override
  String toString() => 'DocContainer $name';
}

class DocWorkspace extends DocContainer {
  final HtmlTemplate htmlTemplate;
  final List<DocFile> navFiles = [];

  DocWorkspace(String name, {super.isPackage, required this.htmlTemplate})
      : super(null, name) {
    // Placeholder for the main file.
    mainFile = DocFile(this, 'index.html', 'index.html', emptyContentGenerator);
  }

  @override
  DocWorkspace get workspace => this;

  @override
  Future<void> generate(Directory dir, {required Logger logger}) async {
    // mainFile
    await mainFile?.generate(dir, logger: logger);

    // navFiles
    for (var navElement in navFiles) {
      await navElement.generate(dir, logger: logger);
    }

    // children
    for (var child in children) {
      await child.generate(dir, logger: logger);
    }
  }

  String pathTo(DocFile target, {DocFile? from}) {
    if (from == null) {
      return target.path;
    } else {
      return p.relative(target.path, from: p.dirname(from.path));
    }
  }

  Future<String> generateWorkspacePage(
      DocFile file, GenerationResults page) async {
    // navbar
    // <li><a href="https://dart.dev/overview" class="nav-link">Overview</a></li>
    var navbarContent = [
      mainFile!,
      ...navFiles,
    ].map((target) {
      String active = '';
      if (navFiles.contains(file) && target == file) {
        active = ' active';
      } else if (!navFiles.contains(file) && target == mainFile) {
        active = ' active';
      }

      var href = file == target ? '' : 'href="${pathTo(target, from: file)}"';
      var name = target == mainFile ? 'Docs' : target.name;
      return '<li><a $href class="nav-link$active">$name</a></li>';
    }).join(' ');

    // todo: sidenav
    // <ul class="nav flex-column">
    //   <li class="nav-item">
    //     <a class="nav-link collapsed" data-toggle="collapse"
    //       href="https://dart.dev/guides/language/effective-dart#sidenav-1" role="button" aria-expanded="false"
    //       aria-controls="sidenav-1">Samples &amp; tutorials</a>
    //   </li>
    // </ul>

    var sidenavContents = _genSidenav(file, this);

    // todo:
    // // Create the toc for markdown header elements.
    // var toc = StringBuffer();
    // var headerElements = markdownHeaders(content);
    // // todo: lower header elements should be nested in an <ul class="nav">
    // for (var h in headerElements) {
    //   toc.writeln(
    //     '<li class="toc-entry nav-item toc-${h.tag}">'
    //     '  <a class="nav-link" href="#${h.generatedId}">${h.textContent}</a>'
    //     '</li>',
    //   );
    // }

    // breadcrumbs
    var breadcrumbsContent = file.breadcrumbs.map((entity) {
      var target =
          entity is DocFile ? entity : (entity as DocContainer).mainFile!;
      var active = file == target ? ' active' : '';
      var href = file == target ? '' : 'href="${pathTo(target, from: file)}"';
      return '<a $href class="breadcrumb-item$active">${entity.name}</a>';
    }).join(' ');

    var pathPrefix =
        p.split(file.path).skip(1).map((e) => '..').join(p.separator);
    if (pathPrefix.isNotEmpty) pathPrefix = '$pathPrefix/';

    return htmlTemplate.templateSubtitute(
      pageTitle: name,
      pathPrefix: pathPrefix,
      navbar: navbarContent,
      sideNav: sidenavContents,
      breadcrumbs: breadcrumbsContent,
      pageContent: page.contents,
      toc: page.outline?.asHtml ?? '',
    );
  }

  String _genSidenav(DocFile page, DocEntity entity, {bool? ext}) {
    // class='collapsed' on a hrefs to toggle a header closed
    // class='collapse' on ul's to hide the children

    if (entity is DocWorkspace) {
      var buf = StringBuffer('<ul class="nav flex-column">');
      // buf.writeln(_genSidenav(page, entity.mainFile!));
      for (var child in entity.children) {
        buf.writeln(_genSidenav(page, child, ext: child is DocFile));
      }
      buf.writeln('</ul>');
      return buf.toString();
    } else if (entity is DocFile) {
      var active = entity == page ? ' active' : '';
      var extClass = (ext ?? false) ? ' external' : '';
      return '<li class="nav-item">'
          '<a href="${pathTo(entity, from: page)}" '
          'class="nav-link$active$extClass">${entity.name}</a>'
          '</li>';
    } else {
      entity as DocContainer;

      var buf = StringBuffer('<li class="nav-item">');

      var active = entity.mainFile == page ? ' active' : '';
      var href = '';
      if (entity.mainFile != null) {
        href = 'href="${pathTo(entity.mainFile!, from: page)}"';
      }
      buf.writeln('<a $href class="nav-link$active" data-toggle="collapse">'
          '${entity.name}</a>');

      if (entity.children.isNotEmpty) {
        buf.writeln('<ul class="nav flex-column">');
        for (var child in entity.children) {
          buf.writeln(_genSidenav(page, child));
        }
        buf.writeln('</ul>');
      }

      buf.writeln('</li>');

      return buf.toString();
    }
  }

  @override
  String toString() => 'DocWorkspace $name';

  static DocWorkspace fromPackage(HtmlTemplate htmlTemplate, Directory dir) {
    var pubspec =
        yaml.loadYaml(File(p.join(dir.path, 'pubspec.yaml')).readAsStringSync())
            as yaml.YamlMap;

    var workspace = DocWorkspace(
      'package:${pubspec['name']}',
      htmlTemplate: htmlTemplate,
      isPackage: true,
    );

    for (var file in dir
        .listSyncSorted()
        .whereType<File>()
        .where((f) => p.extension(f.path) == '.md' || f.name == 'LICENSE')) {
      var name = p.relative(file.path, from: dir.path);
      var path = '${p.withoutExtension(name)}.html';
      if (name == 'README.md') {
        workspace.mainFile =
            DocFile(workspace, name, 'index.html', markdownGenerator(file));
      } else if (name == 'CHANGELOG.md' || name == 'LICENSE.md') {
        workspace.navFiles
            .add(DocFile(workspace, name, path, markdownGenerator(file)));
      } else if (name == 'LICENSE') {
        workspace.navFiles
            .add(DocFile(workspace, name, path, plaintextGenerator(file)));
      } else {
        workspace
            .addChild(DocFile(workspace, name, path, markdownGenerator(file)));
      }
    }

    var docDir = Directory(p.join(dir.path, 'doc'));
    if (docDir.existsSync()) {
      for (var file in docDir
          .listSyncSorted()
          .whereType<File>()
          .where((f) => p.extension(f.path) == '.md')) {
        var name = file.name;
        var path = '${p.withoutExtension(name)}.html';
        workspace
            .addChild(DocFile(workspace, name, path, markdownGenerator(file)));
      }
    }

    return workspace;
  }
}

class Outline {
  final List<Heading> items = [];

  void add(Heading heading) {
    if (items.isEmpty) {
      items.add(heading);
    } else if (items.last.level >= heading.level) {
      items.add(heading);
    } else {
      items.last.add(heading);
    }
  }

  String get asHtml {
    var buf = StringBuffer('<ul id="toc" class="section-nav">');
    for (var item in items) {
      buf.writeln(item.asHtml);
    }
    buf.writeln('</ul>');
    return buf.toString();
  }
}

class Heading {
  final String label;
  final String? id;
  final int level;

  final List<Heading> children = [];

  Heading(this.label, {this.id, this.level = 2});

  void add(Heading heading) {
    if (children.isEmpty) {
      children.add(heading);
    } else if (children.last.level >= heading.level) {
      children.add(heading);
    } else {
      children.last.add(heading);
    }
  }

  String get asHtml {
    var buf = StringBuffer('<li class="toc-entry nav-item toc-h$level">');
    var href = id == null ? '' : 'href="#$id"';
    buf.writeln('<a class="nav-link" $href>$label</a>');
    if (children.isNotEmpty) {
      buf.writeln('<ul class="nav">');
      for (var child in children) {
        buf.writeln(child.asHtml);
      }
      buf.writeln('</ul>');
    }
    buf.writeln('</li>');
    return buf.toString();
  }

  @override
  String toString() => id == null ? '$label h$level' : '$label h$level ($id)';
}
