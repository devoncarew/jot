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
    } else {
      buf.writeln('<h1>${file.name}</h1>');
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
      if (item is DocFile) {
        result.add(item);
      } else if (item is DocContainer) {
        if (!result.contains(item.mainFile)) {
          result.add(item.mainFile!);
        }
      }
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

  bool hasChild(DocFile page) {
    if (mainFile == page) return true;
    if (children.contains(page)) return true;
    return false;
  }
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
        active = ' navbar__link--active';
      } else if (!navFiles.contains(file) && target == mainFile) {
        active = ' navbar__link--active';
      }

      var href = file == target ? '' : 'href="${pathTo(target, from: file)}"';
      var name = target == mainFile ? 'Docs' : target.name;
      return '<a $href class="navbar__item navbar__link$active">$name</a>';
    }).join(' ');

    // side nav
    var sidenavContents = _genSidenav(file, this);

    // breadcrumbs
    var breadcrumbs = file.breadcrumbs;
    if (breadcrumbs.length == 1) {
      breadcrumbs = [];
    }
    var breadcrumbsContent = breadcrumbs.map((entity) {
      var target =
          entity is DocFile ? entity : (entity as DocContainer).mainFile!;
      var href = 'href="${pathTo(target, from: file)}"';

      if (workspace.mainFile == target) {
        return '''
          <li class="breadcrumbs__item">
            <a aria-label="Home page" class="breadcrumbs__link" $href>
              <svg viewBox="0 0 24 24" class="breadcrumbHomeIcon">
                <path
                  d="M10 19v-5h4v5c0 .55.45 1 1 1h3c.55 0 1-.45 1-1v-7h1.7c.46 0 .68-.57.33-.87L12.67 3.6c-.38-.34-.96-.34-1.34 0l-8.36 7.53c-.34.3-.13.87.33.87H5v7c0 .55.45 1 1 1h3c.55 0 1-.45 1-1z"
                  fill="currentColor">
                </path>
              </svg>
            </a>
          </li>''';
      } else if (file == target) {
        return '<li class="breadcrumbs__item breadcrumbs__item--active">'
            '<span class="breadcrumbs__link">${entity.name}</span></li>';
      } else {
        return '<li class="breadcrumbs__item">'
            '<a $href class="breadcrumbs__link">${entity.name}</a></li>';
      }
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
      footer: footer ?? '',
    );
  }

  String _genSidenav(DocFile page, DocEntity entity) {
    if (entity is DocWorkspace) {
      var buf = StringBuffer('<ul class="theme-doc-sidebar-menu menu__list">');
      buf.writeln(_genSidenav(page, entity.mainFile!));
      for (var child in entity.children) {
        buf.writeln(_genSidenav(page, child));
      }
      buf.writeln('</ul>');
      return buf.toString();
    } else if (entity is DocFile) {
      var active = entity == page ? 'menu__link--active' : '';

      return '<li class="theme-doc-sidebar-item-link theme-doc-sidebar-item-link-level-2 menu__list-item">'
          '<a class="menu__link $active" '
          '  href="${pathTo(entity, from: page)}">${entity.name}</a>'
          '</li>';
    } else {
      entity as DocContainer;

      // todo: add 'menu__list-item--collapsed' once the SPA is working
      var buf = StringBuffer('<li class="theme-doc-sidebar-item-category '
          'theme-doc-sidebar-item-category-level-1 menu__list-item">');

      var activeContains = entity.hasChild(page) ? 'menu__link--active' : '';
      var href = '';
      if (entity.mainFile != null) {
        href = 'href="${pathTo(entity.mainFile!, from: page)}"';
      }

      var menuActive =
          entity.mainFile == page ? 'menu__list-item-collapsible--active' : '';

      buf.writeln('''
        <div class="menu__list-item-collapsible $menuActive">
          <a $href class="menu__link menu__link--sublist $activeContains">${entity.name}</a>
          <button type="button" class="clean-btn menu__caret"></button>
        </div>''');

      if (entity.children.isNotEmpty) {
        buf.writeln('<ul class="menu__list">');
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
      var title =
          titleCase(p.basenameWithoutExtension(file.path).toLowerCase());

      var path = '${p.withoutExtension(name)}.html';
      if (name == 'README.md') {
        workspace.mainFile =
            DocFile(workspace, title, 'index.html', markdownGenerator(file));
      } else if (name == 'CHANGELOG.md' || name == 'LICENSE.md') {
        workspace.navFiles
            .add(DocFile(workspace, title, path, markdownGenerator(file)));
      } else if (name == 'LICENSE') {
        workspace.navFiles
            .add(DocFile(workspace, title, path, plaintextGenerator(file)));
      } else {
        workspace
            .addChild(DocFile(workspace, title, path, markdownGenerator(file)));
      }
    }

    var docDir = Directory(p.join(dir.path, 'doc'));
    if (docDir.existsSync()) {
      for (var file in docDir
          .listSyncSorted()
          .whereType<File>()
          .where((f) => p.extension(f.path) == '.md')) {
        var name = file.name;
        var title =
            titleCase(p.basenameWithoutExtension(file.path).toLowerCase());
        var path = '${p.withoutExtension(name)}.html';
        workspace
            .addChild(DocFile(workspace, title, path, markdownGenerator(file)));
      }
    }

    return workspace;
  }
}
