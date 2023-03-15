import 'dart:html';

import 'interop.dart';
import 'utils.dart';

late final String baseUrl;
late final String initialUrl;

// TODO: update the active links on a page change

// TODO: more dynamic behavior for the sidenav menus

// TODO: re-write hrefs in the newly loaded content

void main() {
  // base url
  baseUrl = _calcDocBase();

  // initial url
  var rel = docMainContainer.attributes['data-path']!;
  initialUrl = '$baseUrl$rel';

  // replace all the a hrefs with listeners
  for (var anchor in $query<AnchorElement>('a[data-jot]')) {
    anchor.onClick.listen((event) {
      event.preventDefault();

      final relPath = anchor.attributes['href']!;
      _swapFor('$baseUrl$relPath', updateHistory: true);
    });
  }

  // hook up the color theme toggle
  var colorModeButton = $id('color-mode-button');
  colorModeButton.onClick.listen((event) {
    var light = document.documentElement!.attributes['data-theme'] == 'light';

    var stylesLink = $id<LinkElement>('theme-stylesheet');
    var href = stylesLink.href;
    var parent = href.substring(0, href.lastIndexOf('/'));
    stylesLink.href = '$parent/styles-${light ? 'dark' : 'light'}.css';
    document.documentElement!.attributes['data-theme'] =
        light ? 'dark' : 'light';
  });

  // hook up sidenav menu collapse buttons
  for (var element in $query('button.menu__caret')) {
    element.onClick.listen((event) {
      event.preventDefault();

      element.parent!.parent!.classes.toggle('menu__list-item--collapsed');
    });
  }

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

  window.onPopState.listen((PopStateEvent event) {
    final url = (event.state as String?) ?? initialUrl;
    _swapFor(url, updateHistory: false);
  });
}

String _calcDocBase() {
  var loc = window.location.href;
  var container = docMainContainer;
  var rel = container.attributes['data-path']!;
  for (var _ in rel.split('/')) {
    loc = loc.substring(0, loc.lastIndexOf('/'));
  }
  return '$loc/';
}

void _swapFor(String url, {required bool updateHistory}) async {
  print('swapFor $url');

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

  docMainContainer.setInnerHtml(
    content.outerHtml,
    treeSanitizer: NodeTreeSanitizer.trusted,
  );

  // todo: update the a hrefs here

  if (updateHistory) {
    var history = window.history;
    history.pushState(url, document.title, url);
  }
}

Element get docMainContainer => $id('doc-main-container');
