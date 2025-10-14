# Library: dart:collection

Classes and utilities that supplement the collection support in dart:core.

To use this library in your code:
```dart
import 'dart:collection';
```

## Map
A finite mapping from unique keys to their associated values.
Allows efficient lookup of the value associated with a key, if any,
and iterating through the individual keys and values of the map.
The [Map] interface has a number of implementations, including the following:
* [HashMap] is unordered, the order of iteration is not guaranteed.
* [LinkedHashMap] iterates in key insertion order.
* [SplayTreeMap] iterates the keys in sorted order.
* [UnmodifiableMapView] is a wrapper, an unmodifiable [Map] view of another
`Map`.

## Set
A collection of objects in which each object can occur only once.
The [Set] interface has a number of implementations, including the following:
* [HashSet] does not guarantee the order of the objects in the iterations.
* [LinkedHashSet] iterates the objects in insertion order.
* [SplayTreeSet] iterates the objects in sorted order.
* [UnmodifiableSetView] is a wrapper, an unmodifiable [Set] view of another
`Set`.

## Queue
A queue is a sequence of elements that is intended to be modified,
by adding or removing elements, only at its ends.
Dart queues are *double ended* queues, which means that they can be
accessed equally from either end, and can therefore be used
to implement both stack and queue behavior.
* [Queue] is the general interface for queues.
* [ListQueue] is a list-based queue. Default implementation for [Queue].
* [DoubleLinkedQueue] is a queue implementation based on a double-linked
list.

## List
An indexable sequence of objects. Objects can be accessed using their
position, index, in the sequence. [List] is also called an "array" in other
programming languages.
* [UnmodifiableListView] is a wrapper, an unmodifiable [List] view of
another `List`.

## LinkedList
[LinkedList] is a specialized double-linked list of elements that extends
[LinkedListEntry]. Each element knows its own place in the linked list,
as well as which list it is in.
{@category Core}

## Members

- type alias `typedef IterableBase<E> = Iterable<E>`:
  Base class for implementing [Iterable].
- type alias `typedef IterableMixin<E> = Iterable<E>`:
  This [Iterable] mixin implements all [Iterable] members except `iterator`.
- type alias `typedef ListMixin<E> = ListBase<E>`:
  Base mixin implementation of a [List] class.
- type alias `typedef MapMixin<K, V> = MapBase<K, V>`: Mixin implementing a [Map].
- type alias `typedef SetMixin<E> = SetBase<E>`: Mixin implementation of [Set].

## Class: DoubleLinkedQueue

A [Queue] implementation based on a double-linked list.

```dart
final class DoubleLinkedQueue<E> extends Iterable<E> implements Queue<E> { … }
```

- `DoubleLinkedQueue()`
- `DoubleLinkedQueue.from(Iterable<dynamic> elements)`:
  Creates a double-linked queue containing all [elements].
- `DoubleLinkedQueue.of(Iterable<E> elements)`:
  Creates a double-linked queue from [elements].
