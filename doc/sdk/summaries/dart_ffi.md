# Library: dart:ffi

Foreign Function Interface for interoperability with the C programming language.

For further details, please see: https://dart.dev/server/c-interop.

{@category VM}

## Members

- accessor `Pointer<Never> get nullptr`
- function `int sizeOf<T extends SizedNativeType>()`:
  Number of bytes used by native type T.
- type alias `typedef Dart_NativeMessageHandler = Void Function(Int64, Pointer<Dart_CObject>)`
- type alias `typedef NativeFinalizerFunction = NativeFunction<Void Function(Pointer<Void>)>`:
  The native function type for [NativeFinalizer]s.

## Class: Abi

An application binary interface (ABI).

```dart
class Abi { … }
```

- `Abi.current()`: The ABI the Dart VM is currently running on.
- static `Abi androidArm`:
  The application binary interface for Android on the Arm architecture.
- static `Abi androidArm64`:
  The application binary interface for Android on the Arm64 architecture.
- static `Abi androidIA32`:
  The application binary interface for Android on the IA32 architecture.
- static `Abi androidRiscv64`:
  The application binary interface for Android on 64-bit RISC-V.
- static `Abi androidX64`:
  The application binary interface for Android on the X64 architecture.
- static `Abi fuchsiaArm64`:
  The application binary interface for Fuchsia on the Arm64 architecture.
- static `Abi fuchsiaRiscv64`:
  The application binary interface for Fuchsia on the Riscv64 architecture.
- static `Abi fuchsiaX64`:
  The application binary interface for Fuchsia on the X64 architecture.
- static `Abi iosArm`:
  The application binary interface for iOS on the Arm architecture.
- static `Abi iosArm64`:
  The application binary interface for iOS on the Arm64 architecture.
- static `Abi iosX64`:
  The application binary interface for iOS on the X64 architecture.
- static `Abi linuxArm`:
  The application binary interface for Linux on the Arm architecture.
- static `Abi linuxArm64`:
  The application binary interface for linux on the Arm64 architecture.
- static `Abi linuxIA32`:
  The application binary interface for linux on the IA32 architecture.
- static `Abi linuxRiscv32`:
  The application binary interface for linux on 32-bit RISC-V.
- static `Abi linuxRiscv64`:
  The application binary interface for linux on 64-bit RISC-V.
- static `Abi linuxX64`:
  The application binary interface for linux on the X64 architecture.
- static `Abi macosArm64`:
  The application binary interface for MacOS on the Arm64 architecture.
- static `Abi macosX64`:
  The application binary interface for MacOS on the X64 architecture.
- static `List<Abi> values`: The ABIs that the DartVM can run on.
- static `Abi windowsArm64`:
  The application binary interface for Windows on the Arm64 architecture.
- static `Abi windowsIA32`:
  The application binary interface for Windows on the IA32 architecture.
- static `Abi windowsX64`:
  The application binary interface for Windows on the X64 architecture.
- `String toString()`: A string representation of this ABI.

## Class: AbiSpecificInteger

The supertype of all [Abi]-specific integer types.

```dart
class AbiSpecificInteger implements SizedNativeType { … }
```

- `AbiSpecificInteger()`

## Class: AbiSpecificIntegerMapping

Mapping for a subtype of [AbiSpecificInteger].

```dart
final class AbiSpecificIntegerMapping { … }
```

- `AbiSpecificIntegerMapping(Map<Abi, NativeType> mapping)`
- `Map<Abi, NativeType> mapping`

## Class: Allocator

Manages memory on the native heap.

```dart
abstract class Allocator { … }
```

- `Pointer<T> allocate<T extends NativeType>(int byteCount, {int? alignment})`:
  Allocates [byteCount] bytes of memory on the native heap.
- `void free(Pointer<NativeType> pointer)`:
  Releases memory allocated on the native heap.

## Class: Array

A fixed-sized array of [T]s.

```dart
final class Array<T extends NativeType> extends _Compound { … }
```

- `Array(int dimension1, [int dimension2, int dimension3, int dimension4, int dimension5])`:
  Annotation to specify [Array] dimensions in [Struct]s.
- `Array.multi(List<int> dimensions)`:
  Annotation to specify [Array] dimensions in [Struct]s.
- `Array.variable([int dimension2, int dimension3, int dimension4, int dimension5])`:
  Annotation to specify a variable length [Array] in [Struct]s.
- `Array.variableMulti(List<int> dimensions, {int variableDimension})`:
  Annotation to a variable length [Array] in [Struct]s.
