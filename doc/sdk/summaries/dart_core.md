# Library: dart:core

Built-in types, collections,
and other core functionality for every Dart program.

This library is automatically imported.

Some classes in this library,
such as [String] and [num],
support Dart's built-in data types.
Other classes, such as [List] and [Map], provide data structures
for managing collections of objects.
And still other classes represent commonly used types of data
such as URIs, dates and times, and errors.

## Numbers and booleans

[int] and [double] provide support for Dart's built-in numerical data types:
integers and double-precision floating point numbers, respectively.
An object of type [bool] is either true or false.
Variables of these types can be constructed from literals:
```dart
int meaningOfLife = 42;
double valueOfPi  = 3.141592;
bool visible      = true;
```
## Strings and regular expressions

A [String] is immutable and represents a sequence of characters.
```dart
String shakespeareQuote = "All the world's a stage, ...";
```
[StringBuffer] provides a way to construct strings efficiently.
```dart
var moreShakespeare = StringBuffer();
moreShakespeare.write('And all the men and women ');
moreShakespeare.write('merely players; ...');
```
The [String] and [StringBuffer] classes implement string splitting,
concatenation, and other string manipulation features.
```dart
bool isPalindrome(String text) => text == text.split('').reversed.join();
```
[RegExp] implements Dart regular expressions,
which provide a grammar for matching patterns within text.
For example, here's a regular expression that matches
a substring containing one or more digits:
```dart
var numbers = RegExp(r'\d+');
```
Dart regular expressions have the same syntax and semantics as
JavaScript regular expressions. See
<http://ecma-international.org/ecma-262/5.1/#sec-15.10>
for the specification of JavaScript regular expressions.

## Collections

The `dart:core` library provides basic collections,
such as [List], [Map], and [Set].

A [List] is an ordered collection of objects, with a length.
Lists are sometimes called arrays.
Use a [List] when you need to access objects by index.
```dart
var superheroes = ['Batman', 'Superman', 'Harry Potter'];
```
A [Set] is an unordered collection of unique objects.
You cannot get an item efficiently by index (position).
Adding an element which is already in the set, has no effect.
```dart
var villains = {'Joker'};
print(villains.length); // 1
villains.addAll(['Joker', 'Lex Luthor', 'Voldemort']);
print(villains.length); // 3
```
A [Map] is an unordered collection of key-value pairs,
where each key can only occur once.
Maps are sometimes called associative arrays because
maps associate a key to some value for easy retrieval.
Use a [Map] when you need to access objects
by a unique identifier.
```dart
var sidekicks = {'Batman': 'Robin',
                 'Superman': 'Lois Lane',
                 'Harry Potter': 'Ron and Hermione'};
```
In addition to these classes,
`dart:core` contains [Iterable],
an interface that defines functionality
common in collections of objects.
Examples include the ability
to run a function on each element in the collection,
to apply a test to each element,
to retrieve an object, and to determine the number of elements.

[Iterable] is implemented by [List] and [Set],
and used by [Map] for its keys and values.

For other kinds of collections, check out the
`dart:collection` library.

## Date and time

Use [DateTime] to represent a point in time
and [Duration] to represent a span of time.

You can create [DateTime] objects with constructors
or by parsing a correctly formatted string.
```dart
var now = DateTime.now();
var berlinWallFell = DateTime(1989, 11, 9);
var moonLanding = DateTime.parse("1969-07-20");
```
Create a [Duration] object by specifying the individual time units.
```dart
var timeRemaining = const Duration(hours: 56, minutes: 14);
```
In addition to [DateTime] and [Duration],
`dart:core` contains the [Stopwatch] class for measuring elapsed time.

## Uri

A [Uri] object represents a uniform resource identifier,
which identifies a resource, for example on the web.
```dart
var dartlang = Uri.parse('http://dartlang.org/');
```
## Errors

The [Error] class represents the occurrence of an error
during runtime.
Subclasses of this class represent specific kinds of errors.

## Other documentation

