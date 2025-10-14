# Library: dart:typed_data

Lists that efficiently handle fixed sized data
(for example, unsigned 8 byte integers) and SIMD numeric types.

To use this library in your code:
```dart
import 'dart:typed_data';
```
{@category Core}
{@canonicalFor dart:_internal.BytesBuilder}

## Members

## Class: ByteBuffer

A sequence of bytes underlying a typed data object.

```dart
abstract final class ByteBuffer { … }
```

- `int get lengthInBytes`: The length of this byte buffer, in bytes.
- `ByteData asByteData([int offsetInBytes, int? length])`:
  Creates a [ByteData] _view_ of a region of this byte buffer.
- `Float32List asFloat32List([int offsetInBytes, int? length])`:
  Creates a [Float32List] _view_ of a region of this byte buffer.
- `Float32x4List asFloat32x4List([int offsetInBytes, int? length])`:
  Creates a [Float32x4List] _view_ of a region of this byte buffer.
- `Float64List asFloat64List([int offsetInBytes, int? length])`:
  Creates a [Float64List] _view_ of a region of this byte buffer.
- `Float64x2List asFloat64x2List([int offsetInBytes, int? length])`:
  Creates a [Float64x2List] _view_ of a region of this byte buffer.
- `Int16List asInt16List([int offsetInBytes, int? length])`:
  Creates a [Int16List] _view_ of a region of this byte buffer.
- `Int32List asInt32List([int offsetInBytes, int? length])`:
  Creates a [Int32List] _view_ of a region of this byte buffer.
- `Int32x4List asInt32x4List([int offsetInBytes, int? length])`:
  Creates a [Int32x4List] _view_ of a region of this byte buffer.
- `Int64List asInt64List([int offsetInBytes, int? length])`:
  Creates a [Int64List] _view_ of a region of this byte buffer.
- `Int8List asInt8List([int offsetInBytes, int? length])`:
  Creates a [Int8List] _view_ of a region of this byte buffer.
- `Uint16List asUint16List([int offsetInBytes, int? length])`:
  Creates a [Uint16List] _view_ of a region of this byte buffer.
- `Uint32List asUint32List([int offsetInBytes, int? length])`:
  Creates a [Uint32List] _view_ of a region of this byte buffer.
- `Uint64List asUint64List([int offsetInBytes, int? length])`:
  Creates a [Uint64List] _view_ of a region of this byte buffer.
- `Uint8ClampedList asUint8ClampedList([int offsetInBytes, int? length])`:
  Creates a [Uint8ClampedList] _view_ of a region of this byte buffer.
- `Uint8List asUint8List([int offsetInBytes, int? length])`:
  Creates a [Uint8List] _view_ of a region of this byte buffer.

## Class: ByteData

A fixed-length, random-access sequence of bytes that also provides random
and unaligned access to the fixed-width integers and floating point
numbers represented by those bytes.

```dart
abstract final class ByteData implements TypedData { … }
```

- `ByteData(int length)`:
  Creates a [ByteData] of the specified length (in elements), all of
  whose bytes are initially zero.
- `ByteData.sublistView(TypedData data, [int start, int? end])`:
  Creates a [ByteData] view on a range of elements of [data].
- `ByteData.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates an [ByteData] _view_ of the specified region in [buffer].
- `ByteData asUnmodifiableView()`: A read-only view of this [ByteData].
- `double getFloat32(int byteOffset, [Endian endian])`:
  The floating point number represented by the four bytes at
  the specified [byteOffset] in this object, in IEEE 754
  single-precision binary floating-point format (binary32).
- `double getFloat64(int byteOffset, [Endian endian])`:
  The floating point number represented by the eight bytes at
  the specified [byteOffset] in this object, in IEEE 754
  double-precision binary floating-point format (binary64).
- `int getInt16(int byteOffset, [Endian endian])`:
  The (possibly negative) integer represented by the two bytes at
  the specified [byteOffset] in this object, in two's complement binary
  form.
- `int getInt32(int byteOffset, [Endian endian])`:
  The (possibly negative) integer represented by the four bytes at
  the specified [byteOffset] in this object, in two's complement binary
  form.
- `int getInt64(int byteOffset, [Endian endian])`:
  The (possibly negative) integer represented by the eight bytes at
  the specified [byteOffset] in this object, in two's complement binary
  form.
- `int getInt8(int byteOffset)`:
  The (possibly negative) integer represented by the byte at the
  specified [byteOffset] in this object, in two's complement binary
  representation.
- `int getUint16(int byteOffset, [Endian endian])`:
  The positive integer represented by the two bytes starting
  at the specified [byteOffset] in this object, in unsigned binary
  form.
- `int getUint32(int byteOffset, [Endian endian])`:
  The positive integer represented by the four bytes starting
  at the specified [byteOffset] in this object, in unsigned binary
  form.
- `int getUint64(int byteOffset, [Endian endian])`:
  The positive integer represented by the eight bytes starting
  at the specified [byteOffset] in this object, in unsigned binary
  form.
- `int getUint8(int byteOffset)`:
  The positive integer represented by the byte at the specified
  [byteOffset] in this object, in unsigned binary form.
- `void setFloat32(int byteOffset, double value, [Endian endian])`:
  Sets the four bytes starting at the specified [byteOffset] in this
  object to the IEEE 754 single-precision binary floating-point
  (binary32) representation of the specified [value].
- `void setFloat64(int byteOffset, double value, [Endian endian])`:
  Sets the eight bytes starting at the specified [byteOffset] in this
  object to the IEEE 754 double-precision binary floating-point
  (binary64) representation of the specified [value].
- `void setInt16(int byteOffset, int value, [Endian endian])`:
  Sets the two bytes starting at the specified [byteOffset] in this
  object to the two's complement binary representation of the specified
  [value], which must fit in two bytes.
- `void setInt32(int byteOffset, int value, [Endian endian])`:
  Sets the four bytes starting at the specified [byteOffset] in this
  object to the two's complement binary representation of the specified
  [value], which must fit in four bytes.
- `void setInt64(int byteOffset, int value, [Endian endian])`:
  Sets the eight bytes starting at the specified [byteOffset] in this
  object to the two's complement binary representation of the specified
  [value], which must fit in eight bytes.
- `void setInt8(int byteOffset, int value)`:
  Sets the byte at the specified [byteOffset] in this object to the
  two's complement binary representation of the specified [value], which
  must fit in a single byte.
- `void setUint16(int byteOffset, int value, [Endian endian])`:
  Sets the two bytes starting at the specified [byteOffset] in this object
  to the unsigned binary representation of the specified [value],
  which must fit in two bytes.
- `void setUint32(int byteOffset, int value, [Endian endian])`:
  Sets the four bytes starting at the specified [byteOffset] in this object
  to the unsigned binary representation of the specified [value],
  which must fit in four bytes.
- `void setUint64(int byteOffset, int value, [Endian endian])`:
  Sets the eight bytes starting at the specified [byteOffset] in this object
  to the unsigned binary representation of the specified [value],
  which must fit in eight bytes.
- `void setUint8(int byteOffset, int value)`:
  Sets the byte at the specified [byteOffset] in this object to the
  unsigned binary representation of the specified [value], which must fit
  in a single byte.

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

## Class: Endian

Endianness of number representation.

```dart
final class Endian { … }
```

- static `Endian big`
- static `Endian host`
- static `Endian little`

## Class: Float32List

A fixed-length list of IEEE 754 single-precision binary floating-point
numbers that is viewable as a [TypedData].

```dart
abstract final class Float32List implements _TypedFloatList { … }
```

- `Float32List(int length)`:
  Creates a [Float32List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Float32List.fromList(List<double> elements)`:
  Creates a [Float32List] with the same length as the [elements] list
  and copies over the elements.
