# Library: api.dart

## Members

- type alias `typedef RelationshipMap = Map<RelationshipKind, List<Item>>`:
  A tuple of a relationship kind (subclass, implementor, ...) and a set of
  items.

## Enum: GroupType

```dart
enum GroupType implements Comparable<GroupType> { … }
```

- `GroupType(String title, String displayName, Set<Object> elementKinds, {bool containerType})`
- `$class`
- `$enum`
- `$extension`
- `$extensionType`
- `$mixin`
- `accessor`
- `constructor`
- `enumValue`
- `field`
- `function`
- `functionTypeAlias`
- `method`
- `other`
- `skip`
- `topLevelVariable`
- `typeAlias`
- static `GroupType typeFor(Element element)`:
  Return the [GroupType] for the given [element].
- `bool containerType`
- `String displayName`
- `Set<Object> elementKinds`
- `String title`
- `int compareTo(GroupType other)`: Compares this object to another object.

## Enum: RelationshipKind

```dart
enum RelationshipKind implements Comparable<RelationshipKind> { … }
```

- `RelationshipKind(String title)`
- `$extended`
- `$implements`
- `$mixes`
- `$subclasses`
- `String title`
- `int compareTo(RelationshipKind other)`: Compares this object to another object.

## Class: Api

```dart
class Api { … }
```

- `Api()`
- `Map<Element, Item> elementItemMap`
- `Index index`
- `List<Package> packages`
- `Resolver resolver`
- `LibraryItemContainer addLibrary(LibraryElement element, String packageName, String libraryPath)`
- `void addResolution(Item item, WorkspaceFile file)`
- `void finish()`
- `String hrefOrSpan(String text, Element element, {WorkspaceFile? from})`
- `Item? itemForElement(Element? element)`
- `String? resolve(Element? element, {WorkspaceFile? from})`

## Class: ExportedItem

```dart
class ExportedItem { … }
```

- `ExportedItem(Item item, LibraryItemContainer exportedFrom)`
- `LibraryItemContainer exportedFrom`
- `Item item`

## Class: ExtensionElementItems

```dart
class ExtensionElementItems extends Items { … }
```

- `ExtensionElementItems(Items? parent, Element element)`
- `ExtensionElement get element`

## Class: Group

```dart
class Group implements Comparable<Group> { … }
```

- `Group(GroupType type)`
- `List<Item> items`
- `GroupType type`
- `String get anchorId`
- `bool get containerType`
- `String get name`
- `int compareTo(Group other)`: Compares this object to another object.
- `void sort()`

## Class: InterfaceElementItems

```dart
class InterfaceElementItems extends Items { … }
```

- `InterfaceElementItems(Items? parent, InterfaceElement element)`
- `InterfaceElement get element`

## Class: Item

```dart
class Item { … }
```

- `Item(Items? parent, Element element)`
- `String? docs`
- `Element element`
- `String? nameOverride`
- `Items? parent`
- `Map<RelationshipKind, List<Item>> relationships`
- `GroupType type`
- `String get anchorId`
- `List<ElementAnnotation> get annotations`
- `PropertyAccessorElement get asAccessor`
- `ClassElement get asClass`
- `ConstructorElement get asConstructor`
- `EnumElement get asEnum`
- `ExtensionElement get asExtension`
- `ExtensionTypeElement get asExtensionType`
- `FieldElement get asField`
- `FunctionElement get asFunction`
- `MethodElement get asMethod`
- `MixinElement get asMixin`
- `TopLevelVariableElement get asTopLevelVariableElement`
- `TypeAliasElement get asTypeAlias`
- `String get debugPath`
- `bool get hasDocs`
- `bool get isStatic`
- `LibraryItemContainer? get libraryParent`
- `String get name`
- `Scope get scope`
- `String? Function(String) markdownLinkResolver(Resolver resolver)`

## Class: Items

```dart
abstract class Items extends Item { … }
```

- `Items(Items? parent, Element element)`
- static `Map<GroupType, List<Item>> itemsByGroup(List<Item> items)`
- `Map<GroupType, Group> groups`
- `Iterable<Item> get allChildren`
- `List<Item> get allChildrenSorted`
- `T addChild<T extends Item>(T item)`
- `void sort()`

## Class: LibraryItemContainer

```dart
class LibraryItemContainer
    extends Items
    implements Comparable<LibraryItemContainer> { … }
```

- `LibraryItemContainer(Package? package, LibraryElement element, String name)`
- `List<ExportedItem> exports`:
  The list of items that are part of this library's public API, but that
  are considered exports (primarily defined elsewhere).
- `Package? package`
- `LibraryElement get element`
- `Map<LibraryItemContainer, List<Item>> get exportsByLibrary`
- `String get urlName`
- `int compareTo(LibraryItemContainer other)`:
  Compares this object to another object.

## Class: LinkedText

A StringBuffer like class that allows you to write out Element references,
dart format the written text, and emit the result as html with the element
references converted to html links.

```dart
class LinkedText { … }
```

- `LinkedText(Resolver resolver, WorkspaceFile fromFile)`
- `WorkspaceFile fromFile`
- `Resolver resolver`
- `String emitHtml(String Function(String) formatHelper, [String suffix])`
- `String toString()`: A string representation of this object.
- `void write(String str)`
- `void writeElement(String str, Element element)`

## Class: Package

```dart
class Package implements Comparable<Package> { … }
```

- `Package(String name)`
- `String? description`
- `List<LibraryItemContainer> libraries`
- `String name`
- `String? version`
- `bool get includeInUrls`
- `int compareTo(Package other)`: Compares this object to another object.

## Class: Resolver

```dart
class Resolver { … }
```

- `Map<Element, Item> elementToItemMap`
- `Map<Item, WorkspaceFile> itemToFileMap`
- `void addResolution(Item item, WorkspaceFile file)`
- `WorkspaceFile? fileFor(Element element)`
- `String hrefOrSpan(String text, Element element, {WorkspaceFile? from})`
- `void initElementItemMap(Map<Element, Item> elementItemMap)`
- `String? resolve(Element? element, {WorkspaceFile? from})`
- `String? resolveDocReference(String reference, {required Item context, WorkspaceFile? fromFile})`:
  Returns a Uri if the reference is resolved.