- `Array.variableWithVariableDimension([int dimension1, int dimension2, int dimension3, int dimension4, int dimension5])`:
  Annotation to specify a variable length [Array] with a configurable
  variable dimension ([dimension1]) in [Struct]s.

## Class: Bool

Represents a native bool in C.

```dart
final class Bool implements SizedNativeType { … }
```

- `Bool()`

## Class: Char

The C `char` type.

```dart
final class Char extends AbiSpecificInteger { … }
```

- `Char()`

## Class: DartRepresentationOf

```dart
final class DartRepresentationOf { … }
```

- `DartRepresentationOf(String nativeType)`:
  Represents the Dart type corresponding to a [NativeType].

## Class: Dart_CObject

Opaque, not exposing it's members.

```dart
final class Dart_CObject extends Opaque { … }
```

## Class: DefaultAsset

Annotation specifying the default asset ID for the current library.

```dart
final class DefaultAsset { … }
```

- `DefaultAsset(String id)`
- `String id`:
  The default asset name for [Native] external functions in this library.

## Class: Double

Represents a native 64 bit double in C.

```dart
final class Double implements _NativeDouble { … }
```

- `Double()`

## Class: DynamicLibrary

A dynamically loaded native library.

```dart
final class DynamicLibrary { … }
```

- `DynamicLibrary.executable()`:
  Creates a [DynamicLibrary] containing all the symbols of the running
  executable.
- `DynamicLibrary.open(String path)`:
  Loads a library file and provides access to its symbols.
- `DynamicLibrary.process()`:
  Creates a [DynamicLibrary] holding all global symbols.
- `Pointer<Void> get handle`: The opaque handle to the dynamic library.
- `int get hashCode`:
  The hash code for a [DynamicLibrary] only depends on the loaded library.
- `bool operator==(Object other)`:
  Dynamic libraries are equal if they load the same library.
- `void close()`: Closes this dynamic library.
- `Pointer<T> lookup<T extends NativeType>(String symbolName)`:
  Looks up a symbol in the [DynamicLibrary] and returns its address in
  memory.
- `bool providesSymbol(String symbolName)`:
  Checks whether this dynamic library provides a symbol with the given
  name.

## Class: Finalizable

Marker interface for objects which should not be finalized too soon.

```dart
abstract interface class Finalizable { … }
```

## Class: Float

Represents a native 32 bit float in C.

```dart
final class Float implements _NativeDouble { … }
```

- `Float()`

## Class: Handle

Represents `Dart_Handle` from `dart_api.h` in C.

```dart
abstract final class Handle implements NativeType { … }
```

## Class: Int

The C `int` type.

```dart
final class Int extends AbiSpecificInteger { … }
```

- `Int()`

## Class: Int16

Represents a native signed 16 bit integer in C.

```dart
final class Int16 implements _NativeInteger { … }
```

- `Int16()`

## Class: Int32

Represents a native signed 32 bit integer in C.

```dart
final class Int32 implements _NativeInteger { … }
```

- `Int32()`

## Class: Int64

Represents a native signed 64 bit integer in C.

```dart
final class Int64 implements _NativeInteger { … }
```

- `Int64()`

## Class: Int8

Represents a native signed 8 bit integer in C.

```dart
final class Int8 implements _NativeInteger { … }
```

- `Int8()`

## Class: IntPtr

The C `intptr_t` type.

```dart
final class IntPtr extends AbiSpecificInteger { … }
```

- `IntPtr()`

## Class: Long

The C `long int`, aka. `long`, type.

```dart
final class Long extends AbiSpecificInteger { … }
```

- `Long()`

## Class: LongLong

The C `long long` type.

```dart
final class LongLong extends AbiSpecificInteger { … }
```

- `LongLong()`

## Class: Native

Annotation binding an external declaration to its native implementation.

```dart
final class Native<T> { … }
```

- `Native({String? assetId, bool isLeaf, String? symbol})`
- static `Pointer<T> addressOf<T extends NativeType>(Object native)`:
  The native address of the implementation of [native].
- `String? assetId`:
  The ID of the asset in which [symbol] is resolved, if not using the
  default.
- `bool isLeaf`: Whether the function is a leaf function.
- `String? symbol`: The native symbol to be resolved, if not using the default.

## Class: NativeApi

Utilities for accessing the Dart VM API from Dart code or
from C code via `dart_api_dl.h`.

