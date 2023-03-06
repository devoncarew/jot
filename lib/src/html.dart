import 'dart:io';
import 'dart:isolate';

Future<String> get htmlTemplateData async {
  var packageUri = Uri.parse('package:jot/resources/template.html');
  var fileUri = await Isolate.resolvePackageUri(packageUri);
  return File(fileUri!.toFilePath()).readAsStringSync();
}

String templateSubtitute(
  String template, {
  required String pageTitle,
  String navbar = '',
  String sideNav = '',
  String subnav = '',
  String pageContent = '',
  String toc = '',
  String footerSection = '',
}) {
  return template
      .replaceAll('{{ page-title }}', pageTitle)
      .replaceFirst('{{ navbar }}', navbar)
      .replaceFirst('{{ sidenav }}', sideNav)
      .replaceFirst('{{ subnav }}', subnav)
      .replaceFirst('{{ page-content }}', pageContent)
      .replaceFirst('{{ toc }}', toc)
      .replaceFirst('{{ footer-section }}', footerSection);
}
