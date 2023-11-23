/// class modifiers (https://dart.dev/language/class-modifiers)
library;

// abstract

abstract class Vehicle {
  void moveForward(int meters);
}

// base

base class VehicleBase {
  void moveForward(int meters) {
    // ...
  }
}

// interface

interface class VehicleInterface {
  void moveForward(int meters) {
    // ...
  }
}

abstract interface class FruitInterface {
  void eat(int bites) {
    // ...
  }
}

final class AnimalInterface {
  void growl(int count) {
    // ...
  }
}
