import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:path/path.dart' as p;

import 'utils.dart';

class HtmlTemplate {
  static Future<HtmlTemplate> initDir(
    Directory dir, {
    Stats? stats,
    bool writeResouces = true,
  }) async {
    const resources = [
      'script.js',
      'styles.css',
      'styles-dark.css',
      'styles-light.css',
      'toggle-dark.svg',
      'toggle-light.svg',
    ];

    if (writeResouces) {
      for (var resource in resources) {
        final file = File(p.join(dir.path, 'resources', resource));
        if (!file.parent.existsSync()) {
          file.parent.createSync(recursive: true);
        }
        var data = await loadResourceDataAsBytes(resource);
        file.writeAsBytesSync(data);
        stats?.genFile(file);
      }
    }

    final htmlData = await loadResourceDataAsString('index.html');
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

Future<String> loadResourceDataAsString(String name) async {
  var packageUri = Uri.parse('package:jot/resources/$name');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsStringSync();
}

Future<Uint8List> loadResourceDataAsBytes(String name) async {
  var packageUri = Uri.parse('package:jot/resources/$name');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsBytesSync();
}
