# Library: dart:io

File, socket, HTTP, and other I/O support for non-web applications.

**Important:** Browser-based apps can't use this library.
Only the following can import and use the dart:io library:
  - Servers
  - Command-line scripts
  - Flutter mobile apps
  - Flutter desktop apps

This library allows you to work with files, directories,
sockets, processes, HTTP servers and clients, and more.
Many operations related to input and output are asynchronous
and are handled using [Future]s or [Stream]s, both of which
are defined in the [dart:async
library](../dart-async/dart-async-library.html).

To use the dart:io library in your code:
```dart
import 'dart:io';
```
For an introduction to I/O in Dart, see the [dart:io library
tour](https://dart.dev/guides/libraries/library-tour#dartio).

## File, Directory, and Link

An instance of [File], [Directory], or [Link] represents a file,
directory, or link, respectively, in the native file system.

You can manipulate the file system through objects of these types.
For example, you can rename a file or directory:
```dart
File myFile = File('myFile.txt');
myFile.rename('yourFile.txt').then((_) => print('file renamed'));
```
Many methods provided by the [File], [Directory], and [Link] classes
run asynchronously and return a [Future].

## FileSystemEntity

[File], [Directory], and [Link] all extend [FileSystemEntity].
In addition to being the superclass for these classes,
FileSystemEntity has a number of static methods for working with paths.

To get information about a path,
you can use the [FileSystemEntity] static methods
such as [FileSystemEntity.isDirectory], [FileSystemEntity.isFile],
and [FileSystemEntity.exists].
Because file system access involves I/O, these methods
are asynchronous and return a [Future].
```dart
FileSystemEntity.isDirectory(myPath).then((isDir) {
  if (isDir) {
    print('$myPath is a directory');
  } else {
    print('$myPath is not a directory');
  }
});
```
## HttpServer and HttpClient

The classes [HttpClient] and [HttpServer] provide low-level HTTP
functionality.

Instead of using these classes directly, consider using more
developer-friendly and composable APIs found in packages.

For HTTP clients, look at [`package:http`](https://pub.dev/packages/http).

For HTTP servers, look at
[Write HTTP servers](https://dart.dev/tutorials/server/httpserver) on
[dart.dev](https://dart.dev/).

## Process

The [Process] class provides a way to run a process on
the native machine.
For example, the following code spawns a process that recursively lists
the files under `web`.
```dart
Process.start('ls', ['-R', 'web']).then((process) {
  stdout.addStream(process.stdout);
  stderr.addStream(process.stderr);
  process.exitCode.then(print);
});
```
Using [Process.start] returns a [Future],
which completes with a [Process] object when the process has started.
This [Process] object allows you to interact
with the process while it is running.
Using [Process.run] returns a [Future],
which completes with a [ProcessResult] object when the spawned process has
terminated. This [ProcessResult] object collects the output and exit code
from the process.

When using [Process.start],
you need to read all data coming on the [Process.stdout] and [Process.stderr]
streams, otherwise the system resources will not be freed.

## WebSocket

The [WebSocket] class provides support for the web socket protocol. This
allows full-duplex communications between client and server applications.

A web socket server uses a normal HTTP server for accepting web socket
connections. The initial handshake is a HTTP request which is then upgraded to a
web socket connection.
The server upgrades the request using [WebSocketTransformer]
and listens for the data on the returned web socket.
For example, here's a mini server that listens for 'ws' data
on a WebSocket:
```dart import:async
runZoned(() async {
  var server = await HttpServer.bind('127.0.0.1', 4040);
  server.listen((HttpRequest req) async {
    if (req.uri.path == '/ws') {
      var socket = await WebSocketTransformer.upgrade(req);
      socket.listen(handleMsg);
    }
  });
}, onError: (e) => print("An error occurred."));
```
The client connects to the [WebSocket] using the [WebSocket.connect] method
and a URI that uses the Web Socket protocol.
The client can write to the [WebSocket] with the [WebSocket.add] method.
For example,
```dart
var socket = await WebSocket.connect('ws://127.0.0.1:4040/ws');
socket.add('Hello, World!');
```
Check out the
[websocket_sample](https://github.com/dart-lang/dart-samples/tree/master/html5/web/websockets/basics)
app, which uses [WebSocket]s to communicate with a server.

## Socket and ServerSocket

Clients and servers use [Socket]s to communicate using the TCP protocol.
Use [ServerSocket] on the server side and [Socket] on the client.
The server creates a listening socket using the `bind()` method and
then listens for incoming connections on the socket. For example:
```dart import:convert
ServerSocket.bind('127.0.0.1', 4041)
  .then((serverSocket) {
    serverSocket.listen((socket) {
      socket.transform(utf8.decoder).listen(print);
    });
  });
```
A client connects a [Socket] using the `connect()` method,
which returns a [Future].
Using `write()`, `writeln()`, or `writeAll()` are the easiest ways to
send data over the socket.
For example:
```dart
Socket.connect('127.0.0.1', 4041).then((socket) {
  socket.write('Hello, World!');
});
```
Besides [Socket] and [ServerSocket], the [RawSocket] and
[RawServerSocket] classes are available for lower-level access
to async socket IO.

## Standard output, error, and input streams

This library provides the standard output, error, and input
streams, named [stdout], [stderr], and [stdin], respectively.

The [stdout] and [stderr] streams are both [IOSink]s and have the same set
of methods and properties.

To write a string to [stdout]:
```dart
stdout.writeln('Hello, World!');
```
To write a list of objects to [stderr]:
```dart
stderr.writeAll([ 'That ', 'is ', 'an ', 'error.', '\n']);
```
The standard input stream is a true [Stream], so it inherits
properties and methods from the [Stream] class.

To read text synchronously from the command line
(the program blocks waiting for user to type information):
```dart
String? inputText = stdin.readLineSync();
```
{@category VM}

## Members

- accessor `int get exitCode`: Get the global exit code for the Dart VM.
- accessor `set exitCode=(int code)`: Set the global exit code for the Dart VM.
- accessor `GZipCodec get gzip`
- accessor `int get pid`: Returns the PID of the current process.
- accessor `Stdout get stderr`:
  The standard output stream of errors written by this program.
- accessor `Stdin get stdin`:
  The standard input stream of data read by this program.
- accessor `Stdout get stdout`:
  The standard output stream of data written by this program.
- accessor `SystemEncoding get systemEncoding`
- accessor `ZLibCodec get zlib`
- function `Never exit(int code)`:
  Exit the Dart VM process immediately with the given exit code.
- function `void sleep(Duration duration)`:
  Sleep for the duration specified in [duration].
- function `StdioType stdioType(dynamic object)`:
  Whether a stream is attached to a file, pipe, terminal, or
  something else.
- type alias `typedef BadCertificateCallback = bool Function(X509Certificate, String, int)`

## Enum: HttpClientResponseCompressionState

Enum that specifies the compression state of the byte stream of an
[HttpClientResponse].

```dart
enum HttpClientResponseCompressionState { … }
```

- `compressed`: The body of the HTTP response contains compressed bytes.
- `decompressed`:
  The body of the HTTP response was originally compressed, but by virtue of
  the [HttpClient.autoUncompress] configuration option, it has been
  automatically uncompressed.
- `notCompressed`:
  The body of the HTTP response was received and remains in an uncompressed
  state.

## Class: BytesBuilder

Builds a list of bytes, allowing bytes and lists of bytes to be added at the
end.

```dart
abstract interface class BytesBuilder { … }
```

- `BytesBuilder({bool copy})`: Construct a new empty [BytesBuilder].
- `bool get isEmpty`: Whether the buffer is empty.
- `bool get isNotEmpty`: Whether the buffer is non-empty.
- `int get length`: The number of bytes in this builder.
- `void add(List<int> bytes)`:
  Appends [bytes] to the current contents of this builder.
- `void addByte(int byte)`:
  Appends [byte] to the current contents of this builder.
- `void clear()`: Clears the contents of this builder.
- `Uint8List takeBytes()`:
  Returns the bytes currently contained in this builder and clears it.
- `Uint8List toBytes()`:
  Returns a copy of the current byte contents of this builder.

## Class: CertificateException

An exception that happens in the handshake phase of establishing
a secure network connection, when looking up or verifying a
certificate.

```dart
class CertificateException extends TlsException { … }
```

- `CertificateException([String message, OSError? osError])`

## Class: CompressionOptions

Options controlling compression in a [WebSocket].

```dart
class CompressionOptions { … }
```

- `CompressionOptions({bool clientNoContextTakeover, bool serverNoContextTakeover, int? clientMaxWindowBits, int? serverMaxWindowBits, bool enabled})`
- static `CompressionOptions compressionDefault`:
  Default [WebSocket] compression configuration.
- static `CompressionOptions compressionOff`: No-compression configuration.
- `int? clientMaxWindowBits`:
  The maximal window size bit count requested by the client.
- `bool clientNoContextTakeover`:
  Whether the client will reuse its compression instances.
- `bool enabled`: Whether WebSocket compression is enabled.
- `int? serverMaxWindowBits`:
  The maximal window size bit count requested by the server.
- `bool serverNoContextTakeover`:
  Whether the server will reuse its compression instances.

## Class: ConnectionTask

A cancelable connection attempt.

```dart
final class ConnectionTask<S> { … }
```

- static `ConnectionTask<T> fromSocket<T extends Socket>(Future<T> socket, void Function() onCancel)`:
  Create a `ConnectionTask` from an existing `Future<Socket>`.
- `Future<S> socket`:
  A `Future` that completes with value that `S.connect()` would return
  unless [cancel] is called on this [ConnectionTask].
- `void cancel()`: Cancels the connection attempt.

## Class: ContentType

A MIME/IANA media type used as the value of the
[HttpHeaders.contentTypeHeader] header.

```dart
abstract interface class ContentType implements HeaderValue { … }
```

- `ContentType(String primaryType, String subType, {String? charset, Map<String, String?> parameters})`:
  Creates a new content type object setting the primary type and
  sub type. The charset and additional parameters can also be set
  using [charset] and [parameters]. If charset is passed and
  [parameters] contains charset as well the passed [charset] will
  override the value in parameters. Keys passed in parameters will be
  converted to lower case. The `charset` entry, whether passed as `charset`
  or in `parameters`, will have its value converted to lower-case.
- static `ContentType binary`: Content type for binary data.
- static `ContentType html`: Content type for HTML using UTF-8 encoding.
- static `ContentType json`: Content type for JSON using UTF-8 encoding.
- static `ContentType text`: Content type for plain text using UTF-8 encoding.
- static `ContentType parse(String value)`:
  Creates a new content type object from parsing a Content-Type
  header value. As primary type, sub type and parameter names and
  values are not case sensitive all these values will be converted
  to lower case. Parsing this string
- `String? get charset`: Gets the character set, if any.
- `String get mimeType`: Gets the MIME type and subtype, without any parameters.
- `String get primaryType`: Gets the primary type.
- `String get subType`: Gets the subtype.

## Class: Cookie

Representation of a cookie. For cookies received by the server as Cookie
header values only [name] and [value] properties will be set. When building a
cookie for the 'set-cookie' header in the server and when receiving cookies
in the client as 'set-cookie' headers all fields can be used.

```dart
abstract interface class Cookie { … }
```

- `Cookie(String name, String value)`:
  Creates a new cookie setting the name and value.
- `Cookie.fromSetCookieValue(String value)`:
  Creates a new cookie by parsing a header value from a 'set-cookie'
  header.
- `String? domain`: The domain that the cookie applies to.
- `DateTime? expires`: The time at which the cookie expires.
- `bool httpOnly`:
  Whether the cookie is only sent in the HTTP request and is not made
  available to client side scripts.
- `int? maxAge`:
  The number of seconds until the cookie expires. A zero or negative value
  means the cookie has expired.
- `String name`: The name of the cookie.
- `String? path`: The path within the [domain] that the cookie applies to.
- `SameSite? sameSite`: Whether the cookie is available from other sites.
- `bool secure`: Whether to only send this cookie on secure connections.
- `String value`: The value of the cookie.
- `String toString()`:
  Returns the formatted string representation of the cookie. The
  string representation can be used for setting the Cookie or
  'set-cookie' headers

## Class: Datagram

A data packet received by a [RawDatagramSocket].

```dart
final class Datagram { … }
```

- `Datagram(Uint8List data, InternetAddress address, int port)`
- `InternetAddress address`: The address of the socket which sends the data.
- `Uint8List data`: The actual bytes of the message.
- `int port`: The port of the socket which sends the data.

## Class: Directory

A reference to a directory (or _folder_) on the file system.

```dart
abstract interface class Directory implements FileSystemEntity { … }
```

- `Directory(String path)`: Creates a [Directory] object.
- `Directory.fromRawPath(Uint8List path)`
- `Directory.fromUri(Uri uri)`: Create a [Directory] from a URI.
- `Directory get absolute`:
  A [Directory] whose path is the absolute path of this [Directory].
- static `Directory get current`:
  Creates a directory object pointing to the current working
  directory.
- static `set current=(dynamic path)`:
  Sets the current working directory of the Dart process.
- `String get path`: Gets the path of this directory.
- static `Directory get systemTemp`: The system temp directory.
- `Uri get uri`: A [Uri] representing the directory's location.
- `Future<Directory> create({bool recursive})`:
  Creates the directory if it doesn't exist.
- `void createSync({bool recursive})`:
  Synchronously creates the directory if it doesn't exist.
- `Future<Directory> createTemp([String? prefix])`:
  Creates a temporary directory in this directory.
- `Directory createTempSync([String? prefix])`:
  Synchronously creates a temporary directory in this directory.
- `Future<FileSystemEntity> delete({bool recursive})`: Deletes this [Directory].
- `void deleteSync({bool recursive})`: Synchronously deletes this [Directory].
- `Stream<FileSystemEntity> list({bool recursive, bool followLinks})`:
  Lists the sub-directories and files of this [Directory].
- `List<FileSystemEntity> listSync({bool recursive, bool followLinks})`:
  Lists the sub-directories and files of this [Directory].
  Optionally recurses into sub-directories.
- `Future<Directory> rename(String newPath)`: Renames this directory.
- `Directory renameSync(String newPath)`: Synchronously renames this directory.
- `Future<String> resolveSymbolicLinks()`:
  Resolves the path of a file system object relative to the
  current working directory.
- `String resolveSymbolicLinksSync()`:
  Resolves the path of a file system object relative to the
  current working directory.
- `String toString()`:
  Returns a human readable representation of this [Directory].

## Class: File

A reference to a file on the file system.

```dart
abstract interface class File implements FileSystemEntity { … }
```

- `File(String path)`: Creates a [File] object.
- `File.fromRawPath(Uint8List rawPath)`: Creates a [File] object from a raw path.
- `File.fromUri(Uri uri)`: Create a [File] object from a URI.
- `File get absolute`: A [File] with the absolute path of [path].
- `String get path`: Get the path of the file.
- `Future<File> copy(String newPath)`: Copies this file.
- `File copySync(String newPath)`: Synchronously copies this file.
- `Future<File> create({bool recursive, bool exclusive})`: Creates the file.
- `void createSync({bool recursive, bool exclusive})`:
  Synchronously creates the file.
- `Future<FileSystemEntity> delete({bool recursive})`: Deletes this [File].
- `void deleteSync({bool recursive})`: Synchronously deletes this [File].
- `Future<DateTime> lastAccessed()`: The last-accessed time of the file.
- `DateTime lastAccessedSync()`: The last-accessed time of the file.
- `Future<DateTime> lastModified()`: Get the last-modified time of the file.
- `DateTime lastModifiedSync()`: Get the last-modified time of the file.
- `Future<int> length()`: The length of the file.
- `int lengthSync()`: The length of the file provided synchronously.
- `Future<RandomAccessFile> open({FileMode mode})`:
  Opens the file for random access operations.
- `Stream<List<int>> openRead([int? start, int? end])`:
  Creates a new independent [Stream] for the contents of this file.
- `RandomAccessFile openSync({FileMode mode})`:
  Synchronously opens the file for random access operations.
- `IOSink openWrite({FileMode mode, Encoding encoding})`:
  Creates a new independent [IOSink] for the file.
- `Future<Uint8List> readAsBytes()`:
  Reads the entire file contents as a list of bytes.
- `Uint8List readAsBytesSync()`:
  Synchronously reads the entire file contents as a list of bytes.
- `Future<List<String>> readAsLines({Encoding encoding})`:
  Reads the entire file contents as lines of text using the given
  [Encoding].
- `List<String> readAsLinesSync({Encoding encoding})`:
  Synchronously reads the entire file contents as lines of text
  using the given [Encoding].
- `Future<String> readAsString({Encoding encoding})`:
  Reads the entire file contents as a string using the given
  [Encoding].
- `String readAsStringSync({Encoding encoding})`:
  Synchronously reads the entire file contents as a string using the
  given [Encoding].
- `Future<File> rename(String newPath)`: Renames this file.
- `File renameSync(String newPath)`: Synchronously renames this file.
- `Future<dynamic> setLastAccessed(DateTime time)`:
  Modifies the time the file was last accessed.
- `void setLastAccessedSync(DateTime time)`:
  Synchronously modifies the time the file was last accessed.
- `Future<dynamic> setLastModified(DateTime time)`:
  Modifies the time the file was last modified.
- `void setLastModifiedSync(DateTime time)`:
  Synchronously modifies the time the file was last modified.
- `Future<File> writeAsBytes(List<int> bytes, {FileMode mode, bool flush})`:
  Writes a list of bytes to a file.
- `void writeAsBytesSync(List<int> bytes, {FileMode mode, bool flush})`:
  Synchronously writes a list of bytes to a file.
- `Future<File> writeAsString(String contents, {FileMode mode, Encoding encoding, bool flush})`:
  Writes a string to a file.
- `void writeAsStringSync(String contents, {FileMode mode, Encoding encoding, bool flush})`:
  Synchronously writes a string to a file.

## Class: FileLock

Type of lock when requesting a lock on a file.

```dart
class FileLock { … }
```

- static `FileLock blockingExclusive`: Blocking exclusive file lock.
- static `FileLock blockingShared`: Blocking shared file lock.
- static `FileLock exclusive`: Exclusive file lock.
- static `FileLock shared`: Shared file lock.

## Class: FileMode

The modes in which a [File] can be opened.

```dart
class FileMode { … }
```

- static `FileMode append`: Mode for opening a file for reading and writing to the
  end of it. The file is created if it does not already exist.
- static `FileMode read`: The mode for opening a file only for reading.
- static `FileMode write`:
  Mode for opening a file for reading and writing. The file is
  overwritten if it already exists. The file is created if it does not
  already exist.
- static `FileMode writeOnly`:
  Mode for opening a file for writing *only*. The file is
  overwritten if it already exists. The file is created if it does not
  already exist.
- static `FileMode writeOnlyAppend`:
  Mode for opening a file for writing *only* to the
  end of it. The file is created if it does not already exist.

## Class: FileStat

The result of calling the POSIX `stat()` function on a file system object.

```dart
interface class FileStat { … }
```

- static `Future<FileStat> stat(String path)`:
  Asynchronously calls the operating system's `stat()` function (or
  equivalent) on [path].
- static `FileStat statSync(String path)`:
  Calls the operating system's `stat()` function (or equivalent) on [path].
- `DateTime accessed`:
  The time of the last access to the data of the file system object.
- `DateTime changed`:
  The time of the last change to the data or metadata of the file system
  object.
- `int mode`: The mode of the file system object.
- `DateTime modified`:
  The time of the last change to the data of the file system object.
- `int size`: The size of the file system object.
- `FileSystemEntityType type`: The type of the underlying file system object.
- `String modeString()`: The mode value as a human-readable string.
- `String toString()`: A string representation of this object.

## Class: FileSystemCreateEvent

File system event for newly created file system objects.

```dart
final class FileSystemCreateEvent extends FileSystemEvent { … }
```

- `FileSystemCreateEvent(String path, bool isDirectory)`:
  Constructs a new [FileSystemCreateEvent].
- `String toString()`: A string representation of this object.

## Class: FileSystemDeleteEvent

File system event for deletion of file system objects.

```dart
final class FileSystemDeleteEvent extends FileSystemEvent { … }
```

- `FileSystemDeleteEvent(String path, bool isDirectory)`:
  Constructs a new [FileSystemDeleteEvent].
- `bool get isDirectory`: Whether the file system object was a directory.
- `String toString()`: A string representation of this object.

## Class: FileSystemEntity

The common superclass of [File], [Directory], and [Link].

```dart
abstract class FileSystemEntity { … }
```

- static `Future<bool> identical(String path1, String path2)`:
  Checks whether two paths refer to the same object in the
  file system.
- static `bool identicalSync(String path1, String path2)`:
  Synchronously checks whether two paths refer to the same object in the
  file system.
- static `Future<bool> isDirectory(String path)`:
  Whether [path] refers to a directory.
- static `bool isDirectorySync(String path)`:
  Synchronously checks whether [path] refers to a directory.
- static `Future<bool> isFile(String path)`: Whether [path] refers to a file.
- static `bool isFileSync(String path)`:
  Synchronously checks whether [path] refers to a file.
- static `Future<bool> isLink(String path)`: Whether [path] refers to a link.
- static `bool isLinkSync(String path)`:
  Synchronously checks whether [path] refers to a link.
- static `String parentOf(String path)`: The parent path of a path.
- static `Future<FileSystemEntityType> type(String path, {bool followLinks})`:
  Finds the type of file system object that a path points to.
- static `FileSystemEntityType typeSync(String path, {bool followLinks})`:
  Synchronously finds the type of file system object that a path points to.
- `FileSystemEntity get absolute`:
  A [FileSystemEntity] whose path is the absolute path of [path].
- `bool get isAbsolute`: Whether this object's path is absolute.
- static `bool get isWatchSupported`:
  Test if [watch] is supported on the current system.
- `Directory get parent`: The parent directory of this entity.
- `String get path`
- `Uri get uri`: A [Uri] representing the file system entity's location.
- `Future<FileSystemEntity> delete({bool recursive})`:
  Deletes this [FileSystemEntity].
- `void deleteSync({bool recursive})`:
  Synchronously deletes this [FileSystemEntity].
- `Future<bool> exists()`:
  Checks whether the file system entity with this path exists.
- `bool existsSync()`:
  Synchronously checks whether the file system entity with this path
  exists.
- `Future<FileSystemEntity> rename(String newPath)`:
  Renames this file system entity.
- `FileSystemEntity renameSync(String newPath)`:
  Synchronously renames this file system entity.
- `Future<String> resolveSymbolicLinks()`:
  Resolves the path of a file system object relative to the
  current working directory.
- `String resolveSymbolicLinksSync()`:
  Resolves the path of a file system object relative to the
  current working directory.
- `Future<FileStat> stat()`:
  Calls the operating system's `stat()` function on [path].
- `FileStat statSync()`:
  Synchronously calls the operating system's `stat()` function on [path].
- `Stream<FileSystemEvent> watch({int events, bool recursive})`:
  Start watching the [FileSystemEntity] for changes.

## Class: FileSystemEntityType

The type of an entity on the file system,
such as a file, directory, or link.

```dart
final class FileSystemEntityType { … }
```

- static `FileSystemEntityType NOT_FOUND`
- static `FileSystemEntityType directory`
- static `FileSystemEntityType file`
- static `FileSystemEntityType link`
- static `FileSystemEntityType notFound`
- static `FileSystemEntityType pipe`
- static `FileSystemEntityType unixDomainSock`
- `String toString()`: A string representation of this object.

## Class: FileSystemEvent

Base event class emitted by [FileSystemEntity.watch].

```dart
sealed class FileSystemEvent { … }
```

- static `int all`:
  Bitfield for [FileSystemEntity.watch], for enabling all of [create],
  [modify], [delete] and [move].
- static `int create`:
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemCreateEvent]s.
- static `int delete`:
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemDeleteEvent]s.
- static `int modify`:
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemModifyEvent]s.
- static `int move`:
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemMoveEvent]s.
- `bool isDirectory`: Whether the event target is a directory.
- `String path`: The path that triggered the event.
- `int type`: The type of event. See [FileSystemEvent] for a list of events.