- `E get first`: The first element.
- `bool get isEmpty`: Whether this collection has no elements.
- `_DoubleLinkedQueueIterator<E> get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `E get last`: The last element.
- `int get length`: The number of elements in this [Iterable].
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `void add(E value)`: Adds [value] at the end of the queue.
- `void addAll(Iterable<E> iterable)`:
  Adds all elements of [iterable] at the end of the queue. The
  length of the queue is extended by the length of [iterable].
- `void addFirst(E value)`: Adds [value] at the beginning of the queue.
- `void addLast(E value)`: Adds [value] at the end of the queue.
- `Queue<R> cast<R>()`:
  Provides a view of this queue as a queue of [R] instances, if necessary.
- `void clear()`:
  Removes all elements in the queue. The size of the queue becomes zero.
- `DoubleLinkedQueueEntry<E>? firstEntry()`:
  The entry object of the first element in the queue.
- `void forEachEntry(void Function(DoubleLinkedQueueEntry<E>) action)`:
  Calls [action] for each entry object of this double-linked queue.
- `DoubleLinkedQueueEntry<E>? lastEntry()`:
  The entry object of the last element in the queue.
- `bool remove(Object? o)`: Removes a single instance of [value] from the queue.
- `E removeFirst()`: Removes and returns the first element of this queue.
- `E removeLast()`: Removes and returns the last element of the queue.
- `void removeWhere(bool Function(E) test)`:
  Removes all elements matched by [test] from the queue.
- `void retainWhere(bool Function(E) test)`:
  Removes all elements not matched by [test] from the queue.
- `String toString()`:
  Returns a string representation of (some of) the elements of `this`.

## Class: DoubleLinkedQueueEntry

An entry in a doubly linked list.

```dart
class DoubleLinkedQueueEntry<E> { … }
```

- `DoubleLinkedQueueEntry(E element)`:
  Creates a new entry with the given [element].
- `E element`: The element of the entry in the queue.
- `void append(E e)`:
  Appends the given element [e] as entry just after this entry.
- `DoubleLinkedQueueEntry<E>? nextEntry()`:
  The next entry, or `null` if there is none.
- `void prepend(E e)`: Prepends the given [e] as entry just before this entry.
- `DoubleLinkedQueueEntry<E>? previousEntry()`:
  The previous entry, or `null` if there is none.
- `E remove()`: Removes this entry from any chain of entries it is part of.

## Class: HasNextIterator

Wrapper for [Iterator] providing the pre-Dart 1.0 iterator interface.

```dart
final class HasNextIterator<E> { … }
```

- `HasNextIterator(Iterator<E> iterator)`
- `bool get hasNext`: Whether the iterator has a next element.
- `E next()`: Provides the next element of the iterable, and moves past it.

## Class: HashMap

A hash-table based implementation of [Map].

```dart
abstract final class HashMap<K, V> implements Map<K, V> { … }
```

- `HashMap({bool Function(K, K)? equals, int Function(K)? hashCode, bool Function(dynamic)? isValidKey})`:
  Creates an unordered hash-table based [Map].
- `HashMap.from(Map<dynamic, dynamic> other)`:
  Creates a [HashMap] that contains all key/value pairs of [other].
- `HashMap.fromEntries(Iterable<MapEntry<K, V>> entries)`:
  Creates a [HashMap] containing the entries of [entries].
- `HashMap.fromIterable(Iterable<dynamic> iterable, {K Function(dynamic)? key, V Function(dynamic)? value})`:
  Creates a [HashMap] where the keys and values are computed from the
  [iterable].
- `HashMap.fromIterables(Iterable<K> keys, Iterable<V> values)`:
  Creates a [HashMap] associating the given [keys] to [values].
- `HashMap.identity()`: Creates an unordered identity-based map.
- `HashMap.of(Map<K, V> other)`:
  Creates a [HashMap] that contains all key/value pairs of [other].
  Example:

## Class: HashSet

An unordered hash-table based [Set] implementation.

```dart
abstract final class HashSet<E> implements Set<E> { … }
```

- `HashSet({bool Function(E, E)? equals, int Function(E)? hashCode, bool Function(dynamic)? isValidKey})`:
  Create a hash set using the provided [equals] as equality.
- `HashSet.from(Iterable<dynamic> elements)`:
  Create a hash set containing all [elements].
- `HashSet.identity()`: Creates an unordered identity-based set.
- `HashSet.of(Iterable<E> elements)`: Create a hash set containing all [elements].
- `Iterator<E> get iterator`:
  Provides an iterator that iterates over the elements of this set.

## Class: LinkedHashMap

An insertion-ordered [Map] with expected constant-time lookup.

```dart
abstract final class LinkedHashMap<K, V> implements Map<K, V> { … }
```

- `LinkedHashMap({bool Function(K, K)? equals, int Function(K)? hashCode, bool Function(dynamic)? isValidKey})`:
  Creates an insertion-ordered hash-table based [Map].
- `LinkedHashMap.from(Map<dynamic, dynamic> other)`:
  Creates a [LinkedHashMap] that contains all key value pairs of [other].
- `LinkedHashMap.fromEntries(Iterable<MapEntry<K, V>> entries)`:
  Creates a [LinkedHashMap] containing the entries of [entries].
- `LinkedHashMap.fromIterable(Iterable<dynamic> iterable, {K Function(dynamic)? key, V Function(dynamic)? value})`:
  Creates a [LinkedHashMap] where the keys and values are computed from the
  [iterable].
- `LinkedHashMap.fromIterables(Iterable<K> keys, Iterable<V> values)`:
  Creates a [LinkedHashMap] associating the given [keys] to [values].
- `LinkedHashMap.identity()`: Creates an insertion-ordered identity-based map.
- `LinkedHashMap.of(Map<K, V> other)`:
  Creates a [LinkedHashMap] that contains all key value pairs of [other].
  Example:

## Class: LinkedHashSet

A [LinkedHashSet] is a hash-table based [Set] implementation.

```dart
abstract final class LinkedHashSet<E> implements Set<E> { … }
```

- `LinkedHashSet({bool Function(E, E)? equals, int Function(E)? hashCode, bool Function(dynamic)? isValidKey})`:
  Create an insertion-ordered hash set using the provided
  [equals] and [hashCode].
- `LinkedHashSet.from(Iterable<dynamic> elements)`:
  Create a linked hash set containing all [elements].
- `LinkedHashSet.identity()`: Creates an insertion-ordered identity-based set.
- `LinkedHashSet.of(Iterable<E> elements)`:
  Create a linked hash set from [elements].
- `Iterator<E> get iterator`:
  Provides an iterator that iterates over the elements in insertion order.
- `void forEach(void Function(E) action)`:
  Executes a function on each element of the set.

## Class: LinkedList

A specialized double-linked list of elements that extends [LinkedListEntry].

```dart
class LinkedList<E extends LinkedListEntry<E>> extends Iterable<E> { … }
```

- `LinkedList()`: Constructs a new empty linked list.
- `E get first`: The first element.
- `bool get isEmpty`: Whether this collection has no elements.
- `Iterator<E> get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `E get last`: The last element.
- `int get length`: The number of elements in this [Iterable].
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `void add(E entry)`: Adds [entry] to the end of the linked list.
- `void addAll(Iterable<E> entries)`:
  Adds [entries] to the end of the linked list.
