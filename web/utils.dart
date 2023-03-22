import 'dart:html';

T $id<T extends Element>(String id) {
  return document.getElementById(id) as T;
}

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