## Class: FileSystemException

Exception thrown when a file operation fails.

```dart
class FileSystemException implements IOException { … }
```

- `FileSystemException([String message, String? path, OSError? osError])`:
  Creates a new file system exception with optional parts.
- `String message`: Message describing the error.
- `OSError? osError`: The underlying OS error.
- `String? path`: The file system path on which the error occurred.
- `String toString()`: A string representation of this object.

## Class: FileSystemModifyEvent

File system event for modifications of file system objects.

```dart
final class FileSystemModifyEvent extends FileSystemEvent { … }
```

- `FileSystemModifyEvent(String path, bool isDirectory, bool contentChanged)`:
  Constructs a new [FileSystemModifyEvent].
- `bool contentChanged`:
  If the content was changed and not only the attributes, [contentChanged]
  is `true`.
- `String toString()`: A string representation of this object.

## Class: FileSystemMoveEvent

File system event for moving of file system objects.

```dart
final class FileSystemMoveEvent extends FileSystemEvent { … }
```

- `FileSystemMoveEvent(String path, bool isDirectory, String? destination)`:
  Constructs a new [FileSystemMoveEvent].
- `String? destination`: The destination path of the file being moved.
- `String toString()`: A string representation of this object.

## Class: GZipCodec

The [GZipCodec] encodes raw bytes to GZip compressed bytes and decodes GZip
compressed bytes to raw bytes.

```dart
final class GZipCodec extends Codec<List<int>, List<int>> { … }
```

- `GZipCodec({int level, int windowBits, int memLevel, int strategy, List<int>? dictionary, bool raw, bool gzip})`
- `List<int>? dictionary`: Initial compression dictionary.
- `bool gzip`: When true, `GZip` frames will be added to the compressed data.
- `int level`:
  The compression-[level] can be set in the range of `-1..9`, with `6` being
  the default compression level. Levels above `6` will have higher
  compression rates at the cost of more CPU and memory usage. Levels below
  `6` will use less CPU and memory at the cost of lower compression rates.
- `int memLevel`:
  Specifies how much memory should be allocated for the internal compression
  state. `1` uses minimum memory but is slow and reduces compression ratio;
  `9` uses maximum memory for optimal speed. The default value is `8`.
- `bool raw`:
  When true, deflate generates raw data with no zlib header or trailer, and
  will not compute an adler32 check value
- `int strategy`: Tunes the compression algorithm. Use the value
  [ZLibOption.strategyDefault] for normal data,
  [ZLibOption.strategyFiltered] for data produced by a filter
  (or predictor), [ZLibOption.strategyHuffmanOnly] to force Huffman
  encoding only (no string match), or [ZLibOption.strategyRle] to limit
  match distances to one (run-length encoding).
- `int windowBits`:
  Base two logarithm of the window size (the size of the history buffer). It
  should be in the range `8..15`. Larger values result in better compression
  at the expense of memory usage. The default value is `15`
- `ZLibDecoder get decoder`:
  Get a [ZLibDecoder] for decoding `GZip` compressed data.
- `ZLibEncoder get encoder`:
  Get a [ZLibEncoder] for encoding to `GZip` compressed data.

## Class: HandshakeException

An exception that happens in the handshake phase of establishing
a secure network connection.

```dart
class HandshakeException extends TlsException { … }
```

- `HandshakeException([String message, OSError? osError])`

## Class: HeaderValue

Representation of a header value in the form:

```dart
abstract interface class HeaderValue { … }
```

- `HeaderValue([String value, Map<String, String?> parameters])`:
  Creates a new header value object setting the value and parameters.
- static `HeaderValue parse(String value, {String parameterSeparator, String? valueSeparator, bool preserveBackslash})`:
  Creates a new header value object from parsing a header value
  string with both value and optional parameters.
- `Map<String, String?> get parameters`: A map of parameters.
- `String get value`: The value of the header.
- `String toString()`: Returns the formatted string representation in the form:

## Class: HttpClient

An HTTP client for communicating with an HTTP server.

```dart
abstract interface class HttpClient { … }
```

- `HttpClient({SecurityContext? context})`
- static `int defaultHttpPort`
- static `int defaultHttpsPort`
- static `String findProxyFromEnvironment(Uri url, {Map<String, String>? environment})`:
  Function for resolving the proxy server to be used for an HTTP
  connection from the proxy configuration specified through
  environment variables.
- `bool autoUncompress`:
  Gets and sets whether the body of a response will be automatically
  uncompressed.
- `Duration? connectionTimeout`: Gets and sets the connection timeout.
- `Duration idleTimeout`:
  Gets and sets the idle timeout of non-active persistent (keep-alive)
  connections.
- `int? maxConnectionsPerHost`:
  Gets and sets the maximum number of live connections, to a single host.
- `String? userAgent`:
  Gets and sets the default value of the `User-Agent` header for all requests
  generated by this [HttpClient].
- `set authenticate=(Future<bool> Function(Uri, String, String?)? f)`:
  Sets the function to be called when a site is requesting
  authentication.
- `set authenticateProxy=(Future<bool> Function(String, int, String, String?)? f)`:
  Sets the function to be called when a proxy is requesting
  authentication.
- `set badCertificateCallback=(bool Function(X509Certificate, String, int)? callback)`:
  Sets a callback that will decide whether to accept a secure connection
  with a server certificate that cannot be authenticated by any of our
  trusted root certificates.
- `set connectionFactory=(Future<ConnectionTask<Socket>> Function(Uri, String?, int?)? f)`:
  Sets the function used to create socket connections.
- static `set enableTimelineLogging=(bool value)`:
  Enable logging of HTTP requests from all [HttpClient]s to the developer
  timeline.
- static `bool get enableTimelineLogging`:
  Current state of HTTP request logging from all [HttpClient]s to the
  developer timeline.
- `set findProxy=(String Function(Uri)? f)`:
  Sets the function used to resolve the proxy server to be used for
  opening an HTTP connection to the specified `url`. If this
  function is not set, direct connections will always be used.
