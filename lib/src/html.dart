import 'dart:io';
import 'dart:isolate';

import 'package:path/path.dart' as p;

import 'utils.dart';

class HtmlTemplate {
  static Future<HtmlTemplate> initDir(Directory dir, {Stats? stats}) async {
    final styleLightFile = File(p.join(dir.path, 'styles-light.css'));
    var styleData = await _loadResourceData(styleLightFile.name);
    styleLightFile.writeAsStringSync(styleData);
    stats?.genFile(styleLightFile);

    final styleDarkFile = File(p.join(dir.path, 'styles-dark.css'));
    styleData = await _loadResourceData(styleDarkFile.name);
    styleDarkFile.writeAsStringSync(styleData);
    stats?.genFile(styleDarkFile);

    final scriptFile = File(p.join(dir.path, 'script.js'));
    final scriptData = await _loadResourceData(scriptFile.name);
    scriptFile.writeAsStringSync(scriptData);
    stats?.genFile(scriptFile);

    final htmlData = await _loadResourceData('index.html');
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
    String footer = '',
  }) {
    return htmlTemplateData
        .replaceAll('{{ page-title }}', pageTitle)
        .replaceAll('{{ prefix }}', pathPrefix)
        .replaceFirst('{{ navbar }}', navbar)
        .replaceFirst('{{ sidenav }}', sideNav)
        .replaceFirst('{{ breadcrumbs }}', breadcrumbs)
        .replaceFirst('{{ page-content }}', pageContent)
        .replaceFirst('{{ toc }}', toc)
        .replaceFirst('{{ footer }}', footer);
  }
}

// template.html
Future<String> _loadResourceData(String name) async {
  var packageUri = Uri.parse('package:jot/resources/$name');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsStringSync();
}