- `Float32List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Float32List] view on a range of elements of [data].
- `Float32List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Float32List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `Float32List asUnmodifiableView()`: A read-only view of this [Float32List].
- `Float32List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Float32x4

Four 32-bit floating point values.

```dart
abstract final class Float32x4 { … }
```

- `Float32x4(double x, double y, double z, double w)`:
  Creates a `Float32x4` containing the 32-bit float values of the arguments.
- `Float32x4.fromFloat64x2(Float64x2 xy)`:
  Creates a `Float32x4` with its [x] and [y] lanes set to values from [xy].
- `Float32x4.fromInt32x4Bits(Int32x4 bits)`:
  Creates a `Float32x4` with 32-bit float values from the provided bits.
- `Float32x4.splat(double value)`:
  Creates a `Float32x4` with the same 32-bit float value four times.
- `Float32x4.zero()`: Creates a `Float32x4` with all values being zero.
- static `int wwww`: Shuffle mask "wwww".
- static `int wwwx`: Shuffle mask "wwwx".
- static `int wwwy`: Shuffle mask "wwwy".
- static `int wwwz`: Shuffle mask "wwwz".
- static `int wwxw`: Shuffle mask "wwxw".
- static `int wwxx`: Shuffle mask "wwxx".
- static `int wwxy`: Shuffle mask "wwxy".
- static `int wwxz`: Shuffle mask "wwxz".
- static `int wwyw`: Shuffle mask "wwyw".
- static `int wwyx`: Shuffle mask "wwyx".
- static `int wwyy`: Shuffle mask "wwyy".
- static `int wwyz`: Shuffle mask "wwyz".
- static `int wwzw`: Shuffle mask "wwzw".
- static `int wwzx`: Shuffle mask "wwzx".
- static `int wwzy`: Shuffle mask "wwzy".
- static `int wwzz`: Shuffle mask "wwzz".
- static `int wxww`: Shuffle mask "wxww".
- static `int wxwx`: Shuffle mask "wxwx".
- static `int wxwy`: Shuffle mask "wxwy".
- static `int wxwz`: Shuffle mask "wxwz".
- static `int wxxw`: Shuffle mask "wxxw".
- static `int wxxx`: Shuffle mask "wxxx".
- static `int wxxy`: Shuffle mask "wxxy".
- static `int wxxz`: Shuffle mask "wxxz".
- static `int wxyw`: Shuffle mask "wxyw".
- static `int wxyx`: Shuffle mask "wxyx".
- static `int wxyy`: Shuffle mask "wxyy".
- static `int wxyz`: Shuffle mask "wxyz".
- static `int wxzw`: Shuffle mask "wxzw".
- static `int wxzx`: Shuffle mask "wxzx".
- static `int wxzy`: Shuffle mask "wxzy".
- static `int wxzz`: Shuffle mask "wxzz".
- static `int wyww`: Shuffle mask "wyww".
- static `int wywx`: Shuffle mask "wywx".
- static `int wywy`: Shuffle mask "wywy".
- static `int wywz`: Shuffle mask "wywz".
- static `int wyxw`: Shuffle mask "wyxw".
- static `int wyxx`: Shuffle mask "wyxx".
- static `int wyxy`: Shuffle mask "wyxy".
- static `int wyxz`: Shuffle mask "wyxz".
- static `int wyyw`: Shuffle mask "wyyw".
- static `int wyyx`: Shuffle mask "wyyx".
- static `int wyyy`: Shuffle mask "wyyy".
- static `int wyyz`: Shuffle mask "wyyz".
- static `int wyzw`: Shuffle mask "wyzw".
- static `int wyzx`: Shuffle mask "wyzx".
- static `int wyzy`: Shuffle mask "wyzy".
- static `int wyzz`: Shuffle mask "wyzz".
- static `int wzww`: Shuffle mask "wzww".
- static `int wzwx`: Shuffle mask "wzwx".
- static `int wzwy`: Shuffle mask "wzwy".
- static `int wzwz`: Shuffle mask "wzwz".
- static `int wzxw`: Shuffle mask "wzxw".
- static `int wzxx`: Shuffle mask "wzxx".
- static `int wzxy`: Shuffle mask "wzxy".
- static `int wzxz`: Shuffle mask "wzxz".
- static `int wzyw`: Shuffle mask "wzyw".
- static `int wzyx`: Shuffle mask "wzyx".
- static `int wzyy`: Shuffle mask "wzyy".
- static `int wzyz`: Shuffle mask "wzyz".
- static `int wzzw`: Shuffle mask "wzzw".
- static `int wzzx`: Shuffle mask "wzzx".
- static `int wzzy`: Shuffle mask "wzzy".
- static `int wzzz`: Shuffle mask "wzzz".
- static `int xwww`: Shuffle mask "xwww".
- static `int xwwx`: Shuffle mask "xwwx".
- static `int xwwy`: Shuffle mask "xwwy".
- static `int xwwz`: Shuffle mask "xwwz".
- static `int xwxw`: Shuffle mask "xwxw".
- static `int xwxx`: Shuffle mask "xwxx".
- static `int xwxy`: Shuffle mask "xwxy".
- static `int xwxz`: Shuffle mask "xwxz".
- static `int xwyw`: Shuffle mask "xwyw".
- static `int xwyx`: Shuffle mask "xwyx".
- static `int xwyy`: Shuffle mask "xwyy".
- static `int xwyz`: Shuffle mask "xwyz".
- static `int xwzw`: Shuffle mask "xwzw".
- static `int xwzx`: Shuffle mask "xwzx".
- static `int xwzy`: Shuffle mask "xwzy".
- static `int xwzz`: Shuffle mask "xwzz".
- static `int xxww`: Shuffle mask "xxww".
- static `int xxwx`: Shuffle mask "xxwx".
- static `int xxwy`: Shuffle mask "xxwy".
- static `int xxwz`: Shuffle mask "xxwz".
- static `int xxxw`: Shuffle mask "xxxw".
- static `int xxxx`: Shuffle mask "xxxx".
- static `int xxxy`: Shuffle mask "xxxy".
- static `int xxxz`: Shuffle mask "xxxz".
- static `int xxyw`: Shuffle mask "xxyw".
- static `int xxyx`: Shuffle mask "xxyx".
- static `int xxyy`: Shuffle mask "xxyy".
- static `int xxyz`: Shuffle mask "xxyz".
- static `int xxzw`: Shuffle mask "xxzw".
- static `int xxzx`: Shuffle mask "xxzx".
- static `int xxzy`: Shuffle mask "xxzy".
- static `int xxzz`: Shuffle mask "xxzz".
- static `int xyww`: Shuffle mask "xyww".
- static `int xywx`: Shuffle mask "xywx".
- static `int xywy`: Shuffle mask "xywy".
- static `int xywz`: Shuffle mask "xywz".
- static `int xyxw`: Shuffle mask "xyxw".
- static `int xyxx`: Shuffle mask "xyxx".
- static `int xyxy`: Shuffle mask "xyxy".
- static `int xyxz`: Shuffle mask "xyxz".
- static `int xyyw`: Shuffle mask "xyyw".
- static `int xyyx`: Shuffle mask "xyyx".
- static `int xyyy`: Shuffle mask "xyyy".
- static `int xyyz`: Shuffle mask "xyyz".
- static `int xyzw`: Shuffle mask "xyzw".
- static `int xyzx`: Shuffle mask "xyzx".
- static `int xyzy`: Shuffle mask "xyzy".
- static `int xyzz`: Shuffle mask "xyzz".
- static `int xzww`: Shuffle mask "xzww".
- static `int xzwx`: Shuffle mask "xzwx".
- static `int xzwy`: Shuffle mask "xzwy".
- static `int xzwz`: Shuffle mask "xzwz".
- static `int xzxw`: Shuffle mask "xzxw".
- static `int xzxx`: Shuffle mask "xzxx".
- static `int xzxy`: Shuffle mask "xzxy".
- static `int xzxz`: Shuffle mask "xzxz".
- static `int xzyw`: Shuffle mask "xzyw".
- static `int xzyx`: Shuffle mask "xzyx".
- static `int xzyy`: Shuffle mask "xzyy".
- static `int xzyz`: Shuffle mask "xzyz".
- static `int xzzw`: Shuffle mask "xzzw".
- static `int xzzx`: Shuffle mask "xzzx".
- static `int xzzy`: Shuffle mask "xzzy".
- static `int xzzz`: Shuffle mask "xzzz".
- static `int ywww`: Shuffle mask "ywww".
- static `int ywwx`: Shuffle mask "ywwx".
- static `int ywwy`: Shuffle mask "ywwy".
- static `int ywwz`: Shuffle mask "ywwz".
- static `int ywxw`: Shuffle mask "ywxw".
- static `int ywxx`: Shuffle mask "ywxx".
- static `int ywxy`: Shuffle mask "ywxy".
- static `int ywxz`: Shuffle mask "ywxz".
- static `int ywyw`: Shuffle mask "ywyw".
- static `int ywyx`: Shuffle mask "ywyx".
- static `int ywyy`: Shuffle mask "ywyy".
- static `int ywyz`: Shuffle mask "ywyz".
- static `int ywzw`: Shuffle mask "ywzw".
- static `int ywzx`: Shuffle mask "ywzx".
- static `int ywzy`: Shuffle mask "ywzy".
- static `int ywzz`: Shuffle mask "ywzz".
- static `int yxww`: Shuffle mask "yxww".
- static `int yxwx`: Shuffle mask "yxwx".
- static `int yxwy`: Shuffle mask "yxwy".
- static `int yxwz`: Shuffle mask "yxwz".
- static `int yxxw`: Shuffle mask "yxxw".
- static `int yxxx`: Shuffle mask "yxxx".
- static `int yxxy`: Shuffle mask "yxxy".
- static `int yxxz`: Shuffle mask "yxxz".
- static `int yxyw`: Shuffle mask "yxyw".
- static `int yxyx`: Shuffle mask "yxyx".
- static `int yxyy`: Shuffle mask "yxyy".
- static `int yxyz`: Shuffle mask "yxyz".
- static `int yxzw`: Shuffle mask "yxzw".
- static `int yxzx`: Shuffle mask "yxzx".
- static `int yxzy`: Shuffle mask "yxzy".
- static `int yxzz`: Shuffle mask "yxzz".
- static `int yyww`: Shuffle mask "yyww".
- static `int yywx`: Shuffle mask "yywx".
- static `int yywy`: Shuffle mask "yywy".
- static `int yywz`: Shuffle mask "yywz".
- static `int yyxw`: Shuffle mask "yyxw".
- static `int yyxx`: Shuffle mask "yyxx".
- static `int yyxy`: Shuffle mask "yyxy".
- static `int yyxz`: Shuffle mask "yyxz".
- static `int yyyw`: Shuffle mask "yyyw".
- static `int yyyx`: Shuffle mask "yyyx".
- static `int yyyy`: Shuffle mask "yyyy".
- static `int yyyz`: Shuffle mask "yyyz".
- static `int yyzw`: Shuffle mask "yyzw".
- static `int yyzx`: Shuffle mask "yyzx".
- static `int yyzy`: Shuffle mask "yyzy".
- static `int yyzz`: Shuffle mask "yyzz".
- static `int yzww`: Shuffle mask "yzww".
- static `int yzwx`: Shuffle mask "yzwx".
- static `int yzwy`: Shuffle mask "yzwy".
- static `int yzwz`: Shuffle mask "yzwz".
- static `int yzxw`: Shuffle mask "yzxw".
- static `int yzxx`: Shuffle mask "yzxx".
- static `int yzxy`: Shuffle mask "yzxy".
- static `int yzxz`: Shuffle mask "yzxz".
- static `int yzyw`: Shuffle mask "yzyw".
- static `int yzyx`: Shuffle mask "yzyx".
- static `int yzyy`: Shuffle mask "yzyy".
- static `int yzyz`: Shuffle mask "yzyz".
- static `int yzzw`: Shuffle mask "yzzw".
- static `int yzzx`: Shuffle mask "yzzx".
- static `int yzzy`: Shuffle mask "yzzy".
- static `int yzzz`: Shuffle mask "yzzz".
- static `int zwww`: Shuffle mask "zwww".
- static `int zwwx`: Shuffle mask "zwwx".
- static `int zwwy`: Shuffle mask "zwwy".
- static `int zwwz`: Shuffle mask "zwwz".
- static `int zwxw`: Shuffle mask "zwxw".
- static `int zwxx`: Shuffle mask "zwxx".
- static `int zwxy`: Shuffle mask "zwxy".
- static `int zwxz`: Shuffle mask "zwxz".
- static `int zwyw`: Shuffle mask "zwyw".
- static `int zwyx`: Shuffle mask "zwyx".
- static `int zwyy`: Shuffle mask "zwyy".
- static `int zwyz`: Shuffle mask "zwyz".
- static `int zwzw`: Shuffle mask "zwzw".
- static `int zwzx`: Shuffle mask "zwzx".
- static `int zwzy`: Shuffle mask "zwzy".
- static `int zwzz`: Shuffle mask "zwzz".
- static `int zxww`: Shuffle mask "zxww".
- static `int zxwx`: Shuffle mask "zxwx".
- static `int zxwy`: Shuffle mask "zxwy".
- static `int zxwz`: Shuffle mask "zxwz".
- static `int zxxw`: Shuffle mask "zxxw".
- static `int zxxx`: Shuffle mask "zxxx".
- static `int zxxy`: Shuffle mask "zxxy".
- static `int zxxz`: Shuffle mask "zxxz".
- static `int zxyw`: Shuffle mask "zxyw".
- static `int zxyx`: Shuffle mask "zxyx".
- static `int zxyy`: Shuffle mask "zxyy".
- static `int zxyz`: Shuffle mask "zxyz".
- static `int zxzw`: Shuffle mask "zxzw".
- static `int zxzx`: Shuffle mask "zxzx".
- static `int zxzy`: Shuffle mask "zxzy".
- static `int zxzz`: Shuffle mask "zxzz".
- static `int zyww`: Shuffle mask "zyww".
- static `int zywx`: Shuffle mask "zywx".
- static `int zywy`: Shuffle mask "zywy".
- static `int zywz`: Shuffle mask "zywz".
- static `int zyxw`: Shuffle mask "zyxw".
- static `int zyxx`: Shuffle mask "zyxx".
- static `int zyxy`: Shuffle mask "zyxy".
- static `int zyxz`: Shuffle mask "zyxz".
- static `int zyyw`: Shuffle mask "zyyw".
- static `int zyyx`: Shuffle mask "zyyx".
- static `int zyyy`: Shuffle mask "zyyy".
- static `int zyyz`: Shuffle mask "zyyz".
- static `int zyzw`: Shuffle mask "zyzw".
- static `int zyzx`: Shuffle mask "zyzx".
- static `int zyzy`: Shuffle mask "zyzy".
- static `int zyzz`: Shuffle mask "zyzz".
- static `int zzww`: Shuffle mask "zzww".
- static `int zzwx`: Shuffle mask "zzwx".
- static `int zzwy`: Shuffle mask "zzwy".
- static `int zzwz`: Shuffle mask "zzwz".
- static `int zzxw`: Shuffle mask "zzxw".
- static `int zzxx`: Shuffle mask "zzxx".
- static `int zzxy`: Shuffle mask "zzxy".
- static `int zzxz`: Shuffle mask "zzxz".
- static `int zzyw`: Shuffle mask "zzyw".
- static `int zzyx`: Shuffle mask "zzyx".
- static `int zzyy`: Shuffle mask "zzyy".
- static `int zzyz`: Shuffle mask "zzyz".
- static `int zzzw`: Shuffle mask "zzzw".
- static `int zzzx`: Shuffle mask "zzzx".
- static `int zzzy`: Shuffle mask "zzzy".
- static `int zzzz`: Shuffle mask "zzzz".
- `int get signMask`: The sign bits of each lane as single bits.
- `double get w`: The value of the "w" lane.
- `double get x`: The value of the "x" lane.
- `double get y`: The value of the "y" lane.
- `double get z`: The value of the "z" lane.
- `Float32x4 operator*(Float32x4 other)`: Lane-wise multiplication.
- `Float32x4 operator+(Float32x4 other)`: Lane-wise addition.
- `Float32x4 operatorunary-()`: Lane-wise negation.
- `Float32x4 operator-(Float32x4 other)`: Lane-wise subtraction.
- `Float32x4 operator/(Float32x4 other)`: Lane-wise division.
- `Float32x4 abs()`: Lane-wise conversion to absolute value.
- `Float32x4 clamp(Float32x4 lowerLimit, Float32x4 upperLimit)`:
  Lane-wise clamp to a range.
- `Int32x4 equal(Float32x4 other)`: Lane-wise equals comparison.
- `Int32x4 greaterThan(Float32x4 other)`: Lane-wise greater-than comparison.
- `Int32x4 greaterThanOrEqual(Float32x4 other)`:
  Lane-wise greater-than-or-equal comparison.
- `Int32x4 lessThan(Float32x4 other)`: Lane-wise less-than comparison.
- `Int32x4 lessThanOrEqual(Float32x4 other)`:
  Lane-wise less-than-or-equal comparison.
- `Float32x4 max(Float32x4 other)`: Lane-wise maximum.
- `Float32x4 min(Float32x4 other)`: Lane-wise minimum.
- `Int32x4 notEqual(Float32x4 other)`: Lane-wise not-equals comparison.
- `Float32x4 reciprocal()`: Lane-wise reciprocal.
- `Float32x4 reciprocalSqrt()`: Lane-wise approximation of reciprocal square root.
- `Float32x4 scale(double scale)`: Lane-wise multiplication by [scale].
- `Float32x4 shuffle(int mask)`: Shuffle the lane values based on the [mask].
- `Float32x4 shuffleMix(Float32x4 other, int mask)`:
  Mixes lanes chosen from two [Float32x4] values using a [mask].
- `Float32x4 sqrt()`: Lane-wise square root.
- `Float32x4 withW(double w)`:
  This value, but with the value of the [Float32x4.w] lane set to [w].
- `Float32x4 withX(double x)`:
  This value, but with the value of the [Float32x4.x] lane set to [x].
- `Float32x4 withY(double y)`:
  This value, but with the value of the [Float32x4.y] lane set to [y].
- `Float32x4 withZ(double z)`:
  This value, but with the value of the [Float32x4.z] lane set to [z].

## Class: Float32x4List

A fixed-length list of [Float32x4] numbers that is viewable as a
[TypedData].

```dart
abstract final class Float32x4List
    implements TypedDataList<Float32x4>, TypedData { … }
