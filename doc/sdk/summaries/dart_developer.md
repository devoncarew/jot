# Library: dart:developer

Interact with developer tools such as the debugger and inspector.

This is a specialized library intended for interacting with the Dart runtime
programmatically for debugging and inspection. Sample uses include advanced
debugging, and creating developer tools.

This library has platform specific implementations for Dart web
and Dart Native (VM). A specific platform may not support all operations.

The functionality provided by this library is generally only available
to Dart code run in development mode, e.g., `dart run`, and not in production
mode, e.g., the output of `dart compile exe`.

## Debugging
The [debugger] function can be used to stop the program as if a breakpoint
was hit. The breakpoint will be placed right after the call to `debugger`.
This functionality can be useful for triggering breakpoints based on logic
in the code.

Example:

```dart template:main
var counter = 0;
final someInterestingValue = 1000;
while (true) {
  if (counter == someInterestingValue) {
    // Trigger a breakpoint in the debugger.
    debugger();
  }
  counter++;
}
```

When executed with `dart run --observe`, and opened in DevTools, the
debugger will be stopped with `counter` at the value `1000`.

## Inspection
Developer tools, such as Dart DevTools, connected to the runtime system
may allow for inspecting execution timing in a "timeline" view.
The static methods of [Timeline] can add extra information and timing events
to this view.

Example:

```dart
void main() {
  Timeline.timeSync('Calculation loop', () {
    for (var i = 30; i < 50; i++) {
      Timeline.timeSync('fib($i)', () {
        fibonacci(i);
      });
    }
  });
}

int fibonacci(int n) => (n < 2) ? n : fibonacci(n - 2) + fibonacci(n - 1);
```

When executed with `dart run --observe`, and opened in DevTools,
the Performance tab will display a timeline containing the annotations
passed to `timeSync`.

## Developer tools
A developer tool, like the debugger built into the `dart` command,
may access information about the running application
exposed by the runtime system,
using the [Service] and [ServiceProtocolInfo] classes.

{@category Core}

## Members

- accessor `bool get extensionStreamHasListener`:
  Whether the "Extension" stream currently has at least one listener.
- accessor `int get reachabilityBarrier`: Current reachability barrier state.
- function `void addHttpClientProfilingData(Map<String, dynamic> requestProfile)`:
  Records the data associated with an HTTP request for profiling purposes.
- function `bool debugger({bool when, String? message})`:
  If [when] is true, stop the program as if a breakpoint were hit at the
  following statement.
- function `UserTag getCurrentTag()`:
  Returns the current [UserTag] for the isolate.
- function `List<Map<String, dynamic>> getHttpClientProfilingData()`:
  Returns the data added through [addHttpClientProfilingData].
- function `Object? inspect(Object? object)`:
  Send a reference to [object] to any attached debuggers.
