import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';

import 'utils.dart';

class Api {
  final List<Package> packages = [];

  Library addLibrary(String packageName, LibraryElement element) {
    if (!packages.any((p) => p.name == packageName)) {
      packages.add(Package(packageName));
    }

    var package = packages.firstWhere((p) => p.name == packageName);
    var library = Library(element);
    package.libraries.add(library);
    return library;
  }
}

class Package implements Comparable<Package> {
  final String name;
  final List<Library> libraries = [];

  Package(this.name);

  @override
  int compareTo(Package other) {
    return name.compareTo(other.name);
  }
}

class Library extends ItemContainer {
  Library(super.element) {
    var exportNamespace = element.exportNamespace;
    var elements = exportNamespace.definedNames.values
        .where((element) => element.isPublic);

    for (var e in elements.where((e) => e.isPublic)) {
      if (e is InterfaceElement) {
        var itemContainer = ItemContainer(e);
        addChild(itemContainer);

        for (var child in e.children.where((e) => e.isPublic)) {
          if (child.isSynthetic) continue;

          itemContainer.addChild(Item(child));
        }
      } else {
        addChild(Item(e));
      }
    }
  }

  @override
  LibraryElement get element => super.element as LibraryElement;
}

class Item {
  final Element element;

  Item(this.element);

  // todo: make this more robust
  String get name {
    var result = element.name!;
    if (result.isEmpty) {
      // todo: for now, assume this is a ctor
      result = element.enclosingElement!.name!;
    }
    return result;
  }

  late String? docs = _calculateDocs();

  String? _calculateDocs() {
    var result = element.documentationComment;
    if (result == null) {
      var enclosing = element.enclosingElement;
      if (enclosing is InterfaceElement) {
        if (element.kind == ElementKind.METHOD) {
          result = _lookupMethodDocs(element as MethodElement);
        } else if (element.kind == ElementKind.GETTER) {
          result = _lookupGetterDocs(element as PropertyAccessorElement);
        } else if (element.kind == ElementKind.SETTER) {
          result = _lookupSetterDocs(element as PropertyAccessorElement);
        }
      }
    }

    return result == null ? null : stripDartdoc(result);
  }

  String? _lookupMethodDocs(MethodElement element) {
    var enclosing = element.enclosingElement as InterfaceElement;
    var superMethod = enclosing.thisType
        .lookUpMethod2(element.name, element.library, inherited: true);
    return superMethod == null
        ? null
        : (superMethod.documentationComment ?? _lookupMethodDocs(superMethod));
  }

  String? _lookupGetterDocs(PropertyAccessorElement element) {
    var enclosing = element.enclosingElement as InterfaceElement;
    var accessor = enclosing.thisType
        .lookUpGetter2(element.name, element.library, inherited: true);
    return accessor == null
        ? null
        : (accessor.documentationComment ?? _lookupGetterDocs(accessor));
  }

  String? _lookupSetterDocs(PropertyAccessorElement element) {
    var enclosing = element.enclosingElement as InterfaceElement;
    var accessor = enclosing.thisType
        .lookUpSetter2(element.name, element.library, inherited: true);
    return accessor == null
        ? null
        : (accessor.documentationComment ?? _lookupSetterDocs(accessor));
  }
}

class ItemContainer extends Item {
  final Map<GroupType, Group> groups = SplayTreeMap();

  ItemContainer(super.element);

  void addChild(Item item) {
    var groupType = GroupType.typeFor(item.element);
    if (groupType != GroupType.skip) {
      groups.putIfAbsent(groupType, () => Group(groupType)).items.add(item);
    }
  }

  Iterable<Item> get allChildren {
    return groups.entries.expand((entry) => entry.value.items);
  }
}

class Group implements Comparable<Group> {
  final GroupType type;
  final List<Item> items = [];

  Group(this.type);

  String get name => type.title;

  @override
  int compareTo(Group other) {
    return type.index - other.type.index;
  }
}

enum GroupType implements Comparable<GroupType> {
  // class members
  constructor('Constructors', {ElementKind.CONSTRUCTOR}),
  field('Fields', {ElementKind.FIELD}),
  accessor('Accessors', {ElementKind.GETTER, ElementKind.SETTER}),
  method('Methods', {ElementKind.METHOD}),

  // library members
  topLevelVariable('Top Level Variables', {ElementKind.TOP_LEVEL_VARIABLE}),
  function('Functions', {ElementKind.FUNCTION}),
  functionTypeAlias('Function Type Aliases', {ElementKind.FUNCTION_TYPE_ALIAS}),
  typeAlias('Type Aliases', {ElementKind.TYPE_ALIAS}),
  $class('Classes', {ElementKind.CLASS}),
  $enum('Enums', {ElementKind.ENUM}),
  $extension('Extensions', {ElementKind.EXTENSION}),

  // catch-all
  skip('Skip', {
    ElementKind.DYNAMIC,
    ElementKind.NEVER,
    ElementKind.TYPE_PARAMETER,
  }),
  other('Other', {});

  final String title;
  final Set<Object> elementKinds;

  const GroupType(this.title, this.elementKinds);

  @override
  int compareTo(GroupType other) {
    return index - other.index;
  }

  static GroupType typeFor(Element element) {
    final kind = element.kind;
    for (var val in GroupType.values) {
      if (val.elementKinds.contains(kind)) {
        return val;
      }
    }
    print('*** ${element.kind} ***');
    return GroupType.other;
  }
}