```

- `Float32x4List(int length)`:
  Creates a [Float32x4List] of the specified length (in elements),
  all of whose elements are initially zero.
- `Float32x4List.fromList(List<Float32x4> elements)`:
  Creates a [Float32x4List] with the same length as the [elements] list
  and copies over the elements.
- `Float32x4List.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Float32x4List] view on a range of elements of [data].
- `Float32x4List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Float32x4List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `List<Float32x4> operator+(List<Float32x4> other)`:
  The concatenation of this list and [other].
- `Float32x4List asUnmodifiableView()`: A read-only view of this [Float32x4List].
- `Float32x4List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Float64List

A fixed-length list of IEEE 754 double-precision binary floating-point
numbers  that is viewable as a [TypedData].

```dart
abstract final class Float64List implements _TypedFloatList { … }
```

- `Float64List(int length)`:
  Creates a [Float64List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Float64List.fromList(List<double> elements)`:
  Creates a [Float64List] with the same length as the [elements] list
  and copies over the elements.
- `Float64List.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Float64List] view on a range of elements of [data].
- `Float64List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Float64List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `Float64List asUnmodifiableView()`: A read-only view of this [Float64List].
- `Float64List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Float64x2

Float64x2 immutable value type and operations.

```dart
abstract final class Float64x2 { … }
```

