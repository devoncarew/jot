# Library: dart:js_interop

Interoperability, "interop" for short, with JavaScript and browser APIs.

JavaScript interop allows a Dart program to interact with a JavaScript
runtime. This can, for example, be to access JavaScript declarations and
interact with JavaScript values, or to adapt Dart values so that they can be
passed to and used by JavaScript code.

This JavaScript interop library works by introducing an abstraction over
JavaScript values, a Dart type hierarchy ("JS types") which mirrors known
JavaScript types, and a framework for introducing new Dart types that bind
Dart type declarations to JavaScript values and external member declarations
to JavaScript APIs.

This abstraction allows the same interop API to be used both when the Dart
code is compiled to JavaScript and when compiled to Wasm.

See https://dart.dev/interop/js-interop for more details on usage, types,
and previous JavaScript interop.

> [!NOTE]
> The types defined in this library only provide static guarantees. The
> runtime types differ based on the backend, so it is important to rely on
> static functionality like the conversion functions. Similarly, don't rely
> on `is` checks that involve JS types or JS-typed values. Furthermore,
> `identical` may also return different results for the same JS value
> depending on the compiler. Use `==` to check for equality of two JS-typed
> values instead, but do not check for equality between a Dart value and a
> JS-typed value.

{@category Web}

## Members

- accessor `_Anonymous get anonymous`
- accessor `JSObject get globalContext`:
  The global scope that is used to find user-declared interop members.
- accessor `_StaticInterop get staticInterop`
- function `JSObject createJSInteropWrapper<T extends Object>(T dartObject, [JSObject? proto])`:
  Given a instance of a Dart class that contains an <code>@[JSExport]</code>
  annotation, creates a JavaScript object that wraps the given Dart object.
- function `JSPromise<JSObject> importModule(JSAny moduleName)`:
  Dynamically imports a JavaScript module with the given [moduleName] using
  the JavaScript `import()` syntax.
- type alias `typedef JSVoid = void`:
  JS type equivalent for `undefined` for interop member return types.

## Class: JS

An annotation on a JavaScript interop declaration.

```dart
class JS { … }
```

- `JS([String? name])`
- `String? name`

## Class: JSExport

Annotation to allow Dart classes to be wrapped with a JS object using
`dart:js_interop`'s `createJSInteropWrapper`.

```dart
class JSExport { … }
```

- `JSExport([String name])`
- `String name`

## Class: NullRejectionException

Exception for when a [JSPromise] that is converted via
[JSPromiseToFuture.toDart] is rejected with a `null` or `undefined` value.

```dart
class NullRejectionException implements Exception { … }
```

- `NullRejectionException(bool isUndefined)`
- `bool isUndefined`
- `String toString()`: A string representation of this object.

## Extension: BoolToJSBoolean

Conversions from [bool] to [JSBoolean].

```dart
extension BoolToJSBoolean on bool { … }
```

- `JSBoolean get toJS`: Converts this [bool] to a [JSBoolean].

## Extension: ByteBufferToJSArrayBuffer

Conversions from [ByteBuffer] to [JSArrayBuffer].

```dart
extension ByteBufferToJSArrayBuffer on ByteBuffer { … }
```

- `JSArrayBuffer get toJS`:
  Converts this [ByteBuffer] to a [JSArrayBuffer] by either casting,
  unwrapping, or cloning the [ByteBuffer].

## Extension: ByteDataToJSDataView

Conversions from [ByteData] to [JSDataView].

```dart
extension ByteDataToJSDataView on ByteData { … }
```

- `JSDataView get toJS`:
  Converts this [ByteData] to a [JSDataView] by either casting, unwrapping,
  or cloning the [ByteData].

## Extension: DoubleToJSNumber

Conversions from [double] to [JSNumber].

```dart
extension DoubleToJSNumber on double { … }
```

- `JSNumber get toJS`: Converts this [double] to a [JSNumber].

## Extension: ExternalDartReferenceToObject

Conversions from [ExternalDartReference] to the value of type [T].

```dart
extension ExternalDartReferenceToObject<T extends Object?> on ExternalDartReference<T> { … }
```

- `T get toDartObject`:
  The Dart value of type [T] that this [ExternalDartReference] refers to.