```dart
abstract final class NativeApi { … }
```

- static `Pointer<NativeFunction<Int8 Function(Int64)>> get closeNativePort`:
  A function pointer to
  `bool Dart_CloseNativePort(Dart_Port native_port_id)`
  in `dart_native_api.h`.
- static `Pointer<Void> get initializeApiDLData`:
  Pass this to `Dart_InitializeApiDL` in your native code to enable using the
  symbols in `dart_api_dl.h`.
- static `int get majorVersion`:
  On breaking changes the major version is increased.
- static `int get minorVersion`:
  On backwards compatible changes the minor version is increased.
- static `Pointer<NativeFunction<Int64 Function(Pointer<Uint8>, Pointer<NativeFunction<Void Function(Int64, Pointer<Dart_CObject>)>>, Int8)>> get newNativePort`:
  A function pointer to
- static `Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> get postCObject`:
  A function pointer to
  `bool Dart_PostCObject(Dart_Port port_id, Dart_CObject* message)`
  in `dart_native_api.h`.

## Class: NativeCallable

A native callable which listens for calls to a native function.

```dart
abstract final class NativeCallable<T extends Function> { … }
```

- `NativeCallable.isolateGroupBound(Function callback, {Object? exceptionalReturn})`
- `NativeCallable.isolateLocal(Function callback, {Object? exceptionalReturn})`:
  Constructs a [NativeCallable] that must be invoked from the same thread
  that created it.
- `NativeCallable.listener(Function callback)`:
  Constructs a [NativeCallable] that can be invoked from any thread.
- `bool keepIsolateAlive`:
  Whether this [NativeCallable] keeps its [Isolate] alive.
- `Pointer<NativeFunction<T>> get nativeFunction`:
  The native function pointer which can be used to invoke the `callback`
  passed to the constructor.
- `void close()`: Closes this callback and releases its resources.

## Class: NativeFinalizer

A native finalizer which can be attached to Dart objects.

```dart
abstract final class NativeFinalizer { … }
```

- `NativeFinalizer(Pointer<NativeFunction<Void Function(Pointer<Void>)>> callback)`:
  Creates a finalizer with the given finalization callback.
- `void attach(Finalizable value, Pointer<Void> token, {Object? detach, int? externalSize})`:
  Attaches this finalizer to [value].
- `void detach(Object detach)`:
  Detaches this finalizer from values attached with [detach].

## Class: NativeFunction

Represents a function type in C.

```dart
abstract final class NativeFunction<T extends Function>
    implements NativeType { … }
```

## Class: NativeType

[NativeType]'s subtypes represent a native type in C.

```dart
abstract final class NativeType { … }
```

## Class: Opaque

[Opaque]'s subtypes represent opaque types in C.

```dart
abstract class Opaque implements NativeType { … }
```

## Class: Packed

Annotation to specify on `Struct` subtypes to indicate that its members
need to be packed.

```dart
final class Packed { … }
```

- `Packed(int memberAlignment)`
- `int memberAlignment`

## Class: Pointer

Represents a pointer into the native C memory. Cannot be extended.

```dart
final class Pointer<T extends NativeType> implements SizedNativeType { … }
```

- `Pointer.fromAddress(int ptr)`: Construction from raw integer.
- static `Pointer<NativeFunction<T>> fromFunction<T extends Function>(Function f, [Object? exceptionalReturn])`:
  Convert Dart function to a C function pointer, automatically marshalling
  the arguments and return value
- `int get address`: Access to the raw pointer value.
  On 32-bit systems, the upper 32-bits of the result are 0.
- `int get hashCode`: The hash code for a Pointer only depends on its address.
- `bool operator==(Object other)`:
  Equality for Pointers only depends on their address.
- `Pointer<U> cast<U extends NativeType>()`:
  Reinterprets the address of this pointer as the address of a [U].

## Class: Short

The C `short` type.

```dart
final class Short extends AbiSpecificInteger { … }
```

- `Short()`

## Class: SignedChar

The C `signed char` type.

```dart
final class SignedChar extends AbiSpecificInteger { … }
```

- `SignedChar()`

## Class: Size

The C `size_t` type.

```dart
final class Size extends AbiSpecificInteger { … }
```

- `Size()`

## Class: SizedNativeType

A [NativeType] with a known size.

```dart
abstract final class SizedNativeType implements NativeType { … }
```

## Class: Struct

The supertype of all FFI struct types.

```dart
abstract class Struct extends _Compound implements SizedNativeType { … }
```

