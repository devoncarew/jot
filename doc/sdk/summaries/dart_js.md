# Library: dart:js

Low-level support for interoperating with JavaScript.

> [!Note]
> You should usually use `dart:js_interop` instead of this library.
> To learn more, check out the
> [JS interop documentation](https://dart.dev/interop/js-interop).

This library provides access to JavaScript objects from Dart, allowing
Dart code to get and set properties, and call methods of JavaScript objects
and invoke JavaScript functions. The library takes care of converting
between Dart and JavaScript objects where possible, or providing proxies if
conversion isn't possible.

This library does not make Dart objects usable from JavaScript, their
methods and properties are not accessible, though it does allow Dart
functions to be passed into and called from JavaScript.

[JsObject] is the core type and represents a proxy of a JavaScript object.
JsObject gives access to the underlying JavaScript objects properties and
methods. `JsObject`s can be acquired by calls to JavaScript, or they can be
created from proxies to JavaScript constructors.

The top-level getter [context] provides a [JsObject] that represents the
global object in JavaScript, usually `window`.

The following example shows an alert dialog via a JavaScript call to the
global function `alert()`:

    import 'dart:js';

    main() => context.callMethod('alert', ['Hello from Dart!']);

This example shows how to create a [JsObject] from a JavaScript constructor
and access its properties:

    import 'dart:js';

    main() {
      var object = JsObject(context['Object']);
      object['greeting'] = 'Hello';
      object['greet'] = (name) => "${object['greeting']} $name";
      var message = object.callMethod('greet', ['JavaScript']);
      context['console'].callMethod('log', [message]);
    }

## Proxying and automatic conversion

When setting properties on a JsObject or passing arguments to a JavaScript
method or function, Dart objects are automatically converted or proxied to
JavaScript objects. When accessing JavaScript properties, or when a Dart
closure is invoked from JavaScript, the JavaScript objects are also
converted to Dart.

Functions and closures are proxied in such a way that they are callable. A
Dart closure assigned to a JavaScript property is proxied by a function in
JavaScript. A JavaScript function accessed from Dart is proxied by a
[JsFunction], which has a [JsFunction.apply] method to invoke it.

The following types are transferred directly and not proxied:

  * Basic types: `null`, `bool`, `num`, `String`, `DateTime`
  * `TypedData`, including its subclasses like `Int32List`, but _not_
    `ByteBuffer`
  * When compiling for the web, also: `Blob`, `Event`, `ImageData`,
    `KeyRange`, `Node`, and `Window`.

## Converting collections with JsObject.jsify()

To create a JavaScript collection from a Dart collection use the
[JsObject.jsify] constructor, which converts Dart [Map]s and [Iterable]s
into JavaScript Objects and Arrays.

The following expression creates a new JavaScript object with the properties
`a` and `b` defined:

    var jsMap = JsObject.jsify({'a': 1, 'b': 2});

This expression creates a JavaScript array:

    var jsArray = JsObject.jsify([1, 2, 3]);

{@category Web (Legacy)}

## Members

- accessor `JsObject get context`: The JavaScript global object, usually `window`.

## Class: JsArray

A [List] that proxies a JavaScript array.

```dart
class JsArray<E> extends JsObject with ListBase<E> { … }
```

- `JsArray()`: Creates an empty JavaScript array.
- `JsArray.from(Iterable<E> other)`:
  Creates a new JavaScript array and initializes it to the contents of
  [other].
- `int get length`: The number of objects in this list.
- `set length=(int length)`
- `E operator[](Object index)`:
  Returns the value associated with [property] from the proxied JavaScript
  object.
- `void operator[]=(Object index, E value)`
- `void add(E value)`: Adds [value] to the end of this list,
  extending the length by one.
- `void addAll(Iterable<E> iterable)`:
  Appends all objects of [iterable] to the end of this list.
- `void insert(int index, E element)`:
  Inserts [element] at position [index] in this list.
- `E removeAt(int index)`: Removes the object at position [index] from this list.
- `E removeLast()`: Removes and returns the last object in this list.
- `void removeRange(int start, int end)`:
  Removes a range of elements from the list.
- `void setRange(int start, int end, Iterable<E> iterable, [int skipCount])`:
  Writes some elements of [iterable] into a range of this list.
- `void sort([int Function(E, E)? compare])`:
  Sorts this list according to the order specified by the [compare] function.

## Class: JsFunction

A proxy on a JavaScript Function object.

```dart
class JsFunction extends JsObject { … }
```

- `JsFunction.withThis(Function f)`:
  Returns a [JsFunction] that captures its 'this' binding and calls [f]
  with the value of JavaScript `this` passed as the first argument.
- `dynamic apply(List<dynamic> args, {dynamic thisArg})`:
  Invokes the JavaScript function with arguments [args]. If [thisArg] is
  supplied it is the value of `this` for the invocation.

## Class: JsObject

A proxy on a JavaScript object.

```dart
class JsObject { … }
```

- `JsObject(JsFunction constructor, [List<dynamic>? arguments])`:
  Constructs a JavaScript object from its native [constructor] and returns
  a proxy to it.
- `JsObject.fromBrowserObject(Object object)`:
  Constructs a [JsObject] that proxies a native Dart object; _for expert use
  only_.
- `JsObject.jsify(Object object)`:
  Recursively converts a JSON-like collection of Dart objects to a
  collection of JavaScript objects and returns a [JsObject] proxy to it.
- `int get hashCode`: The hash code for this object.
- `bool operator==(Object other)`: The equality operator.
- `dynamic operator[](Object property)`:
  Returns the value associated with [property] from the proxied JavaScript
  object.
- `void operator[]=(Object property, Object? value)`
- `dynamic callMethod(Object method, [List<dynamic>? args])`:
  Calls [method] on the JavaScript object with the arguments [args] and
  returns the result.
- `void deleteProperty(Object property)`:
  Removes [property] from the JavaScript object.
- `bool hasProperty(Object property)`:
  Returns `true` if the JavaScript object contains the specified property
  either directly or though its prototype chain.
- `bool instanceof(JsFunction type)`:
  Returns `true` if the JavaScript object has [type] in its prototype chain.
- `String toString()`:
  Returns the result of the JavaScript objects `toString` method.
