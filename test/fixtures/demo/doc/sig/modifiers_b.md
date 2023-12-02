# library modifiers_b.dart

## Members

- accessor `VehicleBase get myVehicle`
- accessor `set myVehicle=(VehicleBase _myVehicle)`
- accessor `VehicleInterface get myVehicle2`
- accessor `set myVehicle2=(VehicleInterface _myVehicle2)`

## Classes

### class Car

```
class Car extends Vehicle { … }
```

- field `int passengers`
- method `void moveForward(int meters)`

### class CarBase

```
class CarBase extends VehicleBase { … }
```

- field `int passengers`

### class MockVehicle

```
class MockVehicle implements Vehicle { … }
```

- method `void moveForward(int meters)`

### class MockVehicleInterface

```
class MockVehicleInterface implements VehicleInterface { … }
```

- method `void moveForward(int meters)`