- `Struct()`: Construct a reference to the [nullptr].
- static `T create<T extends Struct>([TypedData typedData, int offset])`:
  Creates a struct view of bytes in [typedData].

## Class: Uint16

Represents a native unsigned 16 bit integer in C.

```dart
final class Uint16 implements _NativeInteger { … }
```

- `Uint16()`

## Class: Uint32

Represents a native unsigned 32 bit integer in C.

```dart
final class Uint32 implements _NativeInteger { … }
```

- `Uint32()`

## Class: Uint64

Represents a native unsigned 64 bit integer in C.

```dart
final class Uint64 implements _NativeInteger { … }
```

- `Uint64()`

## Class: Uint8

Represents a native unsigned 8 bit integer in C.

```dart
final class Uint8 implements _NativeInteger { … }
```

- `Uint8()`

## Class: UintPtr

The C `uintptr_t` type.

```dart
final class UintPtr extends AbiSpecificInteger { … }
```

- `UintPtr()`

## Class: Union

The supertype of all FFI union types.

```dart
abstract class Union extends _Compound implements SizedNativeType { … }
```

- `Union()`: Construct a reference to the [nullptr].
- static `T create<T extends Union>([TypedData typedData, int offset])`:
  Creates a union view of bytes in [typedData].

## Class: UnsignedChar

The C `unsigned char` type.

```dart
final class UnsignedChar extends AbiSpecificInteger { … }
```

- `UnsignedChar()`

## Class: UnsignedInt

The C `unsigned int` type.

```dart
final class UnsignedInt extends AbiSpecificInteger { … }
```

- `UnsignedInt()`

## Class: UnsignedLong

The C `unsigned long int`, aka. `unsigned long`, type.

```dart
final class UnsignedLong extends AbiSpecificInteger { … }
```

- `UnsignedLong()`

## Class: UnsignedLongLong

The C `unsigned long long` type.

```dart
final class UnsignedLongLong extends AbiSpecificInteger { … }
```

- `UnsignedLongLong()`

## Class: UnsignedShort

The C `unsigned short` type.

```dart
final class UnsignedShort extends AbiSpecificInteger { … }
```

- `UnsignedShort()`

## Class: VarArgs

The types of variadic arguments passed in C.

```dart
abstract final class VarArgs<T extends Record> implements NativeType { … }
```

## Class: Void

Represents a void type in C.

```dart
abstract final class Void implements NativeType { … }
```

## Class: WChar

The C `wchar_t` type.

```dart
final class WChar extends AbiSpecificInteger { … }
```

- `WChar()`

## Extension: AbiSpecificIntegerArray

Bounds checking indexing methods on [Array]s of [AbiSpecificInteger].

```dart
extension AbiSpecificIntegerArray<T extends AbiSpecificInteger> on Array<T> { … }
```

- `List<int> get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: AbiSpecificIntegerPointer

Extension on [Pointer] specialized for the type argument
[AbiSpecificInteger].

```dart
extension AbiSpecificIntegerPointer<T extends AbiSpecificInteger> on Pointer<T> { … }
```

- `int get value`: The integer at [address].
- `set value=(int value)`
- `Pointer<T> operator+(int offset)`:
  A pointer to the [offset]th [T] after this one.
- `Pointer<T> operator-(int offset)`:
  A pointer to the [offset]th [T] before this one.
- `int operator[](int index)`: The integer at `address + sizeOf<T>() * index`.
- `void operator[]=(int index, int value)`:
  The integer at `address + sizeOf<T>() * index`.
- `Pointer<T> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: AllocatorAlloc

Extension on [Allocator] to provide allocation with [NativeType].

```dart
extension AllocatorAlloc on Allocator { … }
```

- `Pointer<T> call<T extends SizedNativeType>([int count])`:
  Allocates `sizeOf<T>() * count` bytes of memory using [allocate].

## Extension: ArrayAddress

```dart
extension ArrayAddress<T extends NativeType> on Array<T> { … }
```

- `Pointer<T> get address`: The memory address of the underlying data.

## Extension: ArrayArray

Bounds checking indexing methods on [Array]s of [Array].

```dart
extension ArrayArray<T extends NativeType> on Array<Array<T>> { … }
```

- `List<Array<T>> get elements`: A list view of the bytes of this array.
- `Array<T> operator[](int index)`
- `void operator[]=(int index, Array<T> value)`

## Extension: BoolAddress

```dart
extension BoolAddress on bool { … }
```

