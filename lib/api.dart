import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/scope.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/element/scope.dart';
import 'package:path/path.dart' as p;

import 'src/index.dart';
import 'src/markdown.dart';
import 'src/utils.dart';
import 'workspace.dart';

class Api {
  final List<Package> packages = [];
  final Resolver resolver = Resolver();
  final Map<Element, Item> elementItemMap = {};

  late final Index index;

  Api();

  LibraryItemContainer addLibrary(
      LibraryElement element, String packageName, String libraryPath) {
    var package = packages.firstWhere((p) => p.name == packageName, orElse: () {
      var package = Package(packageName);
      packages.add(package);
      return package;
    });

    var library = LibraryItemContainer(element, libraryPath);
    package.libraries.add(library);
    return library;
  }

  void finish() {
    // populate the element item map
    for (var package in packages) {
      for (var library in package.libraries) {
        _process(library);
      }
    }

    // perform calculations; super, children, ...
    elementItemMap.values.forEach(_calculateFor);

    // build the index
    String? docSummary(Item item) {
      // get docs
      var docs = item.docs;
      if (docs == null) return null;

      // first sentence
      docs = firstSentence(docs);

      // convert to plaintext; resolve refs to plain text
      docs = markdownToText(docs);

      // consolidate ws
      docs = docs.replaceAll('\n', ' ');

      // first 72 chars
      const limit = 72;
      return docs.length > limit
          ? '${docs.substring(0, limit - 1).trimRight()}…'
          : docs;
    }

    index = Index();
    for (var package in packages) {
      var packageIndex = index.add(package.name, 'package');

      for (var library in package.libraries) {
        var libraryIndex = packageIndex.add(
          library.name,
          'library',
          ref: resolve(library.element),
          docs: docSummary(library),
        );

        for (var child in library.allChildrenSorted) {
          if (child is Items) {
            var childIndex = libraryIndex.add(
              child.name,
              child.type.displayName,
              ref: resolve(child.element),
              docs: docSummary(child),
            );
            for (var c in child.allChildrenSorted) {
              childIndex.add(
                c.name,
                c.type.displayName,
                id: c.anchorId,
                docs: docSummary(c),
              );
            }
          } else {
            libraryIndex.add(
              child.name,
              child.type.displayName,
              id: child.anchorId,
              docs: docSummary(child),
            );
          }
        }
        // todo:
      }
    }
  }

  void _process(Item item) {
    elementItemMap[item.element] = item;

    if (item is Items) {
      item.allChildren.forEach(_process);
    }
  }

  void _calculateFor(Item item) {
    if (item.element is InterfaceElement) {
      var element = item.element as InterfaceElement;

      var superItem = itemForElement(element.supertype?.element);
      superItem?._addRelationship(item, RelationshipKind.$subclasses);

      for (var $interface in element.interfaces) {
        var interfaceItem = itemForElement($interface.element);
        interfaceItem?._addRelationship(item, RelationshipKind.$implements);
      }

      for (var $mixin in element.mixins) {
        var interfaceItem = itemForElement($mixin.element);
        interfaceItem?._addRelationship(item, RelationshipKind.$mixes);
      }
    } else if (item.element is ExtensionElement) {
      var element = item.element as ExtensionElement;

      var extendedElement = element.extendedType.element;
      var extendedItem = itemForElement(extendedElement);
      extendedItem?._addRelationship(item, RelationshipKind.$extended);
    }
  }

  Item? itemForElement(Element? element) {
    return elementItemMap[element];
  }

  void addResolution(Element element, DocFile file) {
    resolver.addResolution(element, file);
  }

