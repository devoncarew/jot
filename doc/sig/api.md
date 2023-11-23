# library api.dart

## Members

- type alias `typedef RelationshipMap = Map<RelationshipKind, List<Item>>`

## Enums

### enum GroupType

```
enum GroupType implements Comparable<GroupType> { … }
```

- constructor `GroupType(String title, String displayName, Set<Object> elementKinds, {bool containerType})`
- enum value `$class`
- enum value `$enum`
- enum value `$extension`
- enum value `$mixin`
- enum value `accessor`
- enum value `constructor`
- enum value `enumValue`
- enum value `field`
- enum value `function`
- enum value `functionTypeAlias`
- enum value `method`
- enum value `other`
- enum value `skip`
- enum value `topLevelVariable`
- enum value `typeAlias`
- static method `GroupType typeFor(Element element)`
- field `bool containerType`
- field `String displayName`
- field `Set<Object> elementKinds`
- field `String title`
- method `int compareTo(GroupType other)`

### enum RelationshipKind

```
enum RelationshipKind implements Comparable<RelationshipKind> { … }
```

- constructor `RelationshipKind(String title)`
- enum value `$extended`
- enum value `$implements`
- enum value `$mixes`
- enum value `$subclasses`
- field `String title`
- method `int compareTo(RelationshipKind other)`

## Classes

### class Api

```
class Api { … }
```

- constructor `Api()`
- field `Map<Element, Item> elementItemMap`
- field `Index index`
- field `List<Package> packages`
- field `Resolver resolver`
- method `LibraryItemContainer addLibrary(LibraryElement element, String packageName, String libraryPath)`
- method `void addResolution(Item item, WorkspaceFile file)`
- method `void finish()`
- method `String hrefOrSpan(String text, Element element, {WorkspaceFile? from})`
- method `Item? itemForElement(Element? element)`
- method `String? resolve(Element? element, {WorkspaceFile? from})`

### class ExportedItem

```
class ExportedItem { … }
```

- constructor `ExportedItem(Item item, LibraryItemContainer exportedFrom)`
- field `LibraryItemContainer exportedFrom`
- field `Item item`

### class ExtensionElementItems

```
class ExtensionElementItems extends Items { … }
```

- constructor `ExtensionElementItems(Items? parent, Element element)`
- accessor `ExtensionElement get element`

### class Group

```
class Group implements Comparable<Group> { … }
```

- constructor `Group(GroupType type)`
- field `List<Item> items`
- field `GroupType type`
- accessor `String get anchorId`
- accessor `bool get containerType`
- accessor `String get name`
- method `int compareTo(Group other)`
- method `void sort()`

### class InterfaceElementItems

```
class InterfaceElementItems extends Items { … }
```

- constructor `InterfaceElementItems(Items? parent, InterfaceElement element)`
- accessor `InterfaceElement get element`

### class Item

```
class Item { … }
```

- constructor `Item(Items? parent, Element element)`
- field `String? docs`
- field `Element element`
- field `String? nameOverride`
- field `Items? parent`
- field `Map<RelationshipKind, List<Item>> relationships`
- field `GroupType type`
- accessor `String get anchorId`
- accessor `List<ElementAnnotation> get annotations`
- accessor `PropertyAccessorElement get asAccessor`
- accessor `ClassElement get asClass`
- accessor `ConstructorElement get asConstructor`
- accessor `EnumElement get asEnum`
- accessor `ExtensionElement get asExtension`
- accessor `FieldElement get asField`
- accessor `FunctionElement get asFunction`
- accessor `MethodElement get asMethod`
- accessor `MixinElement get asMixin`
- accessor `TopLevelVariableElement get asTopLevelVariableElement`
- accessor `TypeAliasElement get asTypeAlias`
- accessor `String get debugPath`
- accessor `bool get isStatic`
- accessor `LibraryItemContainer? get libraryParent`
- accessor `String get name`
- accessor `Scope get scope`
- method `String? Function(String) markdownLinkResolver(Resolver resolver)`

### class Items

```
abstract class Items extends Item { … }
```

- constructor `Items(Items? parent, Element element)`
- static method `Map<GroupType, List<Item>> itemsByGroup(List<Item> items)`
- field `Map<GroupType, Group> groups`
- accessor `Iterable<Item> get allChildren`
- accessor `List<Item> get allChildrenSorted`
- method `T addChild<T extends Item>(T item)`
- method `void sort()`

### class LibraryItemContainer

```
class LibraryItemContainer
    extends Items
    implements Comparable<LibraryItemContainer> { … }
```

- constructor `LibraryItemContainer(Package? package, LibraryElement element, String name)`
- field `List<ExportedItem> exports`
- field `Package? package`
- accessor `LibraryElement get element`
- accessor `Map<LibraryItemContainer, List<Item>> get exportsByLibrary`
- accessor `String get urlName`
- method `int compareTo(LibraryItemContainer other)`

### class LinkedText

```
class LinkedText { … }
```

- constructor `LinkedText(Resolver resolver, WorkspaceFile fromFile)`
- field `WorkspaceFile fromFile`
- field `Resolver resolver`
- method `String emitHtml(String Function(String) formatHelper, [String suffix])`
- method `String toString()`
- method `void write(String str)`
- method `void writeElement(String str, Element element)`

### class Package

```
class Package implements Comparable<Package> { … }
```

- constructor `Package(String name)`
- field `List<LibraryItemContainer> libraries`
- field `String name`
- accessor `bool get includeInUrls`
- method `int compareTo(Package other)`

### class Resolver

```
class Resolver { … }
```

- field `Map<Element, Item> elementToItemMap`
- field `Map<Item, WorkspaceFile> itemToFileMap`
- method `void addResolution(Item item, WorkspaceFile file)`
- method `WorkspaceFile? fileFor(Element element)`
- method `String hrefOrSpan(String text, Element element, {WorkspaceFile? from})`
- method `void initElementItemMap(Map<Element, Item> elementItemMap)`
- method `String? resolve(Element? element, {WorkspaceFile? from})`
- method `String? resolveDocReference(String reference, {required Item context, WorkspaceFile? fromFile})`
