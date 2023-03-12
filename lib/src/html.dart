import 'dart:io';
import 'dart:isolate';

import 'package:path/path.dart' as p;

import 'utils.dart';

class HtmlTemplate {
  static Future<HtmlTemplate> initDir(Directory dir, {Stats? stats}) async {
    final cssData = await _loadResourceData('styles.css');
    final cssFile = File(p.join(dir.path, 'styles.css'));
    cssFile.writeAsStringSync(cssData);
    stats?.genFile(cssFile);

    final iconData = await _loadResourceData('dart.svg');
    final iconFile = File(p.join(dir.path, 'dart.svg'));
    iconFile.writeAsStringSync(iconData);
    stats?.genFile(iconFile);

    final htmlData = await _loadResourceData('template.html');
    return HtmlTemplate._(htmlData);
  }

  final String htmlTemplateData;

  HtmlTemplate._(this.htmlTemplateData);

  String templateSubtitute({
    required String pageTitle,
    required String pathPrefix,
    String navbar = '',
    String sideNav = '',
    String breadcrumbs = '',
    String pageContent = '',
    String toc = '',
    String footerSection = '',
  }) {
    return htmlTemplateData
        .replaceAll('{{ page-title }}', pageTitle)
        .replaceAll('{{ prefix }}', pathPrefix)
        .replaceFirst('{{ navbar }}', navbar)
        .replaceFirst('{{ sidenav }}', sideNav)
        .replaceFirst('{{ breadcrumbs }}', breadcrumbs)
        .replaceFirst('{{ page-content }}', pageContent)
        .replaceFirst('{{ toc }}', toc)
        .replaceFirst('{{ footer-section }}', footerSection);
  }
}

// template.html
Future<String> _loadResourceData(String name) async {
  var packageUri = Uri.parse('package:jot/resources/$name');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsStringSync();
}