- `Pointer<Never> address`: The memory address of the underlying data.

## Extension: BoolArray

Bounds checking indexing methods on [Array]s of [Bool].

```dart
extension BoolArray on Array<Bool> { … }
```

- `List<bool> get elements`: A list view of the bytes of this array.
- `bool operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, bool value)`:
  Stores a Dart value in this array at [index].

## Extension: BoolPointer

Extension on [Pointer] specialized for the type argument [Bool].

```dart
extension BoolPointer on Pointer<Bool> { … }
```

- `bool get value`: The bool at [address].
- `set value=(bool value)`
- `Pointer<Bool> operator+(int offset)`:
  A pointer to the [offset]th [Bool] after this one.
- `Pointer<Bool> operator-(int offset)`:
  A pointer to the [offset]th [Bool] before this one.
- `bool operator[](int index)`: The bool at `address + sizeOf<Bool>() * index`.
- `void operator[]=(int index, bool value)`:
  The bool at `address + sizeOf<Bool>() * index`.
- `Pointer<Bool> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: DoubleAddress

```dart
extension DoubleAddress on double { … }
```

- `Pointer<Never> address`: The memory address of the underlying data.

## Extension: DoubleArray

Bounds checking indexing methods on [Array]s of [Double].

```dart
extension DoubleArray on Array<Double> { … }
```

- `Float64List get elements`: A list view of the bytes of this array.
- `double operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, double value)`:
  Stores a Dart value in this array at [index].

## Extension: DoublePointer

Extension on [Pointer] specialized for the type argument [Double].

```dart
extension DoublePointer on Pointer<Double> { … }
```

- `double get value`: The double at [address].
- `set value=(double value)`
- `Pointer<Double> operator+(int offset)`:
  A pointer to the [offset]th [Double] after this one.
- `Pointer<Double> operator-(int offset)`:
  A pointer to the [offset]th [Double] before this one.
- `double operator[](int index)`:
  The double at `address + sizeOf<Double>() * index`.
- `void operator[]=(int index, double value)`:
  The double at `address + sizeOf<Double>() * index`.
- `Float64List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Double> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: DynamicLibraryExtension

Method which must not be invoked dynamically.

```dart
extension DynamicLibraryExtension on DynamicLibrary { … }
```

- `F lookupFunction<T extends Function, F extends Function>(String symbolName, {bool isLeaf})`:
  Looks up a native function and returns it as a Dart function.

## Extension: Float32ListAddress

```dart
extension Float32ListAddress on Float32List { … }
```

- `Pointer<Float> get address`: The memory address of the underlying data.

## Extension: Float64ListAddress

```dart
extension Float64ListAddress on Float64List { … }
```

- `Pointer<Double> get address`: The memory address of the underlying data.

## Extension: FloatArray

Bounds checking indexing methods on [Array]s of [Float].

```dart
extension FloatArray on Array<Float> { … }
```

- `Float32List get elements`: A list view of the bytes of this array.
- `double operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, double value)`:
  Stores a Dart value in this array at [index].

## Extension: FloatPointer

Extension on [Pointer] specialized for the type argument [Float].

```dart
extension FloatPointer on Pointer<Float> { … }
```

- `double get value`: The float at [address].
- `set value=(double value)`
- `Pointer<Float> operator+(int offset)`:
  A pointer to the [offset]th [Float] after this one.
- `Pointer<Float> operator-(int offset)`:
  A pointer to the [offset]th [Float] before this one.
- `double operator[](int index)`:
  The float at `address + sizeOf<Float>() * index`.
- `void operator[]=(int index, double value)`:
  The float at `address + sizeOf<Float>() * index`.
- `Float32List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Float> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Int16Array

Bounds checking indexing methods on [Array]s of [Int16].

```dart
extension Int16Array on Array<Int16> { … }
```

- `Int16List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Int16ListAddress

```dart
extension Int16ListAddress on Int16List { … }
```

- `Pointer<Int16> get address`: The memory address of the underlying data.

## Extension: Int16Pointer

Extension on [Pointer] specialized for the type argument [Int16].

```dart
extension Int16Pointer on Pointer<Int16> { … }
```

- `int get value`: The 16-bit two's complement integer at [address].
- `set value=(int value)`
- `Pointer<Int16> operator+(int offset)`:
  A pointer to the [offset]th [Int16] after this one.
- `Pointer<Int16> operator-(int offset)`:
  A pointer to the [offset]th [Int16] before this one.
