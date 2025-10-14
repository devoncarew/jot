# Library: dart:js_util

Utility methods to manipulate `package:js` annotated JavaScript interop
objects in cases where the name to call is not known at runtime.

> [!Note]
> You should usually use `dart:js_interop` instead of this library.
> To learn more, check out the
> [JS interop documentation](https://dart.dev/interop/js-interop).

You should only use these methods when the same effect cannot be achieved
with `@JS()` annotations.

{@category Web (Legacy)}

## Members

- accessor `Object get globalThis`
- accessor `Object? get objectPrototype`:
  Returns the `Object` prototype. Equivalent to `Object.prototype`.
- function `T add<T>(Object? first, Object? second)`:
  Perform JavaScript addition (`+`) on two values.
- function `F allowInterop<F extends Function>(F f)`:
  Returns a wrapper around function [f] that can be called from JavaScript
  using `package:js` JavaScript interop.
- function `Function allowInteropCaptureThis(Function f)`:
  Returns a wrapper around function [f] that can be called from JavaScript
  using `package:js` JavaScript interop, passing JavaScript `this` as the
  first argument.
- function `T and<T>(Object? first, Object? second)`:
  Perform JavaScript logical and comparison (`&&`) of two expressions.
- function `T callConstructor<T>(Object constr, List<Object?>? arguments)`
- function `T callMethod<T>(Object o, Object method, List<Object?> args)`
- function `Object createDartExport<T extends Object>(T dartObject)`:
  Given a Dart object that is marked exportable, creates a JS object literal
  that forwards to that Dart class. Look at the `@JSExport` annotation to
  determine what constitutes "exportable" for a Dart class. The object literal
  will be a map of export names (which are either the written instance member
  names or their rename) to their respective Dart instance members.
- function `T createStaticInteropMock<T extends Object, U extends Object>(U dartMock, [Object? proto])`:
  Given a `@staticInterop` type T and an instance [dartMock] of a Dart class
  U that implements the external extension members of T, creates a forwarding
  mock.
- function `Object? dartify(Object? o)`:
  Effectively the inverse of [jsify], [dartify] Takes a JavaScript object, and
  converts it to a Dart based object. Only JS primitives, arrays, or 'map'
  like JS objects are supported.
- function `bool delete<T>(Object o, Object property)`:
  Perform JavaScript delete operator (`delete`) on the given property of the
  given object.
- function `T divide<T>(Object? first, Object? second)`:
  Perform JavaScript division (`/`) on two values.
- function `bool equal<T>(Object? first, Object? second)`:
  Perform JavaScript equality comparison (`==`) on two values.
- function `T exponentiate<T>(Object? first, Object? second)`:
  Perform JavaScript exponentiation (`**`) on two values.
- function `T getProperty<T>(Object o, Object name)`
- function `bool greaterThan<T>(Object? first, Object? second)`:
  Perform JavaScript greater than comparison (`>`) of two values.
- function `bool greaterThanOrEqual<T>(Object? first, Object? second)`:
  Perform JavaScript greater than or equal comparison (`>=`) of two values.
- function `bool hasProperty(Object o, Object name)`
- function `bool instanceOfString(Object? element, String objectType)`:
  Like [instanceof] only takes a [String] for the object name instead of a
  constructor object.
- function `bool instanceof(Object? o, Object type)`:
  Check whether [o] is an instance of [type].
- function `bool isJavaScriptArray(dynamic value)`:
  Returns `true` if a given object is a JavaScript array.
- function `bool isJavaScriptSimpleObject(dynamic value)`:
  Returns `true` if a given object is a simple JavaScript object.
- function `bool isTruthy<T>(Object? o)`:
  Determines if the given object is truthy or falsy.
- function `dynamic jsify(Object? object)`:
  Recursively converts a JSON-like collection to JavaScript compatible
  representation.
- function `bool lessThan<T>(Object? first, Object? second)`:
  Perform JavaScript less than comparison (`<`) of two values.
- function `bool lessThanOrEqual<T>(Object? first, Object? second)`:
  Perform JavaScript less than or equal comparison (`<=`) of two values.
- function `T modulo<T>(Object? first, Object? second)`:
  Perform JavaScript remainder (`%`) on two values.
- function `T multiply<T>(Object? first, Object? second)`:
  Perform JavaScript multiplication (`*`) on two values.
- function `T newObject<T>()`
- function `T not<T>(Object? o)`:
  Perform JavaScript logical not (`!`) on the given object.
- function `bool notEqual<T>(Object? first, Object? second)`:
  Perform JavaScript inequality comparison (`!=`) on two values.
- function `Object? objectGetPrototypeOf(Object? object)`:
  Returns the prototype of a given object. Equivalent to
  `Object.getPrototypeOf`.
- function `List<Object?> objectKeys(Object? object)`:
  Returns the keys for a given object. Equivalent to `Object.keys(object)`.
- function `T or<T>(Object? first, Object? second)`:
  Perform JavaScript logical or comparison (`||`) of two expressions.
- function `Future<T> promiseToFuture<T>(Object jsPromise)`:
  Converts a JavaScript Promise to a Dart [Future].
- function `T setProperty<T>(Object o, Object name, T? value)`
- function `bool strictEqual<T>(Object? first, Object? second)`:
  Perform JavaScript strict equality comparison (`===`) on two values.
- function `bool strictNotEqual<T>(Object? first, Object? second)`:
  Perform JavaScript strict inequality comparison (`!==`) on two values.
- function `T subtract<T>(Object? first, Object? second)`:
  Perform JavaScript subtraction (`-`) on two values.
- function `bool typeofEquals<T>(Object? o, String type)`:
  Perform JavaScript `typeof` operator on the given object and determine if
  the result is equal to the given type. Exposes the whole `typeof` equal
  expression to maximize browser optimization.
- function `num unsignedRightShift(Object? leftOperand, Object? rightOperand)`:
  Perform JavaScript unsigned right shift operator (`>>>`) on the given left
  operand by the amount specified by the given right operand.