- `set keyLog=(dynamic Function(String)? callback)`:
  Sets a callback that will be called when new TLS keys are exchanged with
  the server. It will receive one line of text in
  [NSS Key Log Format](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format)
  for each call. Writing these lines to a file will allow tools (such as
  [Wireshark](https://gitlab.com/wireshark/wireshark/-/wikis/TLS#tls-decryption))
  to decrypt communication between the this client and the server. This is
  meant to allow network-level debugging of secure sockets and should not
  be used in production code. For example:
- `void addCredentials(Uri url, String realm, HttpClientCredentials credentials)`:
  Add credentials to be used for authorizing HTTP requests.
- `void addProxyCredentials(String host, int port, String realm, HttpClientCredentials credentials)`:
  Add credentials to be used for authorizing HTTP proxies.
- `void close({bool force})`: Shuts down the HTTP client.
- `Future<HttpClientRequest> delete(String host, int port, String path)`:
  Opens an HTTP connection using the DELETE method.
- `Future<HttpClientRequest> deleteUrl(Uri url)`:
  Opens an HTTP connection using the DELETE method.
- `Future<HttpClientRequest> get(String host, int port, String path)`:
  Opens an HTTP connection using the GET method.
- `Future<HttpClientRequest> getUrl(Uri url)`:
  Opens an HTTP connection using the GET method.
- `Future<HttpClientRequest> head(String host, int port, String path)`:
  Opens an HTTP connection using the HEAD method.
- `Future<HttpClientRequest> headUrl(Uri url)`:
  Opens an HTTP connection using the HEAD method.
- `Future<HttpClientRequest> open(String method, String host, int port, String path)`:
  Opens an HTTP connection.
- `Future<HttpClientRequest> openUrl(String method, Uri url)`:
  Opens an HTTP connection.
- `Future<HttpClientRequest> patch(String host, int port, String path)`:
  Opens an HTTP connection using the PATCH method.
- `Future<HttpClientRequest> patchUrl(Uri url)`:
  Opens an HTTP connection using the PATCH method.
- `Future<HttpClientRequest> post(String host, int port, String path)`:
  Opens an HTTP connection using the POST method.
- `Future<HttpClientRequest> postUrl(Uri url)`:
  Opens an HTTP connection using the POST method.
- `Future<HttpClientRequest> put(String host, int port, String path)`:
  Opens an HTTP connection using the PUT method.
- `Future<HttpClientRequest> putUrl(Uri url)`:
  Opens an HTTP connection using the PUT method.

## Class: HttpClientBasicCredentials

Represents credentials for basic authentication.

```dart
abstract final class HttpClientBasicCredentials
    implements HttpClientCredentials { … }
```

- `HttpClientBasicCredentials(String username, String password)`

## Class: HttpClientBearerCredentials

Represents credentials for bearer token authentication.

```dart
abstract final class HttpClientBearerCredentials
    implements HttpClientCredentials { … }
```

- `HttpClientBearerCredentials(String token)`

## Class: HttpClientCredentials

Represents credentials for authentication in [HttpClient].

```dart
abstract interface class HttpClientCredentials { … }
```

## Class: HttpClientDigestCredentials

Represents credentials for digest authentication.

```dart
abstract final class HttpClientDigestCredentials
    implements HttpClientCredentials { … }
```

- `HttpClientDigestCredentials(String username, String password)`

## Class: HttpClientRequest

HTTP request for a client connection.

```dart
abstract interface class HttpClientRequest implements IOSink { … }
```

- `bool bufferOutput`:
  Gets or sets if the [HttpClientRequest] should buffer output.
- `int contentLength`: Gets and sets the content length of the request.
- `bool followRedirects`: Whether to follow redirects automatically.
- `int maxRedirects`:
  Set this property to the maximum number of redirects to follow
  when [followRedirects] is `true`. If this number is exceeded
  an error event will be added with a [RedirectException].
- `bool persistentConnection`: The requested persistent connection state.
- `HttpConnectionInfo? get connectionInfo`:
  Gets information about the client connection.
- `List<Cookie> get cookies`:
  Cookies to present to the server (in the 'cookie' header).
- `Future<HttpClientResponse> get done`:
  An [HttpClientResponse] future that will complete once the response is
  available.
- `HttpHeaders get headers`: Returns the client request headers.
- `String get method`: The method of the request.
- `Uri get uri`: The uri of the request.
- `void abort([Object? exception, StackTrace? stackTrace])`:
  Aborts the client connection.
- `Future<HttpClientResponse> close()`:
  Close the request for input. Returns the value of [done].

## Class: HttpClientResponse

HTTP response for a client connection.

```dart
abstract interface class HttpClientResponse implements Stream<List<int>> { … }
```

- `X509Certificate? get certificate`:
  Returns the certificate of the HTTPS server providing the response.
  Returns null if the connection is not a secure TLS or SSL connection.
- `HttpClientResponseCompressionState get compressionState`:
  The compression state of the response.
- `HttpConnectionInfo? get connectionInfo`:
  Gets information about the client connection. Returns `null` if the socket
  is not available.
- `int get contentLength`:
  Returns the content length of the response body. Returns -1 if the size of
  the response body is not known in advance.
- `List<Cookie> get cookies`:
  Cookies set by the server (from the 'set-cookie' header).
- `HttpHeaders get headers`: Returns the client response headers.
- `bool get isRedirect`:
  Returns whether the status code is one of the normal redirect
  codes [HttpStatus.movedPermanently], [HttpStatus.found],
  [HttpStatus.movedTemporarily], [HttpStatus.seeOther] and
  [HttpStatus.temporaryRedirect].
- `bool get persistentConnection`:
  Gets the persistent connection state returned by the server.
- `String get reasonPhrase`:
  Returns the reason phrase associated with the status code.
- `List<RedirectInfo> get redirects`:
  Returns the series of redirects this connection has been through. The
  list will be empty if no redirects were followed. [redirects] will be
  updated both in the case of an automatic and a manual redirect.
- `int get statusCode`: Returns the status code.
- `Future<Socket> detachSocket()`:
  Detach the underlying socket from the HTTP client. When the
  socket is detached the HTTP client will no longer perform any
  operations on it.
- `Future<HttpClientResponse> redirect([String? method, Uri? url, bool? followLoops])`:
  Redirects this connection to a new URL. The default value for
  [method] is the method for the current request. The default value
  for [url] is the value of the [HttpHeaders.locationHeader] header of
  the current response. All body data must have been read from the
  current response before calling [redirect].

## Class: HttpConnectionInfo

Information about an [HttpRequest], [HttpResponse], [HttpClientRequest], or
[HttpClientResponse] connection.

```dart
abstract interface class HttpConnectionInfo { … }
```

- `int get localPort`
- `InternetAddress get remoteAddress`
- `int get remotePort`

## Class: HttpConnectionsInfo

Summary statistics about an [HttpServer]s current socket connections.

```dart
class HttpConnectionsInfo { … }
```

- `int active`: Number of active connections where actual request/response
  processing is active.
- `int closing`: Number of connections which are preparing to close.
- `int idle`:
  Number of idle connections held by clients as persistent connections.
- `int total`: Total number of socket connections.

## Class: HttpDate

Utility functions for working with dates with HTTP specific date
formats.

```dart
class HttpDate { … }
```

- static `String format(DateTime date)`: Format a date according to
  [RFC-1123](http://tools.ietf.org/html/rfc1123 "RFC-1123"),
  e.g. `Thu, 1 Jan 1970 00:00:00 GMT`.
- static `DateTime parse(String date)`:
  Parse a date string in either of the formats
  [RFC-1123](http://tools.ietf.org/html/rfc1123 "RFC-1123"),
  [RFC-850](http://tools.ietf.org/html/rfc850 "RFC-850") or
  ANSI C's asctime() format. These formats are listed here.

## Class: HttpException

```dart
class HttpException implements IOException { … }
```

- `HttpException(String message, {Uri? uri})`
- `String message`
- `Uri? uri`
- `String toString()`: A string representation of this object.

## Class: HttpHeaders

Headers for HTTP requests and responses.

```dart
abstract interface class HttpHeaders { … }
```

- static `String acceptCharsetHeader`
- static `String acceptEncodingHeader`
- static `String acceptHeader`
- static `String acceptLanguageHeader`
- static `String acceptRangesHeader`
- static `String accessControlAllowCredentialsHeader`
- static `String accessControlAllowHeadersHeader`
- static `String accessControlAllowMethodsHeader`
- static `String accessControlAllowOriginHeader`
- static `String accessControlExposeHeadersHeader`
- static `String accessControlMaxAgeHeader`
- static `String accessControlRequestHeadersHeader`
- static `String accessControlRequestMethodHeader`
- static `String ageHeader`
- static `String allowHeader`
- static `String authorizationHeader`
- static `String cacheControlHeader`
- static `String connectionHeader`
- static `String contentDisposition`
- static `String contentEncodingHeader`
- static `String contentLanguageHeader`
- static `String contentLengthHeader`
- static `String contentLocationHeader`
- static `String contentMD5Header`
- static `String contentRangeHeader`
- static `String contentTypeHeader`
- static `String cookieHeader`
- static `String dateHeader`
- static `List<String> entityHeaders`
- static `String etagHeader`
- static `String expectHeader`
- static `String expiresHeader`
- static `String fromHeader`
- static `List<String> generalHeaders`
- static `String hostHeader`
- static `String ifMatchHeader`
- static `String ifModifiedSinceHeader`
- static `String ifNoneMatchHeader`
- static `String ifRangeHeader`
- static `String ifUnmodifiedSinceHeader`
- static `String lastModifiedHeader`
- static `String locationHeader`
- static `String maxForwardsHeader`
- static `String pragmaHeader`
- static `String proxyAuthenticateHeader`
- static `String proxyAuthorizationHeader`
- static `String rangeHeader`
- static `String refererHeader`
- static `List<String> requestHeaders`
- static `List<String> responseHeaders`
- static `String retryAfterHeader`
- static `String serverHeader`
- static `String setCookieHeader`
- static `String teHeader`
- static `String trailerHeader`
- static `String transferEncodingHeader`
- static `String upgradeHeader`
- static `String userAgentHeader`
- static `String varyHeader`
- static `String viaHeader`
- static `String warningHeader`
- static `String wwwAuthenticateHeader`
- `bool chunkedTransferEncoding`:
  Whether the connection uses chunked transfer encoding.
- `int contentLength`: The value of the [contentLengthHeader] header, if any.
- `ContentType? contentType`:
  The [ContentType] of the [contentTypeHeader] header, if any.
- `DateTime? date`: The date specified by the [dateHeader] header, if any.
- `DateTime? expires`:
  The date and time specified by the [expiresHeader] header, if any.
- `String? host`: The value of the [hostHeader] header, if any.
- `DateTime? ifModifiedSince`:
  The date and time specified by the [ifModifiedSinceHeader] header, if any.
- `bool persistentConnection`: Whether the connection is persistent (keep-alive).
- `int? port`: The value of the port part of the [hostHeader] header, if any.
- `List<String>? operator[](String name)`: The values for the header named [name].
- `void add(String name, Object value, {bool preserveHeaderCase})`:
  Adds a header value.
- `void clear()`: Removes all headers.
- `void forEach(void Function(String, List<String>) action)`:
  Performs the [action] on each header.
- `void noFolding(String name)`:
  Disables folding for the header named [name] when sending the HTTP header.
- `void remove(String name, Object value)`:
  Removes a specific value for a header name.
- `void removeAll(String name)`: Removes all values for the specified header name.
- `void set(String name, Object value, {bool preserveHeaderCase})`:
  Sets the header [name] to [value].
- `String? value(String name)`:
  Convenience method for the value for a single valued header.

## Class: HttpOverrides

This class facilitates overriding [HttpClient] with a mock implementation.
It should be extended by another class in client code with overrides
that construct a mock implementation. The implementation in this base class
defaults to the actual [HttpClient] implementation. For example:

```dart
abstract class HttpOverrides { … }
```

- static `R runWithHttpOverrides<R>(R Function() body, HttpOverrides overrides)`:
  Runs [body] in a fresh [Zone] using the overrides found in [overrides].
- static `R runZoned<R>(R Function() body, {HttpClient Function(SecurityContext?)? createHttpClient, String Function(Uri, Map<String, String>?)? findProxyFromEnvironment})`:
  Runs [body] in a fresh [Zone] using the provided overrides.
- static `HttpOverrides? get current`
- static `set global=(HttpOverrides? overrides)`:
  The [HttpOverrides] to use in the root [Zone].
- `HttpClient createHttpClient(SecurityContext? context)`:
  Returns a new [HttpClient] using the given [context].
- `String findProxyFromEnvironment(Uri url, Map<String, String>? environment)`:
  Resolves the proxy server to be used for HTTP connections.

## Class: HttpRequest

A server-side object
that contains the content of and information about an HTTP request.

```dart
abstract interface class HttpRequest implements Stream<Uint8List> { … }
```

- `X509Certificate? get certificate`:
  The client certificate of the client making the request.
- `HttpConnectionInfo? get connectionInfo`:
  Information about the client connection.
- `int get contentLength`: The content length of the request body.
- `List<Cookie> get cookies`:
  The cookies in the request, from the "Cookie" headers.
- `HttpHeaders get headers`: The request headers.
- `String get method`: The method, such as 'GET' or 'POST', for the request.
- `bool get persistentConnection`:
  The persistent connection state signaled by the client.
- `String get protocolVersion`: The HTTP protocol version used in the request,
  either "1.0" or "1.1".
- `Uri get requestedUri`: The requested URI for the request.
- `HttpResponse get response`:
  The [HttpResponse] object, used for sending back the response to the
  client.
- `HttpSession get session`: The session for the given request.
- `Uri get uri`: The URI for the request.

## Class: HttpResponse

An HTTP response, which returns the headers and data
from the server to the client in response to an HTTP request.

```dart
abstract interface class HttpResponse implements IOSink { … }
```

- `bool bufferOutput`: Gets or sets if the [HttpResponse] should buffer output.
- `int contentLength`:
  Gets and sets the content length of the response. If the size of
  the response is not known in advance set the content length to
  -1, which is also the default if not set.
- `Duration? deadline`:
  Set and get the [deadline] for the response. The deadline is timed from the
  time it's set. Setting a new deadline will override any previous deadline.
  When a deadline is exceeded, the response will be closed and any further
  data ignored.
- `bool persistentConnection`:
  Gets and sets the persistent connection state. The initial value
  of this property is the persistent connection state from the
  request.
- `String reasonPhrase`: The reason phrase for the response.
- `int statusCode`: The status code of the response.
- `HttpConnectionInfo? get connectionInfo`:
  Gets information about the client connection. Returns `null` if the
  socket is not available.
- `List<Cookie> get cookies`:
  Cookies to set in the client (in the 'set-cookie' header).
- `HttpHeaders get headers`: Returns the response headers.
- `Future<Socket> detachSocket({bool writeHeaders})`:
  Detaches the underlying socket from the HTTP server. When the
  socket is detached the HTTP server will no longer perform any
  operations on it.
- `Future<dynamic> redirect(Uri location, {int status})`:
  Respond with a redirect to [location].

## Class: HttpServer

A server that delivers content, such as web pages, using the HTTP protocol.

```dart
abstract class HttpServer implements Stream<HttpRequest> { … }
```

- `HttpServer.listenOn(ServerSocket serverSocket)`:
  Attaches the HTTP server to an existing [ServerSocket]. When the
  [HttpServer] is closed, the [HttpServer] will just detach itself,
  closing current connections but not closing [serverSocket].
- static `Future<HttpServer> bind(dynamic address, int port, {int backlog, bool v6Only, bool shared})`:
  Starts listening for HTTP requests on the specified [address] and
  [port].
- static `Future<HttpServer> bindSecure(dynamic address, int port, SecurityContext context, {int backlog, bool v6Only, bool requestClientCertificate, bool shared})`:
  The [address] can either be a [String] or an
  [InternetAddress]. If [address] is a [String], [bind] will
  perform a [InternetAddress.lookup] and use the first value in the
  list. To listen on the loopback adapter, which will allow only
  incoming connections from the local host, use the value
  [InternetAddress.loopbackIPv4] or
  [InternetAddress.loopbackIPv6]. To allow for incoming
  connection from the network use either one of the values
  [InternetAddress.anyIPv4] or [InternetAddress.anyIPv6] to
  bind to all interfaces or the IP address of a specific interface.
- `bool autoCompress`:
  Whether the [HttpServer] should compress the content, if possible.
- `Duration? idleTimeout`:
  Gets or sets the timeout used for idle keep-alive connections. If no
  further request is seen within [idleTimeout] after the previous request was
  completed, the connection is dropped.
- `String? serverHeader`:
  Gets and sets the default value of the `Server` header for all responses
  generated by this [HttpServer].
- `InternetAddress get address`: The address that the server is listening on.
- `HttpHeaders get defaultResponseHeaders`:
  Default set of headers added to all response objects.
- `int get port`: The port that the server is listening on.
- `set sessionTimeout=(int timeout)`:
  Sets the timeout, in seconds, for sessions of this [HttpServer].
- `Future<dynamic> close({bool force})`:
  Permanently stops this [HttpServer] from listening for new
  connections.  This closes the [Stream] of [HttpRequest]s with a
  done event. The returned future completes when the server is
  stopped. For a server started using [bind] or [bindSecure] this
  means that the port listened on no longer in use.
- `HttpConnectionsInfo connectionsInfo()`:
  An [HttpConnectionsInfo] object summarizing the number of
  current connections handled by the server.

## Class: HttpSession

The [session][HttpRequest.session] of an [HttpRequest].

```dart
abstract interface class HttpSession implements Map<dynamic, dynamic> { … }
```

- `String get id`: The id of the current session.
- `bool get isNew`: Whether the session has not yet been sent to the client.
- `set onTimeout=(void Function() callback)`:
  Sets a callback that will be called when the session is timed out.
- `void destroy()`: Destroys the session.

## Class: HttpStatus

HTTP status codes.  Exported in dart:io and dart:html.

```dart
abstract class HttpStatus { … }
```

- static `int ACCEPTED`
- static `int BAD_GATEWAY`
- static `int BAD_REQUEST`
- static `int CONFLICT`
- static `int CONTINUE`
- static `int CREATED`
- static `int EXPECTATION_FAILED`
- static `int FORBIDDEN`
- static `int FOUND`
- static `int GATEWAY_TIMEOUT`
- static `int GONE`
- static `int HTTP_VERSION_NOT_SUPPORTED`
- static `int INTERNAL_SERVER_ERROR`
- static `int LENGTH_REQUIRED`
- static `int METHOD_NOT_ALLOWED`
- static `int MOVED_PERMANENTLY`
- static `int MOVED_TEMPORARILY`
- static `int MULTIPLE_CHOICES`
- static `int NETWORK_CONNECT_TIMEOUT_ERROR`
- static `int NON_AUTHORITATIVE_INFORMATION`
- static `int NOT_ACCEPTABLE`
- static `int NOT_FOUND`
- static `int NOT_IMPLEMENTED`
- static `int NOT_MODIFIED`
- static `int NO_CONTENT`
- static `int OK`
- static `int PARTIAL_CONTENT`
- static `int PAYMENT_REQUIRED`
- static `int PRECONDITION_FAILED`
- static `int PROXY_AUTHENTICATION_REQUIRED`
- static `int REQUESTED_RANGE_NOT_SATISFIABLE`
- static `int REQUEST_ENTITY_TOO_LARGE`
- static `int REQUEST_TIMEOUT`
- static `int REQUEST_URI_TOO_LONG`
- static `int RESET_CONTENT`
- static `int SEE_OTHER`
- static `int SERVICE_UNAVAILABLE`
- static `int SWITCHING_PROTOCOLS`
- static `int TEMPORARY_REDIRECT`
- static `int UNAUTHORIZED`
- static `int UNSUPPORTED_MEDIA_TYPE`
- static `int UPGRADE_REQUIRED`
- static `int USE_PROXY`
- static `int accepted`
- static `int alreadyReported`
- static `int badGateway`
- static `int badRequest`
- static `int clientClosedRequest`
- static `int conflict`
- static `int connectionClosedWithoutResponse`
- static `int continue_`
- static `int created`
- static `int expectationFailed`
- static `int failedDependency`
- static `int forbidden`
- static `int found`
- static `int gatewayTimeout`
- static `int gone`
- static `int httpVersionNotSupported`
- static `int imUsed`
- static `int insufficientStorage`
- static `int internalServerError`
- static `int lengthRequired`
- static `int locked`
- static `int loopDetected`
- static `int methodNotAllowed`
- static `int misdirectedRequest`
- static `int movedPermanently`
- static `int movedTemporarily`
- static `int multiStatus`
- static `int multipleChoices`
- static `int networkAuthenticationRequired`
- static `int networkConnectTimeoutError`
- static `int noContent`
- static `int nonAuthoritativeInformation`
- static `int notAcceptable`
- static `int notExtended`
- static `int notFound`
- static `int notImplemented`
- static `int notModified`
- static `int ok`
- static `int partialContent`
- static `int paymentRequired`
- static `int permanentRedirect`
- static `int preconditionFailed`
- static `int preconditionRequired`
- static `int processing`
- static `int proxyAuthenticationRequired`
- static `int requestEntityTooLarge`
- static `int requestHeaderFieldsTooLarge`
- static `int requestTimeout`
- static `int requestUriTooLong`
- static `int requestedRangeNotSatisfiable`
- static `int resetContent`
- static `int seeOther`
- static `int serviceUnavailable`
- static `int switchingProtocols`
- static `int temporaryRedirect`
- static `int tooManyRequests`
- static `int unauthorized`
- static `int unavailableForLegalReasons`
- static `int unprocessableEntity`
- static `int unsupportedMediaType`
- static `int upgradeRequired`
- static `int useProxy`
- static `int variantAlsoNegotiates`

## Class: IOException

Base class for all IO related exceptions.

```dart
abstract class IOException implements Exception { … }
```

- `String toString()`: A string representation of this object.

## Class: IOOverrides

Facilities for overriding various APIs of `dart:io` with mock
implementations.

```dart
abstract class IOOverrides { … }
```

- static `R runWithIOOverrides<R>(R Function() body, IOOverrides overrides)`:
  Runs [body] in a fresh [Zone] using the overrides found in [overrides].
- static `R runZoned<R>(R Function() body, {Directory Function(String)? createDirectory, Directory Function()? getCurrentDirectory, void Function(String)? setCurrentDirectory, Directory Function()? getSystemTempDirectory, File Function(String)? createFile, Future<FileStat> Function(String)? stat, FileStat Function(String)? statSync, Future<bool> Function(String, String)? fseIdentical, bool Function(String, String)? fseIdenticalSync, Future<FileSystemEntityType> Function(String, bool)? fseGetType, FileSystemEntityType Function(String, bool)? fseGetTypeSync, Stream<FileSystemEvent> Function(String, int, bool)? fsWatch, bool Function()? fsWatchIsSupported, Link Function(String)? createLink, Future<Socket> Function(dynamic, int, {dynamic sourceAddress, int sourcePort, Duration? timeout})? socketConnect, Future<ConnectionTask<Socket>> Function(dynamic, int, {dynamic sourceAddress, int sourcePort})? socketStartConnect, Future<ServerSocket> Function(dynamic, int, {int backlog, bool shared, bool v6Only})? serverSocketBind, Stdin Function()? stdin, Stdout Function()? stdout, Stdout Function()? stderr, Never Function(int)? exit})`:
  Runs [body] in a fresh [Zone] using the provided overrides.
- static `IOOverrides? get current`
- static `set global=(IOOverrides? overrides)`:
  The [IOOverrides] to use in the root [Zone].
- `Stdout get stderr`:
  The standard output stream of errors written by this program.
- `Stdin get stdin`: The standard input stream of data read by this program.
- `Stdout get stdout`: The standard output stream of data written by this program.
- `Directory createDirectory(String path)`:
  Creates a new [Directory] object for the given [path].
- `File createFile(String path)`:
  Creates a new [File] object for the given [path].
- `Link createLink(String path)`:
  Returns a new [Link] object for the given [path].
- `Never exit(int code)`:
  Exit the Dart VM process immediately with the given exit code.
- `Stream<FileSystemEvent> fsWatch(String path, int events, bool recursive)`:
  Returns a [Stream] of [FileSystemEvent]s.
- `bool fsWatchIsSupported()`:
  Returns `true` when [FileSystemEntity.watch] is supported.
- `Future<FileSystemEntityType> fseGetType(String path, bool followLinks)`:
  Asynchronously returns the [FileSystemEntityType] for [path].
- `FileSystemEntityType fseGetTypeSync(String path, bool followLinks)`:
  Returns the [FileSystemEntityType] for [path].
- `Future<bool> fseIdentical(String path1, String path2)`:
  Asynchronously returns `true` if [path1] and [path2] are paths to the
  same file system object.
- `bool fseIdenticalSync(String path1, String path2)`:
  Returns `true` if [path1] and [path2] are paths to the
  same file system object.
- `Directory getCurrentDirectory()`: Returns the current working directory.
- `Directory getSystemTempDirectory()`: Returns the system temporary directory.
- `Future<ServerSocket> serverSocketBind(dynamic address, int port, {int backlog, bool v6Only, bool shared})`:
  Asynchronously returns a [ServerSocket] that connects to the given address
  and port when successful.
- `void setCurrentDirectory(String path)`:
  Sets the current working directory to be [path].
- `Future<Socket> socketConnect(dynamic host, int port, {dynamic sourceAddress, int sourcePort, Duration? timeout})`:
  Asynchronously returns a [Socket] connected to the given host and port.
- `Future<ConnectionTask<Socket>> socketStartConnect(dynamic host, int port, {dynamic sourceAddress, int sourcePort})`:
  Asynchronously returns a [ConnectionTask] that connects to the given host
  and port when successful.
- `Future<FileStat> stat(String path)`:
  Asynchronously returns [FileStat] information for [path].
- `FileStat statSync(String path)`: Returns [FileStat] information for [path].

## Class: IOSink

A combined byte and text output.

```dart
abstract interface class IOSink
    implements StreamSink<List<int>>, StringSink { … }
```

- `IOSink(StreamConsumer<List<int>> target, {Encoding encoding})`:
  Create an [IOSink] that outputs to a [target] [StreamConsumer] of bytes.
- `Encoding encoding`: The [Encoding] used when writing strings.
- `Future<dynamic> get done`:
  A future that will complete when the consumer closes, or when an
  error occurs.
- `void add(List<int> data)`:
  Adds byte [data] to the target consumer, ignoring [encoding].
- `void addError(Object error, [StackTrace? stackTrace])`:
  Passes the error to the target consumer as an error event.
- `Future<dynamic> addStream(Stream<List<int>> stream)`:
  Adds all elements of the given [stream].
- `Future<dynamic> close()`: Close the target consumer.
- `Future<dynamic> flush()`:
  Returns a [Future] that completes once all buffered data is accepted by the
  underlying [StreamConsumer].
- `void write(Object? object)`:
  Converts [object] to a String by invoking [Object.toString] and
  [add]s the encoding of the result to the target consumer.
- `void writeAll(Iterable<dynamic> objects, [String separator])`:
  Iterates over the given [objects] and [write]s them in sequence.
- `void writeCharCode(int charCode)`: Writes the character of [charCode].
- `void writeln([Object? object])`:
  Converts [object] to a String by invoking [Object.toString] and
  writes the result to `this`, followed by a newline.

## Class: InternetAddress

An internet address or a Unix domain address.

```dart
abstract interface class InternetAddress { … }
```

- `InternetAddress(String address, {InternetAddressType? type})`:
  Creates a new [InternetAddress] from a numeric address or a file path.
- `InternetAddress.fromRawAddress(Uint8List rawAddress, {InternetAddressType? type})`:
  Creates a new [InternetAddress] from the provided raw address bytes.
- static `Future<List<InternetAddress>> lookup(String host, {InternetAddressType type})`:
  Looks up the addresses of a host.
- static `InternetAddress? tryParse(String address)`:
  Attempts to parse [address] as a numeric address.
- `String get address`: The numeric address of the host.
- static `InternetAddress get anyIPv4`: IP version 4 any address.
- static `InternetAddress get anyIPv6`: IP version 6 any address.
- `String get host`: The host used to lookup the address.
- `bool get isLinkLocal`:
  Whether the scope of the [InternetAddress] is a link-local.
- `bool get isLoopback`: Whether the [InternetAddress] is a loopback address.
- `bool get isMulticast`: Whether the scope of the [InternetAddress] is multicast.
- static `InternetAddress get loopbackIPv4`: IP version 4 loopback address.
- static `InternetAddress get loopbackIPv6`: IP version 6 loopback address.
- `Uint8List get rawAddress`: The raw address of this [InternetAddress].
- `InternetAddressType get type`: The address family of the [InternetAddress].
- `Future<InternetAddress> reverse()`:
  Performs a reverse DNS lookup on this [address]

## Class: InternetAddressType

The type, or address family, of an [InternetAddress].

```dart
final class InternetAddressType { … }
```

- static `InternetAddressType IPv4`
- static `InternetAddressType IPv6`
- static `InternetAddressType any`
- static `InternetAddressType unix`
- `String get name`: Get the name of the type, e.g. "IPv4" or "IPv6".
- `String toString()`: A string representation of this object.

## Class: Link

References to filesystem links.

```dart
abstract interface class Link implements FileSystemEntity { … }
```

- `Link(String path)`: Creates a Link object.
- `Link.fromRawPath(Uint8List rawPath)`
- `Link.fromUri(Uri uri)`: Creates a [Link] object.
- `Link get absolute`:
  A [Link] instance whose path is the absolute path to this [Link].
- `Future<Link> create(String target, {bool recursive})`:
  Creates a symbolic link in the file system.
- `void createSync(String target, {bool recursive})`:
  Creates a symbolic link in the file system.
- `Future<FileSystemEntity> delete({bool recursive})`: Deletes this [Link].
- `void deleteSync({bool recursive})`: Synchronously deletes this [Link].
- `Future<Link> rename(String newPath)`: Renames this link.
- `Link renameSync(String newPath)`: Synchronously renames this link.
- `Future<String> resolveSymbolicLinks()`:
  Resolves the path of a file system object relative to the
  current working directory.
- `String resolveSymbolicLinksSync()`:
  Resolves the path of a file system object relative to the
  current working directory.
- `Future<String> target()`: Gets the target of the link.
- `String targetSync()`: Synchronously gets the target of the link.
- `Future<Link> update(String target)`: Updates an existing link.
- `void updateSync(String target)`: Synchronously updates an existing link.

## Class: NetworkInterface

A [NetworkInterface] represents an active network interface on the current
system. It contains a list of [InternetAddress]es that are bound to the
interface.

```dart
abstract interface class NetworkInterface { … }
```

- static `Future<List<NetworkInterface>> list({bool includeLoopback, bool includeLinkLocal, InternetAddressType type})`:
  Query the system for [NetworkInterface]s.
- `List<InternetAddress> get addresses`:
  The list of [InternetAddress]es currently bound to this
  [NetworkInterface].
- `int get index`: The index of the [NetworkInterface].
- static `bool get listSupported`: Whether the [list] method is supported.
- `String get name`: The name of the [NetworkInterface].

## Class: OSError

An [Exception] holding information about an error from the
operating system.

```dart
class OSError implements Exception { … }
```

- `OSError([String message, int errorCode])`:
  Creates an OSError object from a message and an errorCode.
- static `int noErrorCode`:
  Constant used to indicate that no OS error code is available.
- `int errorCode`: Error code supplied by the operating system.
- `String message`:
  Error message supplied by the operating system. This will be empty if no
  message is associated with the error.
- `String toString()`: Converts an OSError object to a string representation.

## Class: PathAccessException

Exception thrown when a file operation fails because the necessary access
rights are not available.

```dart
class PathAccessException extends FileSystemException { … }
```

- `PathAccessException(String path, OSError osError, [String message])`
- `String toString()`: A string representation of this object.

## Class: PathExistsException

Exception thrown when a file operation fails because the target path
already exists.

```dart
class PathExistsException extends FileSystemException { … }
```

- `PathExistsException(String path, OSError osError, [String message])`
- `String toString()`: A string representation of this object.

## Class: PathNotFoundException

Exception thrown when a file operation fails because a file or
directory does not exist.

```dart
class PathNotFoundException extends FileSystemException { … }
```

- `PathNotFoundException(String path, OSError osError, [String message])`
- `String toString()`: A string representation of this object.

## Class: Pipe

An anonymous pipe that can be used to send data in a single direction i.e.
data written to [write] can be read using [read].

```dart
abstract interface class Pipe { … }
```

- `Pipe.createSync()`: Synchronously creates an anonymous pipe.
- static `Future<Pipe> create()`
- `ReadPipe get read`: The read end of the [Pipe].
- `WritePipe get write`: The write end of the [Pipe].

## Class: Platform

Information about the environment in which the current program is running.

```dart
abstract final class Platform { … }
```

- static `bool isAndroid`: Whether the operating system is a version of
  [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
- static `bool isFuchsia`: Whether the operating system is a version of
  [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
- static `bool isIOS`: Whether the operating system is a version of
  [iOS](https://en.wikipedia.org/wiki/IOS).
- static `bool isLinux`: Whether the operating system is a version of
  [Linux](https://en.wikipedia.org/wiki/Linux).
- static `bool isMacOS`: Whether the operating system is a version of
  [macOS](https://en.wikipedia.org/wiki/MacOS).
- static `bool isWindows`: Whether the operating system is a version of
  [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
- static `String localHostname`: The local hostname for the system.
- static `int numberOfProcessors`:
  The number of individual execution units of the machine.
- static `String operatingSystem`:
  A string representing the operating system or platform.
- static `String operatingSystemVersion`:
  A string representing the version of the operating system or platform.
- static `String pathSeparator`:
  The path separator used by the operating system to separate
  components in file paths.
- static `String version`: The version of the current Dart runtime.
- static `Map<String, String> get environment`:
  The environment for this process as a map from string key to string value.
- static `String get executable`:
  The path of the executable used to run the script in this isolate.
  Usually `dart` when running on the Dart VM or the
  compiled script name (`script_name.exe`).
- static `List<String> get executableArguments`:
  The flags passed to the executable used to run the script in this isolate.
- static `String get lineTerminator`:
  The current operating system's default line terminator.
- static `String get localeName`: Get the name of the current locale.
- static `String? get packageConfig`:
  The `--packages` flag passed to the executable used to run the script
  in this isolate.
- static `String get resolvedExecutable`:
  The path of the executable used to run the script in this
  isolate after it has been resolved by the OS.
- static `Uri get script`:
  The absolute URI of the script being run in this isolate.

## Class: Process

The means to execute a program.

```dart
abstract interface class Process { … }
```

- static `bool killPid(int pid, [ProcessSignal signal])`:
  Kills the process with id [pid].
- static `Future<ProcessResult> run(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment, bool includeParentEnvironment, bool runInShell, Encoding? stdoutEncoding, Encoding? stderrEncoding})`:
  Starts a process and runs it non-interactively to completion. The
  process run is [executable] with the specified [arguments].
- static `ProcessResult runSync(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment, bool includeParentEnvironment, bool runInShell, Encoding? stdoutEncoding, Encoding? stderrEncoding})`:
  Starts a process and runs it to completion. This is a synchronous
  call and will block until the child process terminates.
- static `Future<Process> start(String executable, List<String> arguments, {String? workingDirectory, Map<String, String>? environment, bool includeParentEnvironment, bool runInShell, ProcessStartMode mode})`:
  Starts a process running the [executable] with the specified
  [arguments].
- `Future<int> get exitCode`:
  A `Future` which completes with the exit code of the process
  when the process completes.
- `int get pid`: The process id of the process.
- `Stream<List<int>> get stderr`:
  The standard error stream of the process as a `Stream`.
- `IOSink get stdin`: The standard input stream of the process as an [IOSink].
- `Stream<List<int>> get stdout`:
  The standard output stream of the process as a `Stream`.
- `bool kill([ProcessSignal signal])`: Kills the process.

## Class: ProcessException

```dart
class ProcessException implements IOException { … }
```

- `ProcessException(String executable, List<String> arguments, [String message, int errorCode])`
- `List<String> arguments`: The arguments provided for the process.
- `int errorCode`: The OS error code for the process exception, if any.
- `String executable`: The executable provided for the process.
- `String message`: The system message for the process exception, if any.
- `String toString()`: A string representation of this object.

## Class: ProcessInfo

Methods for retrieving information about the current process.

```dart
abstract final class ProcessInfo { … }
```

- static `int get currentRss`:
  The current resident set size of memory for the process, in bytes.
- static `int get maxRss`:
  The high-watermark in bytes for the resident set size of memory for the
  process.

## Class: ProcessResult

The result of running a non-interactive
process started with [Process.run] or [Process.runSync].

```dart
final class ProcessResult { … }
```

- `ProcessResult(int pid, int exitCode, dynamic stdout, dynamic stderr)`
- `int exitCode`: Exit code for the process.
- `int pid`: Process id of the process.
- `dynamic stderr`: Standard error from the process.
- `dynamic stdout`: Standard output from the process.

## Class: ProcessSignal

On Posix systems, [ProcessSignal] is used to send a specific signal
to a child process, see `Process.kill`.

```dart
interface class ProcessSignal { … }
```

- static `ProcessSignal sigabrt`
- static `ProcessSignal sigalrm`
- static `ProcessSignal sigbus`
- static `ProcessSignal sigchld`
- static `ProcessSignal sigcont`
- static `ProcessSignal sigfpe`
- static `ProcessSignal sighup`
- static `ProcessSignal sigill`
- static `ProcessSignal sigint`
- static `ProcessSignal sigkill`
- static `ProcessSignal sigpipe`
- static `ProcessSignal sigpoll`
- static `ProcessSignal sigprof`
- static `ProcessSignal sigquit`
- static `ProcessSignal sigsegv`
- static `ProcessSignal sigstop`
- static `ProcessSignal sigsys`
- static `ProcessSignal sigterm`
- static `ProcessSignal sigtrap`
- static `ProcessSignal sigtstp`
- static `ProcessSignal sigttin`
- static `ProcessSignal sigttou`
- static `ProcessSignal sigurg`
- static `ProcessSignal sigusr1`
- static `ProcessSignal sigusr2`
- static `ProcessSignal sigvtalrm`
- static `ProcessSignal sigwinch`
- static `ProcessSignal sigxcpu`
- static `ProcessSignal sigxfsz`
- `String name`:
  The POSIX-standardized name of the signal e.g. [ProcessSignal.name] will
  be "SIGHUP" for [ProcessSignal.sighup].
- `int signalNumber`:
  The numeric constant for the signal e.g. [ProcessSignal.signalNumber]
  will be 1 for [ProcessSignal.sighup] on most platforms.
- `String toString()`: A string representation of this object.
- `Stream<ProcessSignal> watch()`: Watch for process signals.

## Class: ProcessStartMode

Modes for running a new process.

```dart
final class ProcessStartMode { … }
```

- static `ProcessStartMode detached`:
  Detached child process with no open communication channel.
- static `ProcessStartMode detachedWithStdio`:
  Detached child process with stdin, stdout and stderr still open
  for communication with the child.
- static `ProcessStartMode inheritStdio`:
  Stdio handles are inherited by the child process.
- static `ProcessStartMode normal`: Normal child process.
- static `List<ProcessStartMode> get values`
- `String toString()`: A string representation of this object.

## Class: RandomAccessFile

Random access to the data in a file.

```dart
abstract interface class RandomAccessFile { … }
```

- `String get path`: The path of the file underlying this random access file.
- `Future<void> close()`: Closes the file.
- `void closeSync()`: Synchronously closes the file.
- `Future<RandomAccessFile> flush()`: Flushes the contents of the file to disk.
- `void flushSync()`: Synchronously flushes the contents of the file to disk.
- `Future<int> length()`: Gets the length of the file.
- `int lengthSync()`: Synchronously gets the length of the file.
- `Future<RandomAccessFile> lock([FileLock mode, int start, int end])`:
  Locks the file or part of the file.
- `void lockSync([FileLock mode, int start, int end])`:
  Synchronously locks the file or part of the file.
- `Future<int> position()`: Gets the current byte position in the file.
- `int positionSync()`: Synchronously gets the current byte position in the file.
- `Future<Uint8List> read(int count)`: Reads up to [count] bytes from a file.
- `Future<int> readByte()`: Reads a byte from the file.
- `int readByteSync()`: Synchronously reads a single byte from the file.
- `Future<int> readInto(List<int> buffer, [int start, int? end])`:
  Reads bytes into an existing [buffer].
- `int readIntoSync(List<int> buffer, [int start, int? end])`:
  Synchronously reads into an existing [buffer].
- `Uint8List readSync(int count)`:
  Synchronously reads up to [count] bytes from a file
- `Future<RandomAccessFile> setPosition(int position)`:
  Sets the byte position in the file.
- `void setPositionSync(int position)`:
  Synchronously sets the byte position in the file.
- `String toString()`:
  Returns a human-readable string for this random access file.
- `Future<RandomAccessFile> truncate(int length)`:
  Truncates (or extends) the file to [length] bytes.
- `void truncateSync(int length)`:
  Synchronously truncates (or extends) the file to [length] bytes.
- `Future<RandomAccessFile> unlock([int start, int end])`:
  Unlocks the file or part of the file.
- `void unlockSync([int start, int end])`:
  Synchronously unlocks the file or part of the file.
- `Future<RandomAccessFile> writeByte(int value)`:
  Writes a single byte to the file.
- `int writeByteSync(int value)`: Synchronously writes a single byte to the file.
- `Future<RandomAccessFile> writeFrom(List<int> buffer, [int start, int? end])`:
  Writes from a [buffer] to the file.
- `void writeFromSync(List<int> buffer, [int start, int? end])`:
  Synchronously writes from a [buffer] to the file.
- `Future<RandomAccessFile> writeString(String string, {Encoding encoding})`:
  Writes a string to the file using the given [Encoding].
- `void writeStringSync(String string, {Encoding encoding})`:
  Synchronously writes a single string to the file using the given
  [Encoding].

## Class: RawDatagramSocket

An unbuffered interface to a UDP socket.

```dart
abstract interface class RawDatagramSocket extends Stream<RawSocketEvent> { … }
```

- static `Future<RawDatagramSocket> bind(dynamic host, int port, {bool reuseAddress, bool reusePort, int ttl})`:
  Binds a socket to the given [host] and [port].
- `bool broadcastEnabled`: Whether IPv4 broadcast is enabled.
- `int multicastHops`: The maximum network hops for multicast packages
  originating from this socket.
- `NetworkInterface? multicastInterface`:
  The network interface used for outgoing multicast packages.
- `bool multicastLoopback`: Whether multicast traffic is looped back to the host.
- `bool readEventsEnabled`: Whether the [RawDatagramSocket] should listen for
  [RawSocketEvent.read] events.
- `bool writeEventsEnabled`: Whether the [RawDatagramSocket] should listen for
  [RawSocketEvent.write] events.
- `InternetAddress get address`: The address used by this socket.
- `int get port`: The port used by this socket.
- `void close()`: Closes the datagram socket.
- `Uint8List getRawOption(RawSocketOption option)`:
  Reads low level information about the [RawSocket].
- `void joinMulticast(InternetAddress group, [NetworkInterface? interface])`:
  Joins a multicast group.
- `void leaveMulticast(InternetAddress group, [NetworkInterface? interface])`:
  Leaves a multicast group.
- `Datagram? receive()`: Receives a datagram.
- `int send(List<int> buffer, InternetAddress address, int port)`:
  Asynchronously sends a datagram.
- `void setRawOption(RawSocketOption option)`: Customizes the [RawSocket].

## Class: RawSecureServerSocket

A server socket providing a stream of low-level [RawSecureSocket]s.

```dart
class RawSecureServerSocket extends Stream<RawSecureSocket> { … }
```

- static `Future<RawSecureServerSocket> bind(dynamic address, int port, SecurityContext? context, {int backlog, bool v6Only, bool requestClientCertificate, bool requireClientCertificate, List<String>? supportedProtocols, bool shared})`:
  Listens on a provided address and port.
- `bool requestClientCertificate`
- `bool requireClientCertificate`
- `List<String>? supportedProtocols`
- `InternetAddress get address`: The address used by this socket.
- `int get port`: The port used by this socket.
- `Future<RawSecureServerSocket> close()`: Closes this socket.
- `StreamSubscription<RawSecureSocket> listen(void Function(RawSecureSocket)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError})`:
  Adds a subscription to this stream.

## Class: RawSecureSocket

`RawSecureSocket` provides a secure (SSL or TLS) network connection.

```dart
abstract interface class RawSecureSocket implements RawSocket { … }
```

- static `Future<RawSecureSocket> connect(dynamic host, int port, {SecurityContext? context, bool Function(X509Certificate)? onBadCertificate, void Function(String)? keyLog, List<String>? supportedProtocols, Duration? timeout})`:
  Constructs a new secure client socket and connect it to the given
  host on the given port.
- static `Future<RawSecureSocket> secure(RawSocket socket, {StreamSubscription<RawSocketEvent>? subscription, dynamic host, SecurityContext? context, bool Function(X509Certificate)? onBadCertificate, void Function(String)? keyLog, List<String>? supportedProtocols})`:
  Initiates TLS on an existing connection.
- static `Future<RawSecureSocket> secureServer(RawSocket socket, SecurityContext? context, {StreamSubscription<RawSocketEvent>? subscription, List<int>? bufferedData, bool requestClientCertificate, bool requireClientCertificate, List<String>? supportedProtocols})`:
  Initiates TLS on an existing server connection.
- static `Future<ConnectionTask<RawSecureSocket>> startConnect(dynamic host, int port, {SecurityContext? context, bool Function(X509Certificate)? onBadCertificate, void Function(String)? keyLog, List<String>? supportedProtocols})`:
  Like [connect], but returns a [Future] that completes with a
  [ConnectionTask] that can be cancelled if the [RawSecureSocket] is no
  longer needed.
- `X509Certificate? get peerCertificate`:
  Get the peer certificate for a connected RawSecureSocket.  If this
  RawSecureSocket is the server end of a secure socket connection,
  [peerCertificate] will return the client certificate, or null, if no
  client certificate was received.  If it is the client end,
  [peerCertificate] will return the server's certificate.
- `String? get selectedProtocol`:
  The protocol which was selected during protocol negotiation.
- `void renegotiate({bool useSessionCache, bool requestClientCertificate, bool requireClientCertificate})`:
  Does nothing.

## Class: RawServerSocket

A listening socket.

```dart
abstract interface class RawServerSocket implements Stream<RawSocket> { … }
```

- static `Future<RawServerSocket> bind(dynamic address, int port, {int backlog, bool v6Only, bool shared})`:
  Listens on a given address and port.
- `InternetAddress get address`: The address used by this socket.
- `int get port`: The port used by this socket.
- `Future<RawServerSocket> close()`: Closes the socket.

## Class: RawSocket

A TCP connection.

```dart
abstract interface class RawSocket implements Stream<RawSocketEvent> { … }
```

- static `Future<RawSocket> connect(dynamic host, int port, {dynamic sourceAddress, int sourcePort, Duration? timeout})`:
  Creates a new socket connection to the host and port.
- static `Future<ConnectionTask<RawSocket>> startConnect(dynamic host, int port, {dynamic sourceAddress, int sourcePort})`:
  Like [connect], but returns a [Future] that completes with a
  [ConnectionTask] that can be cancelled if the [RawSocket] is no
  longer needed.
- `bool readEventsEnabled`:
  Set or get, if the [RawSocket] should listen for [RawSocketEvent.read]
  and [RawSocketEvent.readClosed] events. Default is `true`.
- `bool writeEventsEnabled`:
  Set or get, if the [RawSocket] should listen for [RawSocketEvent.write]
  events. Default is `true`.
  This is a one-shot listener, and writeEventsEnabled must be set
  to true again to receive another write event.
- `InternetAddress get address`:
  The [InternetAddress] used to connect this socket.
- `int get port`: The port used by this socket.
- `InternetAddress get remoteAddress`:
  The remote [InternetAddress] connected to by this socket.
- `int get remotePort`: The remote port connected to by this socket.
- `int available()`:
  The number of received and non-read bytes in the socket that can be read.
- `Future<RawSocket> close()`: Closes the socket.
- `Uint8List getRawOption(RawSocketOption option)`:
  Reads low level information about the [RawSocket].
- `Uint8List? read([int? len])`: Read up to [len] bytes from the socket.
- `SocketMessage? readMessage([int? count])`:
  Reads a message containing up to [count] bytes from the socket.
- `int sendMessage(List<SocketControlMessage> controlMessages, List<int> data, [int offset, int? count])`:
  Writes socket control messages and data bytes to the socket.
- `bool setOption(SocketOption option, bool enabled)`: Customize the [RawSocket].
- `void setRawOption(RawSocketOption option)`: Customizes the [RawSocket].
- `void shutdown(SocketDirection direction)`:
  Shuts down the socket in the [direction].
- `int write(List<int> buffer, [int offset, int? count])`:
  Writes up to [count] bytes of the buffer from [offset] buffer offset to
  the socket.

## Class: RawSocketEvent

Events for the [RawDatagramSocket], [RawSecureSocket], and [RawSocket].

```dart
class RawSocketEvent { … }
```

- static `RawSocketEvent closed`: An event indicates the socket is closed.
- static `RawSocketEvent read`: An event indicates the socket is ready to be read.
- static `RawSocketEvent readClosed`:
  An event indicates the reading from the socket is closed
- static `RawSocketEvent write`: An event indicates the socket is ready to write.
- `String toString()`: A string representation of this object.

## Class: RawSocketOption

The [RawSocketOption] is used as a parameter to [Socket.setRawOption] and
[RawSocket.setRawOption] to customize the behaviour of the underlying
socket.

```dart
final class RawSocketOption { … }
```

- `RawSocketOption(int level, int option, Uint8List value)`:
  Creates a [RawSocketOption] for [RawSocket.getRawOption]
  and [RawSocket.setRawOption].
- `RawSocketOption.fromBool(int level, int option, bool value)`:
  Convenience constructor for creating a boolean based [RawSocketOption].
- `RawSocketOption.fromInt(int level, int option, int value)`:
  Convenience constructor for creating an integer based [RawSocketOption].
- `int level`: The level for the option to set or get.
- `int option`: The numeric ID of the option to set or get.
- `Uint8List value`:
  The raw data to set, or the array to write the current option value into.
- static `int get IPv4MulticastInterface`: Socket option for `IP_MULTICAST_IF`.
- static `int get IPv6MulticastInterface`: Socket option for `IPV6_MULTICAST_IF`.
- static `int get levelIPv4`: Socket level option for `IPPROTO_IP`.
- static `int get levelIPv6`: Socket level option for `IPPROTO_IPV6`.
- static `int get levelSocket`: Socket level option for `SOL_SOCKET`.
- static `int get levelTcp`: Socket level option for `IPPROTO_TCP`.
- static `int get levelUdp`: Socket level option for `IPPROTO_UDP`.

## Class: RawSynchronousSocket

A low-level class for communicating synchronously over a TCP socket.

```dart
abstract interface class RawSynchronousSocket { … }
```

- static `RawSynchronousSocket connectSync(dynamic host, int port)`:
  Creates a new socket connection and returns a [RawSynchronousSocket].
- `InternetAddress get address`:
  The [InternetAddress] used to connect this socket.
- `int get port`: The port used by this socket.
- `InternetAddress get remoteAddress`:
  The remote [InternetAddress] connected to by this socket.
- `int get remotePort`: The remote port connected to by this socket.
- `int available()`:
  The number of received and unread bytes in the socket that can be read.
- `void closeSync()`: Closes the [RawSynchronousSocket].
- `int readIntoSync(List<int> buffer, [int start, int? end])`:
  Reads bytes into an existing [buffer].
- `List<int>? readSync(int bytes)`: Reads up to [bytes] bytes from the socket.
- `void shutdown(SocketDirection direction)`:
  Shuts down a socket in the provided direction.
- `void writeFromSync(List<int> buffer, [int start, int? end])`:
  Writes from a [buffer] to the socket.

## Class: RawZLibFilter

The [RawZLibFilter] class provides a low-level interface to zlib.

```dart
abstract interface class RawZLibFilter { … }
```

- `RawZLibFilter.deflateFilter({bool gzip, int level, int windowBits, int memLevel, int strategy, List<int>? dictionary, bool raw})`:
  Returns a [RawZLibFilter] whose [process] and [processed] methods
  compress data.
- `RawZLibFilter.inflateFilter({bool gzip, int windowBits, List<int>? dictionary, bool raw})`:
  Returns a [RawZLibFilter] whose [process] and [processed] methods
  decompress data.
- `void process(List<int> data, int start, int end)`: Process a chunk of data.
- `List<int>? processed({bool flush, bool end})`: Get a chunk of processed data.

## Class: ReadPipe

The "read" end of an [Pipe] created by [Pipe.create].

```dart
abstract interface class ReadPipe implements Stream<List<int>> { … }
```

## Class: RedirectException

```dart
class RedirectException implements HttpException { … }
```

- `RedirectException(String message, List<RedirectInfo> redirects)`
- `String message`
- `List<RedirectInfo> redirects`
- `Uri? get uri`
- `String toString()`: A string representation of this object.

## Class: RedirectInfo

Redirect information.

```dart
abstract interface class RedirectInfo { … }
```

- `Uri get location`: Returns the location for the redirect.
- `String get method`: Returns the method used for the redirect.
- `int get statusCode`: Returns the status code used for the redirect.

## Class: ResourceHandle

A wrapper around OS resource handle so it can be passed via Socket
as part of [SocketMessage].

```dart
abstract interface class ResourceHandle { … }
```

- `ResourceHandle.fromFile(RandomAccessFile file)`:
  Creates wrapper around opened file.
- `ResourceHandle.fromRawDatagramSocket(RawDatagramSocket socket)`:
  Creates wrapper around opened raw datagram socket.
- `ResourceHandle.fromRawSocket(RawSocket socket)`:
  Creates wrapper around opened raw socket.
- `ResourceHandle.fromReadPipe(ReadPipe pipe)`
- `ResourceHandle.fromSocket(Socket socket)`:
  Creates wrapper around opened socket.
- `ResourceHandle.fromStdin(Stdin stdin)`: Creates wrapper around current stdin.
- `ResourceHandle.fromStdout(Stdout stdout)`:
  Creates wrapper around current stdout.
- `ResourceHandle.fromWritePipe(WritePipe pipe)`
- `RandomAccessFile toFile()`: Extracts opened file from resource handle.
- `RawDatagramSocket toRawDatagramSocket()`:
  Extracts opened raw datagram socket from resource handle.
- `RawSocket toRawSocket()`: Extracts opened raw socket from resource handle.
- `ReadPipe toReadPipe()`: Extracts a read pipe from resource handle.
- `Socket toSocket()`: Extracts opened socket from resource handle.
- `WritePipe toWritePipe()`: Extracts a write pipe from resource handle.

## Class: SameSite

Cookie cross-site availability configuration.

```dart
final class SameSite { … }
```

- static `SameSite lax`:
  Default value, cookie with this value will generally not be sent on
  cross-site requests, unless the user is navigated to the original site.
- static `SameSite none`: Cookie with this value will be sent in all requests.
- static `SameSite strict`:
  Cookie with this value will never be sent on cross-site requests.
- static `List<SameSite> values`
- `String name`
- `String toString()`: A string representation of this object.

## Class: SecureServerSocket

A server socket, providing a stream of high-level [Socket]s.

```dart
class SecureServerSocket
    extends Stream<SecureSocket>
    implements ServerSocketBase<SecureSocket> { … }
```

- static `Future<SecureServerSocket> bind(dynamic address, int port, SecurityContext? context, {int backlog, bool v6Only, bool requestClientCertificate, bool requireClientCertificate, List<String>? supportedProtocols, bool shared})`:
  Listens on a given address and port.
- `InternetAddress get address`: The address used by this socket.
- `int get port`: The port used by this socket.
- `Future<SecureServerSocket> close()`: Closes this socket.
- `StreamSubscription<SecureSocket> listen(void Function(SecureSocket)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError})`:
  Adds a subscription to this stream.

## Class: SecureSocket

A TCP socket using TLS and SSL.

```dart
abstract interface class SecureSocket implements Socket { … }
```

- static `Future<SecureSocket> connect(dynamic host, int port, {SecurityContext? context, bool Function(X509Certificate)? onBadCertificate, void Function(String)? keyLog, List<String>? supportedProtocols, Duration? timeout})`:
  Constructs a new secure client socket and connects it to the given
  [host] on port [port].
- static `Future<SecureSocket> secure(Socket socket, {dynamic host, SecurityContext? context, bool Function(X509Certificate)? onBadCertificate, void Function(String)? keyLog, List<String>? supportedProtocols})`:
  Initiates TLS on an existing connection.
- static `Future<SecureSocket> secureServer(Socket socket, SecurityContext? context, {List<int>? bufferedData, bool requestClientCertificate, bool requireClientCertificate, List<String>? supportedProtocols})`:
  Initiates TLS on an existing server connection.
- static `Future<ConnectionTask<SecureSocket>> startConnect(dynamic host, int port, {SecurityContext? context, bool Function(X509Certificate)? onBadCertificate, void Function(String)? keyLog, List<String>? supportedProtocols})`:
  Like [connect], but returns a [Future] that completes with a
  [ConnectionTask] that can be cancelled if the [SecureSocket] is no
  longer needed.
- `X509Certificate? get peerCertificate`:
  The peer certificate for a connected SecureSocket.
- `String? get selectedProtocol`:
  The protocol which was selected during ALPN protocol negotiation.
- `void renegotiate({bool useSessionCache, bool requestClientCertificate, bool requireClientCertificate})`:
  Does nothing.

## Class: SecurityContext

The object containing the certificates to trust when making
a secure client connection, and the certificate chain and
private key to serve from a secure server.

```dart
abstract final class SecurityContext { … }
```

- `SecurityContext({bool withTrustedRoots})`: Creates a new [SecurityContext].
- `bool allowLegacyUnsafeRenegotiation`:
  If `true`, the [SecurityContext] will allow TLS renegotiation.
  Renegotiation is only supported as a client and the HelloRequest must be
  received at a quiet point in the application protocol. This is sufficient
  to support the legacy use case of requesting a new client certificate
  between an HTTP request and response in (unpipelined) HTTP/1.1.
  NOTE: Renegotiation is an extremely problematic protocol feature and
  should only be used to communicate with legacy servers in environments
  where it is known to be safe.
- `TlsProtocolVersion minimumTlsProtocolVersion`:
  The minimum TLS version to use when establishing a secure connection.
- static `bool get alpnSupported`:
  Whether the platform supports ALPN. This always returns true and will be
  removed in a future release.
- static `SecurityContext get defaultContext`:
  The default security context used by most operation requiring one.
- `void setAlpnProtocols(List<String> protocols, bool isServer)`:
  Sets the list of application-level protocols supported by a client
  connection or server connection. The ALPN (application level protocol
  negotiation) extension to TLS allows a client to send a list of
  protocols in the TLS client hello message, and the server to pick
  one and send the selected one back in its server hello message.
- `void setClientAuthorities(String file, {String? password})`:
  Sets the list of authority names that a [SecureServerSocket] will advertise
  as accepted when requesting a client certificate from a connecting
  client.
- `void setClientAuthoritiesBytes(List<int> authCertBytes, {String? password})`:
  Sets the list of authority names that a [SecureServerSocket] will advertise
  as accepted, when requesting a client certificate from a connecting
  client.
- `void setTrustedCertificates(String file, {String? password})`:
  Add a certificate to the set of trusted X509 certificates
  used by [SecureSocket] client connections.
- `void setTrustedCertificatesBytes(List<int> certBytes, {String? password})`:
  Add a certificate to the set of trusted X509 certificates
  used by [SecureSocket] client connections.
- `void useCertificateChain(String file, {String? password})`:
  Sets the chain of X509 certificates served by [SecureServerSocket]
  when making secure connections, including the server certificate.
- `void useCertificateChainBytes(List<int> chainBytes, {String? password})`:
  Sets the chain of X509 certificates served by [SecureServerSocket]
  when making secure connections, including the server certificate.
- `void usePrivateKey(String file, {String? password})`:
  Sets the private key for a server certificate or client certificate.
- `void usePrivateKeyBytes(List<int> keyBytes, {String? password})`:
  Sets the private key for a server certificate or client certificate.

## Class: ServerSocket

A listening socket.

```dart
abstract interface class ServerSocket implements ServerSocketBase<Socket> { … }
```

- static `Future<ServerSocket> bind(dynamic address, int port, {int backlog, bool v6Only, bool shared})`:
  Listens on a given address and port.
- `InternetAddress get address`: The address used by this socket.
- `int get port`: The port used by this socket.
- `Future<ServerSocket> close()`: Closes the socket.

## Class: SignalException

```dart
class SignalException implements IOException { … }
```

- `SignalException(String message, [dynamic osError])`
- `String message`
- `dynamic osError`
- `String toString()`: A string representation of this object.

## Class: Socket

A TCP connection between two sockets.

```dart
abstract interface class Socket implements Stream<Uint8List>, IOSink { … }
```

- static `Future<Socket> connect(dynamic host, int port, {dynamic sourceAddress, int sourcePort, Duration? timeout})`:
  Creates a new socket connection to the host and port and returns a [Future]
  that will complete with either a [Socket] once connected or an error
  if the host-lookup or connection failed.
- static `Future<ConnectionTask<Socket>> startConnect(dynamic host, int port, {dynamic sourceAddress, int sourcePort})`:
  Like [connect], but returns a [Future] that completes with a
  [ConnectionTask] that can be cancelled if the [Socket] is no
  longer needed.
- `InternetAddress get address`:
  The [InternetAddress] used to connect this socket.
- `Future<dynamic> get done`:
  A future that will complete when the consumer closes, or when an
  error occurs.
- `int get port`: The port used by this socket.
- `InternetAddress get remoteAddress`:
  The remote [InternetAddress] connected to by this socket.
- `int get remotePort`: The remote port connected to by this socket.
- `void addError(Object error, [StackTrace? stackTrace])`:
  Unsupported operation on sockets.
- `Future<dynamic> close()`: Close the target consumer.
- `void destroy()`: Destroys the socket in both directions.
- `Uint8List getRawOption(RawSocketOption option)`:
  Reads low level information about the [RawSocket].
- `bool setOption(SocketOption option, bool enabled)`: Customizes the [RawSocket].
- `void setRawOption(RawSocketOption option)`: Customizes the [RawSocket].

## Class: SocketControlMessage

Control message part of the [SocketMessage] received by a call to
[RawSocket.readMessage].

```dart
abstract interface class SocketControlMessage { … }
```

- `SocketControlMessage.fromHandles(List<ResourceHandle> handles)`:
  Creates a control message containing the provided [handles].
- `Uint8List get data`:
  Actual bytes that were passed as part of the control message by the
  underlying platform.
- `int get level`:
  A platform specific value used to determine the kind of control message.
- `int get type`:
  A platform specific value used to determine the kind of control message.
- `List<ResourceHandle> extractHandles()`:
  Extracts the list of handles embedded in this message.

## Class: SocketDirection

The [SocketDirection] is used as a parameter to [Socket.close] and
[RawSocket.close] to close a socket in the specified direction(s).

```dart
final class SocketDirection { … }
```

- static `SocketDirection both`
- static `SocketDirection receive`
- static `SocketDirection send`

## Class: SocketException

Exception thrown when a socket operation fails.

```dart
class SocketException implements IOException { … }
```

- `SocketException(String message, {OSError? osError, InternetAddress? address, int? port})`:
  Creates a [SocketException] with the provided values.
- `SocketException.closed()`:
  Creates an exception reporting that a socket was used after it was closed.
- `InternetAddress? address`:
  The address of the socket giving rise to the exception.
- `String message`: Description of the error.
- `OSError? osError`: The underlying OS error.
- `int? port`: The port of the socket giving rise to the exception.
- `String toString()`: A string representation of this object.

## Class: SocketMessage

A socket message received by a [RawDatagramSocket].

```dart
final class SocketMessage { … }
```

- `SocketMessage(Uint8List data, List<SocketControlMessage> controlMessages)`
- `List<SocketControlMessage> controlMessages`:
  The control messages sent as part of this socket message.
- `Uint8List data`: The actual bytes of the message.

## Class: SocketOption

An option for a socket which is configured using [Socket.setOption].

```dart
final class SocketOption { … }
```

- static `SocketOption tcpNoDelay`:
  Enable or disable no-delay on the socket. If tcpNoDelay is enabled, the
  socket will not buffer data internally, but instead write each data chunk
  as an individual TCP packet.

## Class: Stdin

The standard input stream of the process.

```dart
class Stdin extends _StdStream implements Stream<List<int>> { … }
```

- `bool get echoMode`: Whether echo mode is enabled on [stdin].
- `set echoMode=(bool echoMode)`
- `bool get echoNewlineMode`: Whether echo newline mode is enabled on [stdin].
- `set echoNewlineMode=(bool echoNewlineMode)`
- `bool get hasTerminal`: Whether there is a terminal attached to stdin.
- `bool get lineMode`: Whether line mode is enabled on [stdin].
- `set lineMode=(bool lineMode)`
- `bool get supportsAnsiEscapes`:
  Whether connected to a terminal that supports ANSI escape sequences.
- `int readByteSync()`: Synchronously reads a byte from stdin.
- `String? readLineSync({Encoding encoding, bool retainNewlines})`:
  Reads a line from stdin.

## Class: StdinException

Exception thrown by some operations of [Stdin]

```dart
class StdinException implements IOException { … }
```

- `StdinException(String message, [OSError? osError])`
- `String message`: Message describing cause of the exception.
- `OSError? osError`: The underlying OS error, if available.
- `String toString()`: A string representation of this object.

## Class: StdioType

The type of object a standard IO stream can be attached to.

```dart
final class StdioType { … }
```

- static `StdioType file`
- static `StdioType other`
- static `StdioType pipe`
- static `StdioType terminal`
- `String name`
- `String toString()`: A string representation of this object.

## Class: Stdout

An [IOSink] connected to either the standard out or error of the process.

```dart
class Stdout extends _StdSink implements IOSink { … }
```

- `bool get hasTerminal`: Whether there is a terminal attached to stdout.
- `IOSink get nonBlocking`: A non-blocking `IOSink` for the same output.
- `bool get supportsAnsiEscapes`:
  Whether connected to a terminal that supports ANSI escape sequences.
- `int get terminalColumns`: The number of columns of the terminal.
- `int get terminalLines`: The number of lines of the terminal.

## Class: StdoutException

Exception thrown by some operations of [Stdout]

```dart
class StdoutException implements IOException { … }
```

- `StdoutException(String message, [OSError? osError])`
- `String message`: Message describing cause of the exception.
- `OSError? osError`: The underlying OS error, if available.
- `String toString()`: A string representation of this object.

## Class: SystemEncoding

The system encoding is the current code page on Windows and UTF-8 on Linux
and Mac.

```dart
final class SystemEncoding extends Encoding { … }
```

- `SystemEncoding()`: Creates a const SystemEncoding.
- `Converter<List<int>, String> get decoder`:
  Returns the decoder of `this`, converting from `List<int>` to `String`.
- `Converter<String, List<int>> get encoder`:
  Returns the encoder from `String` to `List<int>`.
- `String get name`: Name of the encoding.
- `String decode(List<int> encoded)`: Decodes [encoded] data.
- `List<int> encode(String input)`: Encodes [input].

## Class: TlsException

A secure networking exception caused by a failure in the
TLS/SSL protocol.

```dart
class TlsException implements IOException { … }
```

- `TlsException([String message, OSError? osError])`
- `String message`
- `OSError? osError`
- `String type`
- `String toString()`: A string representation of this object.

## Class: TlsProtocolVersion

A Transport Layer Security (TLS) version.

```dart
class TlsProtocolVersion { … }
```

- static `TlsProtocolVersion tls1_2`:
  Transport Layer Security (TLS) Protocol Version 1.2.
- static `TlsProtocolVersion tls1_3`:
  Transport Layer Security (TLS) Protocol Version 1.3.

## Class: WebSocket

A two-way HTTP communication object for client or server applications.

```dart
abstract class WebSocket implements Stream<dynamic>, StreamSink<dynamic> { … }
```

- `WebSocket()`
- `WebSocket.fromUpgradedSocket(Socket socket, {String? protocol, bool? serverSide, CompressionOptions compression})`:
  Creates a WebSocket from an already-upgraded socket.
- static `int closed`
- static `int closing`
- static `int connecting`: Possible states of the connection.
- static `int open`
- static `Future<WebSocket> connect(String url, {Iterable<String>? protocols, Map<String, dynamic>? headers, CompressionOptions compression, HttpClient? customClient})`:
  Create a new WebSocket connection. The URL supplied in [url]
  must use the scheme `ws` or `wss`.
- `Duration? pingInterval`: The interval between ping signals.
- `int? get closeCode`:
  The close code set when the WebSocket connection is closed. If
  there is no close code available this property will be [:null:]
- `String? get closeReason`:
  The close reason set when the WebSocket connection is closed. If
  there is no close reason available this property will be [:null:]
- `String get extensions`:
  The extensions property is initially the empty string. After the
  WebSocket connection is established this string reflects the
  extensions used by the server.
- `String? get protocol`:
  The protocol property is initially the empty string. After the
  WebSocket connection is established the value is the subprotocol
  selected by the server. If no subprotocol is negotiated the
  value will remain [:null:].
- `int get readyState`: Returns the current state of the connection.
- static `String? get userAgent`:
  Gets the user agent used for WebSocket connections.
- static `set userAgent=(String? userAgent)`:
  Sets the user agent to use for WebSocket connections.
- `void add(dynamic data)`:
  Sends data on the WebSocket connection. The data in [data] must
  be either a `String`, or a `List<int>` holding bytes.
- `Future<dynamic> addStream(Stream<dynamic> stream)`:
  Sends data from a stream on WebSocket connection. Each data event from
  [stream] will be send as a single WebSocket frame. The data from [stream]
  must be either `String`s, or `List<int>`s holding bytes.
- `void addUtf8Text(List<int> bytes)`:
  Sends a text message with the text represented by [bytes].
- `Future<dynamic> close([int? code, String? reason])`:
  Closes the WebSocket connection. Set the optional [code] and [reason]
  arguments to send close information to the remote peer. If they are
  omitted, the peer will see [WebSocketStatus.noStatusReceived] code
  with no reason.

## Class: WebSocketException

```dart
class WebSocketException implements IOException { … }
```

- `WebSocketException([String message, int? httpStatusCode])`
- `int? httpStatusCode`
- `String message`
- `String toString()`: A string representation of this object.

## Class: WebSocketStatus

WebSocket status codes used when closing a WebSocket connection.

```dart
abstract class WebSocketStatus { … }
```

- static `int abnormalClosure`
- static `int goingAway`
- static `int internalServerError`
- static `int invalidFramePayloadData`
- static `int messageTooBig`
- static `int missingMandatoryExtension`
- static `int noStatusReceived`
- static `int normalClosure`
- static `int policyViolation`
- static `int protocolError`
- static `int reserved1004`
- static `int reserved1015`
- static `int unsupportedData`

## Class: WebSocketTransformer

The [WebSocketTransformer] provides the ability to upgrade a
[HttpRequest] to a [WebSocket] connection. It supports both
upgrading a single [HttpRequest] and upgrading a stream of
[HttpRequest]s.

```dart
abstract class WebSocketTransformer
    implements StreamTransformer<HttpRequest, WebSocket> { … }
```

- `WebSocketTransformer({dynamic Function(List<String>)? protocolSelector, CompressionOptions compression})`:
  Create a new [WebSocketTransformer].
- static `bool isUpgradeRequest(HttpRequest request)`:
  Checks whether the request is a valid WebSocket upgrade request.
- static `Future<WebSocket> upgrade(HttpRequest request, {dynamic Function(List<String>)? protocolSelector, CompressionOptions compression})`:
  Upgrades an [HttpRequest] to a [WebSocket] connection. If the
  request is not a valid WebSocket upgrade request an HTTP response
  with status code 500 will be returned. Otherwise the returned
  future will complete with the [WebSocket] when the upgrade process
  is complete.

## Class: WritePipe

The "write" end of an [Pipe] created by [Pipe.create].

```dart
abstract interface class WritePipe implements IOSink { … }
```

## Class: X509Certificate

X509Certificate represents an SSL certificate, with accessors to
get the fields of the certificate.

```dart
abstract interface class X509Certificate { … }
```

- `Uint8List get der`: The DER encoded bytes of the certificate.
- `DateTime get endValidity`
- `String get issuer`
- `String get pem`: The PEM encoded String of the certificate.
- `Uint8List get sha1`: The SHA1 hash of the certificate.
- `DateTime get startValidity`
- `String get subject`

## Class: ZLibCodec

The [ZLibCodec] encodes raw bytes to ZLib compressed bytes and decodes ZLib
compressed bytes to raw bytes.

```dart
final class ZLibCodec extends Codec<List<int>, List<int>> { … }
```

- `ZLibCodec({int level, int windowBits, int memLevel, int strategy, List<int>? dictionary, bool raw, bool gzip})`
- `List<int>? dictionary`: Initial compression dictionary.
- `bool gzip`: When true, `GZip` frames will be added to the compressed data.
- `int level`:
  The compression-[level] can be set in the range of `-1..9`, with `6` being
  the default compression level. Levels above `6` will have higher
  compression rates at the cost of more CPU and memory usage. Levels below
  `6` will use less CPU and memory at the cost of lower compression rates.
- `int memLevel`:
  Specifies how much memory should be allocated for the internal compression
  state. `1` uses minimum memory but is slow and reduces compression ratio;
  `9` uses maximum memory for optimal speed. The default value is `8`.
- `bool raw`:
  When true, deflate generates raw data with no zlib header or trailer, and
  will not compute an adler32 check value
- `int strategy`:
  Tunes the compression algorithm. Use the value strategyDefault for normal
  data, strategyFiltered for data produced by a filter (or predictor),
  strategyHuffmanOnly to force Huffman encoding only (no string match), or
  strategyRle to limit match distances to one (run-length encoding).
- `int windowBits`:
  Base two logarithm of the window size (the size of the history buffer). It
  should be in the range 8..15. Larger values result in better compression at
  the expense of memory usage. The default value is 15
- `ZLibDecoder get decoder`:
  Get a [ZLibDecoder] for decoding `ZLib` compressed data.
- `ZLibEncoder get encoder`:
  Get a [ZLibEncoder] for encoding to `ZLib` compressed data.

## Class: ZLibDecoder

The [ZLibDecoder] is used by [ZLibCodec] and [GZipCodec] to decompress data.

```dart
final class ZLibDecoder extends Converter<List<int>, List<int>> { … }
```

- `ZLibDecoder({bool gzip, int windowBits, List<int>? dictionary, bool raw})`
- `List<int>? dictionary`: Initial compression dictionary.
- `bool gzip`: When true, all concatenated compressed data sets in the input are
  decompressed and concatenated in the output.
- `bool raw`:
  When true, deflate generates raw data with no zlib header or trailer, and
  will not compute an adler32 check value
- `int windowBits`:
  Base two logarithm of the window size (the size of the history buffer). It
  should be in the range `8..15`. Larger values result in better compression
  at the expense of memory usage. The default value is `15`.
- `List<int> convert(List<int> bytes)`:
  Convert a list of bytes using the options given to the [ZLibDecoder]
  constructor.
- `ByteConversionSink startChunkedConversion(Sink<List<int>> sink)`:
  Start a chunked conversion.

## Class: ZLibEncoder

The [ZLibEncoder] encoder is used by [ZLibCodec] and [GZipCodec] to compress
data.

```dart
final class ZLibEncoder extends Converter<List<int>, List<int>> { … }
```

- `ZLibEncoder({bool gzip, int level, int windowBits, int memLevel, int strategy, List<int>? dictionary, bool raw})`
- `List<int>? dictionary`: Initial compression dictionary.
- `bool gzip`: When true, `GZip` frames will be added to the compressed data.
- `int level`:
  The compression-[level] can be set in the range of `-1..9`, with `6` being
  the default compression level. Levels above `6` will have higher
  compression rates at the cost of more CPU and memory usage. Levels below
  `6` will use less CPU and memory at the cost of lower compression rates.
- `int memLevel`:
  Specifies how much memory should be allocated for the internal compression
  state. `1` uses minimum memory but is slow and reduces compression ratio;
  `9` uses maximum memory for optimal speed. The default value is `8`.
- `bool raw`:
  When true, deflate generates raw data with no zlib header or trailer, and
  will not compute an adler32 check value
- `int strategy`: Tunes the compression algorithm. Use the value
  [ZLibOption.strategyDefault] for normal data,
  [ZLibOption.strategyFiltered] for data produced by a filter
  (or predictor), [ZLibOption.strategyHuffmanOnly] to force Huffman
  encoding only (no string match), or [ZLibOption.strategyRle] to limit
  match distances to one (run-length encoding).
- `int windowBits`:
  Base two logarithm of the window size (the size of the history buffer). It
  should be in the range `8..15`. Larger values result in better compression
  at the expense of memory usage. The default value is `15`
- `List<int> convert(List<int> bytes)`:
  Convert a list of bytes using the options given to the ZLibEncoder
  constructor.
- `ByteConversionSink startChunkedConversion(Sink<List<int>> sink)`:
  Start a chunked conversion using the options given to the [ZLibEncoder]
  constructor.

## Class: ZLibOption

Exposes ZLib options for input parameters.

```dart
abstract final class ZLibOption { … }
```

- static `int defaultLevel`:
  Default value for [ZLibCodec.level] and [ZLibEncoder.level].
- static `int defaultMemLevel`:
  Default value for [ZLibCodec.memLevel] and [ZLibEncoder.memLevel].
- static `int defaultWindowBits`:
  Default value for [ZLibCodec.windowBits], [ZLibEncoder.windowBits]
  and [ZLibDecoder.windowBits].
- static `int maxLevel`:
  Maximal value for [ZLibCodec.level] and [ZLibEncoder.level]
- static `int maxMemLevel`:
  Maximal value for [ZLibCodec.memLevel] and [ZLibEncoder.memLevel].
- static `int maxWindowBits`:
  Maximal value for [ZLibCodec.windowBits], [ZLibEncoder.windowBits]
  and [ZLibDecoder.windowBits].
- static `int minLevel`:
  Minimal value for [ZLibCodec.level] and [ZLibEncoder.level].
- static `int minMemLevel`:
  Minimal value for [ZLibCodec.memLevel] and [ZLibEncoder.memLevel].
- static `int minWindowBits`:
  Minimal value for [ZLibCodec.windowBits], [ZLibEncoder.windowBits]
  and [ZLibDecoder.windowBits].
- static `int strategyDefault`: Recommended strategy for normal data
- static `int strategyFiltered`:
  Recommended strategy for data produced by a filter (or predictor)
- static `int strategyFixed`:
  This strategy prevents the use of dynamic Huffman codes, allowing for a
  simpler decoder
- static `int strategyHuffmanOnly`:
  Use this strategy to force Huffman encoding only (no string match)
- static `int strategyRle`:
  Use this strategy to limit match distances to one (run-length encoding)
