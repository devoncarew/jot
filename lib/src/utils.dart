import 'dart:io';
import 'dart:convert' as convert;

import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

String stripDartdoc(String str) {
  str = str.trim();

  if (str.startsWith('/**')) {
    str = str.substring('/**'.length);
    if (str.endsWith('*/')) str = str.substring(0, str.length - '*/'.length);
    return str
        .split('\n')
        .map((line) => line.trimLeft())
        .map((line) {
          if (line.startsWith('* ')) return line.substring(2);
          if (line.startsWith('*')) return line.substring(1);
          return line;
        })
        .map((line) => line.trimRight())
        .skipWhile((l) => l.trim().isEmpty)
        .join('\n');
  } else {
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
}

String titleCase(String str) {
  return str.substring(0, 1).toUpperCase() + str.substring(1);
}

String htmlEscape(String text) => convert.htmlEscape.convert(text);

/// Returns an adjusted lexical compare.
///
/// Adjustments include sorting case-insensitive.
int adjustedLexicalCompare(String a, String b) {
  if (a.isEmpty || b.isEmpty) return a.compareTo(b);

  var lowerA = a.toLowerCase();
  var lowerB = b.toLowerCase();

  return lowerA.compareTo(lowerB);
}

String stringToAnchorId(String str) {
  return Uri.encodeQueryComponent(str);
}

extension DirectoryExtension on Directory {
  List<FileSystemEntity> listSyncSorted({bool recursive = false}) {
    var entites = listSync(recursive: recursive);
    entites.sort((a, b) => adjustedLexicalCompare(a.path, b.path));
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
    var buf = StringBuffer(
        '<ul class="table-of-contents table-of-contents__left-border">');
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
    var buf = StringBuffer('<li>');
    var href = id == null ? '' : 'href="#$id"';
    buf.writeln(
        '<a class="table-of-contents__link toc-highlight" $href>$label</a>');
    if (children.isNotEmpty) {
      buf.writeln('<ul>');
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

class DartFormat {
  // todo: if there are any formatting failures, return the input string
  static String asFunction(String str) {
    return _dartFormat(str, '{}');
  }

  static String asConstructor(
    String str, {
    required String className,
    bool isConst = false,
  }) {
    return _dartFormat(
      str,
      isConst ? ';' : '{}',
      prefix: 'class $className {',
      suffix: '}',
      trimIndent: true,
    );
  }

  static String asMethod(String str) {
    return _dartFormat(
      str,
      '{}',
      prefix: 'class Foo {',
      suffix: '}',
      trimIndent: true,
    );
  }

  static String asTypeAlias(String str) {
    return _dartFormat(str, ';');
  }

  static String _dartFormat(
    String fragment,
    String formattingSuffix, {
    String? prefix,
    String? suffix,
    bool trimIndent = false,
  }) {
    var source = '''
${prefix ?? ''}
// cut 1
$fragment$formattingSuffix
// cut 2
${suffix ?? ''}
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

    if (trimIndent) {
      source = source
          .split('\n')
          .map((line) => line.startsWith('  ') ? line.substring(2) : line)
          .join('\n');
    }

    return source;
  }
}
