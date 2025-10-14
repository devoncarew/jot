# Library: dart:async

Support for asynchronous programming,
with classes such as Future and Stream.

[Future]s and [Stream]s are the fundamental building blocks
of asynchronous programming in Dart. They are supported
directly in the language through `async` and `async*`
functions, and are available to all libraries through
the `dart:core` library.

This library provides further tools for creating, consuming
and transforming futures and streams, as well as direct access to
other asynchronous primitives like [timers][Timer],
[microtasks][scheduleMicrotask] and [zones][Zone].

To use this library in your code:
```dart
import 'dart:async';
```
## Future

A Future object represents a computation whose return value
might not yet be available.
The Future returns the value of the computation
when it completes at some time in the future.
Futures are often used for APIs that are implemented using a
different thread or isolate (e.g., the asynchronous I/O
operations of `dart:io` or HTTP requests of `dart:html`).

Many methods in the Dart libraries return `Future`s when
performing tasks. For example, when binding an `HttpServer`
to a host and port, the `bind()` method returns a Future.
```dart import:io
 HttpServer.bind('127.0.0.1', 4444)
     .then((server) => print('${server.isBroadcast}'))
     .catchError(print);
```
[Future.then] registers a callback function that runs
when the Future's operation, in this case the `bind()` method,
completes successfully.
The value returned by the operation
is passed into the callback function.
In this example, the `bind()` method returns the HttpServer
object. The callback function prints one of its properties.
[Future.catchError] registers a callback function that
runs if an error occurs within the Future.

## Stream

A Stream provides an asynchronous sequence of data.
Examples of data sequences include individual events, like mouse clicks,
or sequential chunks of larger data, like multiple byte lists with the
contents of a file
such as mouse clicks, and a stream of byte lists read from a file.
The following example opens a file for reading.
[Stream.listen] registers callback functions that run
each time more data is available, an error has occurred, or
the stream has finished.
Further functionality is provided on [Stream], implemented by calling
[Stream.listen] to get the actual data.
```dart import:io import:convert
Stream<List<int>> stream = File('quotes.txt').openRead();
stream.transform(utf8.decoder).forEach(print);
```
This stream emits a sequence of lists of bytes.
The program must then handle those lists of bytes in some way.
Here, the code uses a UTF-8 decoder (provided in the `dart:convert` library)
to convert the sequence of bytes into a sequence
of Dart strings.

Another common use of streams is for user-generated events
in a web app: The following code listens for mouse clicks on a button.
```dart import:html
querySelector('#myButton')!.onClick.forEach((_) => print('Click.'));
```
## Other resources

* The [dart:async section of the library tour][asynchronous-programming]:
  A brief overview of asynchronous programming.

* [Use Future-Based APIs][futures-tutorial]: A closer look at Futures and
  how to use them to write asynchronous Dart code.

* [Futures and Error Handling][futures-error-handling]: Everything you
  wanted to know about handling errors and exceptions when working with
  Futures (but were afraid to ask).

