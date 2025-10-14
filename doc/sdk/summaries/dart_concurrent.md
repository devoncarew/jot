# Library: dart:concurrent

Classes that help implementing synchronized, concurrently-safe code.

{@category Core}
{@nodoc}

## Members

## Class: ConditionVariable

A *condition variable* synchronization primitive.

```dart
abstract interface class ConditionVariable { … }
```

- `ConditionVariable()`
- `void notify()`: Wake up at least one thread waiting on this condition variable.
- `void notifyAll()`: Wake up all threads waiting on this condition variable.
- `void wait(Mutex mutex, [int timeout])`:
  Block and wait until another thread calls [notify].

## Class: Mutex

A *mutex* synchronization primitive.

```dart
abstract interface class Mutex { … }
```

- `Mutex()`
- `R runLocked<R>(R Function() action)`:
  Run the given synchronous `action` under a mutex.