- `Float64x2(double x, double y)`
- `Float64x2.fromFloat32x4(Float32x4 v)`: Uses the "x" and "y" lanes from [v].
- `Float64x2.splat(double v)`
- `Float64x2.zero()`
- `int get signMask`:
  Extract the sign bits from each lane return them in the first 2 bits.
  "x" lane is bit 0.
  "y" lane is bit 1.
- `double get x`: Extracted x value.
- `double get y`: Extracted y value.
- `Float64x2 operator*(Float64x2 other)`: Multiplication operator.
- `Float64x2 operator+(Float64x2 other)`: Addition operator.
- `Float64x2 operatorunary-()`: Negate operator.
- `Float64x2 operator-(Float64x2 other)`: Subtraction operator.
- `Float64x2 operator/(Float64x2 other)`: Division operator.
- `Float64x2 abs()`: The lane-wise absolute value of this [Float64x2].
- `Float64x2 clamp(Float64x2 lowerLimit, Float64x2 upperLimit)`:
  Lane-wise clamp this [Float64x2] to be in the range
  [lowerLimit]-[upperLimit].
- `Float64x2 max(Float64x2 other)`:
  The lane-wise maximum value in this [Float64x2] or [other].
- `Float64x2 min(Float64x2 other)`:
  The lane-wise minimum value in this [Float64x2] or [other].
