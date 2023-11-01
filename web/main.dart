import 'dart:convert';
import 'dart:html';

import 'interop.dart';
import 'search.dart';
import 'utils.dart';

// TODO: remember the scroll position of the page content?

// TODO: improve animation of the sidenav opening / closing

// TODO: update the outline view active element as the content area scrolls

// TODO: manage content area scroll with history push / pop

final Path p = Path();

void main() {
  // The web url that serves as the base of the generated content.
  final urlBase = _calcUrlBase();

  // Initial url.
  final rel = _body.attributes['data-path']!;

  final jot = Jot(urlBase: urlBase, initialUrl: '$urlBase$rel');
  jot.setup();
}

final Element _sideNav = $id('sidebar-nav');
final Element _docMainContainer = $id('doc-main-container');
final Element _body = $query('body')!;

String _calcUrlBase() {
  var loc = window.location.href;
  var rel = _body.attributes['data-path']!;
  for (var _ in rel.split('/')) {
    loc = p.parent(loc);
  }
  return '$loc/';
}

class Jot {
  final String urlBase;
  final String initialUrl;

  late final NavbarManager navbarManager;
  late final SidebarManager sidebarManager;
  late final SearchUI search;

  Jot({required this.urlBase, required this.initialUrl});

  String get baseRel {
    final rel = _body.attributes['data-path']!;
    return p.parent(rel);
  }

  Future<void> setup() async {
    // hook up the color theme toggle
    var colorModeButton = $id('color-mode-button');
    colorModeButton.onClick.listen((event) {
      theme = theme == 'light' ? 'dark' : 'light';
    });

    // update the theme from the last session's value
    var previousThemeValue = window.localStorage['theme'];
    if (previousThemeValue != null) {
      theme = previousThemeValue;
    }

    // search
    search = SearchUI(urlBase, (url) {
      _swapFor('$urlBase$url', updateHistory: true);
    });

    // listen for history events
    window.onPopState.listen((PopStateEvent event) {
      final url = (event.state as String?) ?? initialUrl;
      _swapFor(url, updateHistory: false);
    });

    // replace all the a hrefs with listeners
    for (var anchor in $queryAll<AnchorElement>('a[data-jot]')) {
      anchor.onClick.listen((event) {
        event.preventDefault();

        final relParent = p.parent(initialUrl);
        final relPath = anchor.attributes['href']!;
        final url = p.normalize(p.join(relParent, relPath));
        _swapFor(url, updateHistory: true);
      });
    }

    _updateContentLinks();

    navbarManager = NavbarManager(urlBase: urlBase);

    sidebarManager = SidebarManager(this);
    await sidebarManager.setup();
  }

  String get theme =>
      document.documentElement!.attributes['data-theme'] ?? 'dark';

  set theme(String value) {
    if (theme == value) return;

    var stylesLink = $id<LinkElement>('theme-stylesheet');
    stylesLink.href = '${urlBase}resources/styles-$value.css';
    document.documentElement!.attributes['data-theme'] = value;
    window.localStorage['theme'] = value;
  }

  void _swapFor(String url, {required bool updateHistory}) async {
    // todo: make sure we're only loading from the same domain
    var response = (await window.fetch(url)) as FetchResponse;
    var code = response.status;
    if (code == 404) {
      print('error response: $response');
      return;
    }

    var text = await promiseToFuture<String>(response.text());
    var loadedDoc = DomParser().parseFromString(text, 'text/html');
    var content = loadedDoc.getElementById('doc-main-child')!;

    _docMainContainer.setInnerHtml(
      content.outerHtml,
      treeSanitizer: NodeTreeSanitizer.trusted,
    );

    // update the a[hrefs] here
    _updateContentLinks();

    // todo: restore scroll pos on back navs
    var uri = Uri.parse(url);
    if (uri.hasFragment) {
      var target = _docMainContainer.querySelector('#${uri.fragment}');
      target?.scrollIntoViewIfNeeded();
    }

    if (updateHistory) {
      var history = window.history;
      history.pushState(url, document.title, url);
    }

    navbarManager.updateActive(uri.removeFragment());
    sidebarManager.updateActive(uri.removeFragment());
  }

  void _updateContentLinks() {
    var docMainChild = $id('doc-main-child');

    var filePath = docMainChild.attributes['data-path']!;
    var parentPath = p.parent(filePath);

    // todo: don't allow urls to escape the dir root

    for (var anchor in _docMainContainer.querySelectorAll('a[href]')) {
      final relPath = anchor.attributes['href']!;

      // don't handle full urls
      if (Uri.tryParse(relPath) == null) continue;

      anchor.onClick.listen((event) {
        event.preventDefault();

        var url = relPath.startsWith('#')
            ? '$urlBase$filePath$relPath'
            : '$urlBase${p.join(parentPath, relPath)}';
        _swapFor(p.normalize(url), updateHistory: true);
      });
    }
  }
}

/// Manages the items in the navbar at the top of the page.
class NavbarManager {
  final String urlBase;

  NavbarManager({required this.urlBase});

