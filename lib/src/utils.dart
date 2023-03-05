import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

String stripDartdoc(String str) {
  return str
      .split('\n')
      .map((line) => line.trimLeft())
      .map((line) {
        if (line.startsWith('/// ')) return line.substring(4);
        if (line.startsWith('///')) return line.substring(3);
        return line;
      })
      .map((line) => line.trimRight())
      .join('\n');
}

String dartFormat(String fragment, String formattingSuffix) {
  var source = '''
// cut 1
$fragment$formattingSuffix
// cut 2
''';
  source = DartFormatter().format(source);
  source = source.substring(
    source.indexOf('// cut 1') + '// cut 1'.length,
    source.indexOf('// cut 2'),
  );
  source = source.trim();
  if (source.endsWith(formattingSuffix)) {
    source = source.substring(0, source.length - formattingSuffix.length);
  }
  return source.trim();
}

// String processMarkdown(String markdown) {
//   final RegExp regexp = RegExp(r'(\[[\w\.]+\])');
//   return markdown.split('\n').map((line) {
//     for (var match in regexp.allMatches(line)) {
//       var ref = match.group(1)!;
//       ref = ref.substring(1, ref.length - 1);
//       line =
//           '${line.substring(0, match.start)}`$ref`${line.substring(match.end)}';
//     }
//     return line;
//   }).join('\n');
// }

extension DirectoryExtension on Directory {
  List<FileSystemEntity> listSyncSorted({bool recursive = false}) {
    var entites = listSync(recursive: recursive);
    entites.sort((a, b) => a.path.compareTo(b.path));
    return entites;
  }
}

extension FileSystemEntityExtension on FileSystemEntity {
  String get name => p.basename(path);
}