## Extension: Float32ListToJSFloat32Array

Conversions from [Float32List] to [JSFloat32Array].

```dart
extension Float32ListToJSFloat32Array on Float32List { … }
```

- `JSFloat32Array get toJS`:
  Converts this [Float32List] to a [JSFloat32Array] by either casting,
  unwrapping, or cloning the [Float32List].

## Extension: Float64ListToJSFloat64Array

Conversions from [Float64List] to [JSFloat64Array].

```dart
extension Float64ListToJSFloat64Array on Float64List { … }
```

- `JSFloat64Array get toJS`:
  Converts this [Float64List] to a [JSFloat64Array] by either casting,
  unwrapping, or cloning the [Float64List].

## Extension: FunctionToJSExportedDartFunction

Conversions from [Function] to [JSExportedDartFunction].

```dart
extension FunctionToJSExportedDartFunction on Function { … }
```

- `JSExportedDartFunction get toJS`:
  A callable JavaScript function that wraps this [Function].
- `JSExportedDartFunction get toJSCaptureThis`:
  A callable JavaScript function that wraps this [Function] and captures the
  `this` value when called.

## Extension: FutureOfJSAnyToJSPromise

Conversions from [Future] to [JSPromise] where the [Future] returns a value.

```dart
extension FutureOfJSAnyToJSPromise<T extends JSAny?> on Future<T> { … }
```

- `JSPromise<T> get toJS`:
  A [JSPromise] that either resolves with the result of the completed
  [Future] or rejects with an object that contains its error.

## Extension: FutureOfVoidToJSPromise

Conversions from [Future] to [JSPromise] where the [Future] does not return
a value.

```dart
extension FutureOfVoidToJSPromise on Future<void> { … }
```

- `JSPromise<JSAny?> get toJS`:
  A [JSPromise] that either resolves once this [Future] completes or rejects
  with an object that contains its error.

## Extension: Int16ListToJSInt16Array

Conversions from [Int16List] to [JSInt16Array].

```dart
extension Int16ListToJSInt16Array on Int16List { … }
```

- `JSInt16Array get toJS`:
  Converts this [Int16List] to a [JSInt16Array] by either casting,
  unwrapping, or cloning the [Int16List].

## Extension: Int32ListToJSInt32Array

Conversions from [Int32List] to [JSInt32Array].

```dart
extension Int32ListToJSInt32Array on Int32List { … }
```

- `JSInt32Array get toJS`:
  Converts this [Int32List] to a [JSInt32Array] by either casting,
  unwrapping, or cloning the [Int32List].

## Extension: Int8ListToJSInt8Array

Conversions from [Int8List] to [JSInt8Array].

```dart
extension Int8ListToJSInt8Array on Int8List { … }
```

- `JSInt8Array get toJS`:
  Converts this [Int8List] to a [JSInt8Array] by either casting,
  unwrapping, or cloning the [Int8List].

## Extension: JSAnyOperatorExtension

General-purpose JavaScript operators.

```dart
extension JSAnyOperatorExtension on JSAny? { … }
```

- `JSBoolean get isTruthy`: The result of <code>!!`this`</code> in JavaScript.
- `JSBoolean get not`: The result of <code>!`this`</code> in JavaScript.
- `JSAny add(JSAny? any)`:
  The result of <code>`this` + [any]</code> in JavaScript.
- `JSAny? and(JSAny? any)`:
  The result of <code>`this` && [any]</code> in JavaScript.
- `JSAny divide(JSAny? any)`:
  The result of <code>`this` / [any]</code> in JavaScript.
- `JSBoolean equals(JSAny? any)`:
  The result of <code>`this` == [any]</code> in JavaScript.
- `JSAny exponentiate(JSAny? any)`:
  The result of <code>`this` ** [any]</code> in JavaScript.
- `JSBoolean greaterThan(JSAny? any)`:
  The result of <code>`this` > [any]</code> in JavaScript.
- `JSBoolean greaterThanOrEqualTo(JSAny? any)`:
  The result of <code>`this` >= [any]</code> in JavaScript.
- `JSBoolean lessThan(JSAny? any)`:
  The result of <code>`this` < [any]</code> in JavaScript.
