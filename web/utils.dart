import 'dart:html';

T $id<T extends Element>(String id) {
  return document.getElementById(id) as T;
}

ElementList<T> $query<T extends Element>(String selectors) =>
    document.querySelectorAll(selectors);
