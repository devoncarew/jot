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

String titleCase(String str) {
  return str.substring(0, 1).toUpperCase() + str.substring(1);
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

class Outline {
  final List<Heading> items = [];

  void add(Heading heading) {
    if (items.isEmpty) {
      items.add(heading);
    } else if (items.last.level >= heading.level) {
      items.add(heading);
    } else {
      items.last.add(heading);
    }
  }

  String get asHtml {
    var buf = StringBuffer('<ul id="toc" class="section-nav">');
    for (var item in items) {
      buf.writeln(item.asHtml);
    }
    buf.writeln('</ul>');
    return buf.toString();
  }
}

class Heading {
  final String label;
  final String? id;
  final int level;

  final List<Heading> children = [];

  Heading(this.label, {this.id, this.level = 2});

  void add(Heading heading) {
    if (children.isEmpty) {
      children.add(heading);
    } else if (children.last.level >= heading.level) {
      children.add(heading);
    } else {
      children.last.add(heading);
    }
  }

  String get asHtml {
    var buf = StringBuffer('<li class="toc-entry nav-item toc-h$level">');
    var href = id == null ? '' : 'href="#$id"';
    buf.writeln('<a class="nav-link" $href>$label</a>');
    if (children.isNotEmpty) {
      buf.writeln('<ul class="nav">');
      for (var child in children) {
        buf.writeln(child.asHtml);
      }
      buf.writeln('</ul>');
    }
    buf.writeln('</li>');
    return buf.toString();
  }

  @override
  String toString() => id == null ? '$label h$level' : '$label h$level ($id)';
}

class Stats {
  final Stopwatch timer = Stopwatch();
  int fileCount = 0;
  int byteCount = 0;

  void start() {
    timer.start();
  }

  void genFile(File file) {
    fileCount++;
    byteCount += file.lengthSync();
  }

  String get elapsedSeconds =>
      (timer.elapsedMilliseconds / 1000.0).toStringAsFixed(1);

  String get sizeDesc {
    const bytesPerMB = 1024.0 * 1024;

    if (byteCount >= bytesPerMB) {
      return '${(byteCount / (1024.0 * 1024.0)).toStringAsFixed(1)}MB';
    } else {
      return '${byteCount ~/ 1024.0}k';
    }
  }

  void stop() {
    timer.stop();
  }
}
