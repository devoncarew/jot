# Library: dart:mirrors

Basic reflection in Dart,
with support for introspection and dynamic invocation.

*Introspection* is that subset of reflection by which a running
program can examine its own structure. For example, a function
that prints out the names of all the members of an arbitrary object.

*Dynamic invocation* refers the ability to evaluate code that
has not been literally specified at compile time, such as calling a method
whose name is provided as an argument (because it is looked up
in a database, or provided interactively by the user).

## How to interpret this library's documentation

As a rule, the names of Dart declarations are represented using
instances of class [Symbol]. Whenever the doc speaks of an object *s*
of class [Symbol] denoting a name, it means the string that
was used to construct *s*.

The documentation frequently abuses notation with
Dart pseudo-code such as [:o.x(a):], where
o and a are defined to be objects; what is actually meant in these
cases is [:o'.x(a'):] where *o'* and *a'* are Dart variables
bound to *o* and *a* respectively. Furthermore, *o'* and *a'*
are assumed to be fresh variables (meaning that they are
distinct from any other variables in the program).

Sometimes the documentation refers to *serializable* objects.
An object is serializable across isolates if and only if it is an instance of
num, bool, String, a list of objects that are serializable
across isolates, or a map with keys and values that are all serializable across
isolates.

## Status: Unstable

The dart:mirrors library is unstable and its API might change slightly as a
result of user feedback. This library is only supported by the Dart VM and
only available on some platforms.

{@category VM}

## Members

- function `MirrorSystem currentMirrorSystem()`:
  Returns a [MirrorSystem] for the current isolate.
- function `InstanceMirror reflect(dynamic reflectee)`: Reflects an instance.
- function `ClassMirror reflectClass(Type key)`: Reflects a class declaration.
- function `TypeMirror reflectType(Type key, [List<Type>? typeArguments])`:
  Reflects the type represented by [key].

## Class: AbstractClassInstantiationError

Error thrown when trying to instantiate an abstract class.

```dart
class AbstractClassInstantiationError extends Error { … }
```

- `AbstractClassInstantiationError(String className)`
- `String toString()`: A string representation of this object.

## Class: ClassMirror

A [ClassMirror] reflects a Dart language class.

```dart
abstract class ClassMirror implements TypeMirror, ObjectMirror { … }
```

- `Map<Symbol, DeclarationMirror> get declarations`:
  Returns an immutable map of the declarations actually given in the class
  declaration.
- `Map<Symbol, MethodMirror> get instanceMembers`:
  Returns a map of the methods, getters and setters of an instance of the
  class.
- `bool get isAbstract`: Is the reflectee abstract?
- `bool get isEnum`: Is the reflectee an enum?
- `ClassMirror get mixin`: The mixin of this class.
- `Map<Symbol, MethodMirror> get staticMembers`:
  Returns a map of the static methods, getters and setters of the class.
- `ClassMirror? get superclass`: A mirror on the superclass on the reflectee.
- `List<ClassMirror> get superinterfaces`:
  A list of mirrors on the superinterfaces of the reflectee.
- `bool operator==(Object other)`: Whether this mirror is equal to [other].
- `bool isSubclassOf(ClassMirror other)`:
  Returns whether the class denoted by the receiver is a subclass of the
  class denoted by the argument.
- `InstanceMirror newInstance(Symbol constructorName, List<dynamic> positionalArguments, [Map<Symbol, dynamic> namedArguments])`:
  Invokes the named constructor and returns a mirror on the result.

## Class: ClosureMirror

A [ClosureMirror] reflects a closure.

```dart
abstract class ClosureMirror implements InstanceMirror { … }
```

- `MethodMirror get function`:
  A mirror on the function associated with this closure.
- `InstanceMirror apply(List<dynamic> positionalArguments, [Map<Symbol, dynamic> namedArguments])`:
  Executes the closure and returns a mirror on the result.

## Class: CombinatorMirror