- `Float64x2 scale(double s)`:
  Returns a copy of this [Float64x2] each lane being scaled by [s].
  Equivalent to this * new Float64x2.splat(s)
- `Float64x2 sqrt()`: The lane-wise square root of this [Float64x2].
- `Float64x2 withX(double x)`:
  Returns a new [Float64x2] copied from this [Float64x2] with a new x
  value.
- `Float64x2 withY(double y)`:
  Returns a new [Float64x2] copied from this [Float64x2] with a new y
  value.

## Class: Float64x2List

A fixed-length list of [Float64x2] numbers that is viewable as a
[TypedData].

```dart
abstract final class Float64x2List
    implements TypedDataList<Float64x2>, TypedData { … }
```

- `Float64x2List(int length)`:
  Creates a [Float64x2List] of the specified length (in elements),
  all of whose elements have all lanes set to zero.
- `Float64x2List.fromList(List<Float64x2> elements)`:
  Creates a [Float64x2List] with the same length as the [elements] list
  and copies over the elements.
- `Float64x2List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Float64x2List] view on a range of elements of [data].
- `Float64x2List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Float64x2List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `List<Float64x2> operator+(List<Float64x2> other)`:
  The concatenation of this list and [other].
- `Float64x2List asUnmodifiableView()`: A read-only view of this [Float64x2List].
- `Float64x2List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Int16List

A fixed-length list of 16-bit signed integers that is viewable as a
[TypedData].

```dart
abstract final class Int16List implements _TypedIntList { … }
```

- `Int16List(int length)`:
  Creates an [Int16List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Int16List.fromList(List<int> elements)`:
  Creates a [Int16List] with the same length as the [elements] list
  and copies over the elements.
