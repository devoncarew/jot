import 'dart:html';

T $id<T extends Element>(String id) => document.getElementById(id) as T;

T? $query<T extends Element>(String selector) =>
    document.querySelector(selector) as T?;

ElementList<T> $queryAll<T extends Element>(String selectors) =>
    document.querySelectorAll(selectors);

extension ElementExtension on Element {
  bool parentOf(Element? potentialChild) {
    while (potentialChild != null) {
      potentialChild = potentialChild.parent;
      if (this == potentialChild) return true;
    }
    return false;
  }
}

String plural(String word, int count) => count == 1 ? word : '${word}s';

class Path {
  String parent(String path) {
    if (path.contains('/')) {
      return path.substring(0, path.lastIndexOf('/'));
    } else {
      return '';
    }
  }

  String file(String path) {
    if (path.contains('/')) {
      return path.substring(path.lastIndexOf('/') + 1);
    } else {
      return path;
    }
  }

  String join(String a, String b) {
    if (a.isNotEmpty) {
      return '$a/$b';
    } else {
      return b;
    }
  }

  String normalize(String path) {
    if (!path.contains('..')) return path;

    var tokens = path.split('/');

    for (var i = 0; i < tokens.length;) {
      var token = tokens[i];
      if (token == '..' && i > 0 && tokens[i - 1] != '..') {
        tokens.removeAt(i);
        tokens.removeAt(i - 1);
        i--;
      } else {
        i++;
      }
    }

    return tokens.join('/');
  }

  String relative(String path, {required String from}) {
    if (from.isEmpty) return path;

    var paths = path.split('/');
    var froms = from.split('/');

    while (paths.isNotEmpty && froms.isNotEmpty && paths.first == froms.first) {
      paths = paths.sublist(1);
      froms = froms.sublist(1);
    }

    for (var _ in froms) {
      paths.insert(0, '..');
    }

    return paths.join('/');
  }
}