* [The Event Loop and Dart](https://dart.dev/articles/event-loop/):
  Learn how Dart handles the event queue and microtask queue, so you can
  write better asynchronous code with fewer surprises.

* [test package: Asynchronous Tests][test-readme]: How to test asynchronous
  code.

[asynchronous-programming]: https://dart.dev/guides/libraries/library-tour#dartasync---asynchronous-programming
[futures-tutorial]: https://dart.dev/codelabs/async-await
[futures-error-handling]: https://dart.dev/guides/libraries/futures-error-handling
[test-readme]: https://pub.dev/packages/test

{@category Core}

## Members

- function `R runZoned<R>(R Function() body, {Map<Object?, Object?>? zoneValues, ZoneSpecification? zoneSpecification, Function? onError})`:
  Runs [body] in its own zone.
- function `R? runZonedGuarded<R>(R Function() body, void Function(Object, StackTrace) onError, {Map<Object?, Object?>? zoneValues, ZoneSpecification? zoneSpecification})`:
  Runs [body] in its own error zone.
- function `void scheduleMicrotask(void Function() callback)`:
  Runs a function asynchronously.
- function `void unawaited(Future<void>? future)`: Explicitly ignores a future.
- type alias `typedef ControllerCallback = void Function()`:
  Type of a stream controller's `onListen`, `onPause` and `onResume`
  callbacks.
- type alias `typedef ControllerCancelCallback = FutureOr<void> Function()`:
  Type of stream controller `onCancel` callbacks.
- type alias `typedef CreatePeriodicTimerHandler = Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function(Timer))`:
  The type of a custom [Zone.createPeriodicTimer] implementation function.
- type alias `typedef CreateTimerHandler = Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function())`:
  The type of a custom [Zone.createTimer] implementation function.
- type alias `typedef ErrorCallbackHandler = AsyncError? Function(Zone, ZoneDelegate, Zone, Object, StackTrace?)`:
  The type of a custom [Zone.errorCallback] implementation function.
- type alias `typedef ForkHandler = Zone Function(Zone, ZoneDelegate, Zone, ZoneSpecification?, Map<Object?, Object?>?)`:
  The type of a custom [Zone.fork] implementation function.
- type alias `typedef HandleUncaughtErrorHandler = void Function(Zone, ZoneDelegate, Zone, Object, StackTrace)`:
  The type of a custom [Zone.handleUncaughtError] implementation function.
- type alias `typedef PrintHandler = void Function(Zone, ZoneDelegate, Zone, String)`:
  The type of a custom [Zone.print] implementation function.
- type alias `typedef RegisterBinaryCallbackHandler = R Function(T1, T2) Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2))`:
  The type of a custom [Zone.registerBinaryCallback] implementation function.
- type alias `typedef RegisterCallbackHandler = R Function() Function<R>(Zone, ZoneDelegate, Zone, R Function())`:
  The type of a custom [Zone.registerCallback] implementation function.
- type alias `typedef RegisterUnaryCallbackHandler = R Function(T) Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T))`:
  The type of a custom [Zone.registerUnaryCallback] implementation function.
- type alias `typedef RunBinaryHandler = R Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2), T1, T2)`:
  The type of a custom [Zone.runBinary] implementation function.
- type alias `typedef RunHandler = R Function<R>(Zone, ZoneDelegate, Zone, R Function())`:
  The type of a custom [Zone.run] implementation function.
- type alias `typedef RunUnaryHandler = R Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T), T)`:
  The type of a custom [Zone.runUnary] implementation function.
- type alias `typedef ScheduleMicrotaskHandler = void Function(Zone, ZoneDelegate, Zone, void Function())`:
  The type of a custom [Zone.scheduleMicrotask] implementation function.
- type alias `typedef ZoneBinaryCallback<R, T1, T2> = R Function(T1, T2)`
- type alias `typedef ZoneCallback<R> = R Function()`
- type alias `typedef ZoneUnaryCallback<R, T> = R Function(T)`

## Class: AsyncError

An error and a stack trace.

```dart
final class AsyncError implements Error { … }
```

- `AsyncError(Object error, StackTrace? stackTrace)`
- static `StackTrace defaultStackTrace(Object error)`:
  A default stack trace for an error.
- `Object error`
- `StackTrace stackTrace`
- `String toString()`: A string representation of this object.

## Class: Completer

A way to produce Future objects and to complete them later
with a value or error.

```dart
abstract interface class Completer<T> { … }
```

- `Completer()`: Creates a new completer.
- `Completer.sync()`: Completes the future synchronously.
- `Future<T> get future`: The future that is completed by this completer.
- `bool get isCompleted`: Whether the [future] has been completed.
- `void complete([FutureOr<T>? value])`:
  Completes [future] with the supplied values.
- `void completeError(Object error, [StackTrace? stackTrace])`:
  Complete [future] with an error.

## Class: DeferredLoadException

Thrown when a deferred library fails to load.

```dart
final class DeferredLoadException implements Exception { … }
```

- `DeferredLoadException(String message)`
- `String toString()`: A string representation of this object.

## Class: EventSink

A [Sink] that supports adding errors.

```dart
abstract interface class EventSink<T> implements Sink<T> { … }
```

- `void add(T event)`: Adds a data [event] to the sink.
- `void addError(Object error, [StackTrace? stackTrace])`:
  Adds an [error] to the sink.
- `void close()`: Closes the sink.

## Class: Future

The result of an asynchronous computation.

```dart
abstract interface class Future<T> { … }
```

- `Future(FutureOr<T> Function() computation)`:
  Creates a future containing the result of calling [computation]
  asynchronously with [Timer.run].
- `Future.delayed(Duration duration, [FutureOr<T> Function()? computation])`:
  Creates a future that runs its computation after a delay.
- `Future.error(Object error, [StackTrace? stackTrace])`:
  Creates a future that completes with an error.
- `Future.microtask(FutureOr<T> Function() computation)`:
  Creates a future containing the result of calling [computation]
  asynchronously with [scheduleMicrotask].
- `Future.sync(FutureOr<T> Function() computation)`:
  The result of calling [computation] as a future.
- `Future.syncValue(T value)`: Creates a future completed with [value].
- `Future.value([FutureOr<T>? value])`: Creates a future completed with [value].
- static `Future<T> any<T>(Iterable<Future<T>> futures)`:
  Returns the result of the first future in [futures] to complete.
- static `Future<void> doWhile(FutureOr<bool> Function() action)`:
  Performs an operation repeatedly until it returns `false`.
- static `Future<void> forEach<T>(Iterable<T> elements, FutureOr<dynamic> Function(T) action)`:
  Performs an action for each element of the iterable, in turn.
- static `Future<List<T>> wait<T>(Iterable<Future<T>> futures, {bool eagerError, void Function(T)? cleanUp})`:
  Waits for multiple futures to complete and collects their results.
- `Stream<T> asStream()`: Creates a [Stream] containing the result of this future.
- `Future<T> catchError(Function onError, {bool Function(Object)? test})`:
  Handles errors emitted by this [Future].
- `Future<R> then<R>(FutureOr<R> Function(T) onValue, {Function? onError})`:
  Register callbacks to be called when this future completes.
- `Future<T> timeout(Duration timeLimit, {FutureOr<T> Function()? onTimeout})`:
  Stop waiting for this future after [timeLimit] has passed.
- `Future<T> whenComplete(FutureOr<void> Function() action)`:
  Registers a function to be called when this future completes.

## Class: FutureOr

A type representing values that are either `Future<T>` or `T`.

```dart
abstract class FutureOr<T> { … }
```

## Class: MultiStreamController

An enhanced stream controller provided by [Stream.multi].

```dart
abstract interface class MultiStreamController<T>
    implements StreamController<T> { … }
```

- `void addErrorSync(Object error, [StackTrace? stackTrace])`:
  Adds and delivers an error event.
- `void addSync(T value)`: Adds and delivers an event.
- `void closeSync()`: Closes the controller and delivers a done event.

## Class: ParallelWaitError

Error thrown when waiting for multiple futures, when some have errors.

```dart
class ParallelWaitError<V, E> extends Error { … }
```

- `ParallelWaitError(V values, E errors, {int? errorCount, AsyncError? defaultError})`:
  Creates error with the provided [values] and [errors].
- `E errors`: Errors of failing futures.
- `V values`: Values of successful futures.
- `StackTrace? get stackTrace`:
  The stack trace at the point where this error was first thrown.
- `String toString()`: A string representation of this object.

## Class: Stream

A source of asynchronous data events.

```dart
abstract mixin class Stream<T> { … }
```

- `Stream()`
- `Stream.empty({bool broadcast})`: Creates an empty broadcast stream.
- `Stream.error(Object error, [StackTrace? stackTrace])`:
  Creates a stream which emits a single error event before completing.
- `Stream.eventTransformed(Stream<dynamic> source, EventSink<dynamic> Function(EventSink<T>) mapSink)`:
  Creates a stream where all events of an existing stream are piped through
  a sink-transformation.
- `Stream.fromFuture(Future<T> future)`:
  Creates a new single-subscription stream from the future.
- `Stream.fromFutures(Iterable<Future<T>> futures)`:
  Create a single-subscription stream from a group of futures.
- `Stream.fromIterable(Iterable<T> elements)`:
  Creates a stream that gets its data from [elements].
- `Stream.multi(void Function(MultiStreamController<T>) onListen, {bool isBroadcast})`:
  Creates a multi-subscription stream.
- `Stream.periodic(Duration period, [T Function(int)? computation])`:
  Creates a stream that repeatedly emits events at [period] intervals.
- `Stream.value(T value)`:
  Creates a stream which emits a single data event before closing.
- static `Stream<T> castFrom<S, T>(Stream<S> source)`:
  Adapts [source] to be a `Stream<T>`.
- `Future<T> get first`: The first element of this stream.
- `bool get isBroadcast`: Whether this stream is a broadcast stream.
- `Future<bool> get isEmpty`: Whether this stream contains any elements.
- `Future<T> get last`: The last element of this stream.
- `Future<int> get length`: The number of elements in this stream.
- `Future<T> get single`: The single element of this stream.
- `Future<bool> any(bool Function(T) test)`:
  Checks whether [test] accepts any element provided by this stream.
- `Stream<T> asBroadcastStream({void Function(StreamSubscription<T>)? onListen, void Function(StreamSubscription<T>)? onCancel})`:
  Returns a multi-subscription stream that produces the same events as this.
- `Stream<E> asyncExpand<E>(Stream<E>? Function(T) convert)`:
  Transforms each element into a sequence of asynchronous events.
- `Stream<E> asyncMap<E>(FutureOr<E> Function(T) convert)`:
  Creates a new stream with each data event of this stream asynchronously
  mapped to a new event.
- `Stream<R> cast<R>()`: Adapt this stream to be a `Stream<R>`.
- `Future<bool> contains(Object? needle)`:
  Returns whether [needle] occurs in the elements provided by this stream.
- `Stream<T> distinct([bool Function(T, T)? equals])`:
  Skips data events if they are equal to the previous data event.
- `Future<E> drain<E>([E? futureValue])`:
  Discards all data on this stream, but signals when it is done or an error
  occurred.
- `Future<T> elementAt(int index)`:
  Returns the value of the [index]th data event of this stream.
- `Future<bool> every(bool Function(T) test)`:
  Checks whether [test] accepts all elements provided by this stream.
- `Stream<S> expand<S>(Iterable<S> Function(T) convert)`:
  Transforms each element of this stream into a sequence of elements.
- `Future<T> firstWhere(bool Function(T) test, {T Function()? orElse})`:
  Finds the first element of this stream matching [test].
- `Future<S> fold<S>(S initialValue, S Function(S, T) combine)`:
  Combines a sequence of values by repeatedly applying [combine].
- `Future<void> forEach(void Function(T) action)`:
  Executes [action] on each element of this stream.
- `Stream<T> handleError(Function onError, {bool Function(dynamic)? test})`:
  Creates a wrapper Stream that intercepts some errors from this stream.
- `Future<String> join([String separator])`:
  Combines the string representation of elements into a single string.
- `Future<T> lastWhere(bool Function(T) test, {T Function()? orElse})`:
  Finds the last element in this stream matching [test].
- `StreamSubscription<T> listen(void Function(T)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError})`:
  Adds a subscription to this stream.
- `Stream<S> map<S>(S Function(T) convert)`:
  Transforms each element of this stream into a new stream event.
- `Future<dynamic> pipe(StreamConsumer<T> streamConsumer)`:
  Pipes the events of this stream into [streamConsumer].
- `Future<T> reduce(T Function(T, T) combine)`:
  Combines a sequence of values by repeatedly applying [combine].
- `Future<T> singleWhere(bool Function(T) test, {T Function()? orElse})`:
  Finds the single element in this stream matching [test].
- `Stream<T> skip(int count)`:
  Skips the first [count] data events from this stream.
- `Stream<T> skipWhile(bool Function(T) test)`:
  Skip data events from this stream while they are matched by [test].
- `Stream<T> take(int count)`:
  Provides at most the first [count] data events of this stream.
- `Stream<T> takeWhile(bool Function(T) test)`:
  Forwards data events while [test] is successful.
- `Stream<T> timeout(Duration timeLimit, {void Function(EventSink<T>)? onTimeout})`:
  Creates a new stream with the same events as this stream.
- `Future<List<T>> toList()`: Collects all elements of this stream in a [List].
- `Future<Set<T>> toSet()`: Collects the data of this stream in a [Set].
- `Stream<S> transform<S>(StreamTransformer<T, S> streamTransformer)`:
  Applies [streamTransformer] to this stream.
- `Stream<T> where(bool Function(T) test)`:
  Creates a new stream from this stream that discards some elements.

## Class: StreamConsumer

Abstract interface for a "sink" accepting multiple entire streams.

```dart
abstract interface class StreamConsumer<S> { … }
```

- `Future<dynamic> addStream(Stream<S> stream)`:
  Consumes the elements of [stream].
- `Future<dynamic> close()`:
  Tells the consumer that no further streams will be added.

## Class: StreamController

A controller with the stream it controls.

```dart
abstract interface class StreamController<T> implements StreamSink<T> { … }
```

- `StreamController({void Function()? onListen, void Function()? onPause, void Function()? onResume, FutureOr<void> Function()? onCancel, bool sync})`:
  A controller with a [stream] that supports only one single subscriber.
- `StreamController.broadcast({void Function()? onListen, void Function()? onCancel, bool sync})`:
  A controller where [stream] can be listened to more than once.
- `FutureOr<void> Function()? onCancel`:
  The callback which is called when the stream is canceled.
- `void Function()? onListen`:
  The callback which is called when the stream is listened to.
- `void Function()? onPause`:
  The callback which is called when the stream is paused.
- `void Function()? onResume`:
  The callback which is called when the stream is resumed.
- `Future<dynamic> get done`:
  A future which is completed when the stream controller is done
  sending events.
- `bool get hasListener`: Whether there is a subscriber on the [Stream].
- `bool get isClosed`:
  Whether the stream controller is closed for adding more events.
- `bool get isPaused`: Whether the subscription would need to buffer events.
- `StreamSink<T> get sink`:
  Returns a view of this object that only exposes the [StreamSink] interface.
- `Stream<T> get stream`: The stream that this controller is controlling.
- `void add(T event)`: Sends a data [event].
- `void addError(Object error, [StackTrace? stackTrace])`:
  Sends or enqueues an error event.
- `Future<dynamic> addStream(Stream<T> source, {bool? cancelOnError})`:
  Receives events from [source] and puts them into this controller's stream.
- `Future<dynamic> close()`: Closes the stream.

## Class: StreamIterator

An [Iterator]-like interface for the values of a [Stream].

```dart
abstract interface class StreamIterator<T> { … }
```

- `StreamIterator(Stream<T> stream)`: Create a [StreamIterator] on [stream].
- `T get current`: The current value of the stream.
- `Future<dynamic> cancel()`:
  Cancels the stream iterator (and the underlying stream subscription) early.
- `Future<bool> moveNext()`: Wait for the next stream value to be available.

## Class: StreamSink

A object that accepts stream events both synchronously and asynchronously.

```dart
abstract interface class StreamSink<S>
    implements EventSink<S>, StreamConsumer<S> { … }
```

- `Future<dynamic> get done`:
  Return a future which is completed when the [StreamSink] is finished.
- `Future<dynamic> close()`:
  Tells the stream sink that no further streams will be added.

## Class: StreamSubscription

A subscription on events from a [Stream].

```dart
abstract interface class StreamSubscription<T> { … }
```

- `bool get isPaused`: Whether the [StreamSubscription] is currently paused.
- `Future<E> asFuture<E>([E? futureValue])`:
  Returns a future that handles the [onDone] and [onError] callbacks.
- `Future<void> cancel()`: Cancels this subscription.
- `void onData(void Function(T)? handleData)`:
  Replaces the data event handler of this subscription.
- `void onDone(void Function()? handleDone)`:
  Replaces the done event handler of this subscription.
- `void onError(Function? handleError)`:
  Replaces the error event handler of this subscription.
- `void pause([Future<void>? resumeSignal])`:
  Requests that the stream pauses events until further notice.
- `void resume()`: Resumes after a pause.

## Class: StreamTransformer

Transforms a Stream.

```dart
abstract interface class StreamTransformer<S, T> { … }
```

- `StreamTransformer(StreamSubscription<T> Function(Stream<S>, bool) onListen)`:
  Creates a [StreamTransformer] based on the given [onListen] callback.
- `StreamTransformer.fromBind(Stream<T> Function(Stream<S>) bind)`:
  Creates a [StreamTransformer] based on a [bind] callback.
- `StreamTransformer.fromHandlers({void Function(S, EventSink<T>)? handleData, void Function(Object, StackTrace, EventSink<T>)? handleError, void Function(EventSink<T>)? handleDone})`:
  Creates a [StreamTransformer] that delegates events to the given functions.
- static `StreamTransformer<TS, TT> castFrom<SS, ST, TS, TT>(StreamTransformer<SS, ST> source)`:
  Adapts [source] to be a `StreamTransformer<TS, TT>`.
- `Stream<T> bind(Stream<S> stream)`: Transforms the provided [stream].
- `StreamTransformer<RS, RT> cast<RS, RT>()`:
  Provides a `StreamTransformer<RS, RT>` view of this stream transformer.

## Class: StreamTransformerBase

Base class for implementing [StreamTransformer].

```dart
abstract class StreamTransformerBase<S, T>
    implements StreamTransformer<S, T> { … }
```

- `StreamTransformerBase()`
- `StreamTransformer<RS, RT> cast<RS, RT>()`:
  Provides a `StreamTransformer<RS, RT>` view of this stream transformer.

## Class: StreamView

[Stream] wrapper that only exposes the [Stream] interface.

```dart
class StreamView<T> extends Stream<T> { … }
```

- `StreamView(Stream<T> stream)`
- `bool get isBroadcast`: Whether this stream is a broadcast stream.
- `Stream<T> asBroadcastStream({void Function(StreamSubscription<T>)? onListen, void Function(StreamSubscription<T>)? onCancel})`:
  Returns a multi-subscription stream that produces the same events as this.
- `StreamSubscription<T> listen(void Function(T)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError})`:
  Adds a subscription to this stream.

## Class: SynchronousStreamController

A stream controller that delivers its events synchronously.

```dart
abstract interface class SynchronousStreamController<T>
    implements StreamController<T> { … }
```

- `void add(T data)`: Adds event to the controller's stream.
- `void addError(Object error, [StackTrace? stackTrace])`:
  Adds error to the controller's stream.
- `Future<dynamic> close()`: Closes the controller's stream.

## Class: TimeoutException

Thrown when a scheduled timeout happens while waiting for an async result.

```dart
class TimeoutException implements Exception { … }
```

- `TimeoutException(String? message, [Duration? duration])`
- `Duration? duration`: The duration that was exceeded.
- `String? message`: Description of the cause of the timeout.
- `String toString()`: A string representation of this object.

## Class: Timer

A countdown timer that can be configured to fire once or repeatedly.

```dart
abstract interface class Timer { … }
```

- `Timer(Duration duration, void Function() callback)`: Creates a new timer.
- `Timer.periodic(Duration duration, void Function(Timer) callback)`:
  Creates a new repeating timer.
- static `void run(void Function() callback)`:
  Runs the given [callback] asynchronously as soon as possible.
- `bool get isActive`: Returns whether the timer is still active.
- `int get tick`: The number of durations preceding the most recent timer event.
- `void cancel()`: Cancels the timer.

## Class: Zone

A zone represents an environment that remains stable across asynchronous
calls.

```dart
abstract final class Zone { … }
```

- static `Zone root`: The root zone.
- static `Zone get current`: The zone that is currently active.
- `Zone get errorZone`:
  The error zone is responsible for dealing with uncaught errors.
- `Zone? get parent`: The parent zone of the this zone.
- `dynamic operator[](Object? key)`:
  Retrieves the zone-value associated with [key].
- `R Function(T1, T2) bindBinaryCallback<R, T1, T2>(R Function(T1, T2) callback)`:
  Registers the provided [callback] and returns a function that will
  execute in this zone.
- `void Function(T1, T2) bindBinaryCallbackGuarded<T1, T2>(void Function(T1, T2) callback)`:
   Registers the provided [callback] and returns a function that will
   execute in this zone.
- `R Function() bindCallback<R>(R Function() callback)`:
  Registers the provided [callback] and returns a function that will
  execute in this zone.
- `void Function() bindCallbackGuarded(void Function() callback)`:
  Registers the provided [callback] and returns a function that will
  execute in this zone.
- `R Function(T) bindUnaryCallback<R, T>(R Function(T) callback)`:
  Registers the provided [callback] and returns a function that will
  execute in this zone.
- `void Function(T) bindUnaryCallbackGuarded<T>(void Function(T) callback)`:
  Registers the provided [callback] and returns a function that will
  execute in this zone.
- `Timer createPeriodicTimer(Duration period, void Function(Timer) callback)`:
  Creates a periodic [Timer] where the callback is executed in this zone.
- `Timer createTimer(Duration duration, void Function() callback)`:
  Creates a [Timer] where the callback is executed in this zone.
- `AsyncError? errorCallback(Object error, StackTrace? stackTrace)`:
  Intercepts errors when added programmatically to a [Future] or [Stream].
- `Zone fork({ZoneSpecification? specification, Map<Object?, Object?>? zoneValues})`:
  Creates a new zone as a child zone of this zone.
- `void handleUncaughtError(Object error, StackTrace stackTrace)`:
  Handles uncaught asynchronous errors.
- `bool inSameErrorZone(Zone otherZone)`:
  Whether this zone and [otherZone] are in the same error zone.
- `void print(String line)`: Prints the given [line].
- `R Function(T1, T2) registerBinaryCallback<R, T1, T2>(R Function(T1, T2) callback)`:
  Registers the given callback in this zone.
- `R Function() registerCallback<R>(R Function() callback)`:
  Registers the given callback in this zone.
- `R Function(T) registerUnaryCallback<R, T>(R Function(T) callback)`:
  Registers the given callback in this zone.
- `R run<R>(R Function() action)`: Executes [action] in this zone.
- `R runBinary<R, T1, T2>(R Function(T1, T2) action, T1 argument1, T2 argument2)`:
  Executes the given [action] with [argument1] and [argument2] in this
  zone.
- `void runBinaryGuarded<T1, T2>(void Function(T1, T2) action, T1 argument1, T2 argument2)`:
  Executes the given [action] with [argument1] and [argument2] in this
  zone and catches synchronous errors.
- `void runGuarded(void Function() action)`:
  Executes the given [action] in this zone and catches synchronous
  errors.
- `R runUnary<R, T>(R Function(T) action, T argument)`:
  Executes the given [action] with [argument] in this zone.
- `void runUnaryGuarded<T>(void Function(T) action, T argument)`:
  Executes the given [action] with [argument] in this zone and
  catches synchronous errors.
- `void scheduleMicrotask(void Function() callback)`:
  Runs [callback] asynchronously in this zone.

## Class: ZoneDelegate

An adapted view of the parent zone.

```dart
abstract final class ZoneDelegate { … }
```

- `Timer createPeriodicTimer(Zone zone, Duration period, void Function(Timer) f)`
- `Timer createTimer(Zone zone, Duration duration, void Function() f)`
- `AsyncError? errorCallback(Zone zone, Object error, StackTrace? stackTrace)`
- `Zone fork(Zone zone, ZoneSpecification? specification, Map<dynamic, dynamic>? zoneValues)`
- `void handleUncaughtError(Zone zone, Object error, StackTrace stackTrace)`
- `void print(Zone zone, String line)`
- `R Function(T1, T2) registerBinaryCallback<R, T1, T2>(Zone zone, R Function(T1, T2) f)`
- `R Function() registerCallback<R>(Zone zone, R Function() f)`
- `R Function(T) registerUnaryCallback<R, T>(Zone zone, R Function(T) f)`
- `R run<R>(Zone zone, R Function() f)`
- `R runBinary<R, T1, T2>(Zone zone, R Function(T1, T2) f, T1 arg1, T2 arg2)`
- `R runUnary<R, T>(Zone zone, R Function(T) f, T arg)`
- `void scheduleMicrotask(Zone zone, void Function() f)`

## Class: ZoneSpecification

A parameter object with custom zone function handlers for [Zone.fork].

```dart
abstract final class ZoneSpecification { … }
```

- `ZoneSpecification({void Function(Zone, ZoneDelegate, Zone, Object, StackTrace)? handleUncaughtError, R Function<R>(Zone, ZoneDelegate, Zone, R Function())? run, R Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T), T)? runUnary, R Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2), T1, T2)? runBinary, R Function() Function<R>(Zone, ZoneDelegate, Zone, R Function())? registerCallback, R Function(T) Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T))? registerUnaryCallback, R Function(T1, T2) Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2))? registerBinaryCallback, AsyncError? Function(Zone, ZoneDelegate, Zone, Object, StackTrace?)? errorCallback, void Function(Zone, ZoneDelegate, Zone, void Function())? scheduleMicrotask, Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function())? createTimer, Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function(Timer))? createPeriodicTimer, void Function(Zone, ZoneDelegate, Zone, String)? print, Zone Function(Zone, ZoneDelegate, Zone, ZoneSpecification?, Map<Object?, Object?>?)? fork})`:
  Creates a specification with the provided handlers.
- `ZoneSpecification.from(ZoneSpecification other, {void Function(Zone, ZoneDelegate, Zone, Object, StackTrace)? handleUncaughtError, R Function<R>(Zone, ZoneDelegate, Zone, R Function())? run, R Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T), T)? runUnary, R Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2), T1, T2)? runBinary, R Function() Function<R>(Zone, ZoneDelegate, Zone, R Function())? registerCallback, R Function(T) Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T))? registerUnaryCallback, R Function(T1, T2) Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2))? registerBinaryCallback, AsyncError? Function(Zone, ZoneDelegate, Zone, Object, StackTrace?)? errorCallback, void Function(Zone, ZoneDelegate, Zone, void Function())? scheduleMicrotask, Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function())? createTimer, Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function(Timer))? createPeriodicTimer, void Function(Zone, ZoneDelegate, Zone, String)? print, Zone Function(Zone, ZoneDelegate, Zone, ZoneSpecification?, Map<Object?, Object?>?)? fork})`:
  Creates a specification from [other] and provided handlers.
- `Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function(Timer))? get createPeriodicTimer`:
  A custom [Zone.createPeriodicTimer] implementation for a new zone.
- `Timer Function(Zone, ZoneDelegate, Zone, Duration, void Function())? get createTimer`:
  A custom [Zone.createTimer] implementation for a new zone.
- `AsyncError? Function(Zone, ZoneDelegate, Zone, Object, StackTrace?)? get errorCallback`:
  A custom [Zone.errorCallback] implementation for a new zone.
- `Zone Function(Zone, ZoneDelegate, Zone, ZoneSpecification?, Map<Object?, Object?>?)? get fork`:
  A custom [Zone.handleUncaughtError] implementation for a new zone.
- `void Function(Zone, ZoneDelegate, Zone, Object, StackTrace)? get handleUncaughtError`:
  A custom [Zone.handleUncaughtError] implementation for a new zone.
- `void Function(Zone, ZoneDelegate, Zone, String)? get print`:
  A custom [Zone.print] implementation for a new zone.
- `R Function(T1, T2) Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2))? get registerBinaryCallback`:
  A custom [Zone.registerBinaryCallback] implementation for a new zone.
- `R Function() Function<R>(Zone, ZoneDelegate, Zone, R Function())? get registerCallback`:
  A custom [Zone.registerCallback] implementation for a new zone.
- `R Function(T) Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T))? get registerUnaryCallback`:
  A custom [Zone.registerUnaryCallback] implementation for a new zone.
- `R Function<R>(Zone, ZoneDelegate, Zone, R Function())? get run`:
  A custom [Zone.run] implementation for a new zone.
- `R Function<R, T1, T2>(Zone, ZoneDelegate, Zone, R Function(T1, T2), T1, T2)? get runBinary`:
  A custom [Zone.runBinary] implementation for a new zone.
- `R Function<R, T>(Zone, ZoneDelegate, Zone, R Function(T), T)? get runUnary`:
  A custom [Zone.runUnary] implementation for a new zone.
- `void Function(Zone, ZoneDelegate, Zone, void Function())? get scheduleMicrotask`:
  A custom [Zone.scheduleMicrotask] implementation for a new zone.

## Extension: FutureExtensions

Convenience methods on futures.

```dart
extension FutureExtensions<T> on Future<T> { … }
```

- `void ignore()`: Completely ignores this future and its result.
- `Future<T> onError<E extends Object>(FutureOr<T> Function(E, StackTrace) handleError, {bool Function(E)? test})`:
  Handles errors on this future.

## Extension: FutureIterable

```dart
extension FutureIterable<T> on Iterable<Future<T>> { … }
```

- `Future<List<T>> get wait`: Waits for futures in parallel.

## Extension: FutureRecord2

Parallel operations on a record of futures.

```dart
extension FutureRecord2<T1, T2> on (Future<T1>, Future<T2>) { … }
```

- `Future<(T1, T2)> get wait`: {@macro record-parallel-wait}

## Extension: FutureRecord3

Parallel operations on a record of futures.

```dart
extension FutureRecord3<T1, T2, T3> on (Future<T1>, Future<T2>, Future<T3>) { … }
```

- `Future<(T1, T2, T3)> get wait`: {@macro record-parallel-wait}

## Extension: FutureRecord4

Parallel operations on a record of futures.

```dart
extension FutureRecord4<T1, T2, T3, T4> on (Future<T1>, Future<T2>, Future<T3>, Future<T4>) { … }
```

- `Future<(T1, T2, T3, T4)> get wait`: {@macro record-parallel-wait}

## Extension: FutureRecord5

Parallel operations on a record of futures.

```dart
extension FutureRecord5<T1, T2, T3, T4, T5> on (Future<T1>, Future<T2>, Future<T3>, Future<T4>, Future<T5>) { … }
```

- `Future<(T1, T2, T3, T4, T5)> get wait`: {@macro record-parallel-wait}

## Extension: FutureRecord6

Parallel operations on a record of futures.

```dart
extension FutureRecord6<T1, T2, T3, T4, T5, T6> on (Future<T1>, Future<T2>, Future<T3>, Future<T4>, Future<T5>, Future<T6>) { … }
```

- `Future<(T1, T2, T3, T4, T5, T6)> get wait`: {@macro record-parallel-wait}

## Extension: FutureRecord7

Parallel operations on a record of futures.

```dart
extension FutureRecord7<T1, T2, T3, T4, T5, T6, T7> on (Future<T1>, Future<T2>, Future<T3>, Future<T4>, Future<T5>, Future<T6>, Future<T7>) { … }
```

- `Future<(T1, T2, T3, T4, T5, T6, T7)> get wait`: {@macro record-parallel-wait}

## Extension: FutureRecord8

Parallel operations on a record of futures.

```dart
extension FutureRecord8<T1, T2, T3, T4, T5, T6, T7, T8> on (Future<T1>, Future<T2>, Future<T3>, Future<T4>, Future<T5>, Future<T6>, Future<T7>, Future<T8>) { … }
```

- `Future<(T1, T2, T3, T4, T5, T6, T7, T8)> get wait`:
  {@macro record-parallel-wait}

## Extension: FutureRecord9

Parallel operations on a record of futures.

```dart
extension FutureRecord9<T1, T2, T3, T4, T5, T6, T7, T8, T9> on (Future<T1>, Future<T2>, Future<T3>, Future<T4>, Future<T5>, Future<T6>, Future<T7>, Future<T8>, Future<T9>) { … }
```

- `Future<(T1, T2, T3, T4, T5, T6, T7, T8, T9)> get wait`:
  {@macro record-parallel-wait}
