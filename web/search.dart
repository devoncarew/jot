import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'interop.dart';
import 'utils.dart';

class SearchUI {
  final String urlBase;

  late final InputElement searchBox;
  late final SearchResultsUI searchResultsUI;

  late final Index index;

  SearchUI(this.urlBase) {
    index = Index(urlBase);

    searchBox = $id('search') as InputElement;
    searchResultsUI = SearchResultsUI(
        $query('div.search-glass-pane')!, $query('div.search-area')!);

    document.onKeyPress.listen((event) {
      if (event.key == '/') {
        event.preventDefault();

        _activate();
      }
    });

    searchBox.onKeyDown.listen((event) {
      if (event.key == 'Escape') {
        _deactivate();
      } else if (event.key == 'Enter') {
        event.preventDefault();
        _selectCurrent();
      }
    });

    searchBox.onInput.listen((event) {
      _handleInputChanged(searchBox.value ?? '');
    });

    searchBox.onClick.listen((event) {
      _activate();
    });
  }

  void _activate() {
    searchBox.focus();
    _handleInputChanged(searchBox.value ?? '');
  }

  void _selectCurrent() {
    // todo:
  }

  void _deactivate() {
    searchBox.blur();
    searchResultsUI.hide();
  }

  void _handleInputChanged(String text) {
    text = text.trim();

    if (text.isEmpty) {
      searchResultsUI.hide();
    } else {
      searchResultsUI.show();

      index.search(text).then((results) {
        searchResultsUI.displayResults(results);
      });
    }
  }
}

class SearchResultsUI {
  static const Duration _delay = Duration(milliseconds: 200);

  final Element glassPane;
  final Element searchArea;

  SearchResultsUI(this.glassPane, this.searchArea) {
    glassPane.onMouseDown.listen((_) {
      hide();
    });
    searchArea.onMouseDown.listen((event) {
      event.stopPropagation();
    });
  }

  bool get showing => glassPane.style.display != 'none';

  void show() {
    if (!showing) {
      glassPane.style.display = 'block';
      Timer.run(() => glassPane.style.opacity = '1.0');
    }
  }

  void displayResults(SearchResults results) {
    const maxLimit = 200;

    var items = results.items.map((result) => result.item).toList();
    var total = items.length;

    if (items.length > maxLimit) {
      items = items.take(maxLimit).toList();
    }

    var ul = searchArea.querySelector('ul')!;
    ul.children.clear();
    ul.children.addAll(items.map((c) => _renderItem(results.pattern, c)));

    var footer = searchArea.querySelector('div.search-footer')!;

    if (total != items.length) {
      footer.text =
          'showing ${items.length} of ${items.length} ${plural('item', total)}';
    } else {
      footer.text = '${items.length} ${plural('item', total)}';
    }
  }

  static LIElement _renderItem(String pattern, IndexMember item) {
    var element = LIElement()..classes.addAll(['margin--sm', 'padding--sm']);
    element.children.add(
      DivElement()
        ..children.addAll([
          ..._renderMatchText(item.display, item.name, pattern),
          SpanElement()
            ..text = ' ${item.type}'
            ..classes.add('type'),
        ]),
    );
    if (item.docs == null) {
      element.children.add(
        DivElement()
          ..innerHtml = '&nbsp;'
          ..classes.add('docs'),
      );
    } else {
      element.children.add(
        DivElement()
          ..text = item.docs
          ..classes.add('docs'),
      );
    }

    element.onMouseDown.listen((event) {
      event.stopPropagation();

      print('[$item]');

      // todo:
      window.alert(item.toString());
    });

    return element;
  }

  void hide() {
    if (showing) {
      glassPane.style.opacity = '0.0';
      Timer(_delay, () => glassPane.style.display = 'none');
    }
  }
}

Iterable<Element> _renderMatchText(
    String display, String name, String pattern) sync* {
  var startsAt = 0;
  var nameIndex = display.indexOf('.$name');
  if (nameIndex != -1) {
    startsAt = nameIndex;
  }

  var matchAt = display.indexOf(pattern, startsAt);
  if (matchAt == -1) {
    matchAt = display.toLowerCase().indexOf(pattern.toLowerCase(), startsAt);
  }

  if (matchAt == -1) {
    yield SpanElement()..text = display;
  } else {
    yield SpanElement()..text = display.substring(0, matchAt);
    yield SpanElement()
      ..text = display.substring(matchAt, matchAt + pattern.length)
      ..classes.add('match');
    yield SpanElement()..text = display.substring(matchAt + pattern.length);
  }
}

class Index {
  late final List<IndexMember> members;

  final Completer _completer = Completer();

  Index(String urlBase) {
    _init(urlBase).then(
      (result) {
        members = result;

        _completer.complete();
      },
      onError: (error, stackTrace) {
        members = [];
        print('error reading index: $error');
        _completer.complete();
      },
    );
  }

  Future<void> ready() => _completer.future;

  Future<List<IndexMember>> _init(String urlBase) async {
    var response =
        (await window.fetch('${urlBase}resources/index.json')) as FetchResponse;
    var code = response.status;
    if (code == 404) {
      print('error response: $response');
      return [];
    }

    var text = await promiseToFuture<String>(response.text());
    var jsonIndex = (jsonDecode(text) as List).cast<_JsonType>();
    return jsonIndex.map(IndexMember._parse).toList();
  }

