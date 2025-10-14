# Library: dart:math

Mathematical constants and functions, plus a random number generator.

To use this library in your code:
```dart
import 'dart:math';
```

## Random
[Random] is a generator of [bool], [int] or [double] values.
```dart
var intValue = Random().nextInt(10); // Value is >= 0 and < 10.
var doubleValue = Random().nextDouble(); // Value is >= 0.0 and < 1.0.
var boolValue = Random().nextBool(); // true or false, with equal chance.
```

## Point
[Point] is a utility class for representing two-dimensional positions.
```dart
var leftTop = const Point(0, 0);
var rightBottom = const Point(200, 400);
```

## Rectangle
[Rectangle] is a class for representing two-dimensional axis-aligned
rectangles whose properties are immutable.

Create a rectangle spanned by the points.
```dart
var leftTop = const Point(20, 50);
var rightBottom = const Point(300, 600);
var rectangle = Rectangle.fromPoints(leftTop, rightBottom);
print(rectangle.left); // 20
print(rectangle.top); // 50
print(rectangle.right); // 300
print(rectangle.bottom); // 600
```

Create a rectangle spanned by `(left, top)` and
`(left+width, top+height)`.
```dart
var rectangle = const Rectangle(20, 50, 300, 600);
print(rectangle.left); // 20
print(rectangle.top); // 50
print(rectangle.right); // 320
print(rectangle.bottom); // 650
```

## MutableRectangle
[MutableRectangle] is a class for representing two-dimensional axis-aligned
rectangles with mutable properties.

Create a mutable rectangle spanned by `(left, top)` and
`(left+width, top+height)`.
```dart
var rectangle = MutableRectangle(20, 50, 300, 600);
print(rectangle); // Rectangle (20, 50) 300 x 600
print(rectangle.left); // 20
print(rectangle.top); // 50
print(rectangle.right); // 320
print(rectangle.bottom); // 650

// Change rectangle width and height.
rectangle.width = 200;
rectangle.height = 100;
print(rectangle); // Rectangle (20, 50) 200 x 100
print(rectangle.left); // 20
print(rectangle.top); // 50
print(rectangle.right); // 220
print(rectangle.bottom); // 150
```

{@category Core}

## Members

- accessor `double get e`
- accessor `double get ln10`
- accessor `double get ln2`
- accessor `double get log10e`
- accessor `double get log2e`
- accessor `double get pi`
- accessor `double get sqrt1_2`
- accessor `double get sqrt2`
- function `double acos(num x)`:
  Converts [x] to a [double] and returns its arc cosine in radians.
- function `double asin(num x)`:
  Converts [x] to a [double] and returns its arc sine in radians.
- function `double atan(num x)`:
  Converts [x] to a [double] and returns its arc tangent in radians.
- function `double atan2(num a, num b)`: A variant of [atan].
- function `double cos(num radians)`:
  Converts [radians] to a [double] and returns the cosine of the value.
- function `double exp(num x)`:
  Converts [x] to a [double] and returns the natural exponent, [e],
  to the power [x].
- function `double log(num x)`:
  Converts [x] to a [double] and returns the natural logarithm of the value.
- function `T max<T extends num>(T a, T b)`: Returns the larger of two numbers.
- function `T min<T extends num>(T a, T b)`: Returns the lesser of two numbers.
- function `num pow(num x, num exponent)`: Returns [x] to the power of [exponent].
- function `double sin(num radians)`:
  Converts [radians] to a [double] and returns the sine of the value.
- function `double sqrt(num x)`:
  Converts [x] to a [double] and returns the positive square root of the
  value.
- function `double tan(num radians)`:
  Converts [radians] to a [double] and returns the tangent of the value.

## Class: MutableRectangle

A class for representing two-dimensional axis-aligned rectangles with
mutable properties.

```dart
class MutableRectangle<T extends num>
    extends _RectangleBase<T>
    implements Rectangle<T> { … }
```

- `MutableRectangle(T left, T top, T width, T height)`:
  Create a mutable rectangle spanned by `(left, top)` and
  `(left+width, top+height)`.
- `MutableRectangle.fromPoints(Point<T> a, Point<T> b)`:
  Create a mutable rectangle spanned by the points [a] and [b];
- `T left`: The x-coordinate of the left edge.
- `T top`: The y-coordinate of the left edge.
- `T get height`: The height of the rectangle.
- `set height=(T height)`: Sets the height of the rectangle.
- `T get width`: The width of the rectangle.
- `set width=(T width)`: Sets the width of the rectangle.

## Class: Point

A utility class for representing two-dimensional positions.

```dart
class Point<T extends num> { … }
```

- `Point(T x, T y)`: Creates a point with the provided [x] and [y] coordinates.
- `T x`
- `T y`
- `int get hashCode`: The hash code for this object.
- `double get magnitude`:
  Get the straight line (Euclidean) distance between the origin (0, 0) and
  this point.
- `Point<T> operator*(num factor)`:
  Scale this point by [factor] as if it were a vector.
- `Point<T> operator+(Point<T> other)`:
  Add [other] to `this`, as if both points were vectors.
- `Point<T> operator-(Point<T> other)`:
  Subtract [other] from `this`, as if both points were vectors.
- `bool operator==(Object other)`:
  Whether [other] is a point with the same coordinates as this point.
- `double distanceTo(Point<T> other)`:
  Returns the distance between `this` and [other].
- `T squaredDistanceTo(Point<T> other)`:
  Returns the squared distance between `this` and [other].
- `String toString()`: A string representation of this object.

## Class: Random

A generator of random bool, int, or double values.

```dart
abstract interface class Random { … }
```

- `Random([int? seed])`: Creates a random number generator.
- `Random.secure()`: Creates a cryptographically secure random number generator.
- `bool nextBool()`: Generates a random boolean value.
- `double nextDouble()`:
  Generates a non-negative random floating point value uniformly distributed
  in the range from 0.0, inclusive, to 1.0, exclusive.
- `int nextInt(int max)`:
  Generates a non-negative random integer uniformly distributed in the range
  from 0, inclusive, to [max], exclusive.

## Class: Rectangle

A class for representing two-dimensional rectangles whose properties are
immutable.

```dart
class Rectangle<T extends num> extends _RectangleBase<T> { … }
```

- `Rectangle(T left, T top, T width, T height)`:
  Create a rectangle spanned by `(left, top)` and
  `(left+width, top+height)`.
- `Rectangle.fromPoints(Point<T> a, Point<T> b)`:
  Create a rectangle spanned by the points [a] and [b];
- `T height`
- `T left`
- `T top`
- `T width`
