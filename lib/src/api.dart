import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:path/path.dart' as p;

import '../jot.dart';
import 'utils.dart';

class Api {
  final List<Package> packages = [];
  final Resolver resolver = Resolver();

  LibraryItemContainer addLibrary(String packageName, LibraryElement element) {
    if (!packages.any((p) => p.name == packageName)) {
      packages.add(Package(packageName));
    }

    var package = packages.firstWhere((p) => p.name == packageName);
    var library = LibraryItemContainer(element);
    package.libraries.add(library);
    return library;
  }

  // todo: specialize libraries, classes?
  void addResolution(Element element, DocFile file) {
    resolver.addResolution(element, file);
  }

  String? resolve(Element element, {DocFile? from}) {
    return resolver.resolve(element, from: from);
  }

  String hrefOrSpan(String text, Element element, {DocFile? from}) {
    return resolver.hrefOrSpan(text, element, from: from);
  }
}

class Package implements Comparable<Package> {
  final String name;
  final List<LibraryItemContainer> libraries = [];

  Package(this.name);

  @override
  int compareTo(Package other) {
    return name.compareTo(other.name);
  }
}

class Item {
  final Element element;

  late final GroupType type = GroupType.typeFor(element);

  Item(this.element);

  // todo: make this more robust
  String get name {
    var result = element.displayName;
    if (result.isEmpty) {
      // todo: for now, assume this is a ctor
      result = element.enclosingElement!.name!;
    }
    return result;
  }

  String get anchorId => stringToAnchorId(name);

  late String? docs = _calculateDocs();

  ClassElement get asClass => element as ClassElement;

  ExtensionElement get asExtension => element as ExtensionElement;

  EnumElement get asEnum => element as EnumElement;

  FieldElement get asField => element as FieldElement;

  PropertyAccessorElement get asAccessor => element as PropertyAccessorElement;

  MethodElement get asMethod => element as MethodElement;

  FunctionElement get asFunction => element as FunctionElement;

  ConstructorElement get asConstructor => element as ConstructorElement;

  TypeAliasElement get asTypeAlias => element as TypeAliasElement;

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

abstract class Items extends Item {
  final Map<GroupType, Group> groups = SplayTreeMap();

  Items(super.element);

  T addChild<T extends Item>(T item) {
    var groupType = GroupType.typeFor(item.element);
    if (groupType != GroupType.skip) {
      groups.putIfAbsent(groupType, () => Group(groupType)).items.add(item);
    }
    return item;
  }

  Iterable<Item> get allChildren {
    return groups.entries.expand((entry) => entry.value.items);
  }

  List<Item> get allChildrenSorted {
    var items = allChildren.toList();
    items.sort((a, b) => adjustedLexicalCompare(a.name, b.name));
    return items;
  }
}

class InterfaceElementItems extends Items {
  InterfaceElementItems(InterfaceElement element) : super(element);

  @override
  InterfaceElement get element => super.element as InterfaceElement;
}

class ExtensionElementItems extends Items {
  ExtensionElementItems(ExtensionElement element) : super(element);

  @override
  ExtensionElement get element => super.element as ExtensionElement;
}

class LibraryItemContainer extends Items {
  LibraryItemContainer(super.element) {
    var exportNamespace = element.exportNamespace;
    var elements = exportNamespace.definedNames.values
        .where((element) => element.isPublic)
        .toList();
    elements.sort((a, b) => adjustedLexicalCompare(a.name ?? '', b.name ?? ''));

    for (var e in elements) {
      if (e is InterfaceElement) {
        var interfaceElement = e;

        var interfaceElementChildren =
            addChild(InterfaceElementItems(interfaceElement));

        for (var child in interfaceElement.children.where((c) => c.isPublic)) {
          if (child.isSynthetic) continue;

          interfaceElementChildren.addChild(Item(child));
        }
      } else if (e is ExtensionElement) {
        var extensionElement = e;

        var extensionElementChildren =
            addChild(ExtensionElementItems(extensionElement));

        for (var child in extensionElement.children.where((c) => c.isPublic)) {
          if (child.isSynthetic) continue;

          extensionElementChildren.addChild(Item(child));
        }
      } else {
        addChild(Item(e));
      }
    }
  }

  @override
  LibraryElement get element => super.element as LibraryElement;
}

class Group implements Comparable<Group> {
  final GroupType type;
  final List<Item> items = [];

  Group(this.type);

  String get name => type.title;

  String get anchorId => stringToAnchorId(name);

  bool get containerType => type.containerType;

  @override
  int compareTo(Group other) {
    return type.index - other.type.index;
  }
}

enum GroupType implements Comparable<GroupType> {
  // todo: records? mixins?

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
  $enum('Enums', {ElementKind.ENUM}, containerType: true),
  $class('Classes', {ElementKind.CLASS}, containerType: true),
  $extension('Extensions', {ElementKind.EXTENSION}, containerType: true),
  //$record('Records', {ElementKind.RECORD}, containerType: true),

  // catch-all
  skip('Skip', {
    ElementKind.DYNAMIC,
    ElementKind.NEVER,
    ElementKind.TYPE_PARAMETER,
  }),
  other('Other', {});

  final String title;
  final Set<Object> elementKinds;
  final bool containerType;

  const GroupType(this.title, this.elementKinds, {this.containerType = false});

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

class Resolver {
  // libraries and classes to files
  // elements to urls

  Map<Element, DocFile> mappings = {};

  void addResolution(Element element, DocFile file) {
    mappings[element] = file;
  }

  String? resolve(Element element, {DocFile? from}) {
    var target = mappings[element];
    if (target == null) return null;

    if (from != null) {
      return p.relative(target.path, from: p.dirname(from.path));
    } else {
      return target.path;
    }
  }

  // todo: html encode 'text'
  String hrefOrSpan(String text, Element element, {DocFile? from}) {
    var ref = resolve(element, from: from);

    if (ref != null) {
      return '<a href="$ref">$text</a>';
    } else {
      return '<span>$text</span>';
    }
  }
}
