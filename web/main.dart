import 'dart:html';

import 'interop.dart';
import 'utils.dart';

// todo: remember the scroll position of the page content?

// todo: improve animation of the sidenav opening / closing

// todo: search ui

// todo: update the outline view active element as the content area scrolls

// todo: manage content area scroll with history push / pop

// todo: move the data-path from doc-main-container to body

final Path p = Path();

void main() {
  // The web url that serves as the base of the generated content.
  final urlBase = _calcUrlBase();

  // Initial url.
  final rel = _docMainContainer.attributes['data-path']!;

  final jot = Jot(urlBase: urlBase, initialUrl: '$urlBase$rel');
  jot.setup();
}

Element get _docMainContainer => $id('doc-main-container');

String _calcUrlBase() {
  var loc = window.location.href;
  var rel = _docMainContainer.attributes['data-path']!;
  for (var _ in rel.split('/')) {
    loc = p.parent(loc);
  }
  return '$loc/';
}

class Jot {
  final String urlBase;
  final String initialUrl;

  late final NavManager navManager;
  late final SidebarManager sidebarManager;

  Jot({required this.urlBase, required this.initialUrl}) {
    navManager = NavManager(urlBase: urlBase);
    sidebarManager = SidebarManager(this, urlBase: urlBase);
  }

  String get baseRel {
    final rel = _docMainContainer.attributes['data-path']!;
    return p.parent(rel);
  }

  void setup() {
    // hook up the color theme toggle
    var colorModeButton = $id('color-mode-button');
    colorModeButton.onClick.listen((event) {
      var light = document.documentElement!.attributes['data-theme'] == 'light';

      var stylesLink = $id<LinkElement>('theme-stylesheet');
      stylesLink.href =
          '${urlBase}resources/styles-${light ? 'dark' : 'light'}.css';
      document.documentElement!.attributes['data-theme'] =
          light ? 'dark' : 'light';
    });

    // search
    document.onKeyPress.listen((event) {
      if (event.key == '/') {
        event.preventDefault();

        $id('search').focus();
      }
    });

    $id('search').onKeyDown.listen((event) {
      if (event.key == "Escape") {
        $id('search').blur();
      }
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

    navManager.updateActive(uri);
    sidebarManager.updateActive(uri);
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

class SidebarManager {
  final Jot jot;
  final String urlBase;
  late Element _nav;

  SidebarManager(this.jot, {required this.urlBase}) {
    _nav = querySelector('aside.docSidebarContainer')!;

    // hook up sidenav menu collapse buttons
    for (var element in $queryAll('button.menu__caret')) {
      element.onClick.listen((event) {
        event.preventDefault();

        element.parent!.parent!.classes.toggle('menu__list-item--collapsed');
      });
    }
  }

  void updateActive(Uri uri) {
    uri = uri.removeFragment();

    var rel = uri.toString().substring(urlBase.length);
    if (rel.startsWith('/')) {
      rel = rel.substring(1);
    }
    rel = p.normalize(p.relative(rel, from: jot.baseRel));

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
}

class NavManager {
  final String urlBase;

  NavManager({required this.urlBase});

  void updateActive(Uri uri) {
    uri = uri.removeFragment();

    var rel = uri.toString().substring(urlBase.length);
    // todo:
    if (rel.startsWith('/')) {
      rel = rel.substring(1);
    }

    final nav = querySelector('nav')!;
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
