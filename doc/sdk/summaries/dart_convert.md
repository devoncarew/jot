# Library: dart:convert

Encoders and decoders for converting between different data representations,
including JSON and UTF-8.

In addition to converters for common data representations, this library
provides support for implementing converters in a way which makes them easy
to chain and to use with streams.

To use this library in your code:
```dart
import 'dart:convert';
```
Two commonly used converters are the top-level instances of
[JsonCodec] and [Utf8Codec], named [json] and [utf8], respectively.

## JSON
JSON is a simple text format for representing structured objects and
collections.

A [JsonCodec] encodes JSON objects to strings and decodes strings to
JSON objects. The [json] encoder/decoder transforms between strings and
object structures, such as lists and maps, using the JSON format.

The [json] is the default implementation of [JsonCodec].

Examples
```dart
var encoded = json.encode([1, 2, { "a": null }]);
var decoded = json.decode('["foo", { "bar": 499 }]');
```
For more information, see also [JsonEncoder] and [JsonDecoder].

## UTF-8
A [Utf8Codec] encodes strings to UTF-8 code units (bytes) and decodes
UTF-8 code units to strings.

The [utf8] is the default implementation of [Utf8Codec].

Example:
```dart
var encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');
var decoded = utf8.decode([
  195, 142, 195, 177, 197, 163, 195, 169, 114, 195, 177, 195, 165, 197,
  163, 195, 174, 195, 182, 195, 177, 195, 165, 196, 188, 195, 174, 197,
  190, 195, 165, 197, 163, 195, 174, 225, 187, 157, 195, 177]);
```
For more information, see also [Utf8Encoder] and [Utf8Decoder].

## ASCII
An [AsciiCodec] encodes strings as ASCII codes stored as bytes and decodes
ASCII bytes to strings. Not all characters can be represented as ASCII, so
not all strings can be successfully converted.

The [ascii] is the default implementation of [AsciiCodec].

Example:
```dart
var encoded = ascii.encode('This is ASCII!');
var decoded = ascii.decode([0x54, 0x68, 0x69, 0x73, 0x20, 0x69, 0x73,
                            0x20, 0x41, 0x53, 0x43, 0x49, 0x49, 0x21]);
```
For more information, see also [AsciiEncoder] and [AsciiDecoder].

## Latin-1
A [Latin1Codec] encodes strings to ISO Latin-1 (aka ISO-8859-1) bytes
and decodes Latin-1 bytes to strings. Not all characters can be represented
as Latin-1, so not all strings can be successfully converted.

The [latin1] is the default implementation of [Latin1Codec].

Example:
```dart
var encoded = latin1.encode('blåbærgrød');
var decoded = latin1.decode([0x62, 0x6c, 0xe5, 0x62, 0xe6,
                             0x72, 0x67, 0x72, 0xf8, 0x64]);
```
For more information, see also [Latin1Encoder] and [Latin1Decoder].

## Base64
A [Base64Codec] encodes bytes using the default base64 alphabet,
decodes using both the base64 and base64url alphabets,
does not allow invalid characters and requires padding.

The [base64] is the default implementation of [Base64Codec].

Example:
```dart
var encoded = base64.encode([0x62, 0x6c, 0xc3, 0xa5, 0x62, 0xc3, 0xa6,
                             0x72, 0x67, 0x72, 0xc3, 0xb8, 0x64]);
var decoded = base64.decode('YmzDpWLDpnJncsO4ZAo=');
```
For more information, see also [Base64Encoder] and [Base64Decoder].

## Converters
Converters are often used with streams
to transform the data that comes through the stream
as it becomes available.
The following code uses two converters.
The first is a UTF-8 decoder, which converts the data from bytes to UTF-8
as it is read from a file,
The second is an instance of [LineSplitter],
which splits the data on newline boundaries.
```dart import:io
const showLineNumbers = true;
var lineNumber = 1;
var stream = File('quotes.txt').openRead();

stream.transform(utf8.decoder)
      .transform(const LineSplitter())
      .forEach((line) {
        if (showLineNumbers) {
          stdout.write('${lineNumber++} ');
        }
        stdout.writeln(line);
      });
```
See the documentation for the [Codec] and [Converter] classes
for information about creating your own converters.