- `void addFirst(E entry)`: Adds [entry] to the beginning of the linked list.
- `void clear()`: Remove all elements from this linked list.
- `bool contains(Object? entry)`:
  Whether [entry] is a [LinkedListEntry] belonging to this list.
- `void forEach(void Function(E) action)`:
  Call [action] with each entry in this linked list.
- `bool remove(E entry)`: Removes [entry] from the linked list.

## Class: LinkedListEntry

An object that can be an element in a [LinkedList].

```dart
abstract base mixin class LinkedListEntry<E extends LinkedListEntry<E>> { … }
```

- `LinkedList<E>? get list`: The linked list containing this element.
- `E? get next`: The successor of this element in its linked list.
- `E? get previous`: The predecessor of this element in its linked list.
- `void insertAfter(E entry)`:
  Insert an element after this element in this element's linked list.
- `void insertBefore(E entry)`:
  Insert an element before this element in this element's linked list.
- `void unlink()`: Unlink the element from its linked list.

## Class: ListBase

Abstract implementation of a list.

```dart
abstract mixin class ListBase<E> implements List<E> { … }
```

- `ListBase()`
- static `String listToString(List<Object?> list)`:
  Converts a [List] to a [String].
- `E get first`: The first element.
- `set first=(E value)`
- `bool get isEmpty`: Whether this collection has no elements.
- `bool get isNotEmpty`: Whether this collection has at least one element.
- `Iterator<E> get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `E get last`: The last element.
- `set last=(E value)`
- `Iterable<E> get reversed`:
  An [Iterable] of the objects in this list in reverse order.
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `List<E> operator+(List<E> other)`:
  Returns the concatenation of this list and [other].
- `void add(E element)`: Adds [value] to the end of this list,
  extending the length by one.
- `void addAll(Iterable<E> iterable)`:
  Appends all objects of [iterable] to the end of this list.
- `bool any(bool Function(E) test)`:
  Checks whether any element of this iterable satisfies [test].
- `Map<int, E> asMap()`: An unmodifiable [Map] view of this list.
- `List<R> cast<R>()`: Returns a view of this list as a list of [R] instances.
- `void clear()`:
  Removes all objects from this list; the length of the list becomes zero.
- `bool contains(Object? element)`:
  Whether the collection contains an element equal to [element].
- `E elementAt(int index)`: Returns the [index]th element.
- `bool every(bool Function(E) test)`:
  Checks whether every element of this iterable satisfies [test].
- `Iterable<T> expand<T>(Iterable<T> Function(E) f)`:
  Expands each element of this [Iterable] into zero or more elements.
- `void fillRange(int start, int end, [E? fill])`:
  Overwrites a range of elements with [fillValue].
- `E firstWhere(bool Function(E) test, {E Function()? orElse})`:
  The first element that satisfies the given predicate [test].
- `T fold<T>(T initialValue, T Function(T, E) combine)`:
  Reduces a collection to a single value by iteratively combining each
  element of the collection with an existing value
- `Iterable<E> followedBy(Iterable<E> other)`:
  Creates the lazy concatenation of this iterable and [other].
- `void forEach(void Function(E) action)`:
  Invokes [action] on each element of this iterable in iteration order.
- `Iterable<E> getRange(int start, int end)`:
  Creates an [Iterable] that iterates over a range of elements.
- `int indexOf(Object? element, [int start])`:
  The first index of [element] in this list.
- `int indexWhere(bool Function(E) test, [int start])`:
  The first index in the list that satisfies the provided [test].
- `void insert(int index, E element)`:
  Inserts [element] at position [index] in this list.
- `void insertAll(int index, Iterable<E> iterable)`:
  Inserts all objects of [iterable] at position [index] in this list.
- `String join([String separator])`:
  Converts each element to a [String] and concatenates the strings.
- `int lastIndexOf(Object? element, [int? start])`:
  The last index of [element] in this list.
- `int lastIndexWhere(bool Function(E) test, [int? start])`:
  The last index in the list that satisfies the provided [test].
- `E lastWhere(bool Function(E) test, {E Function()? orElse})`:
  The last element that satisfies the given predicate [test].
- `Iterable<T> map<T>(T Function(E) f)`:
  The current elements of this iterable modified by [toElement].
- `E reduce(E Function(E, E) combine)`:
  Reduces a collection to a single value by iteratively combining elements
  of the collection using the provided function.
- `bool remove(Object? element)`:
  Removes the first occurrence of [value] from this list.
- `E removeAt(int index)`: Removes the object at position [index] from this list.
- `E removeLast()`: Removes and returns the last object in this list.
- `void removeRange(int start, int end)`:
  Removes a range of elements from the list.
- `void removeWhere(bool Function(E) test)`:
  Removes all objects from this list that satisfy [test].
- `void replaceRange(int start, int end, Iterable<E> newContents)`:
  Replaces a range of elements with the elements of [replacements].
- `void retainWhere(bool Function(E) test)`:
  Removes all objects from this list that fail to satisfy [test].
- `void setAll(int index, Iterable<E> iterable)`:
  Overwrites elements with the objects of [iterable].
- `void setRange(int start, int end, Iterable<E> iterable, [int skipCount])`:
  Writes some elements of [iterable] into a range of this list.
- `void shuffle([Random? random])`: Shuffles the elements of this list randomly.
- `E singleWhere(bool Function(E) test, {E Function()? orElse})`:
  The single element that satisfies [test].
- `Iterable<E> skip(int count)`:
  Creates an [Iterable] that provides all but the first [count] elements.
- `Iterable<E> skipWhile(bool Function(E) test)`:
  Creates an `Iterable` that skips leading elements while [test] is satisfied.
- `void sort([int Function(E, E)? compare])`:
  Sorts this list according to the order specified by the [compare] function.
- `List<E> sublist(int start, [int? end])`:
  Returns a new list containing the elements between [start] and [end].
- `Iterable<E> take(int count)`:
  Creates a lazy iterable of the [count] first elements of this iterable.
- `Iterable<E> takeWhile(bool Function(E) test)`:
  Creates a lazy iterable of the leading elements satisfying [test].
- `List<E> toList({bool growable})`:
  Creates a [List] containing the elements of this [Iterable].
- `Set<E> toSet()`: Creates a [Set] containing the same elements as this iterable.
- `String toString()`: A string representation of this object.
- `Iterable<E> where(bool Function(E) test)`:
  Creates a new lazy [Iterable] with all elements that satisfy the
  predicate [test].
- `Iterable<T> whereType<T>()`:
  Creates a new lazy [Iterable] with all elements that have type [T].

## Class: ListQueue

List based [Queue].

```dart
final class ListQueue<E> extends ListIterable<E> implements Queue<E> { … }
```

- `ListQueue([int? initialCapacity])`: Create an empty queue.
- `ListQueue.from(Iterable<dynamic> elements)`:
  Create a `ListQueue` containing all [elements].
- `ListQueue.of(Iterable<E> elements)`: Create a `ListQueue` from [elements].
- `E get first`: The first element.
- `bool get isEmpty`: Whether this collection has no elements.
- `Iterator<E> get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `E get last`: The last element.
- `int get length`: Returns the number of elements in the iterable.
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `void add(E value)`: Adds [value] at the end of the queue.
- `void addAll(Iterable<E> elements)`:
  Adds all elements of [iterable] at the end of the queue. The
  length of the queue is extended by the length of [iterable].