  void updateActive(final Uri uri) {
    var rel = uri.toString().substring(urlBase.length);
    if (rel.startsWith('/')) {
      rel = rel.substring(1);
    }

    final nav = $query('nav')!;
    var found = false;

    for (var anchor in nav.querySelectorAll<AnchorElement>('a[data-jot]')) {
      var href = anchor.attributes['href'];
      found |= href == rel;
      anchor.classes.toggle('navbar__link--active', href == rel);
    }

    if (!found) {
      for (var anchor in nav.querySelectorAll<AnchorElement>('a[data-jot]')) {
        var href = anchor.attributes['href'];
        if (href == 'index.html') {
          anchor.classes.toggle('navbar__link--active', true);
        }
      }
    }
  }
}

/// Manages the items in the left-hand side nav.
class SidebarManager {
  final Jot jot;
  late Element _nav;

  SidebarManager(this.jot) {
    _nav = $query('aside.docSidebarContainer')!;
  }

  Future<void> setup() async {
    // build the left nav
    await _populateNav();

    // hook up sidenav menu collapse buttons
    for (var element in $queryAll('button.menu__caret')) {
      element.onClick.listen((event) {
        event.preventDefault();

        element.parent!.parent!.classes.toggle('menu__list-item--collapsed');
      });
    }
  }

  void updateActive(final Uri uri) {
    var rel = uri.toString().substring(jot.urlBase.length);
    if (rel.startsWith('/')) {
      rel = rel.substring(1);
    }

    AnchorElement? itemAnchor;

    // all a hrefs should not have menu__link--active except for the active one
    for (var anchor in _nav.querySelectorAll<AnchorElement>('a[data-jot]')) {
      var href = anchor.attributes['href'];

      if (href == rel) itemAnchor = anchor;
      anchor.classes.toggle('menu__link--active', href == rel);
    }

    // if a menu or contained in a menu, open all the ancestor menus, close all
    // other menus
    if (itemAnchor != null) {
      var parents = <Element>[];

      for (var item
          in _nav.querySelectorAll('li.theme-doc-sidebar-item-category')) {
        if (item.parentOf(itemAnchor)) {
          parents.add(item);
        }
      }

      if (parents.isNotEmpty) {
        for (var item
            in _nav.querySelectorAll('li.theme-doc-sidebar-item-category')) {
          item.classes
              .toggle('menu__list-item--collapsed', !parents.contains(item));
        }
      }
    }
  }

  Future<void> _populateNav() async {
    // todo: write a utility for fetch()
    var response = (await window.fetch('${jot.urlBase}resources/nav.json'))
        as FetchResponse;
    var code = response.status;
    if (code == 404) {
      print('error response: $response');
      // todo: ??
      return;
    }

    var text = await promiseToFuture<String>(response.text());
    var navInfo = (jsonDecode(text) as List)
        .cast<JsonType>()
        .map(SidebarItem._parse)
        .toList();

    // write the item info into the dom
    final outer = Element.ul()..className = 'theme-doc-sidebar-menu menu__list';
    for (var nav in navInfo) {
      outer.append(nav.createElement(jot));
    }
    _sideNav.append(outer);

    updateActive(Uri.parse(window.location.href).removeFragment());
  }
}

class SidebarItem {
  final String name;
  final String? href;
  final String? type;
  final List<SidebarItem>? children;

  SidebarItem({
    required this.name,
    this.href,
    this.type,
    this.children,
  });

  factory SidebarItem._parse(JsonType json) {
    List<SidebarItem>? children;

    if (json.containsKey('c')) {
      var temp = (json['c'] as List).cast<JsonType>();
      children = temp.map(SidebarItem._parse).toList();
    }

    return SidebarItem(
      name: json['n'] as String,
      href: json['h'] as String,
      type: json['t'] as String?,
      children: children,
    );
  }

  bool get separator => type == 'separator';

  Element createElement(Jot jot) {
    if (separator) {
      final li = Element.li()..classes = ['menu__list-item', 'group'];
      li.append(AnchorElement()
        ..className = 'menu__link'
        ..text = name);
      return li;
    } else if (children == null) {
      final li = Element.li()..className = 'menu__list-item';
      final a = AnchorElement(href: href)
        ..className = 'menu__link'
        ..setAttribute('data-jot', '')
        ..text = name
        ..onClick.listen((event) {
          event.preventDefault();

          final url = p.normalize(p.join(jot.urlBase, href!));
          jot._swapFor(url, updateHistory: true);
        });
      li.append(a);
      return li;
    } else {
      final li = Element.li()
        ..classes = [
          'theme-doc-sidebar-item-category',
          'menu__list-item',
          'menu__list-item--collapsed',
        ];

      final div = Element.div()..className = 'menu__list-item-collapsible';
      final a = AnchorElement(href: href)
        ..classes = ['menu__link', 'menu__link--sublist']
        ..setAttribute('data-jot', '')
        ..text = name
        ..onClick.listen((event) {
          event.preventDefault();
          final url = p.normalize(p.join(jot.urlBase, href!));
          jot._swapFor(url, updateHistory: true);
        });
      div.append(a);
      div.append(ButtonElement()
        ..type = 'button'
        ..classes = ['clean-btn', 'menu__caret']);
      li.append(div);

      final ul = Element.ul()..className = 'menu__list';
      for (var nav in children!) {
        ul.append(nav.createElement(jot));
      }
      li.append(ul);

      return li;
    }
  }

  @override
  String toString() => '$name [$href]';
}