## HTML Escape
[HtmlEscape] converter escapes characters with special meaning in HTML.
The converter finds characters that are significant in HTML source and
replaces them with corresponding HTML entities.

Custom escape modes can be created using the [HtmlEscapeMode.new]
constructor.

Example:
```dart
const htmlEscapeMode = HtmlEscapeMode(
  name: 'custom',
  escapeLtGt: true,
  escapeQuot: false,
  escapeApos: false,
  escapeSlash: false,
 );

const HtmlEscape htmlEscape = HtmlEscape(htmlEscapeMode);
String unescaped = 'Text & subject';
String escaped = htmlEscape.convert(unescaped);
print(escaped); // Text &amp; subject

unescaped = '10 > 1 and 1 < 10';
escaped = htmlEscape.convert(unescaped);
print(escaped); // 10 &gt; 1 and 1 &lt; 10

unescaped = "Single-quoted: 'text'";
escaped = htmlEscape.convert(unescaped);
print(escaped); // Single-quoted: 'text'

unescaped = 'Double-quoted: "text"';
escaped = htmlEscape.convert(unescaped);
print(escaped); // Double-quoted: "text"

unescaped = 'Path: /system/';
escaped = htmlEscape.convert(unescaped);
print(escaped); // Path: /system/
```
{@category Core}

## Members