- `JSBoolean lessThanOrEqualTo(JSAny? any)`:
  The result of <code>`this` <= [any]</code> in JavaScript.
- `JSAny modulo(JSAny? any)`:
  The result of <code>`this` % [any]</code> in JavaScript.
- `JSAny multiply(JSAny? any)`:
  The result of <code>`this` * [any]</code> in JavaScript.
- `JSBoolean notEquals(JSAny? any)`:
  The result of <code>`this` != [any]</code> in JavaScript.
- `JSAny? or(JSAny? any)`:
  The result of <code>`this` || [any]</code> in JavaScript.
- `JSBoolean strictEquals(JSAny? any)`:
  The result of <code>`this` === [any]</code> in JavaScript.
- `JSBoolean strictNotEquals(JSAny? any)`:
  The result of <code>`this` !== [any]</code> in JavaScript.
- `JSAny subtract(JSAny? any)`:
  The result of <code>`this` - [any]</code> in JavaScript.
- `JSNumber unsignedRightShift(JSAny? any)`:
  The result of <code>`this` >>> [any]</code> in JavaScript.

## Extension: JSAnyUtilityExtension

Common utility functions that are useful for any JavaScript value.

```dart
extension JSAnyUtilityExtension on JSAny? { … }
```

- `Object? dartify()`:
  Converts a JavaScript JSON-like value to the Dart equivalent if possible.
- `bool instanceOfString(String constructorName)`:
  Whether this <code>[JSAny]?</code> is an `instanceof` the constructor that
  is defined by [constructorName], which is looked up in the
  [globalContext].
- `bool instanceof(JSFunction constructor)`:
  Whether this <code>[JSAny]?</code> is an `instanceof` [constructor].
- `bool isA<T extends JSAny?>()`:
  Whether this <code>[JSAny]?</code> is an instance of the JavaScript type
  that is declared by [T].
- `bool typeofEquals(String typeString)`:
  Whether the result of `typeof` on this <code>[JSAny]?</code> is
  [typeString].

## Extension: JSArrayBufferToByteBuffer

Conversions from [JSArrayBuffer] to [ByteBuffer].

```dart
extension JSArrayBufferToByteBuffer on JSArrayBuffer { … }
```

- `ByteBuffer get toDart`:
  Converts this [JSArrayBuffer] to a [ByteBuffer] by either casting or
  wrapping it.

## Extension: JSArrayToList

Conversions from [JSArray] to [List].

```dart
extension JSArrayToList<T extends JSAny?> on JSArray<T> { … }
```

- `List<T> get toDart`:
  Converts this [JSArray] to a [List] by either casting or wrapping it.

## Extension: JSBooleanToBool

Conversions from [JSBoolean] to [bool].

```dart
extension JSBooleanToBool on JSBoolean { … }
```

- `bool get toDart`: Converts this [JSBoolean] to a [bool].

## Extension: JSBoxedDartObjectToObject

Conversions from [JSBoxedDartObject] to [Object].

```dart
extension JSBoxedDartObjectToObject on JSBoxedDartObject { … }
```

- `Object get toDart`: The Dart [Object] that this [JSBoxedDartObject] wrapped.

## Extension: JSDataViewToByteData

Conversions from [JSDataView] to [ByteData].

```dart
extension JSDataViewToByteData on JSDataView { … }
```

- `ByteData get toDart`:
  Converts this [JSDataView] to a [ByteData] by either casting or wrapping
  it.

## Extension: JSExportedDartFunctionToFunction

Conversions from [JSExportedDartFunction] to [Function].

```dart
extension JSExportedDartFunctionToFunction on JSExportedDartFunction { … }
```

- `Function get toDart`:
  The Dart [Function] that this [JSExportedDartFunction] wrapped.

## Extension: JSFloat32ArrayToFloat32List

Conversions from [JSFloat32Array] to [Float32List].

```dart
extension JSFloat32ArrayToFloat32List on JSFloat32Array { … }
```

- `Float32List get toDart`:
  Converts this [JSFloat32Array] to a [Float32List] by either casting or
  wrapping it.

## Extension: JSFloat64ArrayToFloat64List

Conversions from [JSFloat64Array] to [Float64List].