- `int operator[](int index)`:
  The 16-bit two's complement integer at `address + sizeOf<Int16>() * index`.
- `void operator[]=(int index, int value)`:
  The 16-bit two's complement integer at `address + sizeOf<Int16>() * index`.
- `Int16List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Int16> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Int32Array

Bounds checking indexing methods on [Array]s of [Int32].

```dart
extension Int32Array on Array<Int32> { … }
```

- `Int32List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Int32ListAddress

```dart
extension Int32ListAddress on Int32List { … }
```

- `Pointer<Int32> get address`: The memory address of the underlying data.

## Extension: Int32Pointer

Extension on [Pointer] specialized for the type argument [Int32].

```dart
extension Int32Pointer on Pointer<Int32> { … }
```

- `int get value`: The 32-bit two's complement integer at [address].
- `set value=(int value)`
- `Pointer<Int32> operator+(int offset)`:
  A pointer to the [offset]th [Int32] after this one.
- `Pointer<Int32> operator-(int offset)`:
  A pointer to the [offset]th [Int32] before this one.
- `int operator[](int index)`:
  The 32-bit two's complement integer at `address + sizeOf<Int32>() * index`.
- `void operator[]=(int index, int value)`:
  The 32-bit two's complement integer at `address + sizeOf<Int32>() * index`.
- `Int32List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Int32> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Int64Array

Bounds checking indexing methods on [Array]s of [Int64].

```dart
extension Int64Array on Array<Int64> { … }
```

- `Int64List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Int64ListAddress

```dart
extension Int64ListAddress on Int64List { … }
```

- `Pointer<Int64> get address`: The memory address of the underlying data.

## Extension: Int64Pointer

Extension on [Pointer] specialized for the type argument [Int64].

```dart
extension Int64Pointer on Pointer<Int64> { … }
```

- `int get value`: The 64-bit two's complement integer at [address].
- `set value=(int value)`
- `Pointer<Int64> operator+(int offset)`:
  A pointer to the [offset]th [Int64] after this one.
- `Pointer<Int64> operator-(int offset)`:
  A pointer to the [offset]th [Int64] before this one.
- `int operator[](int index)`:
  The 64-bit two's complement integer at `address + sizeOf<Int64>() * index`.
- `void operator[]=(int index, int value)`:
  The 64-bit two's complement integer at `address + sizeOf<Int64>() * index`.
- `Int64List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Int64> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Int8Array

Bounds checking indexing methods on [Array]s of [Int8].

```dart
extension Int8Array on Array<Int8> { … }
```

- `Int8List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Int8ListAddress

```dart
extension Int8ListAddress on Int8List { … }
```

- `Pointer<Int8> get address`: The memory address of the underlying data.

## Extension: Int8Pointer

Extension on [Pointer] specialized for the type argument [Int8].

```dart
extension Int8Pointer on Pointer<Int8> { … }
```

- `int get value`: The 8-bit two's complement integer at [address].
- `set value=(int value)`
- `Pointer<Int8> operator+(int offset)`:
  A pointer to the [offset]th [Int8] after this one.
- `Pointer<Int8> operator-(int offset)`:
  A pointer to the [offset]th [Int8] before this one.
- `int operator[](int index)`:
  The 8-bit two's complement integer at `address + sizeOf<Int8>() * index`.
- `void operator[]=(int index, int value)`:
  The 8-bit two's complement integer at `address + sizeOf<Int8>() * index`.
- `Int8List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Int8> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: IntAddress

```dart
extension IntAddress on int { … }
```

- `Pointer<Never> address`: The memory address of the underlying data.

## Extension: NativeFunctionPointer

Extension on [Pointer] specialized for the type argument [NativeFunction].

```dart
extension NativeFunctionPointer<NF extends Function> on Pointer<NativeFunction<NF>> { … }
```

- `DF asFunction<DF extends Function>({bool isLeaf})`:
  Convert to Dart function, automatically marshalling the arguments and
  return value.

## Extension: NativePort

Extension to retrieve the native `Dart_Port` from a [SendPort].

```dart
extension NativePort on SendPort { … }
```

- `int get nativePort`: The native port of this [SendPort].

## Extension: PointerArray

Bounds checking indexing methods on [Array]s of [Pointer].

```dart
extension PointerArray<T extends NativeType> on Array<Pointer<T>> { … }
```

- `List<Pointer<T>> get elements`: A list view of the bytes of this array.
- `Pointer<T> operator[](int index)`:
  Loads a Dart value from this array at [index].
- `void operator[]=(int index, Pointer<T> value)`:
  Stores a Dart value in this array at [index].

## Extension: PointerPointer

Extension on [Pointer] specialized for the type argument [Pointer].

```dart
extension PointerPointer<T extends NativeType> on Pointer<Pointer<T>> { … }
```

- `Pointer<T> get value`: The pointer at [address].
- `set value=(Pointer<T> value)`
- `Pointer<Pointer<T>> operator+(int offset)`:
  A pointer to the [offset]th [Pointer<T>] after this one.
- `Pointer<Pointer<T>> operator-(int offset)`:
  A pointer to the [offset]th [Pointer<T>] before this one.
- `Pointer<T> operator[](int index)`:
  Load a Dart value from this location offset by [index].
- `void operator[]=(int index, Pointer<T> value)`:
  Store a Dart value into this location offset by [index].
- `Pointer<Pointer<T>> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: StructAddress

