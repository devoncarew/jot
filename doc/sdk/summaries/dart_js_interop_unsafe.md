# Library: dart:js_interop_unsafe

Utility methods to manipulate JavaScript objects dynamically.

This library is typically meant to be used when the names of properties or
methods are not known statically. This library is similar to `dart:js_util`,
except the methods here are extension methods that use JS types. This
allows code using these functions to also be compiled to WebAssembly.

In general, prefer to write JS interop interfaces and external static
interop members using `dart:js_interop`. This library is meant to work
around issues and help with migration from older JS interop libraries.

> [!NOTE]
> As the name suggests, usage of this library *can* be unsafe. This means
> that safe usage of these methods cannot necessarily be verified
> statically. Prefer using statically analyzable values like constants or
> literals for property or method names so that usage can be verified. This
> library should be used cautiously and only when the same effect cannot be
> achieved with static interop.

{@category Web}

## Members

## Extension: JSFunctionUnsafeUtilExtension

Utility methods to call [JSFunction]s as constructors.

```dart
extension JSFunctionUnsafeUtilExtension on JSFunction { … }
```

- `R callAsConstructor<R>([JSAny? arg1, JSAny? arg2, JSAny? arg3, JSAny? arg4])`:
  Calls this [JSFunction] as a constructor with up to four arguments.
- `R callAsConstructorVarArgs<R extends JSObject>([List<JSAny?>? arguments])`:
  Calls this [JSFunction] as a constructor with a variable number of
  arguments.

## Extension: JSObjectUnsafeUtilExtension

Utility methods to check, get, set, and call properties on a [JSObject].

```dart
extension JSObjectUnsafeUtilExtension on JSObject { … }
```

- `JSAny? operator[](String property)`:
  Shorthand helper for [getProperty] to get the value of the property key
  [property] of this [JSObject], but takes a Dart value.
- `void operator[]=(String property, JSAny? value)`:
  Shorthand helper for [setProperty] to write the [value] of the property
  key [property] of this [JSObject], but takes a Dart value.
- `R callMethod<R extends JSAny?>(JSAny method, [JSAny? arg1, JSAny? arg2, JSAny? arg3, JSAny? arg4])`:
  Calls [method] on this [JSObject] with up to four arguments.
- `R callMethodVarArgs<R extends JSAny?>(JSAny method, [List<JSAny?>? arguments])`:
  Calls [method] on this [JSObject] with a variable number of [arguments].
- `JSBoolean delete(JSAny property)`:
  Deletes the property with key [property] from this [JSObject].
- `R getProperty<R extends JSAny?>(JSAny property)`:
  The value of the property key [property] of this [JSObject].
- `bool has(String property)`:
  Shorthand helper for [hasProperty] to check whether this [JSObject]
  contains the property key [property], but takes and returns a Dart value.
- `JSBoolean hasProperty(JSAny property)`:
  Whether or not this [JSObject] contains the property key [property].
- `void setProperty(JSAny property, JSAny? value)`:
  Write the [value] of property key [property] of this [JSObject].
