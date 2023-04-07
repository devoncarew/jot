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

  HtmlTemplate._(this.htmlTemplateData) {
    _parseTemplate();
  }

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
    final subs = {
      'page-title': pageTitle,
      'prefix': pathPrefix,
      'pageRef': pageRef,
      'navbar': navbar,
      'sidenav': sideNav,
      'breadcrumbs': breadcrumbs,
      'page-content': pageContent,
      'toc': toc,
      'footer': footer,
    };

    var results = _generateString(subs);

    return results;

    // TODO: ~10% of our generation time is spent in this split() call.

    // var lastWasBlank = false;

    // results = results
    //     .split('\n')
    //     .map((line) {
    //       line = line.trimRight();

    //       if (line.endsWith('-->') && line.trim().startsWith('<!--')) {
    //         line = '';
    //       }

    //       if (line.isEmpty) {
    //         if (lastWasBlank) {
    //           return null;
    //         } else {
    //           lastWasBlank = true;
    //           return line;
    //         }
    //       } else {
    //         lastWasBlank = false;
    //         return line;
    //       }
    //     })
    //     .whereType<String>()
    //     .join('\n');

    // return '$results\n';
  }

  late final List<_Location> _locations;

  void _parseTemplate() {
    final regex = RegExp(r'{{\s+([\w-]+)\s+}}');

    var results = <_Location>[];

    for (var match in regex.allMatches(htmlTemplateData)) {
      results.add(_Location(match.start, match.end, match.group(1)!));
    }

    _locations = results.toList();
  }

  String _generateString(Map<String, String> subs) {
    var buf = StringBuffer();
    var offset = 0;

    for (var loc in _locations) {
      if (offset < loc.start) {
        buf.write(htmlTemplateData.substring(offset, loc.start));
        offset = loc.start;
      }

      buf.write(subs[loc.id]!);
      offset = loc.end;
    }

    if (offset < htmlTemplateData.length) {
      buf.write(htmlTemplateData.substring(offset));
    }

    return buf.toString();
  }
}

class _Location {
  final int start;
  final int end;
  final String id;

  _Location(this.start, this.end, this.id);

  @override
  String toString() => '$id $start $end';
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