```dart
extension JSFloat64ArrayToFloat64List on JSFloat64Array { … }
```

- `Float64List get toDart`:
  Converts this [JSFloat64Array] to a [Float64List] by either casting or
  wrapping it.

## Extension: JSFunctionUtilExtension

Utility extensions for [JSFunction].

```dart
extension JSFunctionUtilExtension on JSFunction { … }
```

- `JSAny? callAsFunction([JSAny? thisArg, JSAny? arg1, JSAny? arg2, JSAny? arg3, JSAny? arg4])`:
  Call this [JSFunction] using the JavaScript `.call` syntax and returns the
  result.

## Extension: JSInt16ArrayToInt16List

Conversions from [JSInt16Array] to [Int16List].

```dart
extension JSInt16ArrayToInt16List on JSInt16Array { … }
```

- `Int16List get toDart`:
  Converts this [JSInt16Array] to a [Int16List] by either casting or
  wrapping it.

## Extension: JSInt32ArrayToInt32List

Conversions from [JSInt32Array] to [Int32List].

```dart
extension JSInt32ArrayToInt32List on JSInt32Array { … }
```

- `Int32List get toDart`:
  Converts this [JSInt32Array] to a [Int32List] by either casting or
  wrapping it.

## Extension: JSInt8ArrayToInt8List

Conversions from [JSInt8Array] to [Int8List].

```dart
extension JSInt8ArrayToInt8List on JSInt8Array { … }
```

- `Int8List get toDart`:
  Converts this [JSInt8Array] to a [Int8List] by either casting or wrapping
  it.

## Extension: JSNumberToNumber

Conversions from [JSNumber] to [double] or [int].

```dart
extension JSNumberToNumber on JSNumber { … }
```

- `double get toDartDouble`: Converts this [JSNumber] to a [double].
- `int get toDartInt`: Converts this [JSNumber] to an [int].

## Extension: JSPromiseToFuture

Conversions from [JSPromise] to [Future].

```dart
extension JSPromiseToFuture<T extends JSAny?> on JSPromise<T> { … }
```

- `Future<T> get toDart`:
  A [Future] that either completes with the result of the resolved
  [JSPromise] or propagates the error that the [JSPromise] rejected with.

## Extension: JSStringToString

Conversions from [JSString] to [String].

```dart
extension JSStringToString on JSString { … }
```

- `String get toDart`: Converts this [JSString] to a [String].

## Extension: JSUint16ArrayToUint16List

Conversions from [JSUint16Array] to [Uint16List].

```dart
extension JSUint16ArrayToUint16List on JSUint16Array { … }
```

- `Uint16List get toDart`:
  Converts this [JSUint16Array] to a [Uint16List] by either casting or
  wrapping it.

## Extension: JSUint32ArrayToUint32List

Conversions from [JSUint32Array] to [Uint32List].

```dart
extension JSUint32ArrayToUint32List on JSUint32Array { … }
```

- `Uint32List get toDart`:
  Converts this [JSUint32Array] to a [Uint32List] by either casting or
  wrapping it.

## Extension: JSUint8ArrayToUint8List

Conversions from [JSUint8Array] to [Uint8List].

```dart
extension JSUint8ArrayToUint8List on JSUint8Array { … }
```

- `Uint8List get toDart`:
  Converts this [JSUint8Array] to a [Uint8List] by either casting or
  wrapping it.

## Extension: JSUint8ClampedArrayToUint8ClampedList

Conversions from [JSUint8ClampedArray] to [Uint8ClampedList].

```dart
extension JSUint8ClampedArrayToUint8ClampedList on JSUint8ClampedArray { … }
```

- `Uint8ClampedList get toDart`:
  Converts this [JSUint8ClampedArray] to a [Uint8ClampedList] by either
  casting or wrapping it.

## Extension: ListToJSArray

Conversions from [List] to [JSArray].

```dart
extension ListToJSArray<T extends JSAny?> on List<T> { … }
```

- `JSArray<T> get toJS`:
  Converts this [List] to a [JSArray] by either casting, unwrapping, or
  cloning the [List].
- `JSArray<T> get toJSProxyOrRef`:
  Converts this [List] to a [JSArray] by either casting, unwrapping, or
  proxying the [List].