A mirror on a show/hide combinator declared on a library dependency.

```dart
abstract class CombinatorMirror implements Mirror { … }
```

- `List<Symbol> get identifiers`: The list of identifiers on the combinator.
- `bool get isHide`: Is `true` if this is a 'hide' combinator.
- `bool get isShow`: Is `true` if this is a 'show' combinator.

## Class: DeclarationMirror

A [DeclarationMirror] reflects some entity declared in a Dart program.

```dart
abstract class DeclarationMirror implements Mirror { … }
```

- `bool get isPrivate`: Whether this declaration is library private.
- `bool get isTopLevel`: Whether this declaration is top-level.
- `SourceLocation? get location`:
  The source location of this Dart language entity, or [:null:] if the
  entity is synthetic.
- `List<InstanceMirror> get metadata`:
  A list of the metadata associated with this declaration.
- `DeclarationMirror? get owner`:
  A mirror on the owner of this Dart language entity.
- `Symbol get qualifiedName`:
  The fully-qualified name for this Dart language entity.
- `Symbol get simpleName`: The simple name for this Dart language entity.

## Class: FunctionTypeMirror

A [FunctionTypeMirror] represents the type of a function in the
Dart language.

```dart
abstract class FunctionTypeMirror implements ClassMirror { … }
```

- `MethodMirror get callMethod`:
  A mirror on the [:call:] method for the reflectee.
- `List<ParameterMirror> get parameters`:
  Returns a list of the parameter types of the reflectee.
- `TypeMirror get returnType`: Returns the return type of the reflectee.

## Class: InstanceMirror

An [InstanceMirror] reflects an instance of a Dart language object.

```dart
abstract class InstanceMirror implements ObjectMirror { … }
```

- `bool get hasReflectee`:
  Whether [reflectee] will return the instance reflected by this mirror.
- `dynamic get reflectee`:
  If the [InstanceMirror] reflects an instance it is meaningful to
  have a local reference to, we provide access to the actual
  instance here.
- `ClassMirror get type`: A mirror on the type of the reflectee.
- `bool operator==(Object other)`: Whether this mirror is equal to [other].

## Class: IsolateMirror

An [IsolateMirror] reflects an isolate.

```dart
abstract class IsolateMirror implements Mirror { … }
```

- `String get debugName`:
  A unique name used to refer to the isolate in debugging messages.
- `bool get isCurrent`:
  Whether this mirror reflects the currently running isolate.
- `LibraryMirror get rootLibrary`: The root library for the reflected isolate.
- `bool operator==(Object other)`:
  Whether [other] is an [IsolateMirror] on the same isolate as this mirror.
- `Future<LibraryMirror> loadUri(Uri uri)`:
  Loads the library at the given uri into this isolate.

## Class: LibraryDependencyMirror

A mirror on an import or export declaration.

```dart
abstract class LibraryDependencyMirror implements Mirror { … }
```

- `List<CombinatorMirror> get combinators`:
  Returns the list of show/hide combinators on the import/export
  declaration.
- `bool get isDeferred`:
  Returns true iff this dependency is a deferred import. Otherwise returns
  false.
- `bool get isExport`: Is `true` if this dependency is an export.
- `bool get isImport`: Is `true` if this dependency is an import.
- `SourceLocation? get location`:
  Returns the source location for this import/export declaration.
- `List<InstanceMirror> get metadata`
- `Symbol? get prefix`:
  Returns the prefix if this is a prefixed import and `null` otherwise.
- `LibraryMirror get sourceLibrary`:
  Returns the library mirror of the library that imports or exports the
  [targetLibrary].
- `LibraryMirror? get targetLibrary`:
  Returns the library mirror of the library that is imported or exported,
  or null if the library is not loaded.
- `Future<LibraryMirror> loadLibrary()`:
  Returns a future that completes with a library mirror on the library being
  imported or exported when it is loaded, and initiates a load of that
  library if it is not loaded.