- function `void log(String message, {DateTime? time, int? sequenceNumber, int level, String name, Zone? zone, Object? error, StackTrace? stackTrace})`:
  Emit a log event, which can can viewed using the DevTools
  [Logging view](https://docs.flutter.dev/tools/devtools/logging).
- function `void postEvent(String eventKind, Map<dynamic, dynamic> eventData, {String stream})`:
  Post an event of [eventKind] with payload of [eventData] to the "Extension"
  event stream.
- function `void registerExtension(String method, Future<ServiceExtensionResponse> Function(String, Map<String, String>) handler)`:
  Register a [ServiceExtensionHandler] that will be invoked in this isolate
  for [method]. *NOTE*: Service protocol extensions must be registered
  in each isolate.
- type alias `typedef ServiceExtensionHandler = Future<ServiceExtensionResponse> Function(String, Map<String, String>)`:
  A service protocol extension handler. Registered with [registerExtension].
- type alias `typedef TimelineAsyncFunction = Future<dynamic> Function()`
- type alias `typedef TimelineSyncFunction<T> = T Function()`:
  A typedef for the function argument to [Timeline.timeSync].

## Class: Flow

A class to represent Flow events.

```dart
final class Flow { … }
```

- static `Flow begin({int? id})`: A "begin" Flow event.
- static `Flow end(int id)`: An "end" Flow event.
- static `Flow step(int id)`: A "step" Flow event.
- `int id`: The flow id of the flow event.

## Class: NativeRuntime

Functionality available on the native runtime.

```dart
abstract final class NativeRuntime { … }
```

- static `void writeHeapSnapshotToFile(String filepath)`:
  Writes a snapshot of the heap to [filepath].
- static `String? get buildId`: The build ID for the running application.

## Class: Service

Access information about the service protocol and control the web server
that provides access to the services provided by the Dart VM for
debugging and inspecting Dart programs.

```dart
final class Service { … }
```

- static `Future<ServiceProtocolInfo> controlWebServer({bool enable, bool? silenceOutput})`:
  Control the web server that the service protocol is accessed through.
  [enable] is used as a toggle to enable or disable the web server
  servicing requests. If [silenceOutput] is provided and is true,
  the server will not output information to the console.
- static `Future<ServiceProtocolInfo> getInfo()`:
  Get information about the service protocol (version number and
  Uri to access the service).
- static `String? getIsolateID(Isolate isolate)`:
  Returns a [String] token representing the ID of [isolate].
- static `String? getIsolateId(Isolate isolate)`:
  Returns a [String] token representing the ID of [isolate].
- static `String? getObjectId(Object object)`:
  Returns a [String] token representing the ID of [object].

## Class: ServiceExtensionResponse

A response to a service protocol extension RPC.

```dart
final class ServiceExtensionResponse { … }
```

- `ServiceExtensionResponse.error(int errorCode, String errorDetail)`:
  Creates an error response to a service protocol extension RPC.
- `ServiceExtensionResponse.result(String result)`:
  Creates a successful response to a service protocol extension RPC.
- static `int extensionError`: Generic extension error code.
- static `int extensionErrorMax`: Maximum extension provided error code.
- static `int extensionErrorMin`: Minimum extension provided error code.
- static `int invalidParams`: Invalid method parameter(s) error code.
- `int? errorCode`:
  The error code associated with a failed service protocol extension RPC.
- `String? errorDetail`: The details of a failed service protocol extension RPC.
- `String? result`: The result of a successful service protocol extension RPC.
- `bool isError()`: Determines if this response represents an error.

## Class: ServiceProtocolInfo

Service protocol is the protocol that a client like the Observatory
could use to access the services provided by the Dart VM for
debugging and inspecting Dart programs. This class encapsulates the
version number and Uri for accessing this service.

```dart
final class ServiceProtocolInfo { … }
```

- `ServiceProtocolInfo(Uri? serverUri)`
- `int majorVersion`:
  The major version of the protocol. If the running Dart environment does
  not support the service protocol, this is 0.
- `int minorVersion`:
  The minor version of the protocol. If the running Dart environment does
  not support the service protocol, this is 0.
- `Uri? serverUri`:
  The Uri to connect to the debugger client hosted by the service. If the
  web server is not running, this will be null.
- `Uri? get serverWebSocketUri`:
  The Uri to connect to the service via web socket. If the web server is
  not running, this will be null.
- `String toString()`: A string representation of this object.

## Class: Timeline

Add to the timeline.

```dart
abstract final class Timeline { … }
```

- static `void finishSync()`:
  Finish the last synchronous operation that was started.
- static `void instantSync(String name, {Map<dynamic, dynamic>? arguments})`:
  Emit an instant event.
- static `void startSync(String name, {Map<dynamic, dynamic>? arguments, Flow? flow})`:
  Start a synchronous operation labeled [name]. Optionally takes
  a [Map] of [arguments]. This slice may also optionally be associated with
  a [Flow] event. This operation must be finished before
  returning to the event queue.
- static `T timeSync<T>(String name, T Function() function, {Map<dynamic, dynamic>? arguments, Flow? flow})`:
  A utility method to time a synchronous [function]. Internally calls
  [function] bracketed by calls to [startSync] and [finishSync].
- static `int get now`:
  The current time stamp from the clock used by the timeline. Units are
  microseconds.

## Class: TimelineTask

An asynchronous task on the timeline. An asynchronous task can have many
(nested) synchronous operations. Synchronous operations can live longer than
the current isolate event. To pass a [TimelineTask] to another isolate,
you must first call [pass] to get the task id and then construct a new
[TimelineTask] in the other isolate.

```dart
final class TimelineTask { … }
```

- `TimelineTask({TimelineTask? parent, String? filterKey})`:
  Create a task. The task ID will be set by the system.
- `TimelineTask.withTaskId(int taskId, {String? filterKey})`:
  Create a task with an explicit [taskId]. This is useful if you are
  passing a task from one isolate to another.
- `void finish({Map<dynamic, dynamic>? arguments})`:
  Finish the last synchronous operation that was started.
  Optionally takes a [Map] of [arguments].
- `void instant(String name, {Map<dynamic, dynamic>? arguments})`:
  Emit an instant event for this task.
  Optionally takes a [Map] of [arguments].
- `int pass()`:
  Retrieve the [TimelineTask]'s task id. Will throw an exception if the
  stack is not empty.
- `void start(String name, {Map<dynamic, dynamic>? arguments})`:
  Start a synchronous operation within this task named [name].
  Optionally takes a [Map] of [arguments].

## Class: UserTag

A UserTag can be used to group samples in the
[DevTools CPU profiler](https://docs.flutter.dev/tools/devtools/cpu-profiler).

```dart
abstract final class UserTag { … }
```

- `UserTag(String label)`
- static `int maxUserTags`:
  The maximum number of UserTag instances that can be created by a program.
- static `UserTag get defaultTag`: The default [UserTag] with label 'Default'.
- `String get label`: Label of this [UserTag].
- `UserTag makeCurrent()`:
  Make this [UserTag] the current tag for the isolate. Returns the current
  tag before setting.
