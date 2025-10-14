# Library: dart:indexed_db

A client-side key-value store with support for indexes.

> [!Note]
> This core library is deprecated, and scheduled for removal in late 2025.
> It has been replaced by [package:web](https://pub.dev/packages/web).
> The [migration guide](https://dart.dev/go/package-web) has more details.

IndexedDB is a web standard API for client-side storage of
structured data. By storing data on the client in an IndexedDB,
apps can get advantages such as faster performance and
persistence.

In IndexedDB, each record is identified by a unique index or key,
making data retrieval speedy.
You can store structured data,
such as images, arrays, and maps using IndexedDB.
The standard does not specify size limits for individual data items
or for the database itself, but browsers may impose storage limits.

## Using indexed_db

The classes in this library provide an interface
to the browser's IndexedDB, if it has one.
To use this library in your code:

    import 'dart:indexed_db';

IndexedDB is almost universally supported in modern web browsers, but
a web app can determine if the browser supports IndexedDB
with [IdbFactory.supported]:

    if (IdbFactory.supported)
      // Use indexeddb.
    else
      // Find an alternative.

Access to the browser's IndexedDB is provided by the app's top-level
[Window] object, which your code can refer to with `window.indexedDB`.
So, for example,
here's how to use window.indexedDB to open a database:

    Future open() {
      return window.indexedDB.open('myIndexedDB',
          version: 1,
          onUpgradeNeeded: _initializeDatabase)
        .then(_loadFromDB);
    }
    void _initializeDatabase(VersionChangeEvent e) {
      ...
    }
    Future _loadFromDB(Database db) {
      ...
    }

All data in an IndexedDB is stored within an [ObjectStore].
To manipulate the database use [Transaction]s.

## Other resources

Other options for client-side data storage include:

* [Window.localStorage]&mdash;a
basic mechanism that stores data as a [Map],
and where both the keys and the values are strings.

MDN provides [API
documentation](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API).

{@category Web (Legacy)}

## Members

- type alias `typedef ObserverCallback = void Function(ObserverChanges)`

## Class: Cursor

```dart
class Cursor extends JavaScriptObject { … }
```

- `String? get direction`
- `Object? get key`
- `Object? get primaryKey`
- `Object? get source`
- `void advance(int count)`
- `void continuePrimaryKey(Object key, Object primaryKey)`
- `Future<dynamic> delete()`
- `void next([Object? key])`
- `Future<dynamic> update(dynamic value)`

## Class: CursorWithValue

```dart
class CursorWithValue extends Cursor { … }
```

- `dynamic get value`

## Class: Database

An indexed database object for storing client-side data
in web apps.

```dart
class Database extends EventTarget { … }
```

- static `EventStreamProvider<Event> abortEvent`:
  Static factory designed to expose `abort` events to event
  handlers that are not necessarily instances of [Database].
- static `EventStreamProvider<Event> closeEvent`:
  Static factory designed to expose `close` events to event
  handlers that are not necessarily instances of [Database].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [Database].
- static `EventStreamProvider<VersionChangeEvent> versionChangeEvent`:
  Static factory designed to expose `versionchange` events to event
  handlers that are not necessarily instances of [Database].
- `String? get name`
- `List<String>? get objectStoreNames`
- `Stream<Event> get onAbort`:
  Stream of `abort` events handled by this [Database].
- `Stream<Event> get onClose`:
  Stream of `close` events handled by this [Database].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [Database].
- `Stream<VersionChangeEvent> get onVersionChange`:
  Stream of `versionchange` events handled by this [Database].
- `int? get version`
- `void close()`
- `ObjectStore createObjectStore(String name, {dynamic keyPath, bool? autoIncrement})`
- `void deleteObjectStore(String name)`
- `Transaction transaction(dynamic storeName_OR_storeNames, String mode)`
- `Transaction transactionList(List<String> storeNames, String mode)`
- `Transaction transactionStore(String storeName, String mode)`
- `Transaction transactionStores(DomStringList storeNames, String mode)`

## Class: IdbFactory

```dart
class IdbFactory extends JavaScriptObject { … }
```

- static `bool get supported`:
  Checks to see if Indexed DB is supported on the current platform.
- `bool get supportsDatabaseNames`: Deprecated. Always returns `false`.
- `int cmp(Object first, Object second)`
- `Future<IdbFactory> deleteDatabase(String name, {void Function(Event)? onBlocked})`
- `Future<Database> open(String name, {int? version, void Function(VersionChangeEvent)? onUpgradeNeeded, void Function(Event)? onBlocked})`

## Class: Index

```dart
class Index extends JavaScriptObject { … }
```

- `Object? get keyPath`
- `bool? get multiEntry`
- `String? get name`
- `set name=(String? value)`
- `ObjectStore? get objectStore`
- `bool? get unique`
- `Future<int> count([dynamic key_OR_range])`
- `Future<dynamic> get(dynamic key)`
- `Request getAll(Object? query, [int? count])`
- `Request getAllKeys(Object? query, [int? count])`
- `Future<dynamic> getKey(dynamic key)`
- `Stream<CursorWithValue> openCursor({dynamic key, KeyRange? range, String? direction, bool? autoAdvance})`:
  Creates a stream of cursors over the records in this object store.
- `Stream<Cursor> openKeyCursor({dynamic key, KeyRange? range, String? direction, bool? autoAdvance})`:
  Creates a stream of cursors over the records in this object store.

## Class: KeyRange

```dart
class KeyRange extends JavaScriptObject { … }
```

- `KeyRange.bound(dynamic lower, dynamic upper, [bool lowerOpen, bool upperOpen])`
- `KeyRange.lowerBound(dynamic bound, [bool open])`
- `KeyRange.only(dynamic value)`
- `KeyRange.upperBound(dynamic bound, [bool open])`
- static `KeyRange bound_(Object lower, Object upper, [bool? lowerOpen, bool? upperOpen])`
- static `KeyRange lowerBound_(Object bound, [bool? open])`
- static `KeyRange only_(Object value)`
- static `KeyRange upperBound_(Object bound, [bool? open])`
- `Object? get lower`
- `bool? get lowerOpen`
- `Object? get upper`
- `bool? get upperOpen`
- `bool includes(Object key)`

## Class: ObjectStore

```dart
class ObjectStore extends JavaScriptObject { … }
```

- `bool? get autoIncrement`
- `List<String>? get indexNames`
- `Object? get keyPath`
- `String? get name`
- `set name=(String? value)`
- `Transaction? get transaction`
- `Future<dynamic> add(dynamic value, [dynamic key])`
- `Future<dynamic> clear()`
- `Future<int> count([dynamic key_OR_range])`
- `Index createIndex(String name, dynamic keyPath, {bool? unique, bool? multiEntry})`
- `Future<dynamic> delete(dynamic key_OR_keyRange)`
- `void deleteIndex(String name)`
- `Request getAll(Object? query, [int? count])`
- `Request getAllKeys(Object? query, [int? count])`
- `Request getKey(Object key)`
- `Future<dynamic> getObject(dynamic key)`
- `Index index(String name)`
- `Stream<CursorWithValue> openCursor({dynamic key, KeyRange? range, String? direction, bool? autoAdvance})`:
  Creates a stream of cursors over the records in this object store.
- `Request openKeyCursor(Object? range, [String? direction])`
- `Future<dynamic> put(dynamic value, [dynamic key])`

## Class: Observation

```dart
class Observation extends JavaScriptObject { … }
```

- `Object? get key`
- `String? get type`
- `Object? get value`

## Class: Observer

```dart
class Observer extends JavaScriptObject { … }
```

- `Observer(void Function(ObserverChanges) callback)`
- `void observe(Database db, Transaction tx, Map<dynamic, dynamic> options)`
- `void unobserve(Database db)`

## Class: ObserverChanges

```dart
class ObserverChanges extends JavaScriptObject { … }
```

- `Database? get database`
- `Object? get records`
- `Transaction? get transaction`

## Class: OpenDBRequest

```dart
class OpenDBRequest extends Request { … }
```

- static `EventStreamProvider<Event> blockedEvent`:
  Static factory designed to expose `blocked` events to event
  handlers that are not necessarily instances of [OpenDBRequest].
- static `EventStreamProvider<VersionChangeEvent> upgradeNeededEvent`:
  Static factory designed to expose `upgradeneeded` events to event
  handlers that are not necessarily instances of [OpenDBRequest].
- `Stream<Event> get onBlocked`:
  Stream of `blocked` events handled by this [OpenDBRequest].
- `Stream<VersionChangeEvent> get onUpgradeNeeded`:
  Stream of `upgradeneeded` events handled by this [OpenDBRequest].

## Class: Request

```dart
class Request extends EventTarget { … }
```

- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [Request].
- static `EventStreamProvider<Event> successEvent`:
  Static factory designed to expose `success` events to event
  handlers that are not necessarily instances of [Request].
- `DomException? get error`
- `Stream<Event> get onError`: Stream of `error` events handled by this [Request].
- `Stream<Event> get onSuccess`:
  Stream of `success` events handled by this [Request].
- `String? get readyState`
- `dynamic get result`
- `Object? get source`
- `Transaction? get transaction`

## Class: Transaction

```dart
class Transaction extends EventTarget { … }
```

- static `EventStreamProvider<Event> abortEvent`:
  Static factory designed to expose `abort` events to event
  handlers that are not necessarily instances of [Transaction].
- static `EventStreamProvider<Event> completeEvent`:
  Static factory designed to expose `complete` events to event
  handlers that are not necessarily instances of [Transaction].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [Transaction].
- `Future<Database> get completed`:
  Provides a Future which will be completed once the transaction has
  completed.
- `Database? get db`
- `DomException? get error`
- `String? get mode`
- `List<String>? get objectStoreNames`
- `Stream<Event> get onAbort`:
  Stream of `abort` events handled by this [Transaction].
- `Stream<Event> get onComplete`:
  Stream of `complete` events handled by this [Transaction].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [Transaction].
- `void abort()`
- `ObjectStore objectStore(String name)`

## Class: VersionChangeEvent

```dart
class VersionChangeEvent extends Event { … }
```

- `VersionChangeEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `String? get dataLoss`
- `String? get dataLossMessage`
- `int? get newVersion`
- `int? get oldVersion`
- `OpenDBRequest get target`