## Class: LibraryMirror

A [LibraryMirror] reflects a Dart language library, providing
access to the variables, functions, and classes of the
library.

```dart
abstract class LibraryMirror implements DeclarationMirror, ObjectMirror { … }
```

- `Map<Symbol, DeclarationMirror> get declarations`:
  Returns an immutable map of the declarations actually given in the library.
- `List<LibraryDependencyMirror> get libraryDependencies`:
  Returns a list of the imports and exports in this library;
- `Uri get uri`: The absolute uri of the library.
- `bool operator==(Object other)`: Whether this mirror is equal to [other].

## Class: MethodMirror

A [MethodMirror] reflects a Dart language function, method,
constructor, getter, or setter.

```dart
abstract class MethodMirror implements DeclarationMirror { … }
```

- `Symbol get constructorName`:
  The constructor name for named constructors and factory methods.
- `bool get isAbstract`: Is the reflectee abstract?
- `bool get isConstConstructor`: Is the reflectee a const constructor?
- `bool get isConstructor`: Is the reflectee a constructor?
- `bool get isExtensionMember`: Is the reflectee an extension method?
- `bool get isExtensionTypeMember`: Is the reflectee an extension type method?
- `bool get isFactoryConstructor`: Is the reflectee a factory constructor?
- `bool get isGenerativeConstructor`: Is the reflectee a generative constructor?
- `bool get isGetter`: Is the reflectee a getter?
- `bool get isOperator`: Is the reflectee an operator?
- `bool get isRedirectingConstructor`: Is the reflectee a redirecting constructor?
- `bool get isRegularMethod`: Is the reflectee a regular function or method?
- `bool get isSetter`: Is the reflectee a setter?
- `bool get isStatic`:
  A function is considered non-static iff it is permitted to refer to 'this'.
- `bool get isSynthetic`:
  Returns true if the reflectee is synthetic, and returns false otherwise.
- `List<ParameterMirror> get parameters`:
  A list of mirrors on the parameters for the reflectee.
- `TypeMirror get returnType`: A mirror on the return type for the reflectee.
- `String? get source`:
  The source code for the reflectee, if available. Otherwise null.
- `bool operator==(Object other)`: Whether this mirror is equal to [other].

## Class: Mirror

A [Mirror] reflects some Dart language entity.

```dart
abstract class Mirror { … }
```

## Class: MirrorSystem

A [MirrorSystem] is the main interface used to reflect on a set of
associated libraries.

```dart
abstract class MirrorSystem { … }
```

- static `String getName(Symbol symbol)`: Returns the name of [symbol].
- static `Symbol getSymbol(String name, [LibraryMirror? library])`:
  Returns a symbol for [name].
- `TypeMirror get dynamicType`: A mirror on the [:dynamic:] type.
- `IsolateMirror get isolate`:
  A mirror on the isolate associated with this [MirrorSystem].
- `Map<Uri, LibraryMirror> get libraries`:
  All libraries known to the mirror system, indexed by their URI.
- `TypeMirror get neverType`: A mirror on the [:Never:] type.
- `TypeMirror get voidType`: A mirror on the [:void:] type.
- `LibraryMirror findLibrary(Symbol libraryName)`:
  Returns the unique library named [libraryName] if it exists.

## Class: ObjectMirror

An [ObjectMirror] is a common superinterface of [InstanceMirror],
[ClassMirror], and [LibraryMirror] that represents their shared
functionality.

```dart
abstract class ObjectMirror implements Mirror { … }
```

- `dynamic delegate(Invocation invocation)`:
  Performs [invocation] on the reflectee of this [ObjectMirror].
- `InstanceMirror getField(Symbol fieldName)`:
  Invokes a getter and returns a mirror on the result.
- `InstanceMirror invoke(Symbol memberName, List<dynamic> positionalArguments, [Map<Symbol, dynamic> namedArguments])`:
  Invokes the named function and returns a mirror on the result.