## Extension: NullableObjectUtilExtension

Common utility functions for <code>[Object]?</code>s.

```dart
extension NullableObjectUtilExtension on Object? { … }
```

- `JSAny? jsify()`:
  Converts a Dart JSON-like object to the JavaScript equivalent if possible.

## Extension: NullableUndefineableJSAnyExtension

Helper members to determine if a value is JavaScript `undefined` or `null`.

```dart
extension NullableUndefineableJSAnyExtension on JSAny? { … }
```

- `bool get isDefinedAndNotNull`
- `bool get isNull`: Whether this value corresponds to JavaScript `null`.
- `bool get isUndefined`:
  Whether this value corresponds to JavaScript `undefined`.
- `bool get isUndefinedOrNull`

## Extension: NumToJSExtension

Conversions from [num] to [JSNumber].

```dart
extension NumToJSExtension on num { … }
```

- `JSNumber get toJS`: Converts this [num] to a [JSNumber].

## Extension: ObjectToExternalDartReference

Conversions from a value of type [T] to [ExternalDartReference].

```dart
extension ObjectToExternalDartReference<T extends Object?> on T { … }
```

- `ExternalDartReference<T> get toExternalReference`:
  An opaque reference to this value of type [T] which can be passed to
  JavaScript.

## Extension: ObjectToJSBoxedDartObject

Conversions from [Object] to [JSBoxedDartObject].

```dart
extension ObjectToJSBoxedDartObject on Object { … }
```

- `JSBoxedDartObject get toJSBox`: A JavaScript object that wraps this [Object].

## Extension: StringToJSString

Conversions from [String] to [JSString].

```dart
extension StringToJSString on String { … }
```

- `JSString get toJS`: Converts this [String] to a [JSString].

## Extension: Uint16ListToJSUint16Array

Conversions from [Uint16List] to [JSUint16Array].

```dart
extension Uint16ListToJSUint16Array on Uint16List { … }
```

- `JSUint16Array get toJS`:
  Converts this [Uint16List] to a [JSUint16Array] by either casting,
  unwrapping, or cloning the [Uint16List].

## Extension: Uint32ListToJSUint32Array

Conversions from [Uint32List] to [JSUint32Array].

```dart
extension Uint32ListToJSUint32Array on Uint32List { … }
```

- `JSUint32Array get toJS`:
  Converts this [Uint32List] to a [JSUint32Array] by either casting,
  unwrapping, or cloning the [Uint32List].

## Extension: Uint8ClampedListToJSUint8ClampedArray

Conversions from [Uint8ClampedList] to [JSUint8ClampedArray].

```dart
extension Uint8ClampedListToJSUint8ClampedArray on Uint8ClampedList { … }
```

- `JSUint8ClampedArray get toJS`:
  Converts this [Uint8ClampedList] to a [JSUint8ClampedArray] by either
  casting, unwrapping, or cloning the [Uint8ClampedList].

## Extension: Uint8ListToJSUint8Array

Conversions from [Uint8List] to [JSUint8Array].

```dart
extension Uint8ListToJSUint8Array on Uint8List { … }
```

- `JSUint8Array get toJS`:
  Converts this [Uint8List] to a [JSUint8Array] by either casting,
  unwrapping, or cloning the [Uint8List].

## Extension type: ExternalDartReference

An opaque reference to a Dart object that can be passed to JavaScript.

ExternalDartReference

## Extension type: JSAny

A non-nullish JavaScript value.

JSAny

## Extension type: JSArray