```dart
extension StructAddress<T extends Struct> on T { … }
```

- `Pointer<T> get address`: The memory address of the underlying data.

## Extension: StructArray

Bounds checking indexing methods on [Array]s of [Struct].

```dart
extension StructArray<T extends Struct> on Array<T> { … }
```

- `List<T> get elements`: A list view of the bytes of this array.
- `T operator[](int index)`:
  This extension method must be invoked on a receiver of type `Pointer<T>`
  where `T` is a compile-time constant type.

## Extension: StructPointer

Extension on [Pointer] specialized for the type argument [Struct].

```dart
extension StructPointer<T extends Struct> on Pointer<T> { … }
```

- `T get ref`: A Dart view of the struct referenced by this pointer.
- `set ref=(T value)`
- `Pointer<T> operator+(int offset)`:
  A pointer to the [offset]th [T] after this one.
- `Pointer<T> operator-(int offset)`:
  A pointer to the [offset]th [T] before this one.
- `T operator[](int index)`:
  Creates a reference to access the fields of this struct backed by native
  memory at `address + sizeOf<T>() * index`.
- `void operator[]=(int index, T value)`:
  Copies the [value] struct into native memory, starting at
  `address * sizeOf<T>() * index`.
- `Pointer<T> elementAt(int index)`:
  Pointer arithmetic (takes element size into account)
- `T refWithFinalizer(Pointer<NativeFunction<Void Function(Pointer<Void>)>> finalizer, {Pointer<Void>? token})`:
  A Dart view of the struct referenced by this pointer.

## Extension: Uint16Array

Bounds checking indexing methods on [Array]s of [Uint16].

```dart
extension Uint16Array on Array<Uint16> { … }
```

- `Uint16List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Uint16ListAddress

```dart
extension Uint16ListAddress on Uint16List { … }
```

- `Pointer<Uint16> get address`: The memory address of the underlying data.

## Extension: Uint16Pointer

Extension on [Pointer] specialized for the type argument [Uint16].

```dart
extension Uint16Pointer on Pointer<Uint16> { … }
```

- `int get value`: The 16-bit unsigned integer at [address].
- `set value=(int value)`
- `Pointer<Uint16> operator+(int offset)`:
  A pointer to the [offset]th [Uint16] after this one.
- `Pointer<Uint16> operator-(int offset)`:
  A pointer to the [offset]th [Uint16] before this one.
- `int operator[](int index)`:
  The 16-bit unsigned integer at `address + sizeOf<Uint16>() * index`.
- `void operator[]=(int index, int value)`:
  The 16-bit unsigned integer at `address + sizeOf<Uint16>() * index`.
- `Uint16List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Uint16> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Uint32Array

Bounds checking indexing methods on [Array]s of [Uint32].

```dart
extension Uint32Array on Array<Uint32> { … }
```

- `Uint32List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Uint32ListAddress

```dart
extension Uint32ListAddress on Uint32List { … }
```

- `Pointer<Uint32> get address`: The memory address of the underlying data.

## Extension: Uint32Pointer

Extension on [Pointer] specialized for the type argument [Uint32].

```dart
extension Uint32Pointer on Pointer<Uint32> { … }
```

- `int get value`: The 32-bit unsigned integer at [address].
- `set value=(int value)`
- `Pointer<Uint32> operator+(int offset)`:
  A pointer to the [offset]th [Uint32] after this one.
- `Pointer<Uint32> operator-(int offset)`:
  A pointer to the [offset]th [Uint32] before this one.
- `int operator[](int index)`:
  The 32-bit unsigned integer at `address + sizeOf<Uint32>() * index`.
- `void operator[]=(int index, int value)`:
  The 32-bit unsigned integer at `address + sizeOf<Uint32>() * index`.
- `Uint32List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Uint32> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Uint64Array

