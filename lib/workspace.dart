import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;

import 'api.dart';
import 'src/html.dart';
import 'src/markdown.dart';
import 'src/utils.dart';

typedef FileContentGenerator = Future<GenerationResults> Function(
    DocWorkspace workspace, DocFile thisFile);

class GenerationResults {
  final String contents;
  final Outline? outline;

  GenerationResults(this.contents, [this.outline]);
}

Future<GenerationResults> emptyContentGenerator(
    DocWorkspace workspace, DocFile thisFile) {
  return Future.value(GenerationResults(''));
}

FileContentGenerator createMarkdownGenerator(File markdownFile) {
  return (DocWorkspace workspace, DocFile thisFile) async {
    var content = markdownFile.readAsStringSync();
    var results = convertMarkdownWithOutline(content);
    return GenerationResults(results.html, results.outline);
  };
}

FileContentGenerator createPlaintextGenerator(File markdownFile) {
  return (DocWorkspace workspace, DocFile thisFile) async {
    var content = markdownFile.readAsStringSync();
    var pageContent = htmlEscape(content);
    return GenerationResults('<pre>$pageContent</pre>');
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
        if (item.mainFile != null && !result.contains(item.mainFile)) {
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

  /// If set, the script to specify in an import.
  String? importScript;

  DocFile(super.parent, super.name, this.path, this.contentGenerator);

  Future<GenerationResults> generatePageContents() {
    return contentGenerator(workspace, this);
  }

  @override
  Future<void> generate(
    Directory dir, {
    required Logger logger,
    Stats? stats,
    bool quiet = false,
  }) async {
    var pageContents = await generatePageContents();
    var fileContents =
        await workspace.generateWorkspacePage(this, pageContents);
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

  int get itemCount {
    var count = mainFile == null ? 0 : 1;
    for (var child in children) {
      if (child is DocContainer) {
        count += child.itemCount;
      } else {
        count++;
      }
    }
    return count;
  }

  @override
  DocContainer? get parentPackage => isPackage ? this : parent?.parentPackage;

  T addChild<T extends DocEntity>(T entity) {
    children.add(entity);
    return entity;
  }

  DocEntity? getChild(String name) {
    return children.firstWhereOrNull((c) => c.name == name);
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

  // todo: temp; move this field to a Generator instance
  Api? api;

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
      // We use our own custom 'relative' implementation as the package:path one
      // obsessively call's Directory.current, and would contribute as much as
      // 60% of our runtime time.
      return target.path.pathRelative(fromDir: p.dirname(from.path));
      // return p.relative(target.path, from: p.dirname(from.path));
    }
  }

  Future<String> generateWorkspacePage(
      DocFile file, GenerationResults page) async {
    // navbar
    var navbarContent = [
      mainFile!,
      ...navFiles,
    ].map((target) {
      var active = '';
      if (navFiles.contains(file) && target == file) {
        active = ' navbar__link--active';
      } else if (!navFiles.contains(file) && target == mainFile) {
        active = ' navbar__link--active';
      }

      var href = 'href="${pathTo(target, from: file)}"';
      var name = target == mainFile ? 'Docs' : target.name;
      return '<a $href class="navbar__item navbar__link$active" data-jot>$name</a>';
    }).join(' ');

    // side nav
    var sidenavContents = _genSidenav(file, this).trimRight();

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
            <a class="breadcrumbs__link" $href>
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
      pageRef: file.path,
      navbar: navbarContent,
      sideNav: sidenavContents,
      breadcrumbs: breadcrumbsContent,
      pageContent: page.contents.trimRight(),
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
      var active = entity == page ? ' menu__link--active' : '';

      return '<li class="menu__list-item">'
          '<a class="menu__link$active" '
          'href="${pathTo(entity, from: page)}" data-jot>${entity.name}</a>'
          '</li>';
    } else {
      entity as DocContainer;

      // keep menus open if they're in the parent path
      final collapsed =
          entity.hasChild(page) ? '' : 'menu__list-item--collapsed';
      var buf = StringBuffer('<li class="theme-doc-sidebar-item-category '
          '$collapsed menu__list-item">');

      var active = entity.mainFile == page ? 'menu__link--active' : '';
      var href = '';
      if (entity.mainFile != null) {
        href = 'href="${pathTo(entity.mainFile!, from: page)}"';
      }

      buf.writeln('''

<div class="menu__list-item-collapsible">
  <a $href class="menu__link menu__link--sublist $active" data-jot>${entity.name}</a>
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
        workspace.mainFile = DocFile(
            workspace, title, 'index.html', createMarkdownGenerator(file));
      } else if (name == 'CHANGELOG.md' || name == 'LICENSE.md') {
        workspace.navFiles.add(
            DocFile(workspace, title, path, createMarkdownGenerator(file)));
      } else if (name == 'LICENSE') {
        workspace.navFiles.add(
            DocFile(workspace, title, path, createPlaintextGenerator(file)));
      } else {
        workspace.addChild(
            DocFile(workspace, title, path, createMarkdownGenerator(file)));
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
        workspace.addChild(
            DocFile(workspace, title, path, createMarkdownGenerator(file)));
      }
    }

    return workspace;
  }

  DocFile? getForPath(String path) {
    for (var file in navFiles) {
      if (file.path == path) return file;
    }

    DocFile? check(DocContainer container, String path) {
      if (container.mainFile?.path == path) return container.mainFile;

      for (var child in container.children) {
        if (child is DocFile) {
          if (child.path == path) return child;
        } else {
          var result = check(child as DocContainer, path);
          if (result != null) return result;
        }
      }

      return null;
    }

    return check(this, path);
  }
}
