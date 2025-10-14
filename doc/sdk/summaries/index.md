# Package: Dart SDK

# Welcome!

Welcome to the Dart API reference documentation, covering the
[Dart core libraries](https://dart.dev/guides/libraries). These include:

  * [dart:core](dart-core/dart-core-library.html): Core functionality such as
    strings, numbers, collections, errors, dates, and URIs.
  * [dart:io](dart-io/dart-io-library.html): I/O for non-web apps.
  * [dart:async](dart-async/dart-async-library.html): Functionality for
    asynchronous programming with futures, streams, and zones.

You'll also find reference documentation covering Dart's
various platform interoperability options, such as:

  * [dart:js_interop](dart-js_interop/dart-js_interop-library.html):
    Library including a sound type hierarchy and helper functions
    for interoperability with JavaScript.
  * [package:web](https://pub.dev/documentation/web):
    DOM manipulation for web apps.
  * [dart:ffi](dart-ffi/dart-ffi-library.html): Foreign function interfaces for
    interoperability with the C language.

The core libraries - except for `dart:core` - must be imported before they're
available for use:

```dart
import 'dart:math';
```

Additionally, you can find Dart packages at [pub.dev](https://pub.dev).

## Language docs

The main site for learning and using Dart is [dart.dev](https://dart.dev).
Check out these pages:

  * [Dart overview](https://dart.dev/overview)
  * [Dart language documentation](https://dart.dev/language)
  * [Library tour](https://dart.dev/libraries)
  * [Tutorials](https://dart.dev/tutorials)

This API reference is generated from the SDK source at
[dart-lang/sdk](https://github.com/dart-lang/sdk). If you'd like to give
feedback on or edit this documentation, see
[Contributing](https://github.com/dart-lang/sdk/blob/main/CONTRIBUTING.md).

## Libraries

- [dart:async](dart_async.md): Support for asynchronous programming,
  with classes such as Future and Stream.
- [dart:collection](dart_collection.md):
  Classes and utilities that supplement the collection support in dart:core.
- [dart:concurrent](dart_concurrent.md):
  Classes that help implementing synchronized, concurrently-safe code.
- [dart:convert](dart_convert.md):
  Encoders and decoders for converting between different data representations,
  including JSON and UTF-8.
- [dart:core](dart_core.md): Built-in types, collections,
  and other core functionality for every Dart program.
- [dart:developer](dart_developer.md):
  Interact with developer tools such as the debugger and inspector.
- [dart:math](dart_math.md):
  Mathematical constants and functions, plus a random number generator.
- [dart:typed_data](dart_typed_data.md):
  Lists that efficiently handle fixed sized data
  (for example, unsigned 8 byte integers) and SIMD numeric types.
- [dart:cli](dart_cli.md): Utilities for building CLI apps.
- [dart:ffi](dart_ffi.md):
  Foreign Function Interface for interoperability with the C programming language.
- [dart:io](dart_io.md):
  File, socket, HTTP, and other I/O support for non-web applications.
- [dart:isolate](dart_isolate.md): Concurrent programming using _isolates_:
  independent workers that are similar to threads
  but don't share memory,
  communicating only via messages.
- [dart:mirrors](dart_mirrors.md): Basic reflection in Dart,
  with support for introspection and dynamic invocation.
- [dart:html](dart_html.md):
  HTML elements and other resources for web-based applications that need to
  interact with the browser and the DOM (Document Object Model).
- [dart:indexed_db](dart_indexed_db.md):
  A client-side key-value store with support for indexes.
- [dart:js](dart_js.md): Low-level support for interoperating with JavaScript.
- [dart:js_interop](dart_js_interop.md):
  Interoperability, "interop" for short, with JavaScript and browser APIs.
- [dart:js_interop_unsafe](dart_js_interop_unsafe.md):
  Utility methods to manipulate JavaScript objects dynamically.
- [dart:js_util](dart_js_util.md):
  Utility methods to manipulate `package:js` annotated JavaScript interop
  objects in cases where the name to call is not known at runtime.
- [dart:svg](dart_svg.md): Scalable Vector Graphics:
  Two-dimensional vector graphics with support for events and animation.
- [dart:web_audio](dart_web_audio.md):
  High-fidelity audio programming in the browser.
- [dart:web_gl](dart_web_gl.md): 3D programming in the browser.