- `InstanceMirror setField(Symbol fieldName, dynamic value)`:
  Invokes a setter and returns a mirror on the result.

## Class: ParameterMirror

A [ParameterMirror] reflects a Dart formal parameter declaration.

```dart
abstract class ParameterMirror implements VariableMirror { … }
```

- `InstanceMirror? get defaultValue`:
  Returns the default value of an optional parameter.
- `bool get hasDefaultValue`:
  Returns [:true:] if the reflectee has explicitly declared a default value.
  Otherwise returns [:false:].
- `bool get isNamed`: Returns [:true:] if the reflectee is a named parameter.
  Otherwise returns [:false:].
- `bool get isOptional`:
  Returns [:true:] if the reflectee is an optional parameter.
  Otherwise returns [:false:].
- `TypeMirror get type`: A mirror on the type of this parameter.

## Class: SourceLocation

A [SourceLocation] describes the span of an entity in Dart source code.

```dart
abstract class SourceLocation { … }
```

- `int get column`: The 1-based column number for this source location.
- `int get line`: The 1-based line number for this source location.
- `Uri get sourceUri`: Returns the URI where the source originated.

## Class: TypeMirror

A [TypeMirror] reflects a Dart language class, typedef,
function type or type variable.

```dart
abstract class TypeMirror implements DeclarationMirror { … }
```

- `bool get hasReflectedType`:
  Returns true if this mirror reflects dynamic, a non-generic class or
  typedef, or an instantiated generic class or typedef in the current
  isolate. Otherwise, returns false.
- `bool get isOriginalDeclaration`: Is this the original declaration of this type?
- `TypeMirror get originalDeclaration`:
  A mirror on the original declaration of this type.
- `Type get reflectedType`:
  If [:hasReflectedType:] returns true, returns the corresponding [Type].
  Otherwise, an [UnsupportedError] is thrown.
- `List<TypeMirror> get typeArguments`:
  An immutable list with mirrors for all type arguments for
  this type.
- `List<TypeVariableMirror> get typeVariables`:
  An immutable list with mirrors for all type variables for this type.
- `bool isAssignableTo(TypeMirror other)`:
  Checks the assignability relationship, denoted by `<=>` in the language
  specification.
- `bool isSubtypeOf(TypeMirror other)`:
  Checks the subtype relationship, denoted by `<:` in the language
  specification.

## Class: TypeVariableMirror

A [TypeVariableMirror] represents a type parameter of a generic type.

```dart
abstract class TypeVariableMirror extends TypeMirror { … }
```

- `bool get isStatic`: Is the reflectee static?
- `TypeMirror get upperBound`:
  A mirror on the type that is the upper bound of this type variable.
- `bool operator==(Object other)`:
  Whether [other] is a [TypeVariableMirror] on the same type variable as this
  mirror.

## Class: TypedefMirror

A [TypedefMirror] represents a typedef in a Dart language program.

```dart
abstract class TypedefMirror implements TypeMirror { … }
```

- `FunctionTypeMirror get referent`: The defining type for this typedef.

## Class: VariableMirror

A [VariableMirror] reflects a Dart language variable declaration.

```dart
abstract class VariableMirror implements DeclarationMirror { … }
```

- `bool get isConst`: Returns [:true:] if the reflectee is declared [:const:].
  Otherwise returns [:false:].
- `bool get isExtensionMember`: Is the reflectee an extension member?
- `bool get isExtensionTypeMember`: Is the reflectee an extension type member?
- `bool get isFinal`: Returns [:true:] if the reflectee is a final variable.
  Otherwise returns [:false:].
- `bool get isStatic`: Returns [:true:] if the reflectee is a static variable.
  Otherwise returns [:false:].
- `TypeMirror get type`: Returns a mirror on the type of the reflectee.
- `bool operator==(Object other)`: Whether this mirror is equal to [other].