For more information about how to use the built-in types, refer to
[Built-in Types](https://dart.dev/guides/language/language-tour#built-in-types)
in
[A tour of the Dart language](https://dart.dev/guides/language/language-tour).

Also, see
[dart:core - numbers, collections, strings, and more](https://dart.dev/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)
for more coverage of types in this library.

The [Dart Language Specification](https://dart.dev/guides/language/spec)
provides technical details.

{@category Core}

## Members

- accessor `Deprecated get deprecated`
- accessor `Object get override`
- function `bool identical(Object? a, Object? b)`:
  Check whether two object references are to the same object.
- function `int identityHashCode(Object? object)`:
  The identity hash code of [object].
- function `void print(Object? object)`: Prints an object to the console.
- type alias `typedef Comparator<T> = int Function(T, T)`:
  The signature of a generic comparison function.

## Class: ArgumentError

Error thrown when a function is passed an unacceptable argument.

```dart
class ArgumentError extends Error { … }
```

- `ArgumentError([dynamic message, String? name])`:
  Creates an error with [message] describing the problem with an argument.
- `ArgumentError.notNull([String? name])`:
  Creates an argument error for a `null` argument that must not be `null`.
- `ArgumentError.value(dynamic value, [String? name, dynamic message])`:
  Creates error containing the invalid [value].
- static `T checkNotNull<T>(T? argument, [String? name])`:
  Throws if [argument] is `null`.
- `dynamic invalidValue`: The invalid value.
- `dynamic message`: Message describing the problem.
- `String? name`: Name of the invalid argument, if available.
- `String toString()`: A string representation of this object.

## Class: AssertionError

Error thrown by the runtime system when an assert statement fails.

```dart
class AssertionError extends Error { … }
```

- `AssertionError([Object? message])`:
  Creates an assertion error with the provided [message].
- `Object? message`: Message describing the assertion error.
- `String toString()`: A string representation of this object.

## Class: BigInt

An arbitrarily large integer value.

```dart
abstract final class BigInt implements Comparable<BigInt> { … }
```

- `BigInt.from(num value)`:
  Creates a big integer from the provided [value] number.
- static `BigInt parse(String source, {int? radix})`:
  Parses [source] as a, possibly signed, integer literal and returns its
  value.
- static `BigInt? tryParse(String source, {int? radix})`:
  Parses [source] as a, possibly signed, integer literal and returns its
  value.
- `int get bitLength`:
  Returns the minimum number of bits required to store this big integer.
- `bool get isEven`: Whether this big integer is even.
- `bool get isNegative`: Whether this number is negative.
- `bool get isOdd`: Whether this big integer is odd.
- `bool get isValidInt`:
  Whether this big integer can be represented as an `int` without losing
  precision.
- static `BigInt get one`: A big integer with the numerical value 1.
- `int get sign`: Returns the sign of this big integer.
- static `BigInt get two`: A big integer with the numerical value 2.
- static `BigInt get zero`: A big integer with the numerical value 0.
- `BigInt operator%(BigInt other)`: Euclidean modulo operator.
- `BigInt operator&(BigInt other)`: Bit-wise and operator.
- `BigInt operator*(BigInt other)`: Multiplies [other] by this big integer.
- `BigInt operator+(BigInt other)`: Adds [other] to this big integer.
- `BigInt operatorunary-()`: Return the negative value of this integer.
- `BigInt operator-(BigInt other)`: Subtracts [other] from this big integer.
- `double operator/(BigInt other)`: Double division operator.
- `bool operator<(BigInt other)`:
  Whether this big integer is numerically smaller than [other].
- `BigInt operator<<(int shiftAmount)`:
  Shift the bits of this integer to the left by [shiftAmount].
- `bool operator<=(BigInt other)`:
  Whether [other] is numerically greater than this big integer.
- `bool operator>(BigInt other)`:
  Whether this big integer is numerically greater than [other].
- `bool operator>=(BigInt other)`:
  Whether [other] is numerically smaller than this big integer.
- `BigInt operator>>(int shiftAmount)`:
  Shift the bits of this integer to the right by [shiftAmount].
- `BigInt operator^(BigInt other)`: Bit-wise exclusive-or operator.
- `BigInt abs()`: Returns the absolute value of this integer.
- `int compareTo(BigInt other)`: Compares this to `other`.
- `BigInt gcd(BigInt other)`:
  Returns the greatest common divisor of this big integer and [other].
- `BigInt modInverse(BigInt modulus)`:
  Returns the modular multiplicative inverse of this big integer
  modulo [modulus].
- `BigInt modPow(BigInt exponent, BigInt modulus)`:
  Returns this integer to the power of [exponent] modulo [modulus].
- `BigInt pow(int exponent)`: Returns `this` to the power of [exponent].
- `BigInt remainder(BigInt other)`:
  Returns the remainder of the truncating division of `this` by [other].
- `double toDouble()`: Returns this [BigInt] as a [double].
- `int toInt()`: Returns this [BigInt] as an [int].
- `String toRadixString(int radix)`:
  Converts this [BigInt] to a string representation in the given [radix].
- `BigInt toSigned(int width)`:
  Returns the least significant [width] bits of this integer, extending the
  highest retained bit to the sign. This is the same as truncating the value
  to fit in [width] bits using an signed 2-s complement representation. The
  returned value has the same bit value in all positions higher than [width].
- `String toString()`: Returns a String-representation of this integer.
- `BigInt toUnsigned(int width)`:
  Returns the least significant [width] bits of this big integer as a
  non-negative number (i.e. unsigned representation). The returned value has
  zeros in all bit positions higher than [width].
- `BigInt operator|(BigInt other)`: Bit-wise or operator.
- `BigInt operator~()`: The bit-wise negate operator.
- `BigInt operator~/(BigInt other)`: Truncating integer division operator.

## Class: Comparable

Interface used by types that have an intrinsic ordering.

```dart
abstract interface class Comparable<T> { … }
```

- static `int compare(Comparable<dynamic> a, Comparable<dynamic> b)`:
  A [Comparator] that compares one comparable to another.
- `int compareTo(T other)`: Compares this object to another object.

## Class: ConcurrentModificationError

Error occurring when a collection is modified during iteration.

```dart
class ConcurrentModificationError extends Error { … }
```

- `ConcurrentModificationError([Object? modifiedObject])`
- `Object? modifiedObject`: The object that was modified in an incompatible way.
- `String toString()`: A string representation of this object.

## Class: DateTime

An instant in time, such as July 20, 1969, 8:18pm GMT.

```dart
class DateTime implements Comparable<DateTime> { … }
```

- `DateTime(int year, [int month, int day, int hour, int minute, int second, int millisecond, int microsecond])`:
  Constructs a [DateTime] instance specified in the local time zone.
- `DateTime.fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch, {bool isUtc})`:
  Constructs a new [DateTime] instance
  with the given [microsecondsSinceEpoch].
- `DateTime.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch, {bool isUtc})`:
  Constructs a new [DateTime] instance
  with the given [millisecondsSinceEpoch].
- `DateTime.now()`:
  Constructs a [DateTime] instance with current date and time in the
  local time zone.
- `DateTime.timestamp()`:
  Constructs a [DateTime] with the current UTC date and time.
- `DateTime.utc(int year, [int month, int day, int hour, int minute, int second, int millisecond, int microsecond])`:
  Constructs a [DateTime] instance specified in the UTC time zone.
- static `int april`
- static `int august`
- static `int daysPerWeek`
- static `int december`
- static `int february`
- static `int friday`
- static `int january`
- static `int july`
- static `int june`
- static `int march`
- static `int may`
- static `int monday`
- static `int monthsPerYear`
- static `int november`
- static `int october`
- static `int saturday`
- static `int september`
- static `int sunday`
- static `int thursday`
- static `int tuesday`
- static `int wednesday`
- static `DateTime parse(String formattedString)`:
  Constructs a new [DateTime] instance based on [formattedString].
- static `DateTime? tryParse(String formattedString)`:
  Constructs a new [DateTime] instance based on [formattedString].
- `bool isUtc`: True if this [DateTime] is set to UTC time.
- `int get day`: The day of the month `[1..31]`.
- `int get hashCode`: The hash code for this object.
- `int get hour`: The hour of the day, expressed as in a 24-hour clock `[0..23]`.
- `int get microsecond`: The microsecond `[0...999]`.
- `int get microsecondsSinceEpoch`: The number of microseconds since
  the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
- `int get millisecond`: The millisecond `[0...999]`.
- `int get millisecondsSinceEpoch`: The number of milliseconds since
  the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
- `int get minute`: The minute `[0...59]`.
- `int get month`: The month `[1..12]`.
- `int get second`: The second `[0...59]`.
- `String get timeZoneName`: The time zone name.
- `Duration get timeZoneOffset`: The time zone offset, which
  is the difference between local time and UTC.
- `int get weekday`: The day of the week [monday]..[sunday].
- `int get year`: The year.
- `bool operator==(Object other)`:
  Whether [other] is a [DateTime] at the same moment and in the
  same time zone (UTC or local).
- `DateTime add(Duration duration)`:
  Returns a new [DateTime] instance with [duration] added to this [DateTime].
- `int compareTo(DateTime other)`: Compares this DateTime object to [other],
  returning zero if the values are equal.
- `Duration difference(DateTime other)`:
  Returns a [Duration] with the difference when subtracting [other] from
  this [DateTime].
- `bool isAfter(DateTime other)`: Whether this [DateTime] occurs after [other].
- `bool isAtSameMomentAs(DateTime other)`:
  Whether this [DateTime] occurs at the same moment as [other].
- `bool isBefore(DateTime other)`: Whether this [DateTime] occurs before [other].
- `DateTime subtract(Duration duration)`:
  Returns a new [DateTime] instance with [duration] subtracted from this
  [DateTime].
- `String toIso8601String()`:
  Returns an ISO-8601 full-precision extended format representation.
- `DateTime toLocal()`: Returns this DateTime value in the local time zone.
- `String toString()`: Returns a human-readable string for this instance.
- `DateTime toUtc()`: Returns this DateTime value in the UTC time zone.

## Class: Deprecated

The annotation `@Deprecated('migration')` marks a feature as deprecated.

```dart
class Deprecated { … }
```

- `Deprecated(String? message)`:
  Creates a deprecation annotation which specifies the migration path and
  expiration of the annotated feature.
- `Deprecated.extend([String? message])`:
  Creates an annotation which deprecates extending a class.
- `Deprecated.implement([String? message])`:
  Creates an annotation which deprecates implementing a class or mixin.
- `Deprecated.instantiate([String? message])`:
  Creates an annotation which deprecates instantiating a class.
- `Deprecated.mixin([String? message])`:
  Creates an annotation which deprecates mixing in a class.
- `Deprecated.optional([String? message])`:
  Creates an annotation which deprecates omitting an argument for the
  annotated parameter.
- `Deprecated.subclass([String? message])`:
  Creates an annotation which deprecates subclassing (implementing or
  extending) a class.
- `String? message`:
  Message provided to the user when they use the deprecated feature.
- `String toString()`: A string representation of this object.

## Class: Duration

A span of time, such as 27 days, 4 hours, 12 minutes, and 3 seconds.

```dart
class Duration implements Comparable<Duration> { … }
```

- `Duration({int days, int hours, int minutes, int seconds, int milliseconds, int microseconds})`:
  Creates a new [Duration] object whose value
  is the sum of all individual parts.
- static `int hoursPerDay`: The number of hours per day.
- static `int microsecondsPerDay`: The number of microseconds per day.
- static `int microsecondsPerHour`: The number of microseconds per hour.
- static `int microsecondsPerMillisecond`:
  The number of microseconds per millisecond.
- static `int microsecondsPerMinute`: The number of microseconds per minute.
- static `int microsecondsPerSecond`: The number of microseconds per second.
- static `int millisecondsPerDay`: The number of milliseconds per day.
- static `int millisecondsPerHour`: The number of milliseconds per hour.
- static `int millisecondsPerMinute`: The number of milliseconds per minute.
- static `int millisecondsPerSecond`: The number of milliseconds per second.
- static `int minutesPerDay`: The number of minutes per day.
- static `int minutesPerHour`: The number of minutes per hour.
- static `int secondsPerDay`: The number of seconds per day.
- static `int secondsPerHour`: The number of seconds per hour.
- static `int secondsPerMinute`: The number of seconds per minute.
- static `Duration zero`: An empty duration, representing zero time.
- `int get hashCode`: The hash code for this object.
- `int get inDays`: The number of entire days spanned by this [Duration].
- `int get inHours`: The number of entire hours spanned by this [Duration].
- `int get inMicroseconds`:
  The number of whole microseconds spanned by this [Duration].
- `int get inMilliseconds`:
  The number of whole milliseconds spanned by this [Duration].
- `int get inMinutes`: The number of whole minutes spanned by this [Duration].
- `int get inSeconds`: The number of whole seconds spanned by this [Duration].
- `bool get isNegative`: Whether this [Duration] is negative.
- `Duration operator*(num factor)`:
  Multiplies this Duration by the given [factor] and returns the result
  as a new Duration object.
- `Duration operator+(Duration other)`: Adds this Duration and [other] and
  returns the sum as a new Duration object.
- `Duration operator-(Duration other)`: Subtracts [other] from this Duration and
  returns the difference as a new Duration object.
- `Duration operatorunary-()`:
  Creates a new [Duration] with the opposite direction of this [Duration].
- `bool operator<(Duration other)`:
  Whether this [Duration] is shorter than [other].
- `bool operator<=(Duration other)`:
  Whether this [Duration] is shorter than or equal to [other].
- `bool operator==(Object other)`:
  Whether this [Duration] has the same length as [other].
- `bool operator>(Duration other)`:
  Whether this [Duration] is longer than [other].
- `bool operator>=(Duration other)`:
  Whether this [Duration] is longer than or equal to [other].
- `Duration abs()`:
  Creates a new [Duration] representing the absolute length of this
  [Duration].
- `int compareTo(Duration other)`:
  Compares this [Duration] to [other], returning zero if the values are equal.
- `String toString()`: Returns a string representation of this [Duration].
- `Duration operator~/(int quotient)`:
  Divides this Duration by the given [quotient] and returns the truncated
  result as a new Duration object.

## Class: Enum

An enumerated value.

```dart
abstract interface class Enum { … }
```

- static `int compareByIndex<T extends Enum>(T value1, T value2)`:
  Compares two enum values by their [index].
- static `int compareByName<T extends Enum>(T value1, T value2)`:
  Compares enum values by name.
- `int get index`: A numeric identifier for the enumerated value.

## Class: Error

Error objects thrown in the case of a program failure.

```dart
class Error { … }
```

- `Error()`
- static `String safeToString(Object? object)`:
  Safely convert a value to a [String] description.
- static `Never throwWithStackTrace(Object error, StackTrace stackTrace)`:
  Throws [error] with associated stack trace [stackTrace].
- `StackTrace? get stackTrace`:
  The stack trace at the point where this error was first thrown.

## Class: Exception

A marker interface implemented by all core library exceptions.

```dart
abstract interface class Exception { … }
```

- `Exception([dynamic message])`

## Class: Expando

An [Expando] allows adding new properties to objects.

```dart
final class Expando<T extends Object> { … }
```

- `Expando([String? name])`:
  Creates a new [Expando]. The optional name is only used for
  debugging purposes and creating two different [Expando]s with the
  same name yields two [Expando]s that work on different properties
  of the objects they are used on.
- `String? name`: The name of the this [Expando] as passed to the constructor.
- `T? operator[](Object object)`:
  Gets the value of this [Expando]'s property on the given object.
- `void operator[]=(Object object, T? value)`:
  Sets this [Expando]'s property value on the given object to [value].
- `String toString()`: Expando toString method override.

## Class: Finalizer

A finalizer which can be attached to Dart objects.

```dart
abstract final class Finalizer<T> { … }
```

- `Finalizer(void Function(T) callback)`:
  Creates a finalizer with the given finalization callback.
- `void attach(Object value, T finalizationToken, {Object? detach})`:
  Attaches this finalizer to [value].
- `void detach(Object detach)`:
  Detaches this finalizer from values attached with [detach].

## Class: FormatException

Exception thrown when a string or some other data does not have an expected
format and cannot be parsed or processed.

```dart
class FormatException implements Exception { … }
```

- `FormatException([String message, dynamic source, int? offset])`:
  Creates a new `FormatException` with an optional error [message].
- `String message`: A message describing the format error.
- `int? offset`: The offset in [source] where the error was detected.
- `dynamic source`: The actual source input which caused the error.
- `String toString()`: Returns a description of the format exception.

## Class: Function

A function value.

```dart
abstract final class Function { … }
```

- static `dynamic apply(Function function, List<dynamic>? positionalArguments, [Map<Symbol, dynamic>? namedArguments])`:
  Dynamically call [function] with the specified arguments.
- `int get hashCode`: A hash code value that is compatible with `operator==`.
- `bool operator==(Object other)`:
  Test whether another object is equal to this function.

## Class: IndexError

A specialized [RangeError] used when an index is not in the range
`0..indexable.length-1`.

```dart
class IndexError extends ArgumentError implements RangeError { … }
```

- `IndexError(int invalidValue, dynamic indexable, [String? name, String? message, int? length])`:
  Creates a new [IndexError] stating that [invalidValue] is not a valid index
  into [indexable].
- `IndexError.withLength(int invalidValue, int length, {Object? indexable, String? name, String? message})`:
  Creates a new [IndexError] stating that [invalidValue] is not a valid index
  into [indexable].
- static `int check(int index, int length, {Object? indexable, String? name, String? message})`:
  Check that [index] is a valid index into an indexable object.
- `Object? indexable`:
  The indexable object that [invalidValue] was not a valid index into.
- `int length`: The length of [indexable] at the time of the error.
- `int get end`
- `int get invalidValue`
- `int get start`

## Class: IntegerDivisionByZeroException

```dart
class IntegerDivisionByZeroException
    implements Exception, UnsupportedError { … }
```

- `IntegerDivisionByZeroException()`
- `String? get message`
- `StackTrace? get stackTrace`:
  The stack trace at the point where this error was first thrown.
- `String toString()`: A string representation of this object.

## Class: Invocation

Representation of the invocation of a member on an object.

```dart
abstract class Invocation { … }
```

- `Invocation()`
- `Invocation.genericMethod(Symbol memberName, Iterable<Type>? typeArguments, Iterable<Object?>? positionalArguments, [Map<Symbol, Object?>? namedArguments])`:
  Creates an invocation corresponding to a generic method invocation.
- `Invocation.getter(Symbol name)`:
  Creates an invocation corresponding to a getter invocation.
- `Invocation.method(Symbol memberName, Iterable<Object?>? positionalArguments, [Map<Symbol, Object?>? namedArguments])`:
  Creates an invocation corresponding to a method invocation.
- `Invocation.setter(Symbol memberName, Object? argument)`:
  Creates an invocation corresponding to a setter invocation.
- `bool get isAccessor`: Whether the invocation was a getter or a setter call.
- `bool get isGetter`: Whether the invocation was a getter call.
  If so, all three types of arguments lists are empty.
- `bool get isMethod`: Whether the invocation was a method call.
- `bool get isSetter`: Whether the invocation was a setter call.
- `Symbol get memberName`: The name of the invoked member.
- `Map<Symbol, dynamic> get namedArguments`:
  An unmodifiable view of the named arguments of the call.
- `List<dynamic> get positionalArguments`:
  An unmodifiable view of the positional arguments of the call.
- `List<Type> get typeArguments`:
  An unmodifiable view of the type arguments of the call.

## Class: Iterable

A collection of values, or "elements", that can be accessed sequentially.

```dart
abstract mixin class Iterable<E> { … }
```

- `Iterable()`
- `Iterable.empty()`: Creates an empty iterable.
- `Iterable.generate(int count, [E Function(int)? generator])`:
  Creates an `Iterable` which generates its elements dynamically.
- `Iterable.withIterator(Iterator<E> Function() iteratorFactory)`:
  Creates an [Iterable] from the [Iterator] factory.
- static `Iterable<T> castFrom<S, T>(Iterable<S> source)`:
  Adapts [source] to be an `Iterable<T>`.
- static `String iterableToFullString(Iterable<dynamic> iterable, [String leftDelimiter, String rightDelimiter])`:
  Converts an `Iterable` to a string.
- static `String iterableToShortString(Iterable<dynamic> iterable, [String leftDelimiter, String rightDelimiter])`:
  Convert an `Iterable` to a string like [Iterable.toString].
- `E get first`: The first element.
- `bool get isEmpty`: Whether this collection has no elements.
- `bool get isNotEmpty`: Whether this collection has at least one element.
- `Iterator<E> get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `E get last`: The last element.
- `int get length`: The number of elements in this [Iterable].
- `E get single`:
  Checks that this iterable has only one element, and returns that element.
- `bool any(bool Function(E) test)`:
  Checks whether any element of this iterable satisfies [test].
- `Iterable<R> cast<R>()`:
  A view of this iterable as an iterable of [R] instances.
- `bool contains(Object? element)`:
  Whether the collection contains an element equal to [element].
- `E elementAt(int index)`: Returns the [index]th element.
- `bool every(bool Function(E) test)`:
  Checks whether every element of this iterable satisfies [test].
- `Iterable<T> expand<T>(Iterable<T> Function(E) toElements)`:
  Expands each element of this [Iterable] into zero or more elements.
- `E firstWhere(bool Function(E) test, {E Function()? orElse})`:
  The first element that satisfies the given predicate [test].
- `T fold<T>(T initialValue, T Function(T, E) combine)`:
  Reduces a collection to a single value by iteratively combining each
  element of the collection with an existing value
- `Iterable<E> followedBy(Iterable<E> other)`:
  Creates the lazy concatenation of this iterable and [other].
- `void forEach(void Function(E) action)`:
  Invokes [action] on each element of this iterable in iteration order.
- `String join([String separator])`:
  Converts each element to a [String] and concatenates the strings.
- `E lastWhere(bool Function(E) test, {E Function()? orElse})`:
  The last element that satisfies the given predicate [test].
- `Iterable<T> map<T>(T Function(E) toElement)`:
  The current elements of this iterable modified by [toElement].
- `E reduce(E Function(E, E) combine)`:
  Reduces a collection to a single value by iteratively combining elements
  of the collection using the provided function.
- `E singleWhere(bool Function(E) test, {E Function()? orElse})`:
  The single element that satisfies [test].
- `Iterable<E> skip(int count)`:
  Creates an [Iterable] that provides all but the first [count] elements.
- `Iterable<E> skipWhile(bool Function(E) test)`:
  Creates an `Iterable` that skips leading elements while [test] is satisfied.
- `Iterable<E> take(int count)`:
  Creates a lazy iterable of the [count] first elements of this iterable.
- `Iterable<E> takeWhile(bool Function(E) test)`:
  Creates a lazy iterable of the leading elements satisfying [test].
- `List<E> toList({bool growable})`:
  Creates a [List] containing the elements of this [Iterable].
- `Set<E> toSet()`: Creates a [Set] containing the same elements as this iterable.
- `String toString()`:
  Returns a string representation of (some of) the elements of `this`.
- `Iterable<E> where(bool Function(E) test)`:
  Creates a new lazy [Iterable] with all elements that satisfy the
  predicate [test].
- `Iterable<T> whereType<T>()`:
  Creates a new lazy [Iterable] with all elements that have type [T].

## Class: Iterator

An interface for getting items, one at a time, from an object.

```dart
abstract interface class Iterator<E> { … }
```

- `E get current`: The current element.
- `bool moveNext()`: Advances the iterator to the next element of the iteration.

## Class: List

An indexable collection of objects with a length.

```dart
abstract interface class List<E> implements Iterable<E>, _ListIterable<E> { … }
```

- `List.empty({bool growable})`: Creates a new empty list.
- `List.filled(int length, E fill, {bool growable})`:
  Creates a list of the given length with [fill] at each position.
- `List.from(Iterable<dynamic> elements, {bool growable})`:
  Creates a list containing all [elements].
- `List.generate(int length, E Function(int) generator, {bool growable})`:
  Generates a list of values.
- `List.of(Iterable<E> elements, {bool growable})`:
  Creates a list from [elements].
- `List.unmodifiable(Iterable<dynamic> elements)`:
  Creates an unmodifiable list containing all [elements].
- static `List<T> castFrom<S, T>(List<S> source)`:
  Adapts [source] to be a `List<T>`.
- static `void copyRange<T>(List<T> target, int at, List<T> source, [int? start, int? end])`:
  Copy a range of one list into another list.
- static `void writeIterable<T>(List<T> target, int at, Iterable<T> source)`:
  Write the elements of an iterable into a list.
- `set first=(E value)`: The first element of the list.
- `set last=(E value)`: The last element of the list.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`:
  Setting the `length` changes the number of elements in the list.
- `Iterable<E> get reversed`:
  An [Iterable] of the objects in this list in reverse order.
- `List<E> operator+(List<E> other)`:
  Returns the concatenation of this list and [other].
- `bool operator==(Object other)`: Whether this list is equal to [other].
- `E operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, E value)`:
  Sets the value at the given [index] in the list to [value].
- `void add(E value)`: Adds [value] to the end of this list,
  extending the length by one.
- `void addAll(Iterable<E> iterable)`:
  Appends all objects of [iterable] to the end of this list.
- `Map<int, E> asMap()`: An unmodifiable [Map] view of this list.
- `List<R> cast<R>()`: Returns a view of this list as a list of [R] instances.
- `void clear()`:
  Removes all objects from this list; the length of the list becomes zero.
- `void fillRange(int start, int end, [E? fillValue])`:
  Overwrites a range of elements with [fillValue].
- `Iterable<E> getRange(int start, int end)`:
  Creates an [Iterable] that iterates over a range of elements.
- `int indexOf(E element, [int start])`:
  The first index of [element] in this list.
- `int indexWhere(bool Function(E) test, [int start])`:
  The first index in the list that satisfies the provided [test].
- `void insert(int index, E element)`:
  Inserts [element] at position [index] in this list.
- `void insertAll(int index, Iterable<E> iterable)`:
  Inserts all objects of [iterable] at position [index] in this list.
- `int lastIndexOf(E element, [int? start])`:
  The last index of [element] in this list.
- `int lastIndexWhere(bool Function(E) test, [int? start])`:
  The last index in the list that satisfies the provided [test].
- `bool remove(Object? value)`:
  Removes the first occurrence of [value] from this list.
- `E removeAt(int index)`: Removes the object at position [index] from this list.
- `E removeLast()`: Removes and returns the last object in this list.
- `void removeRange(int start, int end)`:
  Removes a range of elements from the list.
- `void removeWhere(bool Function(E) test)`:
  Removes all objects from this list that satisfy [test].
- `void replaceRange(int start, int end, Iterable<E> replacements)`:
  Replaces a range of elements with the elements of [replacements].
- `void retainWhere(bool Function(E) test)`:
  Removes all objects from this list that fail to satisfy [test].
- `void setAll(int index, Iterable<E> iterable)`:
  Overwrites elements with the objects of [iterable].
- `void setRange(int start, int end, Iterable<E> iterable, [int skipCount])`:
  Writes some elements of [iterable] into a range of this list.
- `void shuffle([Random? random])`: Shuffles the elements of this list randomly.
- `void sort([int Function(E, E)? compare])`:
  Sorts this list according to the order specified by the [compare] function.
- `List<E> sublist(int start, [int? end])`:
  Returns a new list containing the elements between [start] and [end].

## Class: Map

A collection of key/value pairs, from which you retrieve a value
using its associated key.

```dart
abstract interface class Map<K, V> { … }
```

- `Map()`: Creates an empty [LinkedHashMap].
- `Map.from(Map<dynamic, dynamic> other)`:
  Creates a [LinkedHashMap] with the same keys and values as [other].
- `Map.fromEntries(Iterable<MapEntry<K, V>> entries)`:
  Creates a new map and adds all entries.
- `Map.fromIterable(Iterable<dynamic> iterable, {K Function(dynamic)? key, V Function(dynamic)? value})`:
  Creates a Map instance in which the keys and values are computed from the
  [iterable].
- `Map.fromIterables(Iterable<K> keys, Iterable<V> values)`:
  Creates a map associating the given [keys] to the given [values].
- `Map.identity()`:
  Creates an identity map with the default implementation, [LinkedHashMap].
- `Map.of(Map<K, V> other)`:
  Creates a [LinkedHashMap] with the same keys and values as [other].
- `Map.unmodifiable(Map<dynamic, dynamic> other)`:
  Creates an unmodifiable hash-based map containing the entries of [other].
- static `Map<K2, V2> castFrom<K, V, K2, V2>(Map<K, V> source)`:
  Adapts [source] to be a `Map<K2, V2>`.
- `Iterable<MapEntry<K, V>> get entries`: The map entries of this [Map].
- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<K> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<V> get values`: The values of this [Map].
- `V? operator[](Object? key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(K key, V value)`: Associates the [key] with the given [value].
- `void addAll(Map<K, V> other)`: Adds all key/value pairs of [other] to this map.
- `void addEntries(Iterable<MapEntry<K, V>> newEntries)`:
  Adds all key/value pairs of [newEntries] to this map.
- `Map<RK, RV> cast<RK, RV>()`:
  Provides a view of this map as having [RK] keys and [RV] instances,
  if necessary.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(Object? key)`: Whether this map contains the given [key].
- `bool containsValue(Object? value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(K, V) action)`:
  Applies [action] to each key/value pair of the map.
- `Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K, V) convert)`:
  Returns a new map where all entries of this map are transformed by
  the given [convert] function.
- `V putIfAbsent(K key, V Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `V? remove(Object? key)`:
  Removes [key] and its associated value, if present, from the map.
- `void removeWhere(bool Function(K, V) test)`:
  Removes all entries of this map that satisfy the given [test].
- `V update(K key, V Function(V) update, {V Function()? ifAbsent})`:
  Updates the value for the provided [key].
- `void updateAll(V Function(K, V) update)`: Updates all values.

## Class: MapEntry

A key/value pair representing an entry in a [Map].

```dart
final class MapEntry<K, V> { … }
```

- `MapEntry(K key, V value)`: Creates an entry with [key] and [value].
- `K key`: The key of the entry.
- `V value`: The value associated to [key] in a map.
- `String toString()`: String representation intended for debugging only.

## Class: Match

A result from searching within a string.

```dart
abstract interface class Match { … }
```

- `int get end`: The index in the string after the last character of the match.
- `int get groupCount`: Returns the number of captured groups in the match.
- `String get input`: The string on which this match was computed.
- `Pattern get pattern`: The pattern used to search in [input].
- `int get start`: The index in the string where the match starts.
- `String? operator[](int group)`: The string matched by the given [group].
- `String? group(int group)`: The string matched by the given [group].
- `List<String?> groups(List<int> groupIndices)`:
  A list of the groups with the given indices.

## Class: NoSuchMethodError

Error thrown on an invalid function or method invocation.

```dart
class NoSuchMethodError extends Error { … }
```

- `NoSuchMethodError.withInvocation(Object? receiver, Invocation invocation)`:
  Creates a [NoSuchMethodError] corresponding to a failed method call.
- `String toString()`: A string representation of this object.

## Class: Null

The reserved word `null` denotes an object that is the sole instance of
this class.

```dart
final class Null { … }
```

- `int get hashCode`: The hash code for this object.
- `String toString()`: Returns the string `"null"`.

## Class: Object

The base class for all Dart objects except `null`.

```dart
class Object { … }
```

- `Object()`: Creates a new [Object] instance.
- static `int hash(Object? object1, Object? object2, [Object? object3, Object? object4, Object? object5, Object? object6, Object? object7, Object? object8, Object? object9, Object? object10, Object? object11, Object? object12, Object? object13, Object? object14, Object? object15, Object? object16, Object? object17, Object? object18, Object? object19, Object? object20])`:
  Creates a combined hash code for a number of objects.
- static `int hashAll(Iterable<Object?> objects)`:
  Creates a combined hash code for a sequence of objects.
- static `int hashAllUnordered(Iterable<Object?> objects)`:
  Creates a combined hash code for a collection of objects.
- `int get hashCode`: The hash code for this object.
- `Type get runtimeType`: A representation of the runtime type of the object.
- `bool operator==(Object other)`: The equality operator.
- `dynamic noSuchMethod(Invocation invocation)`:
  Invoked when a nonexistent method or property is accessed.
- `String toString()`: A string representation of this object.

## Class: OutOfMemoryError

Error that the platform can use in case of memory shortage.

```dart
final class OutOfMemoryError implements Error { … }
```

- `OutOfMemoryError()`
- `StackTrace? get stackTrace`:
  The stack trace at the point where this error was first thrown.
- `String toString()`: A string representation of this object.

## Class: Pattern

An interface for basic searches within strings.

```dart
abstract interface class Pattern { … }
```

- `Iterable<Match> allMatches(String string, [int start])`:
  Matches this pattern against the string repeatedly.
- `Match? matchAsPrefix(String string, [int start])`:
  Matches this pattern against the start of `string`.

## Class: RangeError

Error thrown due to an argument value being outside an accepted range.

```dart
class RangeError extends ArgumentError { … }
```

- `RangeError(dynamic message)`:
  Create a new [RangeError] with the given [message].
- `RangeError.index(int index, dynamic indexable, [String? name, String? message, int? length])`:
  Creates a new [RangeError] stating that [index] is not a valid index
  into [indexable].
- `RangeError.range(num invalidValue, int? minValue, int? maxValue, [String? name, String? message])`:
  Create a new [RangeError] for a value being outside the valid range.
- `RangeError.value(num value, [String? name, String? message])`:
  Create a new [RangeError] with a message for the given [value].
- static `int checkNotNegative(int value, [String? name, String? message])`:
  Check that an integer value is non-negative.
- static `int checkValidIndex(int index, dynamic indexable, [String? name, int? length, String? message])`:
  Check that [index] is a valid index into an indexable object.
- static `int checkValidRange(int start, int? end, int length, [String? startName, String? endName, String? message])`:
  Check that a range represents a slice of an indexable object.
- static `int checkValueInInterval(int value, int minValue, int maxValue, [String? name, String? message])`:
  Check that an integer [value] lies in a specific interval.
- `num? end`: The maximum value that [value] is allowed to assume.
- `num? start`: The minimum value that [value] is allowed to assume.
- `num? get invalidValue`

## Class: Record

A record value.

```dart
abstract final class Record { … }
```

- `int get hashCode`: A hash-code compatible with `==`.
- `Type get runtimeType`:
  A `Type` object representing the runtime type of a record.
- `bool operator==(Object other)`:
  Checks whether [other] has the same shape and equal fields to this record.
- `String toString()`: Creates a string-representation of the record.

## Class: RegExp

A regular expression pattern.

```dart
abstract interface class RegExp implements Pattern { … }
```

- `RegExp(String source, {bool multiLine, bool caseSensitive, bool unicode, bool dotAll})`:
  Constructs a regular expression.
- static `String escape(String text)`:
  Creates regular expression syntax that matches the input [text].
- `bool get isCaseSensitive`: Whether this regular expression is case sensitive.
- `bool get isDotAll`:
  Whether "." in this regular expression matches line terminators.
- `bool get isMultiLine`: Whether this regular expression matches multiple lines.
- `bool get isUnicode`: Whether this regular expression uses Unicode mode.
- `String get pattern`: The regular expression pattern source of this `RegExp`.
- `Iterable<RegExpMatch> allMatches(String input, [int start])`:
  Matches this pattern against the string repeatedly.
- `RegExpMatch? firstMatch(String input)`:
  Finds the first match of the regular expression in the string [input].
- `bool hasMatch(String input)`:
  Checks whether this regular expression has a match in the [input].
- `String? stringMatch(String input)`:
  Finds the string of the first match of this regular expression
  in [input].

## Class: RegExpMatch

A regular expression match.

```dart
abstract interface class RegExpMatch implements Match { … }
```

- `Iterable<String> get groupNames`:
  The names of the named capture groups of [pattern].
- `RegExp get pattern`: The pattern used to search in [input].
- `String? namedGroup(String name)`:
  The string captured by the named capture group [name].

## Class: RuneIterator

[Iterator] for reading runes (integer Unicode code points) of a Dart string.

```dart
final class RuneIterator implements Iterator<int> { … }
```

- `RuneIterator(String string)`:
  Create an iterator positioned at the beginning of the string.
- `RuneIterator.at(String string, int index)`:
  Create an iterator positioned before the [index]th code unit of the string.
- `String string`: String being iterated.
- `int get current`:
  The rune (integer Unicode code point) starting at the current position in
  the string.
- `String get currentAsString`: A string containing the current rune.
- `int get currentSize`: The number of code units comprising the current rune.
- `int get rawIndex`: The starting position of the current rune in the string.
- `set rawIndex=(int rawIndex)`:
  Resets the iterator to the rune at the specified index of the string.
- `bool moveNext()`: Move to the next code point.
- `bool movePrevious()`: Move back to the previous code point.
- `void reset([int rawIndex])`:
  Resets the iterator to the given index into the string.

## Class: Runes

The runes (integer Unicode code points) of a [String].

```dart
final class Runes extends Iterable<int> { … }
```

- `Runes(String string)`: Creates a [Runes] iterator for [string].
- `String string`: The string that this is the runes of.
- `RuneIterator get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `int get last`: The last element.

## Class: Set

A collection of objects in which each object can occur only once.

```dart
abstract interface class Set<E> implements Iterable<E>, _SetIterable<E> { … }
```

- `Set()`: Creates an empty [Set].
- `Set.from(Iterable<dynamic> elements)`:
  Creates a [Set] that contains all [elements].
- `Set.identity()`: Creates an empty identity [Set].
- `Set.of(Iterable<E> elements)`: Creates a [Set] from [elements].
- `Set.unmodifiable(Iterable<E> elements)`:
  Creates an unmodifiable [Set] from [elements].
- static `Set<T> castFrom<S, T>(Set<S> source, {Set<R> Function<R>()? newSet})`:
  Adapts [source] to be a `Set<T>`.
- `Iterator<E> get iterator`:
  An iterator that iterates over the elements of this set.
- `bool add(E value)`: Adds [value] to the set.
- `void addAll(Iterable<E> elements)`: Adds all [elements] to this set.
- `Set<R> cast<R>()`: Provides a view of this set as a set of [R] instances.
- `void clear()`: Removes all elements from the set.
- `bool contains(Object? value)`: Whether [value] is in the set.
- `bool containsAll(Iterable<Object?> other)`:
  Whether this set contains all the elements of [other].
- `Set<E> difference(Set<Object?> other)`:
  Creates a new set with the elements of this that are not in [other].
- `Set<E> intersection(Set<Object?> other)`:
  Creates a new set which is the intersection between this set and [other].
- `E? lookup(Object? object)`:
  If an object equal to [object] is in the set, return it.
- `bool remove(Object? value)`: Removes [value] from the set.
- `void removeAll(Iterable<Object?> elements)`:
  Removes each element of [elements] from this set.
- `void removeWhere(bool Function(E) test)`:
  Removes all elements of this set that satisfy [test].
- `void retainAll(Iterable<Object?> elements)`:
  Removes all elements of this set that are not elements in [elements].
- `void retainWhere(bool Function(E) test)`:
  Removes all elements of this set that fail to satisfy [test].
- `Set<E> toSet()`:
  Creates a [Set] with the same elements and behavior as this `Set`.
- `Set<E> union(Set<E> other)`:
  Creates a new set which contains all the elements of this set and [other].

## Class: Sink

A generic destination for data.

```dart
abstract interface class Sink<T> { … }
```

- `void add(T data)`: Adds [data] to the sink.
- `void close()`: Closes the sink.

## Class: StackOverflowError

Error that the platform can use in case of stack overflow.

```dart
final class StackOverflowError implements Error { … }
```

- `StackOverflowError()`
- `StackTrace? get stackTrace`:
  The stack trace at the point where this error was first thrown.
- `String toString()`: A string representation of this object.

## Class: StackTrace

An interface implemented by all stack trace objects.

```dart
abstract interface class StackTrace { … }
```

- `StackTrace()`
- `StackTrace.fromString(String stackTraceString)`:
  Create a `StackTrace` object from [stackTraceString].
- static `_StringStackTrace empty`: A stack trace object with no information.
- static `StackTrace get current`:
  Returns a representation of the current stack trace.
- `String toString()`: Returns a [String] representation of the stack trace.

## Class: StateError

The operation was not allowed by the current state of the object.

```dart
class StateError extends Error { … }
```

- `StateError(String message)`
- `String message`
- `String toString()`: A string representation of this object.

## Class: Stopwatch

A stopwatch which measures time while it's running.

```dart
class Stopwatch { … }
```

- `Stopwatch()`: Creates a [Stopwatch] in stopped state with a zero elapsed count.
- `Duration get elapsed`: The [elapsedTicks] counter converted to a [Duration].
- `int get elapsedMicroseconds`:
  The [elapsedTicks] counter converted to microseconds.
- `int get elapsedMilliseconds`:
  The [elapsedTicks] counter converted to milliseconds.
- `int get elapsedTicks`:
  The elapsed number of clock ticks since calling [start] while the
  [Stopwatch] is running.
- `int get frequency`: Frequency of the elapsed counter in Hz.
- `bool get isRunning`: Whether the [Stopwatch] is currently running.
- `void reset()`: Resets the [elapsed] count to zero.
- `void start()`: Starts the [Stopwatch].
- `void stop()`: Stops the [Stopwatch].

## Class: String

A sequence of UTF-16 code units.

```dart
abstract final class String implements Comparable<String>, Pattern { … }
```

- `String.fromCharCode(int charCode)`:
  Allocates a new string containing the specified [charCode].
- `String.fromCharCodes(Iterable<int> charCodes, [int start, int? end])`:
  Allocates a new string containing the specified [charCodes].
- `String.fromEnvironment(String name, {String defaultValue})`:
  Value for [name] in the compilation configuration environment declaration.
- `List<int> get codeUnits`:
  An unmodifiable list of the UTF-16 code units of this string.
- `int get hashCode`: A hash code derived from the code units of the string.
- `bool get isEmpty`: Whether this string is empty.
- `bool get isNotEmpty`: Whether this string is not empty.
- `int get length`: The length of the string.
- `Runes get runes`: An [Iterable] of Unicode code-points of this string.
- `String operator*(int times)`:
  Creates a new string by concatenating this string with itself a number
  of times.
- `String operator+(String other)`:
  Creates a new string by concatenating this string with [other].
- `bool operator==(Object other)`:
  Whether [other] is a `String` with the same sequence of code units.
- `String operator[](int index)`:
  The character (as a single-code-unit [String]) at the given [index].
- `int codeUnitAt(int index)`:
  Returns the 16-bit UTF-16 code unit at the given [index].
- `int compareTo(String other)`: Compares this string to [other].
- `bool contains(Pattern other, [int startIndex])`:
  Whether this string contains a match of [other].
- `bool endsWith(String other)`: Whether this string ends with [other].
- `int indexOf(Pattern pattern, [int start])`:
  Returns the position of the first match of [pattern] in this string,
  starting at [start], inclusive:
- `int lastIndexOf(Pattern pattern, [int? start])`:
  The starting position of the last match [pattern] in this string.
- `String padLeft(int width, [String padding])`:
  Pads this string on the left if it is shorter than [width].
- `String padRight(int width, [String padding])`:
  Pads this string on the right if it is shorter than [width].
- `String replaceAll(Pattern from, String replace)`:
  Replaces all substrings that match [from] with [replace].
- `String replaceAllMapped(Pattern from, String Function(Match) replace)`:
  Replace all substrings that match [from] by a computed string.
- `String replaceFirst(Pattern from, String to, [int startIndex])`:
  Creates a new string with the first occurrence of [from] replaced by [to].
- `String replaceFirstMapped(Pattern from, String Function(Match) replace, [int startIndex])`:
  Replace the first occurrence of [from] in this string.
- `String replaceRange(int start, int? end, String replacement)`:
  Replaces the substring from [start] to [end] with [replacement].
- `List<String> split(Pattern pattern)`:
  Splits the string at matches of [pattern] and returns a list of substrings.
- `String splitMapJoin(Pattern pattern, {String Function(Match)? onMatch, String Function(String)? onNonMatch})`:
  Splits the string, converts its parts, and combines them into a new
  string.
- `bool startsWith(Pattern pattern, [int index])`:
  Whether this string starts with a match of [pattern].
- `String substring(int start, [int? end])`:
  The substring of this string from [start], inclusive, to [end], exclusive.
- `String toLowerCase()`: Converts all characters in this string to lower case.
- `String toUpperCase()`: Converts all characters in this string to upper case.
- `String trim()`: The string without any leading and trailing whitespace.
- `String trimLeft()`: The string without any leading whitespace.
- `String trimRight()`: The string without any trailing whitespace.

## Class: StringBuffer

A class for concatenating strings efficiently.

```dart
class StringBuffer implements StringSink { … }
```

- `StringBuffer([Object content])`:
  Creates a string buffer containing the provided [content].
- `bool get isEmpty`:
  Returns whether the buffer is empty. This is a constant-time operation.
- `bool get isNotEmpty`:
  Returns whether the buffer is not empty. This is a constant-time
  operation.
- `int get length`:
  Returns the length of the content that has been accumulated so far.
  This is a constant-time operation.
- `void clear()`: Clears the string buffer.
- `String toString()`: Returns the contents of buffer as a single string.
- `void write(Object? object)`: Writes the string representation of [object].
- `void writeAll(Iterable<dynamic> objects, [String separator])`:
  Writes the elements of [objects] separated by [separator].
- `void writeCharCode(int charCode)`:
  Writes a string containing the character with code point [charCode].
- `void writeln([Object? obj])`:
  Writes the string representation of [object] followed by a newline.

## Class: StringSink

```dart
abstract interface class StringSink { … }
```

- `void write(Object? object)`: Writes the string representation of [object].
- `void writeAll(Iterable<dynamic> objects, [String separator])`:
  Writes the elements of [objects] separated by [separator].
- `void writeCharCode(int charCode)`:
  Writes a string containing the character with code point [charCode].
- `void writeln([Object? object])`:
  Writes the string representation of [object] followed by a newline.

## Class: Symbol

Opaque name used by mirrors, invocations and [Function.apply].

```dart
abstract class Symbol { … }
```

- `Symbol(String name)`: Constructs a new [Symbol] representing the provided name.
- static `Symbol empty`: The empty symbol.
- static `Symbol unaryMinus`:
  The symbol corresponding to the name of the unary minus operator.
- `int get hashCode`: Returns a hash code compatible with [operator==].
- `bool operator==(Object other)`:
  Symbols are equal to other symbols with an equal (`==`) name string.

## Class: Type

Runtime representation of a type.

```dart
abstract interface class Type { … }
```

- `int get hashCode`:
  A hash code for the type which is compatible with [operator==].
- `bool operator==(Object other)`:
  Whether [other] is a [Type] instance representing an equivalent type.
- `String toString()`: Returns a string which represents the underlying type.

## Class: TypeError

Error thrown by the runtime system when a dynamic type error happens.

```dart
class TypeError extends Error { … }
```

## Class: UnimplementedError

Thrown by operations that have not been implemented yet.

```dart
class UnimplementedError extends Error implements UnsupportedError { … }
```

- `UnimplementedError([String? message])`
- `String? message`
- `String toString()`: A string representation of this object.

## Class: UnsupportedError

The operation was not allowed by the object.

```dart
class UnsupportedError extends Error { … }
```

- `UnsupportedError(String message)`
- `String? message`
- `String toString()`: A string representation of this object.

## Class: Uri

A parsed URI, such as a URL.

```dart
abstract interface class Uri { … }
```

- `Uri({String? scheme, String? userInfo, String? host, int? port, String? path, Iterable<String>? pathSegments, String? query, Map<String, dynamic>? queryParameters, String? fragment})`:
  Creates a new URI from its components.
- `Uri.dataFromBytes(List<int> bytes, {String mimeType, Map<String, String>? parameters, bool percentEncoded})`:
  Creates a `data:` URI containing an encoding of [bytes].
- `Uri.dataFromString(String content, {String? mimeType, Encoding? encoding, Map<String, String>? parameters, bool base64})`:
  Creates a `data:` URI containing the [content] string.
- `Uri.directory(String path, {bool? windows})`:
  Like [Uri.file] except that a non-empty URI path ends in a slash.
- `Uri.file(String path, {bool? windows})`:
  Creates a new file URI from an absolute or relative file path.
- `Uri.http(String authority, [String unencodedPath, Map<String, dynamic>? queryParameters])`:
  Creates a new `http` URI from authority, path and query.
- `Uri.https(String authority, [String unencodedPath, Map<String, dynamic>? queryParameters])`:
  Creates a new `https` URI from authority, path and query.
- static `String decodeComponent(String encodedComponent)`:
  Decodes the percent-encoding in [encodedComponent].
- static `String decodeFull(String uri)`: Decodes the percent-encoding in [uri].
- static `String decodeQueryComponent(String encodedComponent, {Encoding encoding})`:
  Decodes the percent-encoding in [encodedComponent], converting
  pluses to spaces.
- static `String encodeComponent(String component)`:
  Encode the string [component] using percent-encoding to make it
  safe for literal use as a URI component.
- static `String encodeFull(String uri)`:
  Encodes the string [uri] using percent-encoding to make it
  safe for literal use as a full URI.
- static `String encodeQueryComponent(String component, {Encoding encoding})`:
  Encodes the string [component] according to the HTML 4.01 rules
  for encoding the posting of a HTML form as a query string
  component.
- static `Uri parse(String uri, [int start, int? end])`:
  Creates a new `Uri` object by parsing a URI string.
- static `List<int> parseIPv4Address(String host, [int start, int? end])`:
  Parses the [host] as an IP version 4 (IPv4) address, returning the address
  as a list of 4 bytes in network byte order (big endian).
- static `List<int> parseIPv6Address(String host, [int start, int? end])`:
  Parses the [host] as an IP version 6 (IPv6) address.
- static `Map<String, String> splitQueryString(String query, {Encoding encoding})`:
  Splits the [query] into a map according to the rules
  specified for FORM post in the [HTML 4.01 specification section
  17.13.4](https://www.w3.org/TR/REC-html40/interact/forms.html#h-17.13.4
  "HTML 4.01 section 17.13.4").
- static `Uri? tryParse(String uri, [int start, int? end])`:
  Creates a new `Uri` object by parsing a URI string.
- `String get authority`: The authority component.
- static `Uri get base`: The natural base URI for the current platform.
- `UriData? get data`: Access the structure of a `data:` URI.
- `String get fragment`: The fragment identifier component.
- `bool get hasAbsolutePath`:
  Whether the URI has an absolute path (starting with '/').
- `bool get hasAuthority`: Whether the URI has an [authority] component.
- `bool get hasEmptyPath`: Whether the URI has an empty path.
- `bool get hasFragment`: Whether the URI has a fragment part.
- `bool get hasPort`: Whether the URI has an explicit port.
- `bool get hasQuery`: Whether the URI has a query part.
- `bool get hasScheme`: Whether the URI has a [scheme] component.
- `int get hashCode`: Returns a hash code computed as `toString().hashCode`.
- `String get host`: The host part of the authority component.
- `bool get isAbsolute`: Whether the URI is absolute.
- `String get origin`:
  Returns the origin of the URI in the form scheme://host:port for the
  schemes http and https.
- `String get path`: The path component.
- `List<String> get pathSegments`: The URI path split into its segments.
- `int get port`: The port part of the authority component.
- `String get query`: The query component.
- `Map<String, String> get queryParameters`:
  The URI query split into a map according to the rules
  specified for FORM post in the [HTML 4.01 specification section
  17.13.4](https://www.w3.org/TR/REC-html40/interact/forms.html#h-17.13.4
  "HTML 4.01 section 17.13.4").
- `Map<String, List<String>> get queryParametersAll`:
  Returns the URI query split into a map according to the rules
  specified for FORM post in the [HTML 4.01 specification section
  17.13.4](https://www.w3.org/TR/REC-html40/interact/forms.html#h-17.13.4
  "HTML 4.01 section 17.13.4").
- `String get scheme`: The scheme component of the URI.
- `String get userInfo`: The user info part of the authority component.
- `bool operator==(Object other)`:
  A URI is equal to another URI with the same normalized representation.
- `bool isScheme(String scheme)`: Whether the scheme of this [Uri] is [scheme].
- `Uri normalizePath()`: Returns a URI where the path has been normalized.
- `Uri removeFragment()`:
  Creates a `Uri` that differs from this only in not having a fragment.
- `Uri replace({String? scheme, String? userInfo, String? host, int? port, String? path, Iterable<String>? pathSegments, String? query, Map<String, dynamic>? queryParameters, String? fragment})`:
  Creates a new `Uri` based on this one, but with some parts replaced.
- `Uri resolve(String reference)`:
  Resolve [reference] as an URI relative to `this`.
- `Uri resolveUri(Uri reference)`:
  Resolve [reference] as a URI relative to `this`.
- `String toFilePath({bool? windows})`: Creates a file path from a file URI.
- `String toString()`: The normalized string representation of the URI.

## Class: UriData

A way to access the structure of a `data:` URI.

```dart
final class UriData { … }
```

- `UriData.fromBytes(List<int> bytes, {String mimeType, Map<String, String>? parameters, bool percentEncoded})`:
  Creates a `data:` URI containing an encoding of [bytes].
- `UriData.fromString(String content, {String? mimeType, Encoding? encoding, Map<String, String>? parameters, bool base64})`:
  Creates a `data:` URI containing the [content] string.
- `UriData.fromUri(Uri uri)`:
  Creates a `DataUri` from a [Uri] which must have `data` as [Uri.scheme].
- static `UriData parse(String uri)`: Parses a string as a `data` URI.
- `String get charset`: The charset parameter of the media type.
- `String get contentText`:
  The content part of the data URI, as its actual representation.
- `bool get isBase64`: Whether the data is Base64 encoded or not.
- `String get mimeType`: The MIME type of the data URI.
- `Map<String, String> get parameters`:
  A map representing the parameters of the media type.
- `Uri get uri`: The [Uri] that this `UriData` is giving access to.
- `Uint8List contentAsBytes()`: The content part of the data URI as bytes.
- `String contentAsString({Encoding? encoding})`:
  Creates a string from the content of the data URI.
- `bool isCharset(String charset)`:
  Checks whether the charset parameter of the mime type is [charset].
- `bool isEncoding(Encoding encoding)`:
  Whether the charset parameter represents [encoding].
- `bool isMimeType(String mimeType)`:
  Whether the [UriData.mimeType] is equal to [mimeType].
- `String toString()`: A string representation of this object.

## Class: WeakReference

A weak reference to a Dart object.

```dart
abstract final class WeakReference<T extends Object> { … }
```

- `WeakReference(T target)`:
  Creates a [WeakReference] pointing to the given [target].
- `T? get target`:
  The current object weakly referenced by this [WeakReference], if any.

## Class: bool

The reserved words `true` and `false` denote objects that are the only two
instances of this class.

```dart
final class bool { … }
```

- `bool.fromEnvironment(String name, {bool defaultValue})`:
  Boolean value for [name] in the compilation configuration environment.
- `bool.hasEnvironment(String name)`:
  Whether [name] is declared in the compilation configuration environment.
- static `bool parse(String source, {bool caseSensitive})`:
  Parses [source] as an, optionally case-insensitive, boolean literal.
- static `bool? tryParse(String source, {bool caseSensitive})`:
  Parses [source] as an, optionally case-insensitive, boolean literal.
- `int get hashCode`: The hash code for this object.
- `bool operator&(bool other)`:
  The logical conjunction ("and") of this and [other].
- `bool operator^(bool other)`:
  The logical exclusive disjunction ("exclusive or") of this and [other].
- `String toString()`:
  Returns either `"true"` for `true` and `"false"` for `false`.
- `bool operator|(bool other)`:
  The logical disjunction ("inclusive or") of this and [other].

## Class: double

A double-precision floating point number.

```dart
abstract final class double extends num { … }
```

- static `double infinity`
- static `double maxFinite`
- static `double minPositive`
- static `double nan`
- static `double negativeInfinity`
- static `double parse(String source)`:
  Parse [source] as a double literal and return its value.
- static `double? tryParse(String source)`:
  Parse [source] as a double literal and return its value.
- `double get sign`: The sign of the double's numerical value.
- `double operator%(num other)`: Euclidean modulo of this number by [other].
- `double operator*(num other)`: Multiplies this number by [other].
- `double operator+(num other)`: Adds [other] to this number.
- `double operator-(num other)`: Subtracts [other] from this number.
- `double operatorunary-()`: The negation of this value.
- `double operator/(num other)`: Divides this number by [other].
- `double abs()`: The absolute value of this number.
- `int ceil()`: Returns the least integer that is not smaller than this number.
- `double ceilToDouble()`:
  Returns the least integer double value no smaller than `this`.
- `int floor()`: Returns the greatest integer no greater than this number.
- `double floorToDouble()`:
  Returns the greatest integer double value no greater than `this`.
- `double remainder(num other)`:
  The remainder of the truncating division of `this` by [other].
- `int round()`: Returns the integer closest to this number.
- `double roundToDouble()`: Returns the integer double value closest to `this`.
- `String toString()`: Provide a representation of this [double] value.
- `int truncate()`: Returns the integer obtained by discarding any fractional
  part of this number.
- `double truncateToDouble()`:
  Returns the integer double value obtained by discarding any fractional
  digits from `this`.
- `int operator~/(num other)`: Truncating division operator.

## Class: int

An integer number.

```dart
abstract final class int extends num { … }
```

- `int.fromEnvironment(String name, {int defaultValue})`:
  Integer value for [name] in the compilation configuration environment.
- static `int parse(String source, {int? radix})`:
  Parse [source] as a, possibly signed, integer literal and return its value.
- static `int? tryParse(String source, {int? radix})`:
  Parse [source] as a, possibly signed, integer literal.
- `int get bitLength`:
  Returns the minimum number of bits required to store this integer.
- `bool get isEven`: Returns true if and only if this integer is even.
- `bool get isOdd`: Returns true if and only if this integer is odd.
- `int get sign`: Returns the sign of this integer.
- `int operator&(int other)`: Bit-wise and operator.
- `int operatorunary-()`: Return the negative value of this integer.
- `int operator<<(int shiftAmount)`:
  Shift the bits of this integer to the left by [shiftAmount].
- `int operator>>(int shiftAmount)`:
  Shift the bits of this integer to the right by [shiftAmount].
- `int operator>>>(int shiftAmount)`:
  Bitwise unsigned right shift by [shiftAmount] bits.
- `int operator^(int other)`: Bit-wise exclusive-or operator.
- `int abs()`: Returns the absolute value of this integer.
- `int ceil()`: Returns `this`.
- `double ceilToDouble()`: Returns `this.toDouble()`.
- `int floor()`: Returns `this`.
- `double floorToDouble()`: Returns `this.toDouble()`.
- `int gcd(int other)`:
  Returns the greatest common divisor of this integer and [other].
- `int modInverse(int modulus)`:
  Returns the modular multiplicative inverse of this integer
  modulo [modulus].
- `int modPow(int exponent, int modulus)`:
  Returns this integer to the power of [exponent] modulo [modulus].
- `int round()`: Returns `this`.
- `double roundToDouble()`: Returns `this.toDouble()`.
- `String toRadixString(int radix)`:
  Converts this [int] to a string representation in the given [radix].
- `int toSigned(int width)`:
  Returns the least significant [width] bits of this integer, extending the
  highest retained bit to the sign. This is the same as truncating the value
  to fit in [width] bits using an signed 2-s complement representation. The
  returned value has the same bit value in all positions higher than [width].
- `String toString()`: Returns a string representation of this integer.
- `int toUnsigned(int width)`:
  Returns the least significant [width] bits of this integer as a
  non-negative number (i.e. unsigned representation).  The returned value has
  zeros in all bit positions higher than [width].
- `int truncate()`: Returns `this`.
- `double truncateToDouble()`: Returns `this.toDouble()`.
- `int operator|(int other)`: Bit-wise or operator.
- `int operator~()`: The bit-wise negate operator.

## Class: num

An integer or floating-point number.

```dart
sealed class num implements Comparable<num> { … }
```

- static `num parse(String input, [num Function(String)? onError])`:
  Parses a string containing a number literal into a number.
- static `num? tryParse(String input)`:
  Parses a string containing a number literal into a number.
- `int get hashCode`: Returns a hash code for a numerical value.
- `bool get isFinite`: Whether this number is finite.
- `bool get isInfinite`:
  Whether this number is positive infinity or negative infinity.
- `bool get isNaN`: Whether this number is a Not-a-Number value.
- `bool get isNegative`: Whether this number is negative.
- `num get sign`: Negative one, zero or positive one depending on the sign and
  numerical value of this number.
- `num operator%(num other)`: Euclidean modulo of this number by [other].
- `num operator*(num other)`: Multiplies this number by [other].
- `num operator+(num other)`: Adds [other] to this number.
- `num operator-(num other)`: Subtracts [other] from this number.
- `num operatorunary-()`: The negation of this value.
- `double operator/(num other)`: Divides this number by [other].
- `bool operator<(num other)`:
  Whether this number is numerically smaller than [other].
- `bool operator<=(num other)`:
  Whether this number is numerically smaller than or equal to [other].
- `bool operator==(Object other)`:
  Test whether this value is numerically equal to `other`.
- `bool operator>(num other)`:
  Whether this number is numerically greater than [other].
- `bool operator>=(num other)`:
  Whether this number is numerically greater than or equal to [other].
- `num abs()`: The absolute value of this number.
- `int ceil()`: The least integer no smaller than `this`.
- `double ceilToDouble()`:
  Returns the least double integer value no smaller than `this`.
- `num clamp(num lowerLimit, num upperLimit)`:
  Returns this [num] clamped to be in the range [lowerLimit]-[upperLimit].
- `int compareTo(num other)`: Compares this to `other`.
- `int floor()`: The greatest integer no greater than this number.
- `double floorToDouble()`:
  Returns the greatest double integer value no greater than `this`.
- `num remainder(num other)`:
  The remainder of the truncating division of `this` by [other].
- `int round()`: The integer closest to this number.
- `double roundToDouble()`: The double integer value closest to this value.
- `double toDouble()`: This number as a [double].
- `int toInt()`:
  Truncates this [num] to an integer and returns the result as an [int].
- `String toString()`: The shortest string that correctly represents this number.
- `String toStringAsExponential([int? fractionDigits])`:
  An exponential string-representation of this number.
- `String toStringAsFixed(int fractionDigits)`:
  A decimal-point string-representation of this number.
- `String toStringAsPrecision(int precision)`:
  A string representation with [precision] significant digits.
- `int truncate()`:
  The integer obtained by discarding any fractional digits from `this`.
- `double truncateToDouble()`:
  Returns the double integer value obtained by discarding any fractional
  digits from the double value of `this`.
- `int operator~/(num other)`: Truncating division operator.

## Class: pragma

A hint to tools.

```dart
final class pragma { … }
```

- `pragma(String name, [Object? options])`:
  Creates a hint named [name] with optional [options].
- `String name`: The name of the hint.
- `Object? options`: Optional extra data parameterizing the hint.

## Extension: DateTimeCopyWith

Adds [copyWith] method to [DateTime] objects.

```dart
extension DateTimeCopyWith on DateTime { … }
```

- `DateTime copyWith({int? year, int? month, int? day, int? hour, int? minute, int? second, int? millisecond, int? microsecond, bool? isUtc})`:
  Creates a new [DateTime] from this one by updating individual properties.

## Extension: EnumByName

Access enum values by name.

```dart
extension EnumByName<T extends Enum> on Iterable<T> { … }
```

- `Map<String, T> asNameMap()`:
  Creates a map from the names of enum values to the values.
- `T byName(String name)`: Finds the enum value in this list with name [name].

## Extension: EnumName

Access to the name of an enum value.

```dart
extension EnumName on Enum { … }
```

- `String get name`: The name of the enum value.
