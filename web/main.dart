// todo: use lighterweight interop
import 'dart:html';

import 'package:path/path.dart' as p;

void main() {
  print('hello from dart');

  Element colorModeButton = querySelector('#color-mode-button')!;
  colorModeButton.onClick.listen((event) {
    // <html data-theme="dark">
    var isLight = document.documentElement!.attributes['data-theme'] == 'light';

    LinkElement stylesRef = querySelector('#theme-stylesheet') as LinkElement;
    stylesRef.href = p.join(p.dirname(stylesRef.href),
        isLight ? 'styles-dark.css' : 'styles-light.css');

    document.documentElement!.attributes['data-theme'] =
        isLight ? 'dark' : 'light';
  });

  for (var element in querySelectorAll('button.menu__caret')) {
    element.onClick.listen((event) {
      element.parent!.parent!.classes.toggle('menu__list-item--collapsed');
      event.preventDefault();
    });
  }
}