- `void addFirst(E value)`: Adds [value] at the beginning of the queue.
- `void addLast(E value)`: Adds [value] at the end of the queue.
- `Queue<R> cast<R>()`:
  Provides a view of this queue as a queue of [R] instances, if necessary.
- `void clear()`:
  Removes all elements in the queue. The size of the queue becomes zero.
- `E elementAt(int index)`: Returns the [index]th element.
- `void forEach(void Function(E) f)`:
  Invokes [action] on each element of this iterable in iteration order.
- `bool remove(Object? value)`:
  Removes a single instance of [value] from the queue.
- `E removeFirst()`: Removes and returns the first element of this queue.
- `E removeLast()`: Removes and returns the last element of the queue.
- `void removeWhere(bool Function(E) test)`:
  Remove all elements matched by [test].
- `void retainWhere(bool Function(E) test)`:
  Remove all elements not matched by [test].
- `List<E> toList({bool growable})`:
  Creates a [List] containing the elements of this [Iterable].
- `String toString()`:
  Returns a string representation of (some of) the elements of `this`.

## Class: MapBase

Base class for implementing a [Map].

```dart
abstract mixin class MapBase<K, V> implements Map<K, V> { … }
```

- `MapBase()`
- static `String mapToString(Map<Object?, Object?> m)`
- `Iterable<MapEntry<K, V>> get entries`: The map entries of this [Map].
- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<K> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<V> get values`: The values of this [Map].
- `V? operator[](Object? key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(K key, V value)`: Associates the [key] with the given [value].
- `void addAll(Map<K, V> other)`: Adds all key/value pairs of [other] to this map.
- `void addEntries(Iterable<MapEntry<K, V>> newEntries)`:
  Adds all key/value pairs of [newEntries] to this map.
- `Map<RK, RV> cast<RK, RV>()`:
  Provides a view of this map as having [RK] keys and [RV] instances,
  if necessary.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(Object? key)`: Whether this map contains the given [key].
- `bool containsValue(Object? value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(K, V) action)`:
  Applies [action] to each key/value pair of the map.
- `Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K, V) transform)`:
  Returns a new map where all entries of this map are transformed by
  the given [convert] function.
- `V putIfAbsent(K key, V Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `V? remove(Object? key)`:
  Removes [key] and its associated value, if present, from the map.
- `void removeWhere(bool Function(K, V) test)`:
  Removes all entries of this map that satisfy the given [test].
- `String toString()`: A string representation of this object.
- `V update(K key, V Function(V) update, {V Function()? ifAbsent})`:
  Updates the value for the provided [key].
- `void updateAll(V Function(K, V) update)`: Updates all values.

## Class: MapView

Wrapper around a class that implements [Map] that only exposes `Map`
members.

```dart
class MapView<K, V> implements Map<K, V> { … }
```

- `MapView(Map<K, V> map)`: Creates a view which forwards operations to [map].
- `Iterable<MapEntry<K, V>> get entries`: The map entries of this [Map].
- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<K> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<V> get values`: The values of this [Map].
- `V? operator[](Object? key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(K key, V value)`: Associates the [key] with the given [value].
- `void addAll(Map<K, V> other)`: Adds all key/value pairs of [other] to this map.
- `void addEntries(Iterable<MapEntry<K, V>> entries)`:
  Adds all key/value pairs of [newEntries] to this map.
- `Map<RK, RV> cast<RK, RV>()`:
  Provides a view of this map as having [RK] keys and [RV] instances,
  if necessary.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(Object? key)`: Whether this map contains the given [key].
- `bool containsValue(Object? value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(K, V) action)`:
  Applies [action] to each key/value pair of the map.
- `Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K, V) transform)`:
  Returns a new map where all entries of this map are transformed by
  the given [convert] function.
- `V putIfAbsent(K key, V Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `V? remove(Object? key)`:
  Removes [key] and its associated value, if present, from the map.
- `void removeWhere(bool Function(K, V) test)`:
  Removes all entries of this map that satisfy the given [test].
- `String toString()`: A string representation of this object.
- `V update(K key, V Function(V) update, {V Function()? ifAbsent})`:
  Updates the value for the provided [key].
- `void updateAll(V Function(K, V) update)`: Updates all values.

## Class: Queue

A [Queue] is a collection that can be manipulated at both ends. One
can iterate over the elements of a queue through [forEach] or with
an [Iterator].

```dart
abstract interface class Queue<E>
    implements Iterable<E>, _QueueIterable<E> { … }
```

- `Queue()`: Creates a queue.
- `Queue.from(Iterable<dynamic> elements)`:
  Creates a queue containing all [elements].
- `Queue.of(Iterable<E> elements)`: Creates a queue from [elements].
- static `Queue<T> castFrom<S, T>(Queue<S> source)`:
  Adapts [source] to be a `Queue<T>`.
- `void add(E value)`: Adds [value] at the end of the queue.
- `void addAll(Iterable<E> iterable)`:
  Adds all elements of [iterable] at the end of the queue. The
  length of the queue is extended by the length of [iterable].
- `void addFirst(E value)`: Adds [value] at the beginning of the queue.
- `void addLast(E value)`: Adds [value] at the end of the queue.
- `Queue<R> cast<R>()`:
  Provides a view of this queue as a queue of [R] instances, if necessary.
- `void clear()`:
  Removes all elements in the queue. The size of the queue becomes zero.
- `bool remove(Object? value)`:
  Removes a single instance of [value] from the queue.
- `E removeFirst()`: Removes and returns the first element of this queue.
- `E removeLast()`: Removes and returns the last element of the queue.
- `void removeWhere(bool Function(E) test)`:
  Removes all elements matched by [test] from the queue.
- `void retainWhere(bool Function(E) test)`:
  Removes all elements not matched by [test] from the queue.

## Class: SetBase

Base implementation of [Set].

```dart
abstract mixin class SetBase<E> implements Set<E> { … }
```

- `SetBase()`
- static `String setToString(Set<dynamic> set)`: Converts a [Set] to a [String].
- `E get first`: The first element.
- `bool get isEmpty`: Whether this collection has no elements.
- `bool get isNotEmpty`: Whether this collection has at least one element.
- `Iterator<E> get iterator`:
  An iterator that iterates over the elements of this set.
- `E get last`: The last element.
- `int get length`: The number of elements in this [Iterable].
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `bool add(E value)`: Adds [value] to the set.
- `void addAll(Iterable<E> elements)`: Adds all [elements] to this set.
- `bool any(bool Function(E) test)`:
  Checks whether any element of this iterable satisfies [test].
- `Set<R> cast<R>()`: Provides a view of this set as a set of [R] instances.
- `void clear()`: Removes all elements from the set.
- `bool contains(Object? element)`: Whether [value] is in the set.
- `bool containsAll(Iterable<Object?> other)`:
  Whether this set contains all the elements of [other].
- `Set<E> difference(Set<Object?> other)`:
  Creates a new set with the elements of this that are not in [other].
- `E elementAt(int index)`: Returns the [index]th element.
- `bool every(bool Function(E) f)`:
  Checks whether every element of this iterable satisfies [test].
- `Iterable<T> expand<T>(Iterable<T> Function(E) f)`:
  Expands each element of this [Iterable] into zero or more elements.
- `E firstWhere(bool Function(E) test, {E Function()? orElse})`:
  The first element that satisfies the given predicate [test].
- `T fold<T>(T initialValue, T Function(T, E) combine)`:
  Reduces a collection to a single value by iteratively combining each
  element of the collection with an existing value
- `Iterable<E> followedBy(Iterable<E> other)`:
  Creates the lazy concatenation of this iterable and [other].
- `void forEach(void Function(E) f)`:
  Invokes [action] on each element of this iterable in iteration order.
- `Set<E> intersection(Set<Object?> other)`:
  Creates a new set which is the intersection between this set and [other].
- `String join([String separator])`:
  Converts each element to a [String] and concatenates the strings.
- `E lastWhere(bool Function(E) test, {E Function()? orElse})`:
  The last element that satisfies the given predicate [test].
- `E? lookup(Object? element)`:
  If an object equal to [object] is in the set, return it.
- `Iterable<T> map<T>(T Function(E) f)`:
  The current elements of this iterable modified by [toElement].
- `E reduce(E Function(E, E) combine)`:
  Reduces a collection to a single value by iteratively combining elements
  of the collection using the provided function.
- `bool remove(Object? value)`: Removes [value] from the set.
- `void removeAll(Iterable<Object?> elements)`:
  Removes each element of [elements] from this set.
- `void removeWhere(bool Function(E) test)`:
  Removes all elements of this set that satisfy [test].
- `void retainAll(Iterable<Object?> elements)`:
  Removes all elements of this set that are not elements in [elements].
- `void retainWhere(bool Function(E) test)`:
  Removes all elements of this set that fail to satisfy [test].
- `E singleWhere(bool Function(E) test, {E Function()? orElse})`:
  The single element that satisfies [test].
- `Iterable<E> skip(int n)`:
  Creates an [Iterable] that provides all but the first [count] elements.
- `Iterable<E> skipWhile(bool Function(E) test)`:
  Creates an `Iterable` that skips leading elements while [test] is satisfied.
- `Iterable<E> take(int n)`:
  Creates a lazy iterable of the [count] first elements of this iterable.
- `Iterable<E> takeWhile(bool Function(E) test)`:
  Creates a lazy iterable of the leading elements satisfying [test].
- `List<E> toList({bool growable})`:
  Creates a [List] containing the elements of this [Iterable].
- `Set<E> toSet()`:
  Creates a [Set] with the same elements and behavior as this `Set`.
- `String toString()`: A string representation of this object.
- `Set<E> union(Set<E> other)`:
  Creates a new set which contains all the elements of this set and [other].
- `Iterable<E> where(bool Function(E) f)`:
  Creates a new lazy [Iterable] with all elements that satisfy the
  predicate [test].
- `Iterable<T> whereType<T>()`:
  Creates a new lazy [Iterable] with all elements that have type [T].

## Class: SplayTreeMap

A [Map] of objects that can be ordered relative to each other.

```dart
final class SplayTreeMap<K, V>
    extends _SplayTree<K, _SplayTreeMapNode<K, V>>
    with MapBase<K, V> { … }
```

- `SplayTreeMap([int Function(K, K)? compare, bool Function(dynamic)? isValidKey])`
- `SplayTreeMap.from(Map<Object?, Object?> other, [int Function(K, K)? compare, bool Function(dynamic)? isValidKey])`:
  Creates a [SplayTreeMap] that contains all key/value pairs of [other].
- `SplayTreeMap.fromIterable(Iterable<dynamic> iterable, {K Function(dynamic)? key, V Function(dynamic)? value, int Function(K, K)? compare, bool Function(dynamic)? isValidKey})`:
  Creates a [SplayTreeMap] where the keys and values are computed from the
  [iterable].
- `SplayTreeMap.fromIterables(Iterable<K> keys, Iterable<V> values, [int Function(K, K)? compare, bool Function(dynamic)? isValidKey])`:
  Creates a [SplayTreeMap] associating the given [keys] to [values].
- `SplayTreeMap.of(Map<K, V> other, [int Function(K, K)? compare, bool Function(dynamic)? isValidKey])`:
  Creates a [SplayTreeMap] that contains all key/value pairs of [other].
  Example:
- `Iterable<MapEntry<K, V>> get entries`: The map entries of this [Map].
- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<K> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<V> get values`: The values of this [Map].
- `V? operator[](Object? key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(K key, V value)`: Associates the [key] with the given [value].
- `void addAll(Map<K, V> other)`: Adds all key/value pairs of [other] to this map.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(Object? key)`: Whether this map contains the given [key].
- `bool containsValue(Object? value)`:
  Whether this map contains the given [value].
- `K? firstKey()`: The first key in the map.
- `K? firstKeyAfter(K key)`:
  Get the first key in the map that is strictly larger than [key]. Returns
  `null` if such a key was not found.
- `void forEach(void Function(K, V) f)`:
  Applies [action] to each key/value pair of the map.
- `K? lastKey()`: The last key in the map.
- `K? lastKeyBefore(K key)`:
  The last key in the map that is strictly smaller than [key].
- `V putIfAbsent(K key, V Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `V? remove(Object? key)`:
  Removes [key] and its associated value, if present, from the map.
- `V update(K key, V Function(V) update, {V Function()? ifAbsent})`:
  Updates the value for the provided [key].
- `void updateAll(V Function(K, V) update)`: Updates all values.

## Class: SplayTreeSet

A [Set] of objects that can be ordered relative to each other.

```dart
final class SplayTreeSet<E>
    extends _SplayTree<E, _SplayTreeSetNode<E>>
    with Iterable<E>, SetBase<E> { … }
```

- `SplayTreeSet([int Function(E, E)? compare, bool Function(dynamic)? isValidKey])`:
  Create a new [SplayTreeSet] with the given compare function.
- `SplayTreeSet.from(Iterable<dynamic> elements, [int Function(E, E)? compare, bool Function(dynamic)? isValidKey])`:
  Creates a [SplayTreeSet] that contains all [elements].
- `SplayTreeSet.of(Iterable<E> elements, [int Function(E, E)? compare, bool Function(dynamic)? isValidKey])`:
  Creates a [SplayTreeSet] from [elements].
- `E get first`: The first element.
- `bool get isEmpty`: Whether this collection has no elements.
- `bool get isNotEmpty`: Whether this collection has at least one element.
- `Iterator<E> get iterator`:
  An iterator that iterates over the elements of this set.
- `E get last`: The last element.
- `int get length`: The number of elements in this [Iterable].
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `bool add(E element)`: Adds [value] to the set.
- `void addAll(Iterable<E> elements)`: Adds all [elements] to this set.
- `Set<R> cast<R>()`: Provides a view of this set as a set of [R] instances.
- `void clear()`: Removes all elements from the set.
- `bool contains(Object? element)`: Whether [value] is in the set.
- `Set<E> difference(Set<Object?> other)`:
  Creates a new set with the elements of this that are not in [other].
- `Set<E> intersection(Set<Object?> other)`:
  Creates a new set which is the intersection between this set and [other].
- `E? lookup(Object? object)`:
  If an object equal to [object] is in the set, return it.
- `bool remove(Object? object)`: Removes [value] from the set.
- `void removeAll(Iterable<Object?> elements)`:
  Removes each element of [elements] from this set.
- `void retainAll(Iterable<Object?> elements)`:
  Removes all elements of this set that are not elements in [elements].
- `Set<E> toSet()`:
  Creates a [Set] with the same elements and behavior as this `Set`.
- `String toString()`: A string representation of this object.
- `Set<E> union(Set<E> other)`:
  Creates a new set which contains all the elements of this set and [other].

## Class: UnmodifiableListView

An unmodifiable [List] view of another List.

```dart
class UnmodifiableListView<E> extends UnmodifiableListBase<E> { … }
```

- `UnmodifiableListView(Iterable<E> source)`:
  Creates an unmodifiable list backed by [source].
- `int get length`: The number of objects in this list.
- `E operator[](int index)`: The object at the given [index] in the list.
- `List<R> cast<R>()`: Returns a view of this list as a list of [R] instances.

## Class: UnmodifiableMapBase

Basic implementation of an unmodifiable [Map].

```dart
abstract class UnmodifiableMapBase<K, V>
    extends MapBase<K, V>
    with _UnmodifiableMapMixin<K, V> { … }
```

## Class: UnmodifiableMapView

View of a [Map] that disallow modifying the map.

```dart
class UnmodifiableMapView<K, V>
    extends MapView<K, V>
    with _UnmodifiableMapMixin<K, V> { … }
```

- `UnmodifiableMapView(Map<K, V> map)`
- `Map<RK, RV> cast<RK, RV>()`:
  Provides a view of this map as having [RK] keys and [RV] instances,
  if necessary.

## Class: UnmodifiableSetView

An unmodifiable [Set] view of another [Set].

```dart
class UnmodifiableSetView<E>
    extends SetBase<E>
    with _UnmodifiableSetMixin<E> { … }
```

- `UnmodifiableSetView(Set<E> source)`:
  Creates an [UnmodifiableSetView] of [source].
- `Iterator<E> get iterator`:
  An iterator that iterates over the elements of this set.
- `int get length`: The number of elements in this [Iterable].
- `bool contains(Object? element)`: Whether [value] is in the set.
- `E? lookup(Object? element)`:
  If an object equal to [object] is in the set, return it.
- `Set<E> toSet()`:
  Creates a [Set] with the same elements and behavior as this `Set`.

## Extension: IterableExtensions

Operations on iterables.

```dart
extension IterableExtensions<T> on Iterable<T> { … }
```

- `T? get firstOrNull`:
  The first element of this iterator, or `null` if the iterable is empty.
- `Iterable<(int, T)> get indexed`:
  Pairs of elements of the indices and elements of this iterable.
- `T? get lastOrNull`:
  The last element of this iterable, or `null` if the iterable is empty.
- `T? get singleOrNull`: The single element of this iterator, or `null`.
- `T? elementAtOrNull(int index)`:
  The element at position [index] of this iterable, or `null`.

## Extension: NullableIterableExtensions

Operations on iterables with nullable elements.

```dart
extension NullableIterableExtensions<T extends Object> on Iterable<T?> { … }
```

- `Iterable<T> get nonNulls`: The non-`null` elements of this iterable.