- `Int16List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Int16List] view on a range of elements of [data].
- `Int16List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates an [Int16List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `Int16List asUnmodifiableView()`: A read-only view of this [Int16List].
- `Int16List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Int32List

A fixed-length list of 32-bit signed integers that is viewable as a
[TypedData].

```dart
abstract final class Int32List implements _TypedIntList { … }
```

- `Int32List(int length)`:
  Creates an [Int32List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Int32List.fromList(List<int> elements)`:
  Creates a [Int32List] with the same length as the [elements] list
  and copies over the elements.
- `Int32List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Int32List] view on a range of elements of [data].
- `Int32List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates an [Int32List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `Int32List asUnmodifiableView()`: A read-only view of this [Int16List].
- `Int32List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Int32x4

Int32x4 and operations.

```dart
abstract final class Int32x4 { … }
```

- `Int32x4(int x, int y, int z, int w)`
- `Int32x4.bool(bool x, bool y, bool z, bool w)`
- `Int32x4.fromFloat32x4Bits(Float32x4 x)`
- static `int wwww`
- static `int wwwx`
- static `int wwwy`
- static `int wwwz`
- static `int wwxw`
- static `int wwxx`
- static `int wwxy`
- static `int wwxz`
- static `int wwyw`
- static `int wwyx`
- static `int wwyy`
- static `int wwyz`
- static `int wwzw`
- static `int wwzx`
- static `int wwzy`
- static `int wwzz`
- static `int wxww`
- static `int wxwx`
- static `int wxwy`
- static `int wxwz`
- static `int wxxw`
- static `int wxxx`
- static `int wxxy`
- static `int wxxz`
- static `int wxyw`
- static `int wxyx`
- static `int wxyy`
- static `int wxyz`
- static `int wxzw`
- static `int wxzx`
- static `int wxzy`
- static `int wxzz`
- static `int wyww`
- static `int wywx`
- static `int wywy`
- static `int wywz`
- static `int wyxw`
- static `int wyxx`
- static `int wyxy`
- static `int wyxz`
- static `int wyyw`
- static `int wyyx`
- static `int wyyy`
- static `int wyyz`
- static `int wyzw`
- static `int wyzx`
- static `int wyzy`
- static `int wyzz`
- static `int wzww`
- static `int wzwx`
- static `int wzwy`
- static `int wzwz`
- static `int wzxw`
- static `int wzxx`
- static `int wzxy`
- static `int wzxz`
- static `int wzyw`
- static `int wzyx`
- static `int wzyy`
- static `int wzyz`
- static `int wzzw`
- static `int wzzx`
- static `int wzzy`
- static `int wzzz`
- static `int xwww`
- static `int xwwx`
- static `int xwwy`
- static `int xwwz`
- static `int xwxw`
- static `int xwxx`
- static `int xwxy`
- static `int xwxz`
- static `int xwyw`
- static `int xwyx`
- static `int xwyy`
- static `int xwyz`
- static `int xwzw`
- static `int xwzx`
- static `int xwzy`
- static `int xwzz`
- static `int xxww`
- static `int xxwx`
- static `int xxwy`
- static `int xxwz`
- static `int xxxw`
- static `int xxxx`: Mask passed to [shuffle] or [shuffleMix].
- static `int xxxy`
- static `int xxxz`
- static `int xxyw`
- static `int xxyx`
- static `int xxyy`
- static `int xxyz`
- static `int xxzw`
- static `int xxzx`
- static `int xxzy`
- static `int xxzz`
- static `int xyww`
- static `int xywx`
- static `int xywy`
- static `int xywz`
- static `int xyxw`
- static `int xyxx`
- static `int xyxy`
- static `int xyxz`
- static `int xyyw`
- static `int xyyx`
- static `int xyyy`
- static `int xyyz`
- static `int xyzw`
- static `int xyzx`
- static `int xyzy`
- static `int xyzz`
- static `int xzww`
- static `int xzwx`
- static `int xzwy`
- static `int xzwz`
- static `int xzxw`
- static `int xzxx`
- static `int xzxy`
- static `int xzxz`
- static `int xzyw`
- static `int xzyx`
- static `int xzyy`
- static `int xzyz`
- static `int xzzw`
- static `int xzzx`
- static `int xzzy`
- static `int xzzz`
- static `int ywww`
- static `int ywwx`
- static `int ywwy`
- static `int ywwz`
- static `int ywxw`
- static `int ywxx`
- static `int ywxy`
- static `int ywxz`
- static `int ywyw`
- static `int ywyx`
- static `int ywyy`
- static `int ywyz`
- static `int ywzw`
- static `int ywzx`
- static `int ywzy`
- static `int ywzz`
- static `int yxww`
- static `int yxwx`
- static `int yxwy`
- static `int yxwz`
- static `int yxxw`
- static `int yxxx`
- static `int yxxy`
- static `int yxxz`
- static `int yxyw`
- static `int yxyx`
- static `int yxyy`
- static `int yxyz`
- static `int yxzw`
- static `int yxzx`
- static `int yxzy`
- static `int yxzz`
- static `int yyww`
- static `int yywx`
- static `int yywy`
- static `int yywz`
- static `int yyxw`
- static `int yyxx`
- static `int yyxy`
- static `int yyxz`
- static `int yyyw`
- static `int yyyx`
- static `int yyyy`
- static `int yyyz`
- static `int yyzw`
- static `int yyzx`
- static `int yyzy`
- static `int yyzz`
- static `int yzww`
- static `int yzwx`
- static `int yzwy`
- static `int yzwz`
- static `int yzxw`
- static `int yzxx`
- static `int yzxy`
- static `int yzxz`
- static `int yzyw`
- static `int yzyx`
- static `int yzyy`
- static `int yzyz`
- static `int yzzw`
- static `int yzzx`
- static `int yzzy`
- static `int yzzz`
- static `int zwww`
- static `int zwwx`
- static `int zwwy`
- static `int zwwz`
- static `int zwxw`
- static `int zwxx`
- static `int zwxy`
- static `int zwxz`
- static `int zwyw`
- static `int zwyx`
- static `int zwyy`
- static `int zwyz`
- static `int zwzw`
- static `int zwzx`
- static `int zwzy`
- static `int zwzz`
- static `int zxww`
- static `int zxwx`
- static `int zxwy`
- static `int zxwz`
- static `int zxxw`
- static `int zxxx`
- static `int zxxy`
- static `int zxxz`
- static `int zxyw`
- static `int zxyx`
- static `int zxyy`
- static `int zxyz`
- static `int zxzw`
- static `int zxzx`
- static `int zxzy`
- static `int zxzz`
- static `int zyww`
- static `int zywx`
- static `int zywy`
- static `int zywz`
- static `int zyxw`
- static `int zyxx`
- static `int zyxy`
- static `int zyxz`
- static `int zyyw`
- static `int zyyx`
- static `int zyyy`
- static `int zyyz`
- static `int zyzw`
- static `int zyzx`
- static `int zyzy`
- static `int zyzz`
- static `int zzww`
- static `int zzwx`
- static `int zzwy`
- static `int zzwz`
- static `int zzxw`
- static `int zzxx`
- static `int zzxy`
- static `int zzxz`
- static `int zzyw`
- static `int zzyx`
- static `int zzyy`
- static `int zzyz`
- static `int zzzw`
- static `int zzzx`
- static `int zzzy`
- static `int zzzz`
- `bool get flagW`:
  Extracted w value. Returns false for 0, true for any other value.
- `bool get flagX`:
  Extracted x value. Returns false for 0, true for any other value.
- `bool get flagY`:
  Extracted y value. Returns false for 0, true for any other value.
- `bool get flagZ`:
  Extracted z value. Returns false for 0, true for any other value.
- `int get signMask`:
  Extract the top bit from each lane return them in the first 4 bits.
  "x" lane is bit 0.
  "y" lane is bit 1.
  "z" lane is bit 2.
  "w" lane is bit 3.
- `int get w`: Extract 32-bit mask from w lane.
- `int get x`: Extract 32-bit mask from x lane.
- `int get y`: Extract 32-bit mask from y lane.
- `int get z`: Extract 32-bit mask from z lane.
- `Int32x4 operator&(Int32x4 other)`: The bit-wise and operator.
- `Int32x4 operator+(Int32x4 other)`: Addition operator.
- `Int32x4 operator-(Int32x4 other)`: Subtraction operator.
- `Int32x4 operator^(Int32x4 other)`: The bit-wise xor operator.
- `Float32x4 select(Float32x4 trueValue, Float32x4 falseValue)`:
  Merge [trueValue] and [falseValue] based on this [Int32x4] bit mask:
  Select bit from [trueValue] when bit in this [Int32x4] is on.
  Select bit from [falseValue] when bit in this [Int32x4] is off.
- `Int32x4 shuffle(int mask)`:
  Shuffle the lane values. [mask] must be one of the 256 shuffle constants.
- `Int32x4 shuffleMix(Int32x4 other, int mask)`:
  Shuffle the lane values in this [Int32x4] and [other]. The returned
  Int32x4 will have XY lanes from this [Int32x4] and ZW lanes from [other].
  Uses the same [mask] as [shuffle].
- `Int32x4 withFlagW(bool w)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new w value.
- `Int32x4 withFlagX(bool x)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new x value.
- `Int32x4 withFlagY(bool y)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new y value.
- `Int32x4 withFlagZ(bool z)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new z value.
- `Int32x4 withW(int w)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new w value.
- `Int32x4 withX(int x)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new x value.
- `Int32x4 withY(int y)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new y value.
- `Int32x4 withZ(int z)`:
  Returns a new [Int32x4] copied from this [Int32x4] with a new z value.
- `Int32x4 operator|(Int32x4 other)`: The bit-wise or operator.

## Class: Int32x4List

A fixed-length list of [Int32x4] numbers that is viewable as a
[TypedData].

```dart
abstract final class Int32x4List
    implements TypedDataList<Int32x4>, TypedData { … }
```

- `Int32x4List(int length)`:
  Creates a [Int32x4List] of the specified length (in elements),
  all of whose elements are initially zero.
- `Int32x4List.fromList(List<Int32x4> elements)`:
  Creates a [Int32x4List] with the same length as the [elements] list
  and copies over the elements.
- `Int32x4List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Int32x4List] view on a range of elements of [data].
- `Int32x4List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Int32x4List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `List<Int32x4> operator+(List<Int32x4> other)`:
  The concatenation of this list and [other].
- `Int32x4List asUnmodifiableView()`: A read-only view of this [Int32x4List].
- `Int32x4List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Int64List

A fixed-length list of 64-bit signed integers that is viewable as a
[TypedData].

```dart
abstract final class Int64List implements _TypedIntList { … }
```

- `Int64List(int length)`:
  Creates an [Int64List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Int64List.fromList(List<int> elements)`:
  Creates a [Int64List] with the same length as the [elements] list
  and copies over the elements.
- `Int64List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Int64List] view on a range of elements of [data].
- `Int64List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates an [Int64List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `Int64List asUnmodifiableView()`: A read-only view of this [Int64List].
- `Int64List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Int8List

A fixed-length list of 8-bit signed integers.

```dart
abstract final class Int8List implements _TypedIntList { … }
```

- `Int8List(int length)`:
  Creates an [Int8List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Int8List.fromList(List<int> elements)`:
  Creates a [Int8List] with the same length as the [elements] list
  and copies over the elements.
- `Int8List.sublistView(TypedData data, [int start, int? end])`:
  Creates an [Int8List] view on a range of elements of [data].
- `Int8List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates an [Int8List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `Int8List asUnmodifiableView()`: A read-only view of this [Int8List];
- `Int8List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: TypedData

A typed view of a sequence of bytes.

```dart
abstract final class TypedData { … }
```

- `ByteBuffer get buffer`: The byte buffer associated with this object.
- `int get elementSizeInBytes`:
  The number of bytes in the representation of each element in this list.
- `int get lengthInBytes`: The length of this view, in bytes.
- `int get offsetInBytes`:
  The offset of this view into the underlying byte buffer, in bytes.

## Class: TypedDataList

A [TypedData] fixed-length [List]-view on the bytes of [buffer].

```dart
abstract final class TypedDataList<E> implements TypedData, List<E> { … }
```

## Class: Uint16List

A fixed-length list of 16-bit unsigned integers that is viewable as a
[TypedData].

```dart
abstract final class Uint16List implements _TypedIntList { … }
```

- `Uint16List(int length)`:
  Creates a [Uint16List] of the specified length (in elements), all
  of whose elements are initially zero.
- `Uint16List.fromList(List<int> elements)`:
  Creates a [Uint16List] with the same length as the [elements] list
  and copies over the elements.
- `Uint16List.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Uint16List] view on a range of elements of [data].
- `Uint16List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Uint16List] _view_ of the specified region in
  the specified byte buffer.
- static `int bytesPerElement`
- `Uint16List asUnmodifiableView()`: A read-only view of this [Uint16List].
- `Uint16List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Uint32List

A fixed-length list of 32-bit unsigned integers that is viewable as a
[TypedData].

```dart
abstract final class Uint32List implements _TypedIntList { … }
```

- `Uint32List(int length)`:
  Creates a [Uint32List] of the specified length (in elements), all
  of whose elements are initially zero.
- `Uint32List.fromList(List<int> elements)`:
  Creates a [Uint32List] with the same length as the [elements] list
  and copies over the elements.
- `Uint32List.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Uint32List] view on a range of elements of [data].
- `Uint32List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Uint32List] _view_ of the specified region in
  the specified byte buffer.
- static `int bytesPerElement`
- `Uint32List asUnmodifiableView()`: A read-only view of this [Uint32List].
- `Uint32List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Uint64List

A fixed-length list of 64-bit unsigned integers that is viewable as a
[TypedData].

```dart
abstract final class Uint64List implements _TypedIntList { … }
```

- `Uint64List(int length)`:
  Creates a [Uint64List] of the specified length (in elements), all
  of whose elements are initially zero.
- `Uint64List.fromList(List<int> elements)`:
  Creates a [Uint64List] with the same length as the [elements] list
  and copies over the elements.
- `Uint64List.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Uint64List] view on a range of elements of [data].
- `Uint64List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates an [Uint64List] _view_ of the specified region in
  the specified byte buffer.
- static `int bytesPerElement`
- `Uint64List asUnmodifiableView()`: A read-only view of this [Uint64List].
- `Uint64List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Uint8ClampedList

A fixed-length list of 8-bit unsigned integers.

```dart
abstract final class Uint8ClampedList implements _TypedIntList { … }
```

- `Uint8ClampedList(int length)`:
  Creates a [Uint8ClampedList] of the specified length (in elements), all of
  whose elements are initially zero.
- `Uint8ClampedList.fromList(List<int> elements)`:
  Creates a [Uint8ClampedList] of the same size as the [elements]
  list and copies over the values clamping when needed.
- `Uint8ClampedList.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Uint8ClampedList] view on a range of elements of [data].
- `Uint8ClampedList.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Uint8ClampedList] _view_ of the specified region in the
  specified byte [buffer].
- static `int bytesPerElement`
- `Uint8ClampedList asUnmodifiableView()`:
  A read-only view of this [Uint8ClampedList].
- `Uint8ClampedList sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].

## Class: Uint8List

A fixed-length list of 8-bit unsigned integers.

```dart
abstract final class Uint8List implements _TypedIntList { … }
```

- `Uint8List(int length)`:
  Creates a [Uint8List] of the specified length (in elements), all of
  whose elements are initially zero.
- `Uint8List.fromList(List<int> elements)`:
  Creates a [Uint8List] with the same length as the [elements] list
  and copies over the elements.
- `Uint8List.sublistView(TypedData data, [int start, int? end])`:
  Creates a [Uint8List] view on a range of elements of [data].
- `Uint8List.view(ByteBuffer buffer, [int offsetInBytes, int? length])`:
  Creates a [Uint8List] _view_ of the specified region in [buffer].
- static `int bytesPerElement`
- `List<int> operator+(List<int> other)`:
  Returns a concatenation of this list and [other].
- `Uint8List asUnmodifiableView()`: A read-only view of this [Uint8List].
- `Uint8List sublist(int start, [int? end])`:
  Creates a new list containing the elements between [start] and [end].
