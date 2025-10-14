# Library: dart:svg

Scalable Vector Graphics:
Two-dimensional vector graphics with support for events and animation.

> [!Note]
> This core library is deprecated, and scheduled for removal in late 2025.
> It has been replaced by [package:web](https://pub.dev/packages/web).
> The [migration guide](https://dart.dev/go/package-web) has more details.

For details about the features and syntax of SVG, a W3C standard,
refer to the
[Scalable Vector Graphics Specification](http://www.w3.org/TR/SVG/).

{@category Web (Legacy)}

## Members

## Class: AElement

```dart
class AElement extends GraphicsElement implements UriReference { … }
```

- `AElement()`
- `AnimatedString? get href`
- `AnimatedString get target`

## Class: Angle

```dart
class Angle extends JavaScriptObject { … }
```

- static `int SVG_ANGLETYPE_DEG`
- static `int SVG_ANGLETYPE_GRAD`
- static `int SVG_ANGLETYPE_RAD`
- static `int SVG_ANGLETYPE_UNKNOWN`
- static `int SVG_ANGLETYPE_UNSPECIFIED`
- `int? get unitType`
- `num? get value`
- `set value=(num? value)`
- `String? get valueAsString`
- `set valueAsString=(String? value)`
- `num? get valueInSpecifiedUnits`
- `set valueInSpecifiedUnits=(num? value)`
- `void convertToSpecifiedUnits(int unitType)`
- `void newValueSpecifiedUnits(int unitType, num valueInSpecifiedUnits)`

## Class: AnimateElement

```dart
class AnimateElement extends AnimationElement { … }
```

- `AnimateElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: AnimateMotionElement

```dart
class AnimateMotionElement extends AnimationElement { … }
```

- `AnimateMotionElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: AnimateTransformElement

```dart
class AnimateTransformElement extends AnimationElement { … }
```

- `AnimateTransformElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: AnimatedAngle

```dart
class AnimatedAngle extends JavaScriptObject { … }
```

- `Angle? get animVal`
- `Angle? get baseVal`

## Class: AnimatedBoolean

```dart
class AnimatedBoolean extends JavaScriptObject { … }
```

- `bool? get animVal`
- `bool? get baseVal`
- `set baseVal=(bool? value)`

## Class: AnimatedEnumeration

```dart
class AnimatedEnumeration extends JavaScriptObject { … }
```

- `int? get animVal`
- `int? get baseVal`
- `set baseVal=(int? value)`

## Class: AnimatedInteger

```dart
class AnimatedInteger extends JavaScriptObject { … }
```

- `int? get animVal`
- `int? get baseVal`
- `set baseVal=(int? value)`

## Class: AnimatedLength

```dart
class AnimatedLength extends JavaScriptObject { … }
```

- `Length? get animVal`
- `Length? get baseVal`

## Class: AnimatedLengthList

```dart
class AnimatedLengthList extends JavaScriptObject { … }
```

- `LengthList? get animVal`
- `LengthList? get baseVal`

## Class: AnimatedNumber

```dart
class AnimatedNumber extends JavaScriptObject { … }
```

- `num? get animVal`
- `num? get baseVal`
- `set baseVal=(num? value)`

## Class: AnimatedNumberList

```dart
class AnimatedNumberList extends JavaScriptObject { … }
```

- `NumberList? get animVal`
- `NumberList? get baseVal`

## Class: AnimatedPreserveAspectRatio

```dart
class AnimatedPreserveAspectRatio extends JavaScriptObject { … }
```

- `PreserveAspectRatio? get animVal`
- `PreserveAspectRatio? get baseVal`

## Class: AnimatedRect

```dart
class AnimatedRect extends JavaScriptObject { … }
```

- `Rect? get animVal`
- `Rect? get baseVal`

## Class: AnimatedString

```dart
class AnimatedString extends JavaScriptObject { … }
```

- `String? get animVal`
- `String? get baseVal`
- `set baseVal=(String? value)`

## Class: AnimatedTransformList

```dart
class AnimatedTransformList extends JavaScriptObject { … }
```

- `TransformList? get animVal`
- `TransformList? get baseVal`

## Class: AnimationElement

```dart
class AnimationElement extends SvgElement implements Tests { … }
```

- `AnimationElement()`
- `StringList? get requiredExtensions`
- `StringList? get systemLanguage`
- `SvgElement? get targetElement`
- `void beginElement()`
- `void beginElementAt(num offset)`
- `void endElement()`
- `void endElementAt(num offset)`
- `double getCurrentTime()`
- `double getSimpleDuration()`
- `double getStartTime()`

## Class: AttributeClassSet

```dart
class AttributeClassSet extends CssClassSetImpl { … }
```

- `AttributeClassSet(Element _element)`
- `Set<String> readClasses()`:
  Read the class names from the Element class property,
  and put them into a set (duplicates are discarded).
  This is intended to be overridden by specific implementations.
- `void writeClasses(Set<dynamic> s)`:
  Join all the elements of a set into one string and write
  back to the element.
  This is intended to be overridden by specific implementations.

## Class: CircleElement

```dart
class CircleElement extends GeometryElement { … }
```

- `CircleElement()`
- `AnimatedLength? get cx`
- `AnimatedLength? get cy`
- `AnimatedLength? get r`

## Class: ClipPathElement

```dart
class ClipPathElement extends GraphicsElement { … }
```

- `ClipPathElement()`
- `AnimatedEnumeration? get clipPathUnits`

## Class: DefsElement

```dart
class DefsElement extends GraphicsElement { … }
```

- `DefsElement()`

## Class: DescElement

```dart
class DescElement extends SvgElement { … }
```

- `DescElement()`

## Class: DiscardElement

```dart
class DiscardElement extends SvgElement { … }
```

## Class: EllipseElement

```dart
class EllipseElement extends GeometryElement { … }
```

- `EllipseElement()`
- `AnimatedLength? get cx`
- `AnimatedLength? get cy`
- `AnimatedLength? get rx`
- `AnimatedLength? get ry`

## Class: FEBlendElement

```dart
class FEBlendElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEBlendElement()`
- static `int SVG_FEBLEND_MODE_DARKEN`
- static `int SVG_FEBLEND_MODE_LIGHTEN`
- static `int SVG_FEBLEND_MODE_MULTIPLY`
- static `int SVG_FEBLEND_MODE_NORMAL`
- static `int SVG_FEBLEND_MODE_SCREEN`
- static `int SVG_FEBLEND_MODE_UNKNOWN`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get in2`
- `AnimatedEnumeration? get mode`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEColorMatrixElement

```dart
class FEColorMatrixElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEColorMatrixElement()`
- static `int SVG_FECOLORMATRIX_TYPE_HUEROTATE`
- static `int SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA`
- static `int SVG_FECOLORMATRIX_TYPE_MATRIX`
- static `int SVG_FECOLORMATRIX_TYPE_SATURATE`
- static `int SVG_FECOLORMATRIX_TYPE_UNKNOWN`
- `AnimatedLength? get height`
- `AnimatedString get in1`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedEnumeration? get type`
- `AnimatedNumberList? get values`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEComponentTransferElement

```dart
class FEComponentTransferElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEComponentTransferElement()`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FECompositeElement

```dart
class FECompositeElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- static `int SVG_FECOMPOSITE_OPERATOR_ARITHMETIC`
- static `int SVG_FECOMPOSITE_OPERATOR_ATOP`
- static `int SVG_FECOMPOSITE_OPERATOR_IN`
- static `int SVG_FECOMPOSITE_OPERATOR_OUT`
- static `int SVG_FECOMPOSITE_OPERATOR_OVER`
- static `int SVG_FECOMPOSITE_OPERATOR_UNKNOWN`
- static `int SVG_FECOMPOSITE_OPERATOR_XOR`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get in2`
- `AnimatedNumber? get k1`
- `AnimatedNumber? get k2`
- `AnimatedNumber? get k3`
- `AnimatedNumber? get k4`
- `AnimatedEnumeration? get operator`
- `AnimatedString? get result`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEConvolveMatrixElement

```dart
class FEConvolveMatrixElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEConvolveMatrixElement()`
- static `int SVG_EDGEMODE_DUPLICATE`
- static `int SVG_EDGEMODE_NONE`
- static `int SVG_EDGEMODE_UNKNOWN`
- static `int SVG_EDGEMODE_WRAP`
- `AnimatedNumber? get bias`
- `AnimatedNumber? get divisor`
- `AnimatedEnumeration? get edgeMode`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedNumberList? get kernelMatrix`
- `AnimatedNumber? get kernelUnitLengthX`
- `AnimatedNumber? get kernelUnitLengthY`
- `AnimatedInteger? get orderX`
- `AnimatedInteger? get orderY`
- `AnimatedBoolean? get preserveAlpha`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedInteger? get targetX`
- `AnimatedInteger? get targetY`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEDiffuseLightingElement

```dart
class FEDiffuseLightingElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEDiffuseLightingElement()`
- `AnimatedNumber? get diffuseConstant`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedNumber? get kernelUnitLengthX`
- `AnimatedNumber? get kernelUnitLengthY`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedNumber? get surfaceScale`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEDisplacementMapElement

```dart
class FEDisplacementMapElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEDisplacementMapElement()`
- static `int SVG_CHANNEL_A`
- static `int SVG_CHANNEL_B`
- static `int SVG_CHANNEL_G`
- static `int SVG_CHANNEL_R`
- static `int SVG_CHANNEL_UNKNOWN`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get in2`
- `AnimatedString? get result`
- `AnimatedNumber? get scale`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedEnumeration? get xChannelSelector`
- `AnimatedLength? get y`
- `AnimatedEnumeration? get yChannelSelector`

## Class: FEDistantLightElement

```dart
class FEDistantLightElement extends SvgElement { … }
```

- `FEDistantLightElement()`
- `AnimatedNumber? get azimuth`
- `AnimatedNumber? get elevation`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FEFloodElement

```dart
class FEFloodElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEFloodElement()`
- `AnimatedLength? get height`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEFuncAElement

```dart
class FEFuncAElement extends _SVGComponentTransferFunctionElement { … }
```

- `FEFuncAElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FEFuncBElement

```dart
class FEFuncBElement extends _SVGComponentTransferFunctionElement { … }
```

- `FEFuncBElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FEFuncGElement

```dart
class FEFuncGElement extends _SVGComponentTransferFunctionElement { … }
```

- `FEFuncGElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FEFuncRElement

```dart
class FEFuncRElement extends _SVGComponentTransferFunctionElement { … }
```

- `FEFuncRElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FEGaussianBlurElement

```dart
class FEGaussianBlurElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEGaussianBlurElement()`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get result`
- `AnimatedNumber? get stdDeviationX`
- `AnimatedNumber? get stdDeviationY`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`
- `void setStdDeviation(num stdDeviationX, num stdDeviationY)`

## Class: FEImageElement

```dart
class FEImageElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes, UriReference { … }
```

- `FEImageElement()`
- `AnimatedLength? get height`
- `AnimatedString? get href`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEMergeElement

```dart
class FEMergeElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEMergeElement()`
- `AnimatedLength? get height`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEMergeNodeElement

```dart
class FEMergeNodeElement extends SvgElement { … }
```

- `FEMergeNodeElement()`
- `AnimatedString? get in1`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FEMorphologyElement

```dart
class FEMorphologyElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- static `int SVG_MORPHOLOGY_OPERATOR_DILATE`
- static `int SVG_MORPHOLOGY_OPERATOR_ERODE`
- static `int SVG_MORPHOLOGY_OPERATOR_UNKNOWN`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedEnumeration? get operator`
- `AnimatedNumber? get radiusX`
- `AnimatedNumber? get radiusY`
- `AnimatedString? get result`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEOffsetElement

```dart
class FEOffsetElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FEOffsetElement()`
- `AnimatedNumber? get dx`
- `AnimatedNumber? get dy`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FEPointLightElement

```dart
class FEPointLightElement extends SvgElement { … }
```

- `FEPointLightElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedNumber? get x`
- `AnimatedNumber? get y`
- `AnimatedNumber? get z`

## Class: FESpecularLightingElement

```dart
class FESpecularLightingElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FESpecularLightingElement()`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedNumber? get kernelUnitLengthX`
- `AnimatedNumber? get kernelUnitLengthY`
- `AnimatedString? get result`
- `AnimatedNumber? get specularConstant`
- `AnimatedNumber? get specularExponent`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedNumber? get surfaceScale`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FESpotLightElement

```dart
class FESpotLightElement extends SvgElement { … }
```

- `FESpotLightElement()`
- `AnimatedNumber? get limitingConeAngle`
- `AnimatedNumber? get pointsAtX`
- `AnimatedNumber? get pointsAtY`
- `AnimatedNumber? get pointsAtZ`
- `AnimatedNumber? get specularExponent`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedNumber? get x`
- `AnimatedNumber? get y`
- `AnimatedNumber? get z`

## Class: FETileElement

```dart
class FETileElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FETileElement()`
- `AnimatedLength? get height`
- `AnimatedString? get in1`
- `AnimatedString? get result`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FETurbulenceElement

```dart
class FETurbulenceElement
    extends SvgElement
    implements FilterPrimitiveStandardAttributes { … }
```

- `FETurbulenceElement()`
- static `int SVG_STITCHTYPE_NOSTITCH`
- static `int SVG_STITCHTYPE_STITCH`
- static `int SVG_STITCHTYPE_UNKNOWN`
- static `int SVG_TURBULENCE_TYPE_FRACTALNOISE`
- static `int SVG_TURBULENCE_TYPE_TURBULENCE`
- static `int SVG_TURBULENCE_TYPE_UNKNOWN`
- `AnimatedNumber? get baseFrequencyX`
- `AnimatedNumber? get baseFrequencyY`
- `AnimatedLength? get height`
- `AnimatedInteger? get numOctaves`
- `AnimatedString? get result`
- `AnimatedNumber? get seed`
- `AnimatedEnumeration? get stitchTiles`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedEnumeration? get type`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FilterElement

```dart
class FilterElement extends SvgElement implements UriReference { … }
```

- `FilterElement()`
- `AnimatedEnumeration? get filterUnits`
- `AnimatedLength? get height`
- `AnimatedString? get href`
- `AnimatedEnumeration? get primitiveUnits`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FilterPrimitiveStandardAttributes

```dart
abstract class FilterPrimitiveStandardAttributes extends JavaScriptObject { … }
```

- `AnimatedLength? get height`
- `AnimatedString? get result`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: FitToViewBox

```dart
abstract class FitToViewBox extends JavaScriptObject { … }
```

- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedRect? get viewBox`

## Class: ForeignObjectElement

```dart
class ForeignObjectElement extends GraphicsElement { … }
```

- `ForeignObjectElement()`
- `AnimatedLength? get height`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: GElement

```dart
class GElement extends GraphicsElement { … }
```

- `GElement()`

## Class: GeometryElement

```dart
class GeometryElement extends GraphicsElement { … }
```

- `AnimatedNumber? get pathLength`
- `Point getPointAtLength(num distance)`
- `double getTotalLength()`
- `bool isPointInFill(Point point)`
- `bool isPointInStroke(Point point)`

## Class: GraphicsElement

```dart
class GraphicsElement extends SvgElement implements Tests { … }
```

- `SvgElement? get farthestViewportElement`
- `SvgElement? get nearestViewportElement`
- `StringList? get requiredExtensions`
- `StringList? get systemLanguage`
- `AnimatedTransformList? get transform`
- `Rect getBBox()`
- `Matrix getCtm()`
- `Matrix getScreenCtm()`

## Class: ImageElement

```dart
class ImageElement extends GraphicsElement implements UriReference { … }
```

- `ImageElement()`
- `String? get async`
- `set async=(String? value)`
- `AnimatedLength? get height`
- `AnimatedString? get href`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`
- `Future<dynamic> decode()`

## Class: Length

```dart
class Length extends JavaScriptObject { … }
```

- static `int SVG_LENGTHTYPE_CM`
- static `int SVG_LENGTHTYPE_EMS`
- static `int SVG_LENGTHTYPE_EXS`
- static `int SVG_LENGTHTYPE_IN`
- static `int SVG_LENGTHTYPE_MM`
- static `int SVG_LENGTHTYPE_NUMBER`
- static `int SVG_LENGTHTYPE_PC`
- static `int SVG_LENGTHTYPE_PERCENTAGE`
- static `int SVG_LENGTHTYPE_PT`
- static `int SVG_LENGTHTYPE_PX`
- static `int SVG_LENGTHTYPE_UNKNOWN`
- `int? get unitType`
- `num? get value`
- `set value=(num? value)`
- `String? get valueAsString`
- `set valueAsString=(String? value)`
- `num? get valueInSpecifiedUnits`
- `set valueInSpecifiedUnits=(num? value)`
- `void convertToSpecifiedUnits(int unitType)`
- `void newValueSpecifiedUnits(int unitType, num valueInSpecifiedUnits)`

## Class: LengthList

```dart
class LengthList
    extends JavaScriptObject
    with ListBase<Length>, ImmutableListMixin<Length>
    implements List<Length> { … }
```

- `Length get first`: The first element.
- `Length get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `int? get numberOfItems`
- `Length get single`:
  Checks that this iterable has only one element, and returns that element.
- `Length operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Length value)`:
  Sets the value at the given [index] in the list to [value].
- `Length appendItem(Length newItem)`
- `void clear()`:
  Removes all objects from this list; the length of the list becomes zero.
- `Length elementAt(int index)`: Returns the [index]th element.
- `Length getItem(int index)`
- `Length initialize(Length newItem)`
- `Length insertItemBefore(Length newItem, int index)`
- `Length removeItem(int index)`
- `Length replaceItem(Length newItem, int index)`

## Class: LineElement

```dart
class LineElement extends GeometryElement { … }
```

- `LineElement()`
- `AnimatedLength? get x1`
- `AnimatedLength? get x2`
- `AnimatedLength? get y1`
- `AnimatedLength? get y2`

## Class: LinearGradientElement

```dart
class LinearGradientElement extends _GradientElement { … }
```

- `LinearGradientElement()`
- `AnimatedLength? get x1`
- `AnimatedLength? get x2`
- `AnimatedLength? get y1`
- `AnimatedLength? get y2`

## Class: MarkerElement

```dart
class MarkerElement extends SvgElement implements FitToViewBox { … }
```

- `MarkerElement()`
- static `int SVG_MARKERUNITS_STROKEWIDTH`
- static `int SVG_MARKERUNITS_UNKNOWN`
- static `int SVG_MARKERUNITS_USERSPACEONUSE`
- static `int SVG_MARKER_ORIENT_ANGLE`
- static `int SVG_MARKER_ORIENT_AUTO`
- static `int SVG_MARKER_ORIENT_UNKNOWN`
- `AnimatedLength get markerHeight`
- `AnimatedEnumeration get markerUnits`
- `AnimatedLength get markerWidth`
- `AnimatedAngle? get orientAngle`
- `AnimatedEnumeration? get orientType`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedLength get refX`
- `AnimatedLength get refY`
- `AnimatedRect? get viewBox`
- `void setOrientToAngle(Angle angle)`
- `void setOrientToAuto()`

## Class: MaskElement

```dart
class MaskElement extends SvgElement implements Tests { … }
```

- `MaskElement()`
- `AnimatedLength? get height`
- `AnimatedEnumeration? get maskContentUnits`
- `AnimatedEnumeration? get maskUnits`
- `StringList? get requiredExtensions`
- `StringList? get systemLanguage`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: Matrix

```dart
class Matrix extends JavaScriptObject { … }
```

- `num? get a`
- `set a=(num? value)`
- `num? get b`
- `set b=(num? value)`
- `num? get c`
- `set c=(num? value)`
- `num? get d`
- `set d=(num? value)`
- `num? get e`
- `set e=(num? value)`
- `num? get f`
- `set f=(num? value)`
- `Matrix flipX()`
- `Matrix flipY()`
- `Matrix inverse()`
- `Matrix multiply(Matrix secondMatrix)`
- `Matrix rotate(num angle)`
- `Matrix rotateFromVector(num x, num y)`
- `Matrix scale(num scaleFactor)`
- `Matrix scaleNonUniform(num scaleFactorX, num scaleFactorY)`
- `Matrix skewX(num angle)`
- `Matrix skewY(num angle)`
- `Matrix translate(num x, num y)`

## Class: MetadataElement

```dart
class MetadataElement extends SvgElement { … }
```

## Class: Number

```dart
class Number extends JavaScriptObject { … }
```

- `num? get value`
- `set value=(num? value)`

## Class: NumberList

```dart
class NumberList
    extends JavaScriptObject
    with ListBase<Number>, ImmutableListMixin<Number>
    implements List<Number> { … }
```

- `Number get first`: The first element.
- `Number get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `int? get numberOfItems`
- `Number get single`:
  Checks that this iterable has only one element, and returns that element.
- `Number operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Number value)`:
  Sets the value at the given [index] in the list to [value].
- `Number appendItem(Number newItem)`
- `void clear()`:
  Removes all objects from this list; the length of the list becomes zero.
- `Number elementAt(int index)`: Returns the [index]th element.
- `Number getItem(int index)`
- `Number initialize(Number newItem)`
- `Number insertItemBefore(Number newItem, int index)`
- `Number removeItem(int index)`
- `Number replaceItem(Number newItem, int index)`

## Class: PathElement

```dart
class PathElement extends GeometryElement { … }
```

- `PathElement()`

## Class: PatternElement

```dart
class PatternElement
    extends SvgElement
    implements FitToViewBox, UriReference, Tests { … }
```

- `PatternElement()`
- `AnimatedLength? get height`
- `AnimatedString? get href`
- `AnimatedEnumeration? get patternContentUnits`
- `AnimatedTransformList? get patternTransform`
- `AnimatedEnumeration? get patternUnits`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `StringList? get requiredExtensions`
- `StringList? get systemLanguage`
- `AnimatedRect? get viewBox`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: Point

```dart
class Point extends JavaScriptObject { … }
```

- `num? get x`
- `set x=(num? value)`
- `num? get y`
- `set y=(num? value)`
- `Point matrixTransform(Matrix matrix)`

## Class: PointList

```dart
class PointList extends JavaScriptObject { … }
```

- `int? get length`
- `int? get numberOfItems`
- `Point appendItem(Point newItem)`
- `void clear()`
- `Point getItem(int index)`
- `Point initialize(Point newItem)`
- `Point insertItemBefore(Point newItem, int index)`
- `Point removeItem(int index)`
- `Point replaceItem(Point newItem, int index)`

## Class: PolygonElement

```dart
class PolygonElement extends GeometryElement { … }
```

- `PolygonElement()`
- `PointList? get animatedPoints`
- `PointList get points`

## Class: PolylineElement

```dart
class PolylineElement extends GeometryElement { … }
```

- `PolylineElement()`
- `PointList? get animatedPoints`
- `PointList get points`

## Class: PreserveAspectRatio

```dart
class PreserveAspectRatio extends JavaScriptObject { … }
```

- static `int SVG_MEETORSLICE_MEET`
- static `int SVG_MEETORSLICE_SLICE`
- static `int SVG_MEETORSLICE_UNKNOWN`
- static `int SVG_PRESERVEASPECTRATIO_NONE`
- static `int SVG_PRESERVEASPECTRATIO_UNKNOWN`
- static `int SVG_PRESERVEASPECTRATIO_XMAXYMAX`
- static `int SVG_PRESERVEASPECTRATIO_XMAXYMID`
- static `int SVG_PRESERVEASPECTRATIO_XMAXYMIN`
- static `int SVG_PRESERVEASPECTRATIO_XMIDYMAX`
- static `int SVG_PRESERVEASPECTRATIO_XMIDYMID`
- static `int SVG_PRESERVEASPECTRATIO_XMIDYMIN`
- static `int SVG_PRESERVEASPECTRATIO_XMINYMAX`
- static `int SVG_PRESERVEASPECTRATIO_XMINYMID`
- static `int SVG_PRESERVEASPECTRATIO_XMINYMIN`
- `int? get align`
- `set align=(int? value)`
- `int? get meetOrSlice`
- `set meetOrSlice=(int? value)`

## Class: RadialGradientElement

```dart
class RadialGradientElement extends _GradientElement { … }
```

- `RadialGradientElement()`
- `AnimatedLength? get cx`
- `AnimatedLength? get cy`
- `AnimatedLength? get fr`
- `AnimatedLength? get fx`
- `AnimatedLength? get fy`
- `AnimatedLength? get r`

## Class: Rect

```dart
class Rect extends JavaScriptObject { … }
```

- `num? get height`
- `set height=(num? value)`
- `num? get width`
- `set width=(num? value)`
- `num? get x`
- `set x=(num? value)`
- `num? get y`
- `set y=(num? value)`

## Class: RectElement

```dart
class RectElement extends GeometryElement { … }
```

- `RectElement()`
- `AnimatedLength? get height`
- `AnimatedLength? get rx`
- `AnimatedLength? get ry`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: ScriptElement

```dart
class ScriptElement extends SvgElement implements UriReference { … }
```

- `ScriptElement()`
- `AnimatedString? get href`
- `String? get type`
- `set type=(String? value)`

## Class: SetElement

```dart
class SetElement extends AnimationElement { … }
```

- `SetElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: StopElement

```dart
class StopElement extends SvgElement { … }
```

- `StopElement()`
- `AnimatedNumber get gradientOffset`

## Class: StringList

```dart
class StringList
    extends JavaScriptObject
    with ListBase<String>, ImmutableListMixin<String>
    implements List<String> { … }
```

- `String get first`: The first element.
- `String get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `int? get numberOfItems`
- `String get single`:
  Checks that this iterable has only one element, and returns that element.
- `String operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, String value)`:
  Sets the value at the given [index] in the list to [value].
- `String appendItem(String newItem)`
- `void clear()`:
  Removes all objects from this list; the length of the list becomes zero.
- `String elementAt(int index)`: Returns the [index]th element.
- `String getItem(int index)`
- `String initialize(String newItem)`
- `String insertItemBefore(String item, int index)`
- `String removeItem(int index)`
- `String replaceItem(String newItem, int index)`

## Class: StyleElement

```dart
class StyleElement extends SvgElement { … }
```

- `StyleElement()`
- `bool? get disabled`
- `set disabled=(bool? value)`
- `String? get media`
- `set media=(String? value)`
- `StyleSheet? get sheet`
- `String? get type`
- `set type=(String? value)`

## Class: SvgElement

```dart
class SvgElement
    extends Element
    implements GlobalEventHandlers, NoncedElement { … }
```

- `SvgElement.svg(String svg, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`
- `SvgElement.tag(String tag)`
- static `EventStreamProvider<Event> abortEvent`
- static `EventStreamProvider<Event> blurEvent`
- static `EventStreamProvider<Event> canPlayEvent`
- static `EventStreamProvider<Event> canPlayThroughEvent`
- static `EventStreamProvider<Event> changeEvent`
- static `EventStreamProvider<MouseEvent> clickEvent`
- static `EventStreamProvider<MouseEvent> contextMenuEvent`
- static `EventStreamProvider<Event> doubleClickEvent`
- static `EventStreamProvider<MouseEvent> dragEndEvent`
- static `EventStreamProvider<MouseEvent> dragEnterEvent`
- static `EventStreamProvider<MouseEvent> dragEvent`
- static `EventStreamProvider<MouseEvent> dragLeaveEvent`
- static `EventStreamProvider<MouseEvent> dragOverEvent`
- static `EventStreamProvider<MouseEvent> dragStartEvent`
- static `EventStreamProvider<MouseEvent> dropEvent`
- static `EventStreamProvider<Event> durationChangeEvent`
- static `EventStreamProvider<Event> emptiedEvent`
- static `EventStreamProvider<Event> endedEvent`
- static `EventStreamProvider<Event> errorEvent`
- static `EventStreamProvider<Event> focusEvent`
- static `EventStreamProvider<Event> inputEvent`
- static `EventStreamProvider<Event> invalidEvent`
- static `EventStreamProvider<KeyboardEvent> keyDownEvent`
- static `EventStreamProvider<KeyboardEvent> keyPressEvent`
- static `EventStreamProvider<KeyboardEvent> keyUpEvent`
- static `EventStreamProvider<Event> loadEvent`
- static `EventStreamProvider<Event> loadedDataEvent`
- static `EventStreamProvider<Event> loadedMetadataEvent`
- static `EventStreamProvider<MouseEvent> mouseDownEvent`
- static `EventStreamProvider<MouseEvent> mouseEnterEvent`
- static `EventStreamProvider<MouseEvent> mouseLeaveEvent`
- static `EventStreamProvider<MouseEvent> mouseMoveEvent`
- static `EventStreamProvider<MouseEvent> mouseOutEvent`
- static `EventStreamProvider<MouseEvent> mouseOverEvent`
- static `EventStreamProvider<MouseEvent> mouseUpEvent`
- static `EventStreamProvider<WheelEvent> mouseWheelEvent`
- static `EventStreamProvider<Event> pauseEvent`
- static `EventStreamProvider<Event> playEvent`
- static `EventStreamProvider<Event> playingEvent`
- static `EventStreamProvider<Event> rateChangeEvent`
- static `EventStreamProvider<Event> resetEvent`
- static `EventStreamProvider<Event> resizeEvent`
- static `EventStreamProvider<Event> scrollEvent`
- static `EventStreamProvider<Event> seekedEvent`
- static `EventStreamProvider<Event> seekingEvent`
- static `EventStreamProvider<Event> selectEvent`
- static `EventStreamProvider<Event> stalledEvent`
- static `EventStreamProvider<Event> submitEvent`
- static `EventStreamProvider<Event> suspendEvent`
- static `EventStreamProvider<Event> timeUpdateEvent`
- static `EventStreamProvider<TouchEvent> touchCancelEvent`
- static `EventStreamProvider<TouchEvent> touchEndEvent`
- static `EventStreamProvider<TouchEvent> touchMoveEvent`
- static `EventStreamProvider<TouchEvent> touchStartEvent`
- static `EventStreamProvider<Event> volumeChangeEvent`
- static `EventStreamProvider<Event> waitingEvent`
- static `EventStreamProvider<WheelEvent> wheelEvent`
- static `bool isTagSupported(String tag)`:
  Checks to see if the SVG element type is supported by the current platform.
- `set children=(List<Element> value)`
- `List<Element> get children`: List of the direct children of this element.
- `CssClassSet get classes`: The set of CSS classes applied to this element.
- `String? get innerHtml`
- `set innerHtml=(String? value)`
- `bool get isContentEditable`
- `String? get nonce`
- `set nonce=(String? value)`
- `ElementStream<Event> get onAbort`:
  Stream of `abort` events handled by this [Element].
- `ElementStream<Event> get onBlur`:
  Stream of `blur` events handled by this [Element].
- `ElementStream<Event> get onCanPlay`
- `ElementStream<Event> get onCanPlayThrough`
- `ElementStream<Event> get onChange`:
  Stream of `change` events handled by this [Element].
- `ElementStream<MouseEvent> get onClick`:
  Stream of `click` events handled by this [Element].
- `ElementStream<MouseEvent> get onContextMenu`:
  Stream of `contextmenu` events handled by this [Element].
- `ElementStream<Event> get onDoubleClick`:
  Stream of `doubleclick` events handled by this [Element].
- `ElementStream<MouseEvent> get onDrag`:
  A stream of `drag` events fired when this element currently being dragged.
- `ElementStream<MouseEvent> get onDragEnd`:
  A stream of `dragend` events fired when this element completes a drag
  operation.
- `ElementStream<MouseEvent> get onDragEnter`:
  A stream of `dragenter` events fired when a dragged object is first dragged
  over this element.
- `ElementStream<MouseEvent> get onDragLeave`:
  A stream of `dragleave` events fired when an object being dragged over this
  element leaves this element's target area.
- `ElementStream<MouseEvent> get onDragOver`:
  A stream of `dragover` events fired when a dragged object is currently
  being dragged over this element.
- `ElementStream<MouseEvent> get onDragStart`:
  A stream of `dragstart` events fired when this element starts being
  dragged.
- `ElementStream<MouseEvent> get onDrop`:
  A stream of `drop` events fired when a dragged object is dropped on this
  element.
- `ElementStream<Event> get onDurationChange`
- `ElementStream<Event> get onEmptied`
- `ElementStream<Event> get onEnded`
- `ElementStream<Event> get onError`:
  Stream of `error` events handled by this [Element].
- `ElementStream<Event> get onFocus`:
  Stream of `focus` events handled by this [Element].
- `ElementStream<Event> get onInput`:
  Stream of `input` events handled by this [Element].
- `ElementStream<Event> get onInvalid`:
  Stream of `invalid` events handled by this [Element].
- `ElementStream<KeyboardEvent> get onKeyDown`:
  Stream of `keydown` events handled by this [Element].
- `ElementStream<KeyboardEvent> get onKeyPress`:
  Stream of `keypress` events handled by this [Element].
- `ElementStream<KeyboardEvent> get onKeyUp`:
  Stream of `keyup` events handled by this [Element].
- `ElementStream<Event> get onLoad`:
  Stream of `load` events handled by this [Element].
- `ElementStream<Event> get onLoadedData`
- `ElementStream<Event> get onLoadedMetadata`
- `ElementStream<MouseEvent> get onMouseDown`:
  Stream of `mousedown` events handled by this [Element].
- `ElementStream<MouseEvent> get onMouseEnter`:
  Stream of `mouseenter` events handled by this [Element].
- `ElementStream<MouseEvent> get onMouseLeave`:
  Stream of `mouseleave` events handled by this [Element].
- `ElementStream<MouseEvent> get onMouseMove`:
  Stream of `mousemove` events handled by this [Element].
- `ElementStream<MouseEvent> get onMouseOut`:
  Stream of `mouseout` events handled by this [Element].
- `ElementStream<MouseEvent> get onMouseOver`:
  Stream of `mouseover` events handled by this [Element].
- `ElementStream<MouseEvent> get onMouseUp`:
  Stream of `mouseup` events handled by this [Element].
- `ElementStream<WheelEvent> get onMouseWheel`:
  Stream of `mousewheel` events handled by this [Element].
- `ElementStream<Event> get onPause`
- `ElementStream<Event> get onPlay`
- `ElementStream<Event> get onPlaying`
- `ElementStream<Event> get onRateChange`
- `ElementStream<Event> get onReset`:
  Stream of `reset` events handled by this [Element].
- `ElementStream<Event> get onResize`
- `ElementStream<Event> get onScroll`:
  Stream of `scroll` events handled by this [Element].
- `ElementStream<Event> get onSeeked`
- `ElementStream<Event> get onSeeking`
- `ElementStream<Event> get onSelect`:
  Stream of `select` events handled by this [Element].
- `ElementStream<Event> get onStalled`
- `ElementStream<Event> get onSubmit`:
  Stream of `submit` events handled by this [Element].
- `ElementStream<Event> get onSuspend`
- `ElementStream<Event> get onTimeUpdate`
- `ElementStream<TouchEvent> get onTouchCancel`:
  Stream of `touchcancel` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchEnd`:
  Stream of `touchend` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchMove`:
  Stream of `touchmove` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchStart`:
  Stream of `touchstart` events handled by this [Element].
- `ElementStream<Event> get onVolumeChange`
- `ElementStream<Event> get onWaiting`
- `ElementStream<WheelEvent> get onWheel`
- `String? get outerHtml`
- `SvgSvgElement? get ownerSvgElement`
- `SvgElement? get viewportElement`
- `void blur()`
- `void click()`
- `DocumentFragment createFragment(String? svg, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Create a DocumentFragment from the HTML fragment and ensure that it follows
  the sanitization rules specified by the validator or treeSanitizer.
- `void focus()`
- `Element insertAdjacentElement(String where, Element element)`:
  Inserts [element] into the DOM at the specified location.
- `void insertAdjacentHtml(String where, String text, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Parses text as an HTML fragment and inserts it into the DOM at the
  specified location.
- `void insertAdjacentText(String where, String text)`:
  Inserts text into the DOM at the specified location.

## Class: SvgSvgElement

```dart
class SvgSvgElement
    extends GraphicsElement
    implements FitToViewBox, ZoomAndPan { … }
```

- `SvgSvgElement()`
- `num? get currentScale`
- `set currentScale=(num? value)`
- `Point? get currentTranslate`
- `AnimatedLength? get height`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedRect? get viewBox`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`
- `int? get zoomAndPan`
- `set zoomAndPan=(int? value)`
- `bool animationsPaused()`
- `bool checkEnclosure(SvgElement element, Rect rect)`
- `bool checkIntersection(SvgElement element, Rect rect)`
- `Angle createSvgAngle()`
- `Length createSvgLength()`
- `Matrix createSvgMatrix()`
- `Number createSvgNumber()`
- `Point createSvgPoint()`
- `Rect createSvgRect()`
- `Transform createSvgTransform()`
- `Transform createSvgTransformFromMatrix(Matrix matrix)`
- `void deselectAll()`
- `void forceRedraw()`
- `double getCurrentTime()`
- `Element getElementById(String elementId)`
- `List<Node> getEnclosureList(Rect rect, SvgElement? referenceElement)`
- `List<Node> getIntersectionList(Rect rect, SvgElement? referenceElement)`
- `void pauseAnimations()`
- `void setCurrentTime(num seconds)`
- `int suspendRedraw(int maxWaitMilliseconds)`
- `void unpauseAnimations()`
- `void unsuspendRedraw(int suspendHandleId)`
- `void unsuspendRedrawAll()`

## Class: SwitchElement

```dart
class SwitchElement extends GraphicsElement { … }
```

- `SwitchElement()`

## Class: SymbolElement

```dart
class SymbolElement extends SvgElement implements FitToViewBox { … }
```

- `SymbolElement()`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedRect? get viewBox`

## Class: TSpanElement

```dart
class TSpanElement extends TextPositioningElement { … }
```

- `TSpanElement()`

## Class: Tests

```dart
abstract class Tests extends JavaScriptObject { … }
```

- `StringList? get requiredExtensions`
- `StringList? get systemLanguage`

## Class: TextContentElement

```dart
class TextContentElement extends GraphicsElement { … }
```

- static `int LENGTHADJUST_SPACING`
- static `int LENGTHADJUST_SPACINGANDGLYPHS`
- static `int LENGTHADJUST_UNKNOWN`
- `AnimatedEnumeration? get lengthAdjust`
- `AnimatedLength? get textLength`
- `int getCharNumAtPosition(Point point)`
- `double getComputedTextLength()`
- `Point getEndPositionOfChar(int charnum)`
- `Rect getExtentOfChar(int charnum)`
- `int getNumberOfChars()`
- `double getRotationOfChar(int charnum)`
- `Point getStartPositionOfChar(int charnum)`
- `double getSubStringLength(int charnum, int nchars)`
- `void selectSubString(int charnum, int nchars)`

## Class: TextElement

```dart
class TextElement extends TextPositioningElement { … }
```

- `TextElement()`

## Class: TextPathElement

```dart
class TextPathElement extends TextContentElement implements UriReference { … }
```

- static `int TEXTPATH_METHODTYPE_ALIGN`
- static `int TEXTPATH_METHODTYPE_STRETCH`
- static `int TEXTPATH_METHODTYPE_UNKNOWN`
- static `int TEXTPATH_SPACINGTYPE_AUTO`
- static `int TEXTPATH_SPACINGTYPE_EXACT`
- static `int TEXTPATH_SPACINGTYPE_UNKNOWN`
- `AnimatedString? get href`
- `AnimatedEnumeration? get method`
- `AnimatedEnumeration? get spacing`
- `AnimatedLength? get startOffset`

## Class: TextPositioningElement

```dart
class TextPositioningElement extends TextContentElement { … }
```

- `AnimatedLengthList? get dx`
- `AnimatedLengthList? get dy`
- `AnimatedNumberList? get rotate`
- `AnimatedLengthList? get x`
- `AnimatedLengthList? get y`

## Class: TitleElement

```dart
class TitleElement extends SvgElement { … }
```

- `TitleElement()`

## Class: Transform

```dart
class Transform extends JavaScriptObject { … }
```

- static `int SVG_TRANSFORM_MATRIX`
- static `int SVG_TRANSFORM_ROTATE`
- static `int SVG_TRANSFORM_SCALE`
- static `int SVG_TRANSFORM_SKEWX`
- static `int SVG_TRANSFORM_SKEWY`
- static `int SVG_TRANSFORM_TRANSLATE`
- static `int SVG_TRANSFORM_UNKNOWN`
- `num? get angle`
- `Matrix? get matrix`
- `int? get type`
- `void setMatrix(Matrix matrix)`
- `void setRotate(num angle, num cx, num cy)`
- `void setScale(num sx, num sy)`
- `void setSkewX(num angle)`
- `void setSkewY(num angle)`
- `void setTranslate(num tx, num ty)`

## Class: TransformList

```dart
class TransformList
    extends JavaScriptObject
    with ListBase<Transform>, ImmutableListMixin<Transform>
    implements List<Transform> { … }
```

- `Transform get first`: The first element.
- `Transform get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `int? get numberOfItems`
- `Transform get single`:
  Checks that this iterable has only one element, and returns that element.
- `Transform operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Transform value)`:
  Sets the value at the given [index] in the list to [value].
- `Transform appendItem(Transform newItem)`
- `void clear()`:
  Removes all objects from this list; the length of the list becomes zero.
- `Transform? consolidate()`
- `Transform createSvgTransformFromMatrix(Matrix matrix)`
- `Transform elementAt(int index)`: Returns the [index]th element.
- `Transform getItem(int index)`
- `Transform initialize(Transform newItem)`
- `Transform insertItemBefore(Transform newItem, int index)`
- `Transform removeItem(int index)`
- `Transform replaceItem(Transform newItem, int index)`

## Class: UnitTypes

```dart
class UnitTypes extends JavaScriptObject { … }
```

- static `int SVG_UNIT_TYPE_OBJECTBOUNDINGBOX`
- static `int SVG_UNIT_TYPE_UNKNOWN`
- static `int SVG_UNIT_TYPE_USERSPACEONUSE`

## Class: UriReference

```dart
abstract class UriReference extends JavaScriptObject { … }
```

- `AnimatedString? get href`

## Class: UseElement

```dart
class UseElement extends GraphicsElement implements UriReference { … }
```

- `UseElement()`
- `AnimatedLength? get height`
- `AnimatedString? get href`
- `AnimatedLength? get width`
- `AnimatedLength? get x`
- `AnimatedLength? get y`

## Class: ViewElement

```dart
class ViewElement extends SvgElement implements FitToViewBox, ZoomAndPan { … }
```

- `ViewElement()`
- `AnimatedPreserveAspectRatio? get preserveAspectRatio`
- `AnimatedRect? get viewBox`
- `int? get zoomAndPan`
- `set zoomAndPan=(int? value)`

## Class: ZoomAndPan

```dart
abstract class ZoomAndPan extends JavaScriptObject { … }
```

- static `int SVG_ZOOMANDPAN_DISABLE`
- static `int SVG_ZOOMANDPAN_MAGNIFY`
- static `int SVG_ZOOMANDPAN_UNKNOWN`
- `int? get zoomAndPan`
- `set zoomAndPan=(int? value)`