A JavaScript [`Array`](https://tc39.es/ecma262/#sec-array-objects).

JSArray

- `JSArray()`: Creates an empty JavaScript `Array`.
- `JSArray.withLength(int length)`:
  Creates a JavaScript `Array` of size [length] with no elements.
- static `JSArray<T> from<T extends JSAny>(JSObject arrayLike)`:
  Creates a new, shallow-copied JavaScript `Array` instance from a
  JavaScript iterable or array-like object.
- `int get length`: The length in elements of this `Array`.
- `set length=(int newLength)`: Sets the length in elements of this `Array`.
- `T operator[](int position)`: The value at [position] in this `Array`.
- `void operator[]=(int position, T value)`:
  Sets the [value] at [position] in this `Array`.
- `void add(T value)`:
  Adds [value] to the end of this `Array`, extending the length by one.

## Extension type: JSArrayBuffer

A JavaScript `ArrayBuffer`.

JSArrayBuffer

- `JSArrayBuffer(int length, [JSObject options])`:
  Creates a JavaScript `ArrayBuffer` of size [length] using an optional
  [options] JavaScript object that sets the `maxByteLength`.

## Extension type: JSBigInt

A JavaScript `BigInt`.

JSBigInt

## Extension type: JSBoolean

A JavaScript boolean.

JSBoolean

## Extension type: JSBoxedDartObject

A Dart object that is wrapped with a JavaScript object so that it can be
passed to JavaScript safely.

JSBoxedDartObject

## Extension type: JSDataView

A JavaScript `DataView`.

JSDataView

- `JSDataView(JSArrayBuffer buffer, [int byteOffset, int byteLength])`:
  Creates a JavaScript `DataView` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [byteLength].

## Extension type: JSExportedDartFunction

A JavaScript callable function created from a Dart function.

JSExportedDartFunction

## Extension type: JSFloat32Array

A JavaScript `Float32Array`.

JSFloat32Array

- `JSFloat32Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Float32Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSFloat32Array.withLength(int length)`:
  Creates a JavaScript `Float32Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSFloat64Array

A JavaScript `Float64Array`.

JSFloat64Array

- `JSFloat64Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Float64Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSFloat64Array.withLength(int length)`:
  Creates a JavaScript `Float64Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSFunction

A JavaScript [`Function`](https://tc39.es/ecma262/#sec-function-objects)
value.

JSFunction

## Extension type: JSInt16Array

A JavaScript `Int16Array`.

JSInt16Array

- `JSInt16Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Int16Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSInt16Array.withLength(int length)`:
  Creates a JavaScript `Int16Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSInt32Array

A JavaScript `Int32Array`.

JSInt32Array

- `JSInt32Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Int32Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSInt32Array.withLength(int length)`:
  Creates a JavaScript `Int32Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSInt8Array

A JavaScript `Int8Array`.

JSInt8Array

- `JSInt8Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Int8Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSInt8Array.withLength(int length)`:
  Creates a JavaScript `Int8Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSNumber

A JavaScript number.

JSNumber

## Extension type: JSObject

A JavaScript `Object`.

JSObject

- `JSObject()`: Creates a new empty JavaScript object.
- `JSObject.fromInteropObject(Object interopObject)`:
  Creates a [JSObject] from an object provided by an earlier interop
  library.

## Extension type: JSPromise

A JavaScript `Promise` or a promise-like object.

JSPromise

- `JSPromise(JSFunction executor)`

## Extension type: JSString

A JavaScript string.

JSString

## Extension type: JSSymbol

A JavaScript `Symbol`.

JSSymbol

## Extension type: JSTypedArray

Abstract supertype of all JavaScript typed arrays.

JSTypedArray

## Extension type: JSUint16Array

A JavaScript `Uint16Array`.

JSUint16Array

- `JSUint16Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Uint16Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSUint16Array.withLength(int length)`:
  Creates a JavaScript `Uint16Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSUint32Array

A JavaScript `Uint32Array`.

JSUint32Array

- `JSUint32Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Uint32Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSUint32Array.withLength(int length)`:
  Creates a JavaScript `Uint32Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSUint8Array

A JavaScript `Uint8Array`.

JSUint8Array

- `JSUint8Array([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Uint8Array` with [buffer] as its backing storage,
  offset by [byteOffset] bytes, of size [length].
- `JSUint8Array.withLength(int length)`:
  Creates a JavaScript `Uint8Array` of size [length] whose elements are
  initialized to 0.

## Extension type: JSUint8ClampedArray

A JavaScript `Uint8ClampedArray`.

JSUint8ClampedArray

- `JSUint8ClampedArray([JSArrayBuffer buffer, int byteOffset, int length])`:
  Creates a JavaScript `Uint8ClampedArray` with [buffer] as its backing
  storage, offset by [byteOffset] bytes, of size [length].
- `JSUint8ClampedArray.withLength(int length)`:
  Creates a JavaScript `Uint8ClampedArray` of size [length] whose elements
  are initialized to 0.
