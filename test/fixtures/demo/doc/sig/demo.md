# library demo.dart

## Members

- accessor `double get antennaDiameter`
- accessor `set antennaDiameter=(double _antennaDiameter)`
- accessor `List<String> get flybyObjects`
- accessor `set flybyObjects=(List<String> _flybyObjects)`
- accessor `List<int> get il`
- accessor `set il=(List<int> _il)`
- accessor `Map<String, Object> get image`
- accessor `set image=(Map<String, Object> _image)`
- accessor `Map<String, List<String>> get m1`
- accessor `set m1=(Map<String, List<String>> _m1)`
- accessor `Map<String, List<String>> get m2`
- accessor `set m2=(Map<String, List<String>> _m2)`
- accessor `set myCar=(VehicleSealed _myCar)`
- accessor `VehicleSealed get myCar`
- accessor `String get name`
- accessor `set name=(String _name)`
- accessor `Duration get oneSecond`
- accessor `(String, String, {int a, bool b}) get record`
- accessor `set record=((String, String, {int a, bool b}) _record)`
- accessor `double get xOrigin`
- accessor `double get yOrigin`
- accessor `int get year`
- accessor `set year=(int _year)`
- function `Stream<int> asynchronousNaturalsTo(int n)`
- function `String checkList(List<Object>? list)`
- function `Future<void> createDescriptions(Iterable<String> objects)`
- function `void enableFlags({bool? bold, bool? hidden})`
- function `T first<T>(List<T> ts)`
- function `(String, int) foo()`
- function `String getVehicleSound(VehicleSealed vehicle)`
- function `bool isNoble(int atomicNumber)`
- function `Iterable<int> naturalsTo(int n)`
- function `Future<void> printWithDelay(String message)`
- function `String say(String from, String msg, [String? device])`
- function `(int, int) swap((int, int) record)`
- function `(String, int) userInfo(Map<String, dynamic> json)`
- type alias `typedef Compare<T> = int Function(T, T)`
- type alias `typedef IntList = List<int>`
- type alias `typedef JSAnyRepType = Object`
- type alias `typedef ListMapper<X> = Map<X, List<X>>`

## Enums

### enum Vehicle

```
enum Vehicle implements Comparable<Vehicle> { … }
```

- constructor `Vehicle({required int tires, required int passengers, required int carbonPerKilometer})`
- enum value `bicycle`
- enum value `bus`
- enum value `car`
- field `int carbonPerKilometer`
- field `int passengers`
- field `int tires`
- accessor `int get carbonFootprint`
- accessor `bool get isTwoWheeled`
- method `int compareTo(Vehicle other)`

## Mixins

### mixin MusicalPerformer

```
mixin MusicalPerformer on Musician { … }
```

## Classes

### class BicycleSealed

```
class BicycleSealed extends VehicleSealed { … }
```

### class Cache

```
abstract class Cache<T> { … }
```

- method `T getByKey(String key)`
- method `void setByKey(String key, T value)`

### class CarSealed

```
class CarSealed extends VehicleSealed { … }
```

### class Describable

```
abstract class Describable { … }
```

- method `void describe()`
- method `void describeWithEmphasis()`

### class Foo

```
class Foo<T extends Object> { … }
```

### class JSObjectRepType

```
abstract class JSObjectRepType { … }
```

### class MockSpaceship

```
class MockSpaceship implements Spacecraft { … }
```

- field `DateTime? launchDate`
- field `String name`
- accessor `int? get launchYear`
- method `void describe()`

### class Musician

```
class Musician { … }
```

### class Orbiter

```
class Orbiter extends Spacecraft { … }
```

- constructor `Orbiter(String name, DateTime launchDate, double altitude)`
- field `double altitude`

### class Point

```
class Point { … }
```

- constructor `Point(double x, double y)`
- constructor `Point.fromJson(Map<String, Object> json)`
- constructor `Point.origin()`
- static field `Point zero`
- static method `double distanceBetween(Point a, Point b)`
- field `double x`
- field `double y`

### class SingerDancer

```
class SingerDancer extends Musician with MusicalPerformer { … }
```

### class Spacecraft

```
class Spacecraft { … }
```

- constructor `Spacecraft(String name, DateTime? launchDate)`
- constructor `Spacecraft.unlaunched(String name)`
- field `DateTime? launchDate`
- field `String name`
- accessor `int? get launchYear`
- method `void describe()`

### class TruckSealed

```
class TruckSealed implements VehicleSealed { … }
```

### class Vector2d

```
class Vector2d { … }
```

- constructor `Vector2d(double x, double y)`
- field `double x`
- field `double y`

### class Vector3d

```
class Vector3d extends Vector2d { … }
```

- constructor `Vector3d(double x, double y, double z)`
- field `double z`

### class VehicleSealed

```
sealed class VehicleSealed { … }
```

## Extensions

### extension NumberParsing

```
extension NumberParsing on String { … }
```

- method `double parseDouble()`
- method `int parseInt()`

## Extension Types

### extension type EventInit

EventInit

- constructor `EventInit({bool bubbles, bool cancelable, bool composed})`
- accessor `set bubbles=(bool value)`
- accessor `bool get bubbles`
- accessor `set cancelable=(bool value)`
- accessor `bool get cancelable`
- accessor `set composed=(bool value)`
- accessor `bool get composed`

### extension type JSAny

JSAny

### extension type JSObject

JSObject

- constructor `JSObject.fromInteropObject(Object interopObject)`

### extension type ProgressEventInit

ProgressEventInit

- constructor `ProgressEventInit({bool lengthComputable, int loaded, int total})`
- accessor `set lengthComputable=(bool value)`
- accessor `bool get lengthComputable`
- accessor `set loaded=(int value)`
- accessor `int get loaded`
- accessor `set total=(int value)`
- accessor `int get total`
