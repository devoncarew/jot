# Library: dart:isolate

Concurrent programming using _isolates_:
independent workers that are similar to threads
but don't share memory,
communicating only via messages.

*NOTE*: The `dart:isolate` library is currently only supported by the
[Dart Native](https://dart.dev/overview#platform) platform.

To use this library in your code:
```dart
import 'dart:isolate';
```
{@category VM}

## Members

## Class: Capability

An unforgeable object that comes back as equal when passed through other
isolates.

```dart
abstract interface class Capability { … }
```

- `Capability()`: Create a new unforgeable capability object.

## Class: Isolate

An isolated Dart execution context.

```dart
final class Isolate { … }
```

- `Isolate(SendPort controlPort, {Capability? pauseCapability, Capability? terminateCapability})`:
  Creates a new [Isolate] object with a restricted set of capabilities.
- static `int beforeNextEvent`:
  Argument to `ping` and `kill`: Ask for action before the next event.
- static `int immediate`: Argument to `ping` and `kill`: Ask for immediate action.
- static `Never exit([SendPort? finalMessagePort, Object? message])`:
  Terminates the current isolate synchronously.
- static `Future<Uri?> resolvePackageUri(Uri packageUri)`:
  Resolves a `package:` URI to its actual location.
- static `Uri? resolvePackageUriSync(Uri packageUri)`:
  Resolves a `package:` URI to its actual location.
- static `Future<R> run<R>(FutureOr<R> Function() computation, {String? debugName})`:
  Runs [computation] in a new isolate and returns the result.
- static `Future<Isolate> spawn<T>(void Function(T) entryPoint, T message, {bool paused, bool errorsAreFatal, SendPort? onExit, SendPort? onError, String? debugName})`:
  Spawns an isolate that shares the same code as the current isolate.
- static `Future<Isolate> spawnUri(Uri uri, List<String> args, dynamic message, {bool paused, SendPort? onExit, SendPort? onError, bool errorsAreFatal, bool? checked, Map<String, String>? environment, Uri? packageRoot, Uri? packageConfig, bool automaticPackageResolution, String? debugName})`:
  Spawns an isolate running the script file specified by [uri].
- `SendPort controlPort`:
  Control port used to send control messages to the isolate.
- `Capability? pauseCapability`:
  Capability granting the ability to pause the isolate.
- `Capability? terminateCapability`:
  Capability granting the ability to terminate the isolate.
- static `Isolate get current`:
  An [Isolate] object representing the current isolate.
- `String? get debugName`: The name of the [Isolate] displayed for debug purposes.
- `Stream<dynamic> get errors`:
  Returns a broadcast stream of uncaught errors from the isolate.
- static `Future<Uri?> get packageConfig`:
  The location of the package configuration file of the current isolate.
- static `Uri? get packageConfigSync`:
  The location of the package configuration file of the current isolate.
- `void addErrorListener(SendPort port)`:
  Requests that uncaught errors of the isolate are sent back to [port].
- `void addOnExitListener(SendPort responsePort, {Object? response})`:
  Requests an exit message on [responsePort] when the isolate terminates.
- `void kill({int priority})`: Requests the isolate to shut down.
- `Capability pause([Capability? resumeCapability])`:
  Requests the isolate to pause.
- `void ping(SendPort responsePort, {Object? response, int priority})`:
  Requests that the isolate send [response] on the [responsePort].
- `void removeErrorListener(SendPort port)`:
  Stops listening for uncaught errors from the isolate.
- `void removeOnExitListener(SendPort responsePort)`:
  Stops listening for exit messages from the isolate.
- `void resume(Capability resumeCapability)`: Resumes a paused isolate.
- `void setErrorsFatal(bool errorsAreFatal)`:
  Sets whether uncaught errors will terminate the isolate.

## Class: IsolateSpawnException

Thrown when an isolate cannot be created.

```dart
class IsolateSpawnException implements Exception { … }
```

- `IsolateSpawnException(String message)`
- `String message`: Error message reported by the spawn operation.
- `String toString()`: A string representation of this object.

## Class: RawReceivePort

A low-level asynchronous message receiver.

```dart
abstract interface class RawReceivePort { … }
```

- `RawReceivePort([Function? handler, String debugName])`:
  Opens a long-lived port for receiving messages.
- `bool keepIsolateAlive`:
  Whether this [RawReceivePort] keeps its [Isolate] alive.
- `set handler=(Function? newHandler)`:
  Sets the handler that is invoked for every incoming message.
- `SendPort get sendPort`:
  Returns a [SendPort] that sends messages to this raw receive port.
- `void close()`: Closes the port.

## Class: ReceivePort

Together with [SendPort], the only means of communication between isolates.

```dart
abstract interface class ReceivePort implements Stream<dynamic> { … }
```

- `ReceivePort([String debugName])`:
  Opens a long-lived port for receiving messages.
- `ReceivePort.fromRawReceivePort(RawReceivePort rawPort)`:
  Creates a [ReceivePort] from a [RawReceivePort].
- `SendPort get sendPort`: A [SendPort] which sends messages to this receive port.
- `void close()`: Closes the receive port.
- `StreamSubscription<dynamic> listen(void Function(dynamic)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError})`:
  Listen for events from [Stream].

## Class: RemoteError

Description of an error from another isolate.

```dart
final class RemoteError implements Error { … }
```

- `RemoteError(String description, String stackDescription)`
- `StackTrace stackTrace`
- `String toString()`: A string representation of this object.

## Class: SendPort

Sends messages to its [ReceivePort]s.

```dart
abstract interface class SendPort implements Capability { … }
```

- `int get hashCode`:
  A hash code for this send port that is consistent with the == operator.
- `bool operator==(Object other)`:
  Tests whether [other] is a [SendPort] pointing to the same
  [ReceivePort] as this one.
- `void send(Object? message)`:
  Sends an asynchronous [message] through this send port, to its
  corresponding [ReceivePort].

## Class: TransferableTypedData

An efficiently transferable sequence of byte values.

```dart
abstract final class TransferableTypedData { … }
```

- `TransferableTypedData.fromList(List<TypedData> list)`:
  Creates a new [TransferableTypedData] containing the bytes of [list].
- `ByteBuffer materialize()`:
  Creates a new [ByteBuffer] containing the bytes stored in this [TransferableTypedData].