  Future<SearchResults> search(String pattern) async {
    await ready();

    var lower = pattern.toLowerCase();

    var potential = <IndexMember>[];
    for (var member in members) {
      _gatherPotentialMatches(lower, member, potential);
    }

    // TODO: consider performance optimizations if there are a large number of
    // items.

    // if (potential.length>5000) {
    //   potential =
    // }

    // todo: perform more filtering, ranking

    return SearchResults(pattern, potential);
  }

  static void _gatherPotentialMatches(
      String pattern, IndexMember member, List<IndexMember> matches) {
    if (member.name.toLowerCase().contains(pattern) && member.ref != null) {
      matches.add(member);
    }

    if (member.children.isNotEmpty) {
      for (var child in member.children) {
        _gatherPotentialMatches(pattern, child, matches);
      }
    }
  }
}

typedef _JsonType = Map<String, dynamic>;

// [
//   {"t":"package","n":"package:jot","c":[
//     {"t":"library","n":"jot.dart","d":
//         "To create a new DocWorkspace, see ...","ref":"jot.html","c":[
//       {"t":"class","n":"Jot","ref":"jot/Jot.html","c":[
//         {"t":"constructor","n":"Jot"},
//         {"t":"field","n":"inDir"},
//         {"t":"field","n":"outDir"},
//         {"t":"method","n":"generate"},
//         {"t":"method","n":"serve"}
//       ]}
//     ]},
// ...

abstract class IndexMember {
  final String name;
  final String type;
  final String? docs;

  IndexMember? parent;

  String? get ref;
  String? get id;
  List<IndexMember> get children;

  IndexMember(this.name, this.type, this.docs);

  String get display {
    if (type == 'class') {
      return '$name { … }';
    } else if (type == 'function') {
      return '$name()';
    } else if (type == 'method' || type == 'constructor') {
      return '$_maybeParent$name()';
    } else if (type == 'field') {
      return '$_maybeParent$name';
    } else {
      return name;
    }
  }

  String? get packageName {
    var p = parent;
    while (p != null) {
      if (p.type == 'package') return p.name;
      p = p.parent;
    }
    return null;
  }

  String get _maybeParent {
    return parent == null ? '' : '${parent!.name}.';
  }

  factory IndexMember._parse(_JsonType json) {
    var name = json['n'] as String;
    var type = json['t'] as String;
    var docs = json['d'] as String?;

    var ref = json['ref'] as String?;
    var children = json['c'] as List?;

    if (ref != null || children != null) {
      var item = IndexParent(
        name,
        type,
        docs,
        ref,
        children == null
            ? const []
            : children.map((c) => IndexMember._parse(c as _JsonType)).toList(),
      );
      for (var child in item.children) {
        child.parent = item;
      }
      return item;
    } else {
      return IndexLeaf(name, type, docs, json['#'] as String?);
    }
  }

  static const Set<String> importantPackages = {
    'flutter',
  };

  static const Set<String> discouragedPackages = {
    // todo: others
    'dart:cli',
    'dart:html',
    'dart:svg',
  };

  int calcRank(String pattern, String patternLower) {
    var rank = 100;

    var name = this.name;

    // grouping:
    if (name == pattern) {
      // - exact, same length
      rank += 300;
    } else if (name.startsWith(pattern)) {
      // - exact (case is the same)
      // todo: switch these?
      rank += 200;
    } else if (name.toLowerCase().startsWith(patternLower)) {
      // - same (same case-insensitive)
      rank += 100;
    }

    // sorting:
    // - Class, extension, interface (a type)
    if (type == 'class' || type == 'extension') {
      // todo: other container types
      rank += 10;
    }

    var package = packageName;
    if (importantPackages.contains(package)) {
      // - from an important package
      rank += 5;
    } else if (discouragedPackages.contains(package)) {
      // - from a deprecated package
      rank -= 5;
    }

    return rank;
  }

  @override
  String toString() => '$type $name';
}

class IndexParent extends IndexMember {
  @override
  final String? ref;
  @override
  final List<IndexMember> children;

  IndexParent(super.name, super.type, super.docs, this.ref, this.children);

  @override
  String? get id => null;
}

class IndexLeaf extends IndexMember {
  @override
  final String? id;

  IndexLeaf(super.name, super.type, super.docs, this.id);

  @override
  String? get ref => parent?.ref;

  @override
  List<IndexMember> get children => const [];
}

class SearchResults {
  final String pattern;
  late final List<SearchResult> items;

  SearchResults(this.pattern, List<IndexMember> rawItems) {
    final patternLower = pattern.toLowerCase();

    items = rawItems.map((item) {
      return SearchResult(item.calcRank(pattern, patternLower), item);
    }).toList()
      ..sort();

    // // todo: remove
    // for (var i in items) {
    //   print(i);
    // }
  }
}

class SearchResult implements Comparable<SearchResult> {
  final int rank;
  final IndexMember item;

  SearchResult(this.rank, this.item);

  @override
  int compareTo(SearchResult other) {
    var diff = other.rank - rank;
    if (diff != 0) return diff;

    // TODO: sort lowercase first?
    diff = item.name.compareTo(other.item.name);
    if (diff != 0) return diff;

    return item.display.compareTo(other.item.display);
  }

  @override
  String toString() => '[$rank $item]';
}