- accessor `AsciiCodec get ascii`
- accessor `Base64Codec get base64`
- accessor `Base64Codec get base64Url`
- accessor `HtmlEscape get htmlEscape`
- accessor `JsonCodec get json`
- accessor `Latin1Codec get latin1`
- accessor `int get unicodeBomCharacterRune`
- accessor `int get unicodeReplacementCharacterRune`
- accessor `Utf8Codec get utf8`
- function `Uint8List base64Decode(String source)`:
  Decodes [base64](https://tools.ietf.org/html/rfc4648) or [base64url](https://tools.ietf.org/html/rfc4648) encoded bytes.
- function `String base64Encode(List<int> bytes)`:
  Encodes [bytes] using [base64](https://tools.ietf.org/html/rfc4648) encoding.
- function `String base64UrlEncode(List<int> bytes)`:
  Encodes [bytes] using [base64url](https://tools.ietf.org/html/rfc4648) encoding.
- function `dynamic jsonDecode(String source, {Object? Function(Object?, Object?)? reviver})`:
  Parses the string and returns the resulting Json object.
- function `String jsonEncode(Object? object, {Object? Function(Object?)? toEncodable})`:
  Converts [object] to a JSON string.
- type alias `typedef ByteConversionSinkBase = ByteConversionSink`:
  This class provides a base-class for converters that need to accept byte
  inputs.
- type alias `typedef StringConversionSinkBase = StringConversionSink`:
  This class provides a base-class for converters that need to accept String
  inputs.
- type alias `typedef StringConversionSinkMixin = StringConversionSink`:
  This class provides a mixin for converters that need to accept String
  inputs.

## Class: AsciiCodec

An [AsciiCodec] allows encoding strings as ASCII bytes
and decoding ASCII bytes to strings.

```dart
final class AsciiCodec extends Encoding { … }
```

- `AsciiCodec({bool allowInvalid})`: Instantiates a new [AsciiCodec].
- `AsciiDecoder get decoder`:
  Returns the decoder of `this`, converting from `List<int>` to `String`.
- `AsciiEncoder get encoder`: Returns the encoder from `String` to `List<int>`.
- `String get name`: The name of this codec is "us-ascii".
- `String decode(List<int> bytes, {bool? allowInvalid})`:
  Decodes the ASCII [bytes] (a list of unsigned 7-bit integers) to the
  corresponding string.
- `Uint8List encode(String source)`: Encodes [input].

## Class: AsciiDecoder

Converts ASCII bytes to string.

```dart
final class AsciiDecoder extends _UnicodeSubsetDecoder { … }
```

- `AsciiDecoder({bool allowInvalid})`
- `ByteConversionSink startChunkedConversion(Sink<String> sink)`:
  Starts a chunked conversion.

## Class: AsciiEncoder

Converts strings of only ASCII characters to bytes.

```dart
final class AsciiEncoder extends _UnicodeSubsetEncoder { … }
```

- `AsciiEncoder()`

## Class: Base64Codec

A [base64](https://tools.ietf.org/html/rfc4648) encoder and decoder.

```dart
final class Base64Codec extends Codec<List<int>, String> { … }
```

- `Base64Codec()`
- `Base64Codec.urlSafe()`
- `Base64Decoder get decoder`:
  Returns the decoder of `this`, converting from [T] to [S].
- `Base64Encoder get encoder`: Returns the encoder from [S] to [T].
- `Uint8List decode(String encoded)`: Decodes [encoded].
- `String normalize(String source, [int start, int? end])`:
  Validates and normalizes the base64 encoded data in [source].

## Class: Base64Decoder

Decoder for base64 encoded data.

```dart
final class Base64Decoder extends Converter<String, List<int>> { … }
```

- `Base64Decoder()`
- `Uint8List convert(String input, [int start, int? end])`:
  Decodes the characters of [input] from [start] to [end] as base64.
- `StringConversionSink startChunkedConversion(Sink<List<int>> sink)`:
  Starts a chunked conversion.

## Class: Base64Encoder

Base64 and base64url encoding converter.

```dart
final class Base64Encoder extends Converter<List<int>, String> { … }
```

- `Base64Encoder()`
- `Base64Encoder.urlSafe()`
- `String convert(List<int> input)`:
  Converts [input] and returns the result of the conversion.
- `ByteConversionSink startChunkedConversion(Sink<String> sink)`:
  Starts a chunked conversion.

## Class: ByteConversionSink

The [ByteConversionSink] provides an interface for converters to
efficiently transmit byte data.

```dart
abstract mixin class ByteConversionSink
    implements ChunkedConversionSink<List<int>> { … }
```

- `ByteConversionSink()`
- `ByteConversionSink.from(Sink<List<int>> sink)`
- `ByteConversionSink.withCallback(void Function(List<int>) callback)`
- `void addSlice(List<int> chunk, int start, int end, bool isLast)`:
  Adds the next [chunk] to `this`.

## Class: ChunkedConversionSink

A [ChunkedConversionSink] is used to transmit data more efficiently between
two converters during chunked conversions.

```dart
abstract interface class ChunkedConversionSink<T> implements Sink<T> { … }
```

- `ChunkedConversionSink()`
- `ChunkedConversionSink.withCallback(void Function(List<T>) callback)`
- `void add(T chunk)`: Adds chunked data to this sink.
- `void close()`: Closes the sink.

## Class: ClosableStringSink

A [ClosableStringSink] extends the [StringSink] interface by adding a
`close` method.

```dart
abstract interface class ClosableStringSink implements StringSink { … }
```

- `ClosableStringSink.fromStringSink(StringSink sink, void Function() onClose)`:
  Creates a new instance combining a [StringSink] [sink] and a callback
  [onClose] which is invoked when the returned instance is closed.
- `void close()`: Closes `this` and flushes any outstanding data.

## Class: Codec

A [Codec] encodes and (if supported) decodes data.

```dart
abstract mixin class Codec<S, T> { … }
```

- `Codec()`
- `Converter<T, S> get decoder`:
  Returns the decoder of `this`, converting from [T] to [S].
- `Converter<S, T> get encoder`: Returns the encoder from [S] to [T].
- `Codec<T, S> get inverted`: Inverts `this`.
- `S decode(T encoded)`: Decodes [encoded] data.
- `T encode(S input)`: Encodes [input].
- `Codec<S, R> fuse<R>(Codec<T, R> other)`: Fuses `this` with `other`.

## Class: Converter

A [Converter] converts data from one representation into another.

```dart
abstract mixin class Converter<S, T>
    implements StreamTransformerBase<S, T> { … }
```

- `Converter()`
- static `Converter<TS, TT> castFrom<SS, ST, TS, TT>(Converter<SS, ST> source)`:
  Adapts [source] to be a `Converter<TS, TT>`.
- `Stream<T> bind(Stream<S> stream)`: Transforms the provided [stream].
- `Converter<RS, RT> cast<RS, RT>()`:
  Provides a `Converter<RS, RT>` view of this stream transformer.
- `T convert(S input)`: Converts [input] and returns the result of the conversion.
- `Converter<S, TT> fuse<TT>(Converter<T, TT> other)`: Fuses `this` with [other].
- `Sink<S> startChunkedConversion(Sink<T> sink)`: Starts a chunked conversion.

## Class: Encoding

Open-ended set of encodings.

```dart
abstract class Encoding extends Codec<String, List<int>> { … }
```

- `Encoding()`
- static `Encoding? getByName(String? name)`:
  Returns an [Encoding] for a named character set.
- `Converter<List<int>, String> get decoder`:
  Returns the decoder of `this`, converting from `List<int>` to `String`.
- `Converter<String, List<int>> get encoder`:
  Returns the encoder from `String` to `List<int>`.
- `String get name`: Name of the encoding.
- `Future<String> decodeStream(Stream<List<int>> byteStream)`

## Class: HtmlEscape

Converter which escapes characters with special meaning in HTML.

```dart
final class HtmlEscape extends Converter<String, String> { … }
```

- `HtmlEscape([HtmlEscapeMode mode])`:
  Create converter that escapes HTML characters.
- `HtmlEscapeMode mode`: The [HtmlEscapeMode] used by the converter.
- `String convert(String text)`:
  Converts [input] and returns the result of the conversion.
- `StringConversionSink startChunkedConversion(Sink<String> sink)`:
  Starts a chunked conversion.

## Class: HtmlEscapeMode

HTML escape modes.

```dart
final class HtmlEscapeMode { … }
```

- `HtmlEscapeMode({String name, bool escapeLtGt, bool escapeQuot, bool escapeApos, bool escapeSlash})`:
  Create a custom escaping mode.
- static `HtmlEscapeMode attribute`:
  Escaping mode for text going into double-quoted HTML attribute values.
- static `HtmlEscapeMode element`:
  Escaping mode for text going into HTML element content.
- static `HtmlEscapeMode sqAttribute`:
  Escaping mode for text going into single-quoted HTML attribute values.
- static `HtmlEscapeMode unknown`:
  Default escaping mode, which escapes all characters.
- `bool escapeApos`: Whether to escape "'" (apostrophe).
- `bool escapeLtGt`: Whether to escape '<' and '>'.
- `bool escapeQuot`: Whether to escape '"' (quote).
- `bool escapeSlash`: Whether to escape "/" (forward slash, solidus).
- `String toString()`: A string representation of this object.

## Class: JsonCodec

A [JsonCodec] encodes JSON objects to strings and decodes strings to
JSON objects.

```dart
final class JsonCodec extends Codec<Object?, String> { … }
```

- `JsonCodec({Object? Function(Object?, Object?)? reviver, Object? Function(dynamic)? toEncodable})`:
  Creates a `JsonCodec` with the given reviver and encoding function.
- `JsonCodec.withReviver(dynamic Function(Object?, Object?) reviver)`:
  Creates a `JsonCodec` with the given reviver.
- `JsonDecoder get decoder`:
  Returns the decoder of `this`, converting from [T] to [S].
- `JsonEncoder get encoder`: Returns the encoder from [S] to [T].
- `dynamic decode(String source, {Object? Function(Object?, Object?)? reviver})`:
  Parses the string and returns the resulting Json object.
- `String encode(Object? value, {Object? Function(dynamic)? toEncodable})`:
  Converts [value] to a JSON string.

## Class: JsonCyclicError

Reports that an object could not be stringified due to cyclic references.

```dart
class JsonCyclicError extends JsonUnsupportedObjectError { … }
```

- `JsonCyclicError(Object? object)`:
  The first object that was detected as part of a cycle.
- `String toString()`: A string representation of this object.

## Class: JsonDecoder

This class parses JSON strings and builds the corresponding objects.

```dart
final class JsonDecoder extends Converter<String, Object?> { … }
```

- `JsonDecoder([Object? Function(Object?, Object?)? reviver])`:
  Constructs a new JsonDecoder.
- `Stream<Object?> bind(Stream<String> stream)`: Transforms the provided [stream].
- `dynamic convert(String input)`:
  Converts the given JSON-string [input] to its corresponding object.
- `StringConversionSink startChunkedConversion(Sink<Object?> sink)`:
  Starts a conversion from a chunked JSON string to its corresponding object.

## Class: JsonEncoder

This class converts JSON objects to strings.

```dart
final class JsonEncoder extends Converter<Object?, String> { … }
```

- `JsonEncoder([Object? Function(dynamic)? toEncodable])`: Creates a JSON encoder.
- `JsonEncoder.withIndent(String? indent, [Object? Function(dynamic)? toEncodable])`:
  Creates a JSON encoder that creates multi-line JSON.
- `String? indent`: The string used for indention.
- `Stream<String> bind(Stream<Object?> stream)`: Transforms the provided [stream].
- `String convert(Object? object)`: Converts [object] to a JSON [String].
- `Converter<Object?, T> fuse<T>(Converter<String, T> other)`:
  Fuses `this` with [other].
- `ChunkedConversionSink<Object?> startChunkedConversion(Sink<String> sink)`:
  Starts a chunked conversion.

## Class: JsonUnsupportedObjectError

Error thrown by JSON serialization if an object cannot be serialized.

```dart
class JsonUnsupportedObjectError extends Error { … }
```

- `JsonUnsupportedObjectError(Object? unsupportedObject, {Object? cause, String? partialResult})`
- `Object? cause`: The exception thrown when trying to convert the object.
- `String? partialResult`:
  The partial result of the conversion, up until the error happened.
- `Object? unsupportedObject`: The object that could not be serialized.
- `String toString()`: A string representation of this object.

## Class: JsonUtf8Encoder

Encoder that encodes a single object as a UTF-8 encoded JSON string.

```dart
final class JsonUtf8Encoder extends Converter<Object?, List<int>> { … }
```

- `JsonUtf8Encoder([String? indent, dynamic Function(dynamic)? toEncodable, int? bufferSize])`:
  Create converter.
- `Stream<List<int>> bind(Stream<Object?> stream)`:
  Transforms the provided [stream].
- `List<int> convert(Object? object)`: Convert [object] into UTF-8 encoded JSON.
- `ChunkedConversionSink<Object?> startChunkedConversion(Sink<List<int>> sink)`:
  Start a chunked conversion.

## Class: Latin1Codec

A [Latin1Codec] encodes strings to ISO Latin-1 (aka ISO-8859-1) bytes
and decodes Latin-1 bytes to strings.

```dart
final class Latin1Codec extends Encoding { … }
```

- `Latin1Codec({bool allowInvalid})`: Instantiates a new [Latin1Codec].
- `Latin1Decoder get decoder`:
  Returns the decoder of `this`, converting from `List<int>` to `String`.
- `Latin1Encoder get encoder`: Returns the encoder from `String` to `List<int>`.
- `String get name`: The name of this codec, "iso-8859-1".
- `String decode(List<int> bytes, {bool? allowInvalid})`:
  Decodes the Latin-1 [bytes] (a list of unsigned 8-bit integers) to the
  corresponding string.
- `Uint8List encode(String source)`: Encodes [input].

## Class: Latin1Decoder

This class converts Latin-1 bytes (lists of unsigned 8-bit integers)
to a string.

```dart
final class Latin1Decoder extends _UnicodeSubsetDecoder { … }
```

- `Latin1Decoder({bool allowInvalid})`: Instantiates a new [Latin1Decoder].
- `ByteConversionSink startChunkedConversion(Sink<String> sink)`:
  Starts a chunked conversion.

## Class: Latin1Encoder

This class converts strings of only ISO Latin-1 characters to bytes.

```dart
final class Latin1Encoder extends _UnicodeSubsetEncoder { … }
```

- `Latin1Encoder()`

## Class: LineSplitter

A [StreamTransformer] that splits a [String] into individual lines.

```dart
final class LineSplitter extends StreamTransformerBase<String, String> { … }
```

- `LineSplitter()`
- static `Iterable<String> split(String lines, [int start, int? end])`:
  Split [lines] into individual lines.
- `Stream<String> bind(Stream<String> stream)`: Transforms the provided [stream].
- `List<String> convert(String data)`
- `StringConversionSink startChunkedConversion(Sink<String> sink)`

## Class: StringConversionSink

A sink for converters to efficiently transmit String data.

```dart
abstract mixin class StringConversionSink
    implements ChunkedConversionSink<String> { … }
```

- `StringConversionSink()`
- `StringConversionSink.from(Sink<String> sink)`
- `StringConversionSink.fromStringSink(StringSink sink)`:
  Creates a new instance wrapping the given [sink].
- `StringConversionSink.withCallback(void Function(String) callback)`
- `void add(String str)`: Adds chunked data to this sink.
- `void addSlice(String chunk, int start, int end, bool isLast)`:
  Adds the next [chunk] to `this`.
- `ClosableStringSink asStringSink()`: Returns `this` as a [ClosableStringSink].
- `ByteConversionSink asUtf8Sink(bool allowMalformed)`:
  Returns `this` as a sink that accepts UTF-8 input.

## Class: Utf8Codec

A [Utf8Codec] encodes strings to utf-8 code units (bytes) and decodes
UTF-8 code units to strings.

```dart
final class Utf8Codec extends Encoding { … }
```

- `Utf8Codec({bool allowMalformed})`: Instantiates a new [Utf8Codec].
- `Utf8Decoder get decoder`:
  Returns the decoder of `this`, converting from `List<int>` to `String`.
- `Utf8Encoder get encoder`: Returns the encoder from `String` to `List<int>`.
- `String get name`: The name of this codec is "utf-8".
- `String decode(List<int> codeUnits, {bool? allowMalformed})`:
  Decodes the UTF-8 [codeUnits] (a list of unsigned 8-bit integers) to the
  corresponding string.
- `Uint8List encode(String string)`: Encodes the [string] as UTF-8.

## Class: Utf8Decoder

This class converts UTF-8 code units (lists of unsigned 8-bit integers)
to a string.

```dart
final class Utf8Decoder extends Converter<List<int>, String> { … }
```

- `Utf8Decoder({bool allowMalformed})`: Instantiates a new [Utf8Decoder].
- `Stream<String> bind(Stream<List<int>> stream)`:
  Transforms the provided [stream].
- `String convert(List<int> codeUnits, [int start, int? end])`:
  Converts the UTF-8 [codeUnits] (a list of unsigned 8-bit integers) to the
  corresponding string.
- `Converter<List<int>, T> fuse<T>(Converter<String, T> next)`:
  Fuses `this` with [other].
- `ByteConversionSink startChunkedConversion(Sink<String> sink)`:
  Starts a chunked conversion.

## Class: Utf8Encoder

This class converts strings to their UTF-8 code units (a list of
unsigned 8-bit integers).

```dart
final class Utf8Encoder extends Converter<String, List<int>> { … }
```

- `Utf8Encoder()`
- `Stream<List<int>> bind(Stream<String> stream)`:
  Transforms the provided [stream].
- `Uint8List convert(String string, [int start, int? end])`:
  Converts [string] to its UTF-8 code units (a list of
  unsigned 8-bit integers).
- `StringConversionSink startChunkedConversion(Sink<List<int>> sink)`:
  Starts a chunked conversion.