  String? resolve(Element? element, {DocFile? from}) {
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

/// A tuple of a relationship kind (subclass, implementor, ...) and a set of
/// items.
typedef RelationshipMap = Map<RelationshipKind, List<Item>>;

class Item {
  final Element element;
  late final GroupType type = GroupType.typeFor(element);
  final RelationshipMap relationships = SplayTreeMap();

  String? nameOverride;

  Scope? _scope;

  Item(this.element);

  // todo: make this more robust
  String get name {
    if (nameOverride != null) return nameOverride!;

    var result = element.displayName;
    if (result.isEmpty) {
      // todo: for now, assume this is a ctor
      result = element.enclosingElement!.name!;
    }
    return result;
  }

  Scope get scope => _scope ??= _calcScope(element)!;

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

  void _addRelationship(Item item, RelationshipKind kind) {
    relationships.putIfAbsent(kind, () => []).add(item);
  }

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

  MarkdownLinkResolver markdownLinkResolver(Resolver resolver) {
    return (String ref) {
      var result = resolver.resolveDocReference(
        ref,
        context: this,
        fromFile: resolver.fileFor(element),
      );

      // todo: log this?
      // if (result == null) {
      //   print('    unresolved: [$ref] from ${element.displayName}');
      // }

      return result;
    };
  }

  static Scope? _calcScope(Element element) {
    // todo: more of these scopes could be cached / looked up by Item

    if (element is CompilationUnitElement) {
      return _calcScope(element.enclosingElement);
    }

    if (element is LibraryElement) {
      return element.scope;
    } else if (element is ExtensionElement) {
      return ExtensionScope(_calcScope(element.enclosingElement)!, element);
    } else if (element is InterfaceElement) {
      return InterfaceScope(_calcScope(element.enclosingElement)!, element);
    } else if (element is MethodElement) {
      return FormalParameterScope(
          _calcScope(element.enclosingElement)!, element.parameters);
    } else if (element is FunctionElement) {
      return FormalParameterScope(
          _calcScope(element.enclosingElement)!, element.parameters);
    } else if (element is ConstructorElement) {
      return ConstructorInitializerScope(
          _calcScope(element.enclosingElement)!, element);
    } else if (element is PropertyAccessorElement) {
      return LocalScope(_calcScope(element.enclosingElement)!)..add(element);
    } else if (element is FieldElement) {
      return LocalScope(_calcScope(element.enclosingElement)!)..add(element);
    } else if (element is TypeAliasElement) {
      return _calcScope(element.enclosingElement);
    } else {
      print('scope not found for ${element.runtimeType}');
      return null;
    }
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

  void sort() {
    for (var entry in groups.entries) {
      // have enums retain their declaration order
      if (entry.key == GroupType.enumValue) continue;

      entry.value.sort();
    }
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
  LibraryItemContainer(super.element, String name) {
    nameOverride = name;

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

        interfaceElementChildren.sort();
      } else if (e is ExtensionElement) {
        var extensionElement = e;

        var extensionElementChildren =
            addChild(ExtensionElementItems(extensionElement));

        for (var child in extensionElement.children.where((c) => c.isPublic)) {
          if (child.isSynthetic) continue;

          extensionElementChildren.addChild(Item(child));
        }

        extensionElementChildren.sort();
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

  void sort() {
    items.sort((a, b) => adjustedLexicalCompare(a.name, b.name));
  }

  @override
  int compareTo(Group other) {
    return type.index - other.type.index;
  }
}

enum GroupType implements Comparable<GroupType> {
  // todo: records? mixins?

  // class members
  constructor('Constructors', {ElementKind.CONSTRUCTOR}),
  enumValue('Values', {}),
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

  String get displayName => name.startsWith(r'$') ? name.substring(1) : name;

  @override
  int compareTo(GroupType other) {
    return index - other.index;
  }

  /// Return the [GroupType] for the given [element].
  static GroupType typeFor(Element element) {
    final kind = element.kind;
    if (element is FieldElement && element.isEnumConstant) {
      return GroupType.enumValue;
    }
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

  DocFile? fileFor(Element element) {
    var file = mappings[element];
    if (file != null) return file;

    file = mappings[element.enclosingElement];

    return file;
  }

  String? resolve(Element? element, {DocFile? from}) {
    var target = mappings[element];
    if (target == null) return null;

    if (from != null) {
      // TODO: replaced for performance reasons
      return target.path.pathRelative(fromDir: p.dirname(from.path));
      // return p.relative(target.path, from: p.dirname(from.path));
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

  /// Returns a Uri if the reference is resolved.
  String? resolveDocReference(
    String reference, {
    required Item context,
    DocFile? fromFile,
  }) {
    // TODO: handle dotted references (Foo.bar, ...)

    var scope = context.scope;
    var element = scope.lookup(reference).getter;
    return resolve(element, from: fromFile);
  }
}

enum RelationshipKind implements Comparable<RelationshipKind> {
  $subclasses('Subclassed by'),
  $implements('Implemented by'),
  $mixes('Mixed into'),
  $extended('Extended by');

  final String title;

  const RelationshipKind(this.title);

  @override
  int compareTo(RelationshipKind other) {
    return index - other.index;
  }
}

/// A StringBuffer like class that allows you to write out Element references,
/// dart format the written text, and emit the result as html with the element
/// references converted to html links.
class LinkedText {
  final Resolver resolver;
  final DocFile fromFile;

  final List<_ElementSpan> _elementSpans = [];

  final StringBuffer _buf = StringBuffer();
  int _charIndex = 0;

  LinkedText(this.resolver, this.fromFile);

  void write(String str) {
    for (var i = 0; i < str.length; i++) {
      if (str[i].trim().isNotEmpty) {
        _charIndex++;
      }
    }
    _buf.write(str);
  }

  void writeElement(String str, Element element) {
    _elementSpans.add(_ElementSpan(element, _charIndex, str));
    _charIndex += str.length;
    _buf.write(str);
  }

  String emitHtml(String Function(String) formatHelper, [String suffix = '']) {
    var fmt = formatHelper(_buf.toString());

    var chunks = _chunks(fmt, _elementSpans, _spanStarts(fmt)).toList();

    var html = chunks.map((chunk) {
      if (chunk is String) {
        return htmlEscape(chunk);
      } else {
        var span = chunk as _ElementSpan;

        var uri = resolver.resolve(span.element, from: fromFile);
        if (uri == null) {
          return htmlEscape(span.text);
        } else {
          return '<a href="$uri">${htmlEscape(span.text)}</a>';
        }
      }
    }).join();

    return '<pre class="declaration"><code>$html$suffix</code></pre>';
  }

  List<int> _spanStarts(String fmt) {
    var result = <int>[];

    var spans = _elementSpans.iterator;
    if (!spans.moveNext()) return result;

    var index = 0;
    int i;

    for (i = 0; i < fmt.length; i++) {
      if (fmt[i].trim().isEmpty) continue;

      if (index == spans.current.start) {
        result.add(i);
        if (!spans.moveNext()) return result;
      }

      index++;
    }

    return result;
  }

  // A List of Strings and _ElementSpans.
  Iterable<dynamic> _chunks(
      String fmt, List<_ElementSpan> spans, List<int> spanStarts) sync* {
    var fmtIndex = 0;

    for (var i = 0; i < spans.length; i++) {
      var span = spans[i];
      var spanStart = spanStarts[i];

      if (fmtIndex < spanStart) {
        yield fmt.substring(fmtIndex, spanStart);
        fmtIndex = spanStart;
      }

      yield span;
      fmtIndex = spanStart + span.text.length;
    }

    if (fmtIndex < fmt.length) {
      yield fmt.substring(fmtIndex);
    }
  }

  @override
  String toString() => _buf.toString();
}

class _ElementSpan {
  final Element element;
  final int start;
  String text;

  _ElementSpan(this.element, this.start, this.text);

  @override
  String toString() => '[$text]';
}