Bounds checking indexing methods on [Array]s of [Uint64].

```dart
extension Uint64Array on Array<Uint64> { … }
```

- `Uint64List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Uint64ListAddress

```dart
extension Uint64ListAddress on Uint64List { … }
```

- `Pointer<Uint64> get address`: The memory address of the underlying data.

## Extension: Uint64Pointer

Extension on [Pointer] specialized for the type argument [Uint64].

```dart
extension Uint64Pointer on Pointer<Uint64> { … }
```

- `int get value`: The 64-bit unsigned integer at [address].
- `set value=(int value)`
- `Pointer<Uint64> operator+(int offset)`:
  A pointer to the [offset]th [Uint64] after this one.
- `Pointer<Uint64> operator-(int offset)`:
  A pointer to the [offset]th [Uint64] before this one.
- `int operator[](int index)`:
  The 64-bit unsigned integer at `address + sizeOf<Uint64>() * index`.
- `void operator[]=(int index, int value)`:
  The 64-bit unsigned integer at `address + sizeOf<Uint64>() * index`.
- `Uint64List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Uint64> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: Uint8Array

Bounds checking indexing methods on [Array]s of [Uint8].

```dart
extension Uint8Array on Array<Uint8> { … }
```

- `Uint8List get elements`: A list view of the bytes of this array.
- `int operator[](int index)`: Loads a Dart value from this array at [index].
- `void operator[]=(int index, int value)`:
  Stores a Dart value in this array at [index].

## Extension: Uint8ListAddress

```dart
extension Uint8ListAddress on Uint8List { … }
```

- `Pointer<Uint8> get address`: The memory address of the underlying data.

## Extension: Uint8Pointer

Extension on [Pointer] specialized for the type argument [Uint8].

```dart
extension Uint8Pointer on Pointer<Uint8> { … }
```

- `int get value`: The 8-bit unsigned integer at [address].
- `set value=(int value)`
- `Pointer<Uint8> operator+(int offset)`:
  A pointer to the [offset]th [Uint8] after this one.
- `Pointer<Uint8> operator-(int offset)`:
  A pointer to the [offset]th [Uint8] before this one.
- `int operator[](int index)`:
  The 8-bit unsigned integer at `address + sizeOf<Uint8>() * index`.
- `void operator[]=(int index, int value)`:
  The 8-bit unsigned integer at `address + sizeOf<Uint8>() * index`.
- `Uint8List asTypedList(int length, {Pointer<NativeFunction<Void Function(Pointer<Void>)>>? finalizer, Pointer<Void>? token})`:
  Creates a typed list view backed by memory in the address space.
- `Pointer<Uint8> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).

## Extension: UnionAddress

```dart
extension UnionAddress<T extends Union> on T { … }
```

- `Pointer<T> get address`: The memory address of the underlying data.

## Extension: UnionArray

Bounds checking indexing methods on [Array]s of [Union].

```dart
extension UnionArray<T extends Union> on Array<T> { … }
```

- `List<T> get elements`: A list view of the bytes of this array.
- `T operator[](int index)`:
  This extension method must be invoked on a receiver of type `Pointer<T>`
  where `T` is a compile-time constant type.

## Extension: UnionPointer

Extension on [Pointer] specialized for the type argument [Union].

```dart
extension UnionPointer<T extends Union> on Pointer<T> { … }
```

- `T get ref`: A Dart view of the union referenced by this pointer.
- `set ref=(T value)`
- `Pointer<T> operator+(int offset)`:
  A pointer to the [offset]th [T] after this one.
- `Pointer<T> operator-(int offset)`:
  A pointer to the [offset]th [T] before this one.
- `T operator[](int index)`:
  Creates a reference to access the fields of this union backed by native
  memory at `address + sizeOf<T>() * index`.
- `void operator[]=(int index, T value)`:
  Copies the [value] union into native memory, starting at
  `address * sizeOf<T>() * index`.
- `Pointer<T> elementAt(int index)`:
  Pointer arithmetic (takes element size into account).
- `T refWithFinalizer(Pointer<NativeFunction<Void Function(Pointer<Void>)>> finalizer, {Pointer<Void>? token})`:
  A Dart view of the union referenced by this pointer.
