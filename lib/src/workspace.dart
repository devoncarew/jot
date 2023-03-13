import 'dart:convert';
import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;

import 'api.dart';
import 'html.dart';
import 'markdown.dart';
import 'render.dart';
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
    var results = convertMarkdownWithOutline(content);
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

FileContentGenerator libraryGenerator(Library library) {
  return (DocWorkspace workspace, DocFile file) async {
    var buf = StringBuffer();

    if (file.parentPackage != null) {
      var packageRef = '${file.parentPackage!.name}/${file.name}';
      buf.writeln('<h1>$packageRef</h1>');
    }

    if (library.docs != null) {
      buf.writeln(convertMarkdown(library.docs!));
    }

    var pageItemRenderer = OutlineRenderer();

    var outline = Outline();
    var outlineRenderer = OutlineRenderer();

    for (var group in library.groups.values) {
      buf.writeln('<h2 id="${group.name}">${group.name}</h2>');
      outline.add(Heading(group.name, id: group.name, level: 2));

      for (var item in group.items) {
        // todo: have Item get an 'anchorId' property

        buf.writeln('<h3 id="${item.name}">'
            '${pageItemRenderer.render(group.type, item)}</h3>');
        outline.add(Heading(outlineRenderer.render(group.type, item),
            id: item.name, level: 3));
        if (item.docs != null) {
          if (item is ItemContainer) {
            buf.writeln(convertMarkdown(firstSentence(item.docs!)));
          } else {
            buf.writeln(convertMarkdown(item.docs!));
          }
        }
      }
    }

    return GenerationResults(buf.toString(), outline);
  };
}

FileContentGenerator itemContainerGenerator(ItemContainer itemContainer) {
  return (DocWorkspace workspace, DocFile file) async {
    var buf = StringBuffer();
    buf.writeln('<h1>${itemContainer.name}</h1>');

    if (itemContainer.docs != null) {
      buf.writeln(convertMarkdown(itemContainer.docs!));
    }

    var pageItemRenderer = OutlineRenderer();

    var outline = Outline();
    var outlineRenderer = OutlineRenderer();

    for (var group in itemContainer.groups.values) {
      buf.writeln('<h2 id="${group.name}">${group.name}</h2>');
      outline.add(Heading(group.name, id: group.name, level: 2));

      for (var item in group.items) {
        buf.writeln(
            '<h3 id="${item.name}">${pageItemRenderer.render(group.type, item)}</h3>');
        outline.add(Heading(outlineRenderer.render(group.type, item),
            id: item.name, level: 3));
        if (item.docs != null) {
          buf.writeln(convertMarkdown(item.docs!));
        }
      }
    }

    return GenerationResults(buf.toString(), outline);
  };
}

abstract class DocEntity {
  final DocEntity? parent;
  final String name;

  DocEntity(this.parent, this.name);

  DocWorkspace get workspace => parent!.workspace;

  DocContainer? get parentPackage => parent?.parentPackage;

  Future<void> generate(
    Directory dir, {
    required Logger logger,
    Stats? stats,
    bool quiet = false,
  });

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
  Future<void> generate(
    Directory dir, {
    required Logger logger,
    Stats? stats,
    bool quiet = false,
  }) async {
    var page = await contentGenerator(workspace, this);
    var fileContents = await workspace.generateWorkspacePage(this, page);
    var file = File(p.join(dir.path, path));
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(fileContents);

    stats?.genFile(file);

    if (!quiet) logger.stdout('  $path');
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
  Future<void> generate(
    Directory dir, {
    required Logger logger,
    Stats? stats,
    bool quiet = false,
  }) async {
    // mainFile
    // todo: always generate an index file
    await mainFile?.generate(dir, logger: logger, stats: stats);

    // children
    for (var child in children) {
      await child.generate(dir, logger: logger, stats: stats, quiet: true);
    }
  }

  @override
  String toString() => 'DocContainer $name';
}

class DocWorkspace extends DocContainer {
  final HtmlTemplate htmlTemplate;
  final List<DocFile> navFiles = [];
  String? footer;

  DocWorkspace(String name, {super.isPackage, required this.htmlTemplate})
      : super(null, name) {
    // Placeholder for the main file.
    mainFile = DocFile(this, 'index.html', 'index.html', emptyContentGenerator);
  }

  @override
  DocWorkspace get workspace => this;

  @override
  Future<void> generate(
    Directory dir, {
    required Logger logger,
    Stats? stats,
    bool quiet = false,
  }) async {
    // mainFile
    await mainFile?.generate(dir, logger: logger, stats: stats);

    // navFiles
    for (var navElement in navFiles) {
      await navElement.generate(dir, logger: logger, stats: stats, quiet: true);
    }

    // children
    for (var child in children) {
      await child.generate(dir, logger: logger, stats: stats);
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

    // side nav
    var sidenavContents = _genSidenav(file, this);

    // breadcrumbs
    var breadcrumbs = file.breadcrumbs;
    if (file == workspace.mainFile) {
      breadcrumbs = breadcrumbs.take(1);
    }
    var breadcrumbsContent = breadcrumbs.map((entity) {
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
      footerSection: footer ?? '',
    );
  }

  String _genSidenav(DocFile page, DocEntity entity, {bool? ext}) {
    // class='collapsed' on a hrefs to toggle a header closed
    // class='collapse' on ul's to hide the children

    if (entity is DocWorkspace) {
      var buf = StringBuffer('<ul class="nav flex-column">');
      buf.writeln(_genSidenav(page, entity.mainFile!, ext: true));
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

    final packageName = pubspec['name'] as String?;
    final packageVersion = pubspec['version'] as String?;

    var workspace = DocWorkspace(
      'package:$packageName',
      htmlTemplate: htmlTemplate,
      isPackage: true,
    );
    if (packageVersion != null) {
      workspace.footer = 'package:$packageName v$packageVersion';
    }

    for (var file in dir
        .listSyncSorted()
        .whereType<File>()
        .where((f) => p.extension(f.path) == '.md' || f.name == 'LICENSE')) {
      var name = p.relative(file.path, from: dir.path);
      var path = '${p.withoutExtension(name)}.html';
      if (name == 'README.md') {
        workspace.mainFile = DocFile(
            workspace, workspace.name, 'index.html', markdownGenerator(file));
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
