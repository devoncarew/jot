import 'dart:io';
import 'dart:isolate';

import 'package:path/path.dart' as p;

import 'utils.dart';

class HtmlTemplate {
  static Future<HtmlTemplate> initDir(Directory dir, {Stats? stats}) async {
    const resources = [
      'script.js',
      'styles.css',
      'styles-dark.css',
      'styles-light.css',
      'toggle-dark.svg',
      'toggle-light.svg',
    ];

    for (var resource in resources) {
      final file = File(p.join(dir.path, 'resources', resource));
      if (!file.parent.existsSync()) {
        file.parent.createSync(recursive: true);
      }
      var styleData = await _loadResourceData(resource);
      file.writeAsStringSync(styleData);
      stats?.genFile(file);
    }

    final htmlData = await _loadResourceData('index.html');
    return HtmlTemplate._(htmlData);
  }

  final String htmlTemplateData;

  HtmlTemplate._(this.htmlTemplateData);

  String templateSubtitute({
    required String pageTitle,
    required String pathPrefix,
    required String pageRef,
    String navbar = '',
    String sideNav = '',
    String breadcrumbs = '',
    String pageContent = '',
    String toc = '',
    String footer = '',
  }) {
    var results = htmlTemplateData
        .replaceAll('{{ page-title }}', pageTitle)
        .replaceAll('{{ prefix }}', pathPrefix)
        .replaceAll('{{ pageRef }}', pageRef)
        .replaceFirst('{{ navbar }}', navbar)
        .replaceFirst('{{ sidenav }}', sideNav)
        .replaceFirst('{{ breadcrumbs }}', breadcrumbs)
        .replaceFirst('{{ page-content }}', pageContent)
        .replaceFirst('{{ toc }}', toc)
        .replaceFirst('{{ footer }}', footer);

    var lastWasBlank = false;

    results = results
        .split('\n')
        .map((line) {
          line = line.trimRight();

          if (line.endsWith('-->') && line.trim().startsWith('<!--')) {
            line = '';
          }

          if (line.isEmpty) {
            if (lastWasBlank) {
              return null;
            } else {
              lastWasBlank = true;
              return line;
            }
          } else {
            lastWasBlank = false;
            return line;
          }
        })
        .whereType<String>()
        .join('\n');

    return '$results\n';
  }
}

// template.html
Future<String> _loadResourceData(String name) async {
  var packageUri = Uri.parse('package:jot/resources/$name');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsStringSync();
}
