# Library: dart:web_gl

3D programming in the browser.

> [!Note]
> This core library is deprecated, and scheduled for removal in late 2025.
> It has been replaced by [package:web](https://pub.dev/packages/web).
> The [migration guide](https://dart.dev/go/package-web) has more details.

{@category Web (Legacy)}

## Members

## Class: ActiveInfo

```dart
class ActiveInfo extends JavaScriptObject { … }
```

- `String get name`
- `int get size`
- `int get type`

## Class: AngleInstancedArrays

```dart
class AngleInstancedArrays extends JavaScriptObject { … }
```

- static `int VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE`
- `void drawArraysInstancedAngle(int mode, int first, int count, int primcount)`
- `void drawElementsInstancedAngle(int mode, int count, int type, int offset, int primcount)`
- `void vertexAttribDivisorAngle(int index, int divisor)`

## Class: Buffer

```dart
class Buffer extends JavaScriptObject { … }
```

## Class: Canvas

```dart
class Canvas extends JavaScriptObject { … }
```

- `CanvasElement get canvas`
- `OffscreenCanvas? get offscreenCanvas`

## Class: ColorBufferFloat

```dart
class ColorBufferFloat extends JavaScriptObject { … }
```

## Class: CompressedTextureAstc

```dart
class CompressedTextureAstc extends JavaScriptObject { … }
```

- static `int COMPRESSED_RGBA_ASTC_10x10_KHR`
- static `int COMPRESSED_RGBA_ASTC_10x5_KHR`
- static `int COMPRESSED_RGBA_ASTC_10x6_KHR`
- static `int COMPRESSED_RGBA_ASTC_10x8_KHR`
- static `int COMPRESSED_RGBA_ASTC_12x10_KHR`
- static `int COMPRESSED_RGBA_ASTC_12x12_KHR`
- static `int COMPRESSED_RGBA_ASTC_4x4_KHR`
- static `int COMPRESSED_RGBA_ASTC_5x4_KHR`
- static `int COMPRESSED_RGBA_ASTC_5x5_KHR`
- static `int COMPRESSED_RGBA_ASTC_6x5_KHR`
- static `int COMPRESSED_RGBA_ASTC_6x6_KHR`
- static `int COMPRESSED_RGBA_ASTC_8x5_KHR`
- static `int COMPRESSED_RGBA_ASTC_8x6_KHR`
- static `int COMPRESSED_RGBA_ASTC_8x8_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR`
- static `int COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR`

## Class: CompressedTextureAtc

```dart
class CompressedTextureAtc extends JavaScriptObject { … }
```

- static `int COMPRESSED_RGBA_ATC_EXPLICIT_ALPHA_WEBGL`
- static `int COMPRESSED_RGBA_ATC_INTERPOLATED_ALPHA_WEBGL`
- static `int COMPRESSED_RGB_ATC_WEBGL`

## Class: CompressedTextureETC1

```dart
class CompressedTextureETC1 extends JavaScriptObject { … }
```

- static `int COMPRESSED_RGB_ETC1_WEBGL`

## Class: CompressedTextureEtc

```dart
class CompressedTextureEtc extends JavaScriptObject { … }
```

- static `int COMPRESSED_R11_EAC`
- static `int COMPRESSED_RG11_EAC`
- static `int COMPRESSED_RGB8_ETC2`
- static `int COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2`
- static `int COMPRESSED_RGBA8_ETC2_EAC`
- static `int COMPRESSED_SIGNED_R11_EAC`
- static `int COMPRESSED_SIGNED_RG11_EAC`
- static `int COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`
- static `int COMPRESSED_SRGB8_ETC2`
- static `int COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2`

## Class: CompressedTexturePvrtc

```dart
class CompressedTexturePvrtc extends JavaScriptObject { … }
```

- static `int COMPRESSED_RGBA_PVRTC_2BPPV1_IMG`
- static `int COMPRESSED_RGBA_PVRTC_4BPPV1_IMG`
- static `int COMPRESSED_RGB_PVRTC_2BPPV1_IMG`
- static `int COMPRESSED_RGB_PVRTC_4BPPV1_IMG`

## Class: CompressedTextureS3TC

```dart
class CompressedTextureS3TC extends JavaScriptObject { … }
```

- static `int COMPRESSED_RGBA_S3TC_DXT1_EXT`
- static `int COMPRESSED_RGBA_S3TC_DXT3_EXT`
- static `int COMPRESSED_RGBA_S3TC_DXT5_EXT`
- static `int COMPRESSED_RGB_S3TC_DXT1_EXT`

## Class: CompressedTextureS3TCsRgb

```dart
class CompressedTextureS3TCsRgb extends JavaScriptObject { … }
```

- static `int COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT`
- static `int COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT`
- static `int COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT`
- static `int COMPRESSED_SRGB_S3TC_DXT1_EXT`

## Class: ContextEvent

```dart
class ContextEvent extends Event { … }
```

- `ContextEvent(String type, [Map<dynamic, dynamic>? eventInit])`
- `String get statusMessage`

## Class: DebugRendererInfo

```dart
class DebugRendererInfo extends JavaScriptObject { … }
```

- static `int UNMASKED_RENDERER_WEBGL`
- static `int UNMASKED_VENDOR_WEBGL`

## Class: DebugShaders

```dart
class DebugShaders extends JavaScriptObject { … }
```

- `String? getTranslatedShaderSource(Shader shader)`

## Class: DepthTexture

```dart
class DepthTexture extends JavaScriptObject { … }
```

- static `int UNSIGNED_INT_24_8_WEBGL`

## Class: DrawBuffers

```dart
class DrawBuffers extends JavaScriptObject { … }
```

- `void drawBuffersWebgl(List<int> buffers)`

## Class: EXTsRgb

```dart
class EXTsRgb extends JavaScriptObject { … }
```

- static `int FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT`
- static `int SRGB8_ALPHA8_EXT`
- static `int SRGB_ALPHA_EXT`
- static `int SRGB_EXT`

## Class: ExtBlendMinMax

```dart
class ExtBlendMinMax extends JavaScriptObject { … }
```

- static `int MAX_EXT`
- static `int MIN_EXT`

## Class: ExtColorBufferFloat

```dart
class ExtColorBufferFloat extends JavaScriptObject { … }
```

## Class: ExtColorBufferHalfFloat

```dart
class ExtColorBufferHalfFloat extends JavaScriptObject { … }
```

## Class: ExtDisjointTimerQuery

```dart
class ExtDisjointTimerQuery extends JavaScriptObject { … }
```

- static `int CURRENT_QUERY_EXT`
- static `int GPU_DISJOINT_EXT`
- static `int QUERY_COUNTER_BITS_EXT`
- static `int QUERY_RESULT_AVAILABLE_EXT`
- static `int QUERY_RESULT_EXT`
- static `int TIMESTAMP_EXT`
- static `int TIME_ELAPSED_EXT`
- `void beginQueryExt(int target, TimerQueryExt query)`
- `TimerQueryExt createQueryExt()`
- `void deleteQueryExt(TimerQueryExt? query)`
- `void endQueryExt(int target)`
- `Object? getQueryExt(int target, int pname)`
- `Object? getQueryObjectExt(TimerQueryExt query, int pname)`
- `bool isQueryExt(TimerQueryExt? query)`
- `void queryCounterExt(TimerQueryExt query, int target)`

## Class: ExtDisjointTimerQueryWebGL2

```dart
class ExtDisjointTimerQueryWebGL2 extends JavaScriptObject { … }
```

- static `int GPU_DISJOINT_EXT`
- static `int QUERY_COUNTER_BITS_EXT`
- static `int TIMESTAMP_EXT`
- static `int TIME_ELAPSED_EXT`
- `void queryCounterExt(Query query, int target)`

## Class: ExtFragDepth

```dart
class ExtFragDepth extends JavaScriptObject { … }
```

## Class: ExtShaderTextureLod

```dart
class ExtShaderTextureLod extends JavaScriptObject { … }
```

## Class: ExtTextureFilterAnisotropic

```dart
class ExtTextureFilterAnisotropic extends JavaScriptObject { … }
```

- static `int MAX_TEXTURE_MAX_ANISOTROPY_EXT`
- static `int TEXTURE_MAX_ANISOTROPY_EXT`

## Class: Framebuffer

```dart
class Framebuffer extends JavaScriptObject { … }
```

## Class: GetBufferSubDataAsync

```dart
class GetBufferSubDataAsync extends JavaScriptObject { … }
```

- `Future<dynamic> getBufferSubDataAsync(int target, int srcByteOffset, TypedData dstData, [int? dstOffset, int? length])`

## Class: LoseContext

```dart
class LoseContext extends JavaScriptObject { … }
```

- `void loseContext()`
- `void restoreContext()`

## Class: OesElementIndexUint

```dart
class OesElementIndexUint extends JavaScriptObject { … }
```

## Class: OesStandardDerivatives

```dart
class OesStandardDerivatives extends JavaScriptObject { … }
```

- static `int FRAGMENT_SHADER_DERIVATIVE_HINT_OES`

## Class: OesTextureFloat

```dart
class OesTextureFloat extends JavaScriptObject { … }
```

## Class: OesTextureFloatLinear

```dart
class OesTextureFloatLinear extends JavaScriptObject { … }
```

## Class: OesTextureHalfFloat

```dart
class OesTextureHalfFloat extends JavaScriptObject { … }
```

- static `int HALF_FLOAT_OES`

## Class: OesTextureHalfFloatLinear

```dart
class OesTextureHalfFloatLinear extends JavaScriptObject { … }
```

## Class: OesVertexArrayObject

```dart
class OesVertexArrayObject extends JavaScriptObject { … }
```

- static `int VERTEX_ARRAY_BINDING_OES`
- `void bindVertexArray(VertexArrayObjectOes? arrayObject)`
- `VertexArrayObjectOes createVertexArray()`
- `void deleteVertexArray(VertexArrayObjectOes? arrayObject)`
- `bool isVertexArray(VertexArrayObjectOes? arrayObject)`

## Class: Program

```dart
class Program extends JavaScriptObject { … }
```

## Class: Query

```dart
class Query extends JavaScriptObject { … }
```

## Class: Renderbuffer

```dart
class Renderbuffer extends JavaScriptObject { … }
```

## Class: RenderingContext

```dart
class RenderingContext
    extends JavaScriptObject
    implements CanvasRenderingContext { … }
```

- `CanvasElement get canvas`
- `int? get drawingBufferHeight`
- `int? get drawingBufferWidth`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void activeTexture(int texture)`
- `void attachShader(Program program, Shader shader)`
- `void bindAttribLocation(Program program, int index, String name)`
- `void bindBuffer(int target, Buffer? buffer)`
- `void bindFramebuffer(int target, Framebuffer? framebuffer)`
- `void bindRenderbuffer(int target, Renderbuffer? renderbuffer)`
- `void bindTexture(int target, Texture? texture)`
- `void blendColor(num red, num green, num blue, num alpha)`
- `void blendEquation(int mode)`
- `void blendEquationSeparate(int modeRGB, int modeAlpha)`
- `void blendFunc(int sfactor, int dfactor)`
- `void blendFuncSeparate(int srcRGB, int dstRGB, int srcAlpha, int dstAlpha)`
- `void bufferData(int target, dynamic data_OR_size, int usage)`
- `void bufferDataTyped(int target, TypedData data, int usage)`:
  Set the bufferData to [data].
- `void bufferSubData(int target, int offset, dynamic data)`
- `void bufferSubDataTyped(int target, int offset, TypedData data)`:
  Set the bufferSubData to [data].
- `int checkFramebufferStatus(int target)`
- `void clear(int mask)`
- `void clearColor(num red, num green, num blue, num alpha)`
- `void clearDepth(num depth)`
- `void clearStencil(int s)`
- `void colorMask(bool red, bool green, bool blue, bool alpha)`
- `Future<dynamic> commit()`
- `void compileShader(Shader shader)`
- `void compressedTexImage2D(int target, int level, int internalformat, int width, int height, int border, TypedData data)`
- `void compressedTexSubImage2D(int target, int level, int xoffset, int yoffset, int width, int height, int format, TypedData data)`
- `void copyTexImage2D(int target, int level, int internalformat, int x, int y, int width, int height, int border)`
- `void copyTexSubImage2D(int target, int level, int xoffset, int yoffset, int x, int y, int width, int height)`
- `Buffer createBuffer()`
- `Framebuffer createFramebuffer()`
- `Program createProgram()`
- `Renderbuffer createRenderbuffer()`
- `Shader createShader(int type)`
- `Texture createTexture()`
- `void cullFace(int mode)`
- `void deleteBuffer(Buffer? buffer)`
- `void deleteFramebuffer(Framebuffer? framebuffer)`
- `void deleteProgram(Program? program)`
- `void deleteRenderbuffer(Renderbuffer? renderbuffer)`
- `void deleteShader(Shader? shader)`
- `void deleteTexture(Texture? texture)`
- `void depthFunc(int func)`
- `void depthMask(bool flag)`
- `void depthRange(num zNear, num zFar)`
- `void detachShader(Program program, Shader shader)`
- `void disable(int cap)`
- `void disableVertexAttribArray(int index)`
- `void drawArrays(int mode, int first, int count)`
- `void drawElements(int mode, int count, int type, int offset)`
- `void enable(int cap)`
- `void enableVertexAttribArray(int index)`
- `void finish()`
- `void flush()`
- `void framebufferRenderbuffer(int target, int attachment, int renderbuffertarget, Renderbuffer? renderbuffer)`
- `void framebufferTexture2D(int target, int attachment, int textarget, Texture? texture, int level)`
- `void frontFace(int mode)`
- `void generateMipmap(int target)`
- `ActiveInfo getActiveAttrib(Program program, int index)`
- `ActiveInfo getActiveUniform(Program program, int index)`
- `List<Shader>? getAttachedShaders(Program program)`
- `int getAttribLocation(Program program, String name)`
- `Object? getBufferParameter(int target, int pname)`
- `Map<dynamic, dynamic>? getContextAttributes()`
- `int getError()`
- `Object? getExtension(String name)`
- `Object? getFramebufferAttachmentParameter(int target, int attachment, int pname)`
- `Object? getParameter(int pname)`
- `String? getProgramInfoLog(Program program)`
- `Object? getProgramParameter(Program program, int pname)`
- `Object? getRenderbufferParameter(int target, int pname)`
- `String? getShaderInfoLog(Shader shader)`
- `Object? getShaderParameter(Shader shader, int pname)`
- `ShaderPrecisionFormat getShaderPrecisionFormat(int shadertype, int precisiontype)`
- `String? getShaderSource(Shader shader)`
- `List<String>? getSupportedExtensions()`
- `Object? getTexParameter(int target, int pname)`
- `Object? getUniform(Program program, UniformLocation location)`
- `UniformLocation getUniformLocation(Program program, String name)`
- `Object? getVertexAttrib(int index, int pname)`
- `int getVertexAttribOffset(int index, int pname)`
- `void hint(int target, int mode)`
- `bool isBuffer(Buffer? buffer)`
- `bool isContextLost()`
- `bool isEnabled(int cap)`
- `bool isFramebuffer(Framebuffer? framebuffer)`
- `bool isProgram(Program? program)`
- `bool isRenderbuffer(Renderbuffer? renderbuffer)`
- `bool isShader(Shader? shader)`
- `bool isTexture(Texture? texture)`
- `void lineWidth(num width)`
- `void linkProgram(Program program)`
- `void pixelStorei(int pname, int param)`
- `void polygonOffset(num factor, num units)`
- `void readPixels(int x, int y, int width, int height, int format, int type, TypedData? pixels)`
- `void renderbufferStorage(int target, int internalformat, int width, int height)`
- `void sampleCoverage(num value, bool invert)`
- `void scissor(int x, int y, int width, int height)`
- `void shaderSource(Shader shader, String string)`
- `void stencilFunc(int func, int ref, int mask)`
- `void stencilFuncSeparate(int face, int func, int ref, int mask)`
- `void stencilMask(int mask)`
- `void stencilMaskSeparate(int face, int mask)`
- `void stencilOp(int fail, int zfail, int zpass)`
- `void stencilOpSeparate(int face, int fail, int zfail, int zpass)`
- `void texImage2D(int target, int level, int internalformat, int format_OR_width, int height_OR_type, dynamic bitmap_OR_border_OR_canvas_OR_image_OR_pixels_OR_video, [int? format, int? type, TypedData? pixels])`
- `void texImage2DTyped(int targetTexture, int levelOfDetail, int internalFormat, int width, int height, int border, int format, int type, TypedData data)`:
  Sets the currently bound texture to [data].
- `void texImage2DUntyped(int targetTexture, int levelOfDetail, int internalFormat, int format, int type, dynamic data)`:
  Sets the currently bound texture to [data].
- `void texParameterf(int target, int pname, num param)`
- `void texParameteri(int target, int pname, int param)`
- `void texSubImage2D(int target, int level, int xoffset, int yoffset, int format_OR_width, int height_OR_type, dynamic bitmap_OR_canvas_OR_format_OR_image_OR_pixels_OR_video, [int? type, TypedData? pixels])`
- `void texSubImage2DTyped(int targetTexture, int levelOfDetail, int xOffset, int yOffset, int width, int height, int border, int format, int type, TypedData data)`:
  Updates a sub-rectangle of the currently bound texture to [data].
- `void texSubImage2DUntyped(int targetTexture, int levelOfDetail, int xOffset, int yOffset, int format, int type, dynamic data)`:
  Updates a sub-rectangle of the currently bound texture to [data].
- `void uniform1f(UniformLocation? location, num x)`
- `void uniform1fv(UniformLocation? location, dynamic v)`
- `void uniform1i(UniformLocation? location, int x)`
- `void uniform1iv(UniformLocation? location, dynamic v)`
- `void uniform2f(UniformLocation? location, num x, num y)`
- `void uniform2fv(UniformLocation? location, dynamic v)`
- `void uniform2i(UniformLocation? location, int x, int y)`
- `void uniform2iv(UniformLocation? location, dynamic v)`
- `void uniform3f(UniformLocation? location, num x, num y, num z)`
- `void uniform3fv(UniformLocation? location, dynamic v)`
- `void uniform3i(UniformLocation? location, int x, int y, int z)`
- `void uniform3iv(UniformLocation? location, dynamic v)`
- `void uniform4f(UniformLocation? location, num x, num y, num z, num w)`
- `void uniform4fv(UniformLocation? location, dynamic v)`
- `void uniform4i(UniformLocation? location, int x, int y, int z, int w)`
- `void uniform4iv(UniformLocation? location, dynamic v)`
- `void uniformMatrix2fv(UniformLocation? location, bool transpose, dynamic array)`
- `void uniformMatrix3fv(UniformLocation? location, bool transpose, dynamic array)`
- `void uniformMatrix4fv(UniformLocation? location, bool transpose, dynamic array)`
- `void useProgram(Program? program)`
- `void validateProgram(Program program)`
- `void vertexAttrib1f(int indx, num x)`
- `void vertexAttrib1fv(int indx, dynamic values)`
- `void vertexAttrib2f(int indx, num x, num y)`
- `void vertexAttrib2fv(int indx, dynamic values)`
- `void vertexAttrib3f(int indx, num x, num y, num z)`
- `void vertexAttrib3fv(int indx, dynamic values)`
- `void vertexAttrib4f(int indx, num x, num y, num z, num w)`
- `void vertexAttrib4fv(int indx, dynamic values)`
- `void vertexAttribPointer(int indx, int size, int type, bool normalized, int stride, int offset)`
- `void viewport(int x, int y, int width, int height)`

## Class: RenderingContext2

```dart
class RenderingContext2
    extends JavaScriptObject
    implements _WebGL2RenderingContextBase, _WebGLRenderingContextBase { … }
```

- `Canvas? get canvas`
- `int? get drawingBufferHeight`
- `int? get drawingBufferWidth`
- `void activeTexture(int texture)`
- `void attachShader(Program program, Shader shader)`
- `void beginQuery(int target, Query query)`
- `void beginTransformFeedback(int primitiveMode)`
- `void bindAttribLocation(Program program, int index, String name)`
- `void bindBuffer(int target, Buffer? buffer)`
- `void bindBufferBase(int target, int index, Buffer? buffer)`
- `void bindBufferRange(int target, int index, Buffer? buffer, int offset, int size)`
- `void bindFramebuffer(int target, Framebuffer? framebuffer)`
- `void bindRenderbuffer(int target, Renderbuffer? renderbuffer)`
- `void bindSampler(int unit, Sampler? sampler)`
- `void bindTexture(int target, Texture? texture)`
- `void bindTransformFeedback(int target, TransformFeedback? feedback)`
- `void bindVertexArray(VertexArrayObject? vertexArray)`
- `void blendColor(num red, num green, num blue, num alpha)`
- `void blendEquation(int mode)`
- `void blendEquationSeparate(int modeRGB, int modeAlpha)`
- `void blendFunc(int sfactor, int dfactor)`
- `void blendFuncSeparate(int srcRGB, int dstRGB, int srcAlpha, int dstAlpha)`
- `void blitFramebuffer(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, int mask, int filter)`
- `void bufferData(int target, dynamic data_OR_size, int usage)`
- `void bufferData2(int target, TypedData srcData, int usage, int srcOffset, [int? length])`
- `void bufferSubData(int target, int offset, dynamic data)`
- `void bufferSubData2(int target, int dstByteOffset, TypedData srcData, int srcOffset, [int? length])`
- `int checkFramebufferStatus(int target)`
- `void clear(int mask)`
- `void clearBufferfi(int buffer, int drawbuffer, num depth, int stencil)`
- `void clearBufferfv(int buffer, int drawbuffer, dynamic value, [int? srcOffset])`
- `void clearBufferiv(int buffer, int drawbuffer, dynamic value, [int? srcOffset])`
- `void clearBufferuiv(int buffer, int drawbuffer, dynamic value, [int? srcOffset])`
- `void clearColor(num red, num green, num blue, num alpha)`
- `void clearDepth(num depth)`
- `void clearStencil(int s)`
- `int clientWaitSync(Sync sync, int flags, int timeout)`
- `void colorMask(bool red, bool green, bool blue, bool alpha)`
- `Future<dynamic> commit()`
- `void compileShader(Shader shader)`
- `void compressedTexImage2D(int target, int level, int internalformat, int width, int height, int border, TypedData data)`
- `void compressedTexImage2D2(int target, int level, int internalformat, int width, int height, int border, TypedData data, int srcOffset, [int? srcLengthOverride])`
- `void compressedTexImage2D3(int target, int level, int internalformat, int width, int height, int border, int imageSize, int offset)`
- `void compressedTexImage3D(int target, int level, int internalformat, int width, int height, int depth, int border, TypedData data, [int? srcOffset, int? srcLengthOverride])`
- `void compressedTexImage3D2(int target, int level, int internalformat, int width, int height, int depth, int border, int imageSize, int offset)`
- `void compressedTexSubImage2D(int target, int level, int xoffset, int yoffset, int width, int height, int format, TypedData data)`
- `void compressedTexSubImage2D2(int target, int level, int xoffset, int yoffset, int width, int height, int format, TypedData data, int srcOffset, [int? srcLengthOverride])`
- `void compressedTexSubImage2D3(int target, int level, int xoffset, int yoffset, int width, int height, int format, int imageSize, int offset)`
- `void compressedTexSubImage3D(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, TypedData data, [int? srcOffset, int? srcLengthOverride])`
- `void compressedTexSubImage3D2(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int imageSize, int offset)`
- `void copyBufferSubData(int readTarget, int writeTarget, int readOffset, int writeOffset, int size)`
- `void copyTexImage2D(int target, int level, int internalformat, int x, int y, int width, int height, int border)`
- `void copyTexSubImage2D(int target, int level, int xoffset, int yoffset, int x, int y, int width, int height)`
- `void copyTexSubImage3D(int target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height)`
- `Buffer createBuffer()`
- `Framebuffer createFramebuffer()`
- `Program createProgram()`
- `Query? createQuery()`
- `Renderbuffer createRenderbuffer()`
- `Sampler? createSampler()`
- `Shader createShader(int type)`
- `Texture createTexture()`
- `TransformFeedback? createTransformFeedback()`
- `VertexArrayObject? createVertexArray()`
- `void cullFace(int mode)`
- `void deleteBuffer(Buffer? buffer)`
- `void deleteFramebuffer(Framebuffer? framebuffer)`
- `void deleteProgram(Program? program)`
- `void deleteQuery(Query? query)`
- `void deleteRenderbuffer(Renderbuffer? renderbuffer)`
- `void deleteSampler(Sampler? sampler)`
- `void deleteShader(Shader? shader)`
- `void deleteSync(Sync? sync)`
- `void deleteTexture(Texture? texture)`
- `void deleteTransformFeedback(TransformFeedback? feedback)`
- `void deleteVertexArray(VertexArrayObject? vertexArray)`
- `void depthFunc(int func)`
- `void depthMask(bool flag)`
- `void depthRange(num zNear, num zFar)`
- `void detachShader(Program program, Shader shader)`
- `void disable(int cap)`
- `void disableVertexAttribArray(int index)`
- `void drawArrays(int mode, int first, int count)`
- `void drawArraysInstanced(int mode, int first, int count, int instanceCount)`
- `void drawBuffers(List<int> buffers)`
- `void drawElements(int mode, int count, int type, int offset)`
- `void drawElementsInstanced(int mode, int count, int type, int offset, int instanceCount)`
- `void drawRangeElements(int mode, int start, int end, int count, int type, int offset)`
- `void enable(int cap)`
- `void enableVertexAttribArray(int index)`
- `void endQuery(int target)`
- `void endTransformFeedback()`
- `Sync? fenceSync(int condition, int flags)`
- `void finish()`
- `void flush()`
- `void framebufferRenderbuffer(int target, int attachment, int renderbuffertarget, Renderbuffer? renderbuffer)`
- `void framebufferTexture2D(int target, int attachment, int textarget, Texture? texture, int level)`
- `void framebufferTextureLayer(int target, int attachment, Texture? texture, int level, int layer)`
- `void frontFace(int mode)`
- `void generateMipmap(int target)`
- `ActiveInfo getActiveAttrib(Program program, int index)`
- `ActiveInfo getActiveUniform(Program program, int index)`
- `String? getActiveUniformBlockName(Program program, int uniformBlockIndex)`
- `Object? getActiveUniformBlockParameter(Program program, int uniformBlockIndex, int pname)`
- `Object? getActiveUniforms(Program program, List<int> uniformIndices, int pname)`
- `List<Shader>? getAttachedShaders(Program program)`
- `int getAttribLocation(Program program, String name)`
- `Object? getBufferParameter(int target, int pname)`
- `void getBufferSubData(int target, int srcByteOffset, TypedData dstData, [int? dstOffset, int? length])`
- `Map<dynamic, dynamic>? getContextAttributes()`
- `int getError()`
- `Object? getExtension(String name)`
- `int getFragDataLocation(Program program, String name)`
- `Object? getFramebufferAttachmentParameter(int target, int attachment, int pname)`
- `Object? getIndexedParameter(int target, int index)`
- `Object? getInternalformatParameter(int target, int internalformat, int pname)`
- `Object? getParameter(int pname)`
- `String? getProgramInfoLog(Program program)`
- `Object? getProgramParameter(Program program, int pname)`
- `Object? getQuery(int target, int pname)`
- `Object? getQueryParameter(Query query, int pname)`
- `Object? getRenderbufferParameter(int target, int pname)`
- `Object? getSamplerParameter(Sampler sampler, int pname)`
- `String? getShaderInfoLog(Shader shader)`
- `Object? getShaderParameter(Shader shader, int pname)`
- `ShaderPrecisionFormat getShaderPrecisionFormat(int shadertype, int precisiontype)`
- `String? getShaderSource(Shader shader)`
- `List<String>? getSupportedExtensions()`
- `Object? getSyncParameter(Sync sync, int pname)`
- `Object? getTexParameter(int target, int pname)`
- `ActiveInfo? getTransformFeedbackVarying(Program program, int index)`
- `Object? getUniform(Program program, UniformLocation location)`
- `int getUniformBlockIndex(Program program, String uniformBlockName)`
- `List<int>? getUniformIndices(Program program, List<String> uniformNames)`
- `UniformLocation getUniformLocation(Program program, String name)`
- `Object? getVertexAttrib(int index, int pname)`
- `int getVertexAttribOffset(int index, int pname)`
- `void hint(int target, int mode)`
- `void invalidateFramebuffer(int target, List<int> attachments)`
- `void invalidateSubFramebuffer(int target, List<int> attachments, int x, int y, int width, int height)`
- `bool isBuffer(Buffer? buffer)`
- `bool isContextLost()`
- `bool isEnabled(int cap)`
- `bool isFramebuffer(Framebuffer? framebuffer)`
- `bool isProgram(Program? program)`
- `bool isQuery(Query? query)`
- `bool isRenderbuffer(Renderbuffer? renderbuffer)`
- `bool isSampler(Sampler? sampler)`
- `bool isShader(Shader? shader)`
- `bool isSync(Sync? sync)`
- `bool isTexture(Texture? texture)`
- `bool isTransformFeedback(TransformFeedback? feedback)`
- `bool isVertexArray(VertexArrayObject? vertexArray)`
- `void lineWidth(num width)`
- `void linkProgram(Program program)`
- `void pauseTransformFeedback()`
- `void pixelStorei(int pname, int param)`
- `void polygonOffset(num factor, num units)`
- `void readBuffer(int mode)`
- `void readPixels(int x, int y, int width, int height, int format, int type, TypedData pixels)`
- `void readPixels2(int x, int y, int width, int height, int format, int type, dynamic dstData_OR_offset, [int? offset])`
- `void renderbufferStorage(int target, int internalformat, int width, int height)`
- `void renderbufferStorageMultisample(int target, int samples, int internalformat, int width, int height)`
- `void resumeTransformFeedback()`
- `void sampleCoverage(num value, bool invert)`
- `void samplerParameterf(Sampler sampler, int pname, num param)`
- `void samplerParameteri(Sampler sampler, int pname, int param)`
- `void scissor(int x, int y, int width, int height)`
- `void shaderSource(Shader shader, String string)`
- `void stencilFunc(int func, int ref, int mask)`
- `void stencilFuncSeparate(int face, int func, int ref, int mask)`
- `void stencilMask(int mask)`
- `void stencilMaskSeparate(int face, int mask)`
- `void stencilOp(int fail, int zfail, int zpass)`
- `void stencilOpSeparate(int face, int fail, int zfail, int zpass)`
- `void texImage2D(int target, int level, int internalformat, int format_OR_width, int height_OR_type, dynamic bitmap_OR_border_OR_canvas_OR_image_OR_pixels_OR_video, [int? format, int? type, TypedData? pixels])`
- `void texImage2D2(int target, int level, int internalformat, int width, int height, int border, int format, int type, dynamic bitmap_OR_canvas_OR_data_OR_image_OR_offset_OR_srcData_OR_video, [int? srcOffset])`
- `void texImage3D(int target, int level, int internalformat, int width, int height, int depth, int border, int format, int type, dynamic bitmap_OR_canvas_OR_data_OR_image_OR_offset_OR_pixels_OR_video, [int? srcOffset])`
- `void texParameterf(int target, int pname, num param)`
- `void texParameteri(int target, int pname, int param)`
- `void texStorage2D(int target, int levels, int internalformat, int width, int height)`
- `void texStorage3D(int target, int levels, int internalformat, int width, int height, int depth)`
- `void texSubImage2D(int target, int level, int xoffset, int yoffset, int format_OR_width, int height_OR_type, dynamic bitmap_OR_canvas_OR_format_OR_image_OR_pixels_OR_video, [int? type, TypedData? pixels])`
- `void texSubImage2D2(int target, int level, int xoffset, int yoffset, int width, int height, int format, int type, dynamic bitmap_OR_canvas_OR_data_OR_image_OR_offset_OR_srcData_OR_video, [int? srcOffset])`
- `void texSubImage3D(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int type, dynamic bitmap_OR_canvas_OR_data_OR_image_OR_offset_OR_pixels_OR_video, [int? srcOffset])`
- `void transformFeedbackVaryings(Program program, List<String> varyings, int bufferMode)`
- `void uniform1f(UniformLocation? location, num x)`
- `void uniform1fv(UniformLocation? location, dynamic v)`
- `void uniform1fv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform1i(UniformLocation? location, int x)`
- `void uniform1iv(UniformLocation? location, dynamic v)`
- `void uniform1iv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform1ui(UniformLocation? location, int v0)`
- `void uniform1uiv(UniformLocation? location, dynamic v, [int? srcOffset, int? srcLength])`
- `void uniform2f(UniformLocation? location, num x, num y)`
- `void uniform2fv(UniformLocation? location, dynamic v)`
- `void uniform2fv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform2i(UniformLocation? location, int x, int y)`
- `void uniform2iv(UniformLocation? location, dynamic v)`
- `void uniform2iv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform2ui(UniformLocation? location, int v0, int v1)`
- `void uniform2uiv(UniformLocation? location, dynamic v, [int? srcOffset, int? srcLength])`
- `void uniform3f(UniformLocation? location, num x, num y, num z)`
- `void uniform3fv(UniformLocation? location, dynamic v)`
- `void uniform3fv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform3i(UniformLocation? location, int x, int y, int z)`
- `void uniform3iv(UniformLocation? location, dynamic v)`
- `void uniform3iv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform3ui(UniformLocation? location, int v0, int v1, int v2)`
- `void uniform3uiv(UniformLocation? location, dynamic v, [int? srcOffset, int? srcLength])`
- `void uniform4f(UniformLocation? location, num x, num y, num z, num w)`
- `void uniform4fv(UniformLocation? location, dynamic v)`
- `void uniform4fv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform4i(UniformLocation? location, int x, int y, int z, int w)`
- `void uniform4iv(UniformLocation? location, dynamic v)`
- `void uniform4iv2(UniformLocation? location, dynamic v, int srcOffset, [int? srcLength])`
- `void uniform4ui(UniformLocation? location, int v0, int v1, int v2, int v3)`
- `void uniform4uiv(UniformLocation? location, dynamic v, [int? srcOffset, int? srcLength])`
- `void uniformBlockBinding(Program program, int uniformBlockIndex, int uniformBlockBinding)`
- `void uniformMatrix2fv(UniformLocation? location, bool transpose, dynamic array)`
- `void uniformMatrix2fv2(UniformLocation? location, bool transpose, dynamic array, int srcOffset, [int? srcLength])`
- `void uniformMatrix2x3fv(UniformLocation? location, bool transpose, dynamic value, [int? srcOffset, int? srcLength])`
- `void uniformMatrix2x4fv(UniformLocation? location, bool transpose, dynamic value, [int? srcOffset, int? srcLength])`
- `void uniformMatrix3fv(UniformLocation? location, bool transpose, dynamic array)`
- `void uniformMatrix3fv2(UniformLocation? location, bool transpose, dynamic array, int srcOffset, [int? srcLength])`
- `void uniformMatrix3x2fv(UniformLocation? location, bool transpose, dynamic value, [int? srcOffset, int? srcLength])`
- `void uniformMatrix3x4fv(UniformLocation? location, bool transpose, dynamic value, [int? srcOffset, int? srcLength])`
- `void uniformMatrix4fv(UniformLocation? location, bool transpose, dynamic array)`
- `void uniformMatrix4fv2(UniformLocation? location, bool transpose, dynamic array, int srcOffset, [int? srcLength])`
- `void uniformMatrix4x2fv(UniformLocation? location, bool transpose, dynamic value, [int? srcOffset, int? srcLength])`
- `void uniformMatrix4x3fv(UniformLocation? location, bool transpose, dynamic value, [int? srcOffset, int? srcLength])`
- `void useProgram(Program? program)`
- `void validateProgram(Program program)`
- `void vertexAttrib1f(int indx, num x)`
- `void vertexAttrib1fv(int indx, dynamic values)`
- `void vertexAttrib2f(int indx, num x, num y)`
- `void vertexAttrib2fv(int indx, dynamic values)`
- `void vertexAttrib3f(int indx, num x, num y, num z)`
- `void vertexAttrib3fv(int indx, dynamic values)`
- `void vertexAttrib4f(int indx, num x, num y, num z, num w)`
- `void vertexAttrib4fv(int indx, dynamic values)`
- `void vertexAttribDivisor(int index, int divisor)`
- `void vertexAttribI4i(int index, int x, int y, int z, int w)`
- `void vertexAttribI4iv(int index, dynamic v)`
- `void vertexAttribI4ui(int index, int x, int y, int z, int w)`
- `void vertexAttribI4uiv(int index, dynamic v)`
- `void vertexAttribIPointer(int index, int size, int type, int stride, int offset)`
- `void vertexAttribPointer(int indx, int size, int type, bool normalized, int stride, int offset)`
- `void viewport(int x, int y, int width, int height)`
- `void waitSync(Sync sync, int flags, int timeout)`

## Class: Sampler

```dart
class Sampler extends JavaScriptObject { … }
```

## Class: Shader

```dart
class Shader extends JavaScriptObject { … }
```

## Class: ShaderPrecisionFormat

```dart
class ShaderPrecisionFormat extends JavaScriptObject { … }
```

- `int get precision`
- `int get rangeMax`
- `int get rangeMin`

## Class: Sync

```dart
class Sync extends JavaScriptObject { … }
```

## Class: Texture

```dart
class Texture extends JavaScriptObject { … }
```

- `bool? get lastUploadedVideoFrameWasSkipped`
- `int? get lastUploadedVideoHeight`
- `num? get lastUploadedVideoTimestamp`
- `int? get lastUploadedVideoWidth`

## Class: TimerQueryExt

```dart
class TimerQueryExt extends JavaScriptObject { … }
```

## Class: TransformFeedback

```dart
class TransformFeedback extends JavaScriptObject { … }
```

## Class: UniformLocation

```dart
class UniformLocation extends JavaScriptObject { … }
```

## Class: VertexArrayObject

```dart
class VertexArrayObject extends JavaScriptObject { … }
```

## Class: VertexArrayObjectOes

```dart
class VertexArrayObjectOes extends JavaScriptObject { … }
```

## Class: WebGL

Amalgamation of the WebGL constants from the IDL interfaces in
WebGLRenderingContextBase, WebGL2RenderingContextBase, & WebGLDrawBuffers.
Because the RenderingContextBase interfaces are hidden they would be
replicated in more than one class (e.g., RenderingContext and
RenderingContext2) to prevent that duplication these 600+ constants are
defined in one abstract class (WebGL).

```dart
abstract class WebGL { … }
```

- static `int ACTIVE_ATTRIBUTES`
- static `int ACTIVE_TEXTURE`
- static `int ACTIVE_UNIFORMS`
- static `int ACTIVE_UNIFORM_BLOCKS`
- static `int ALIASED_LINE_WIDTH_RANGE`
- static `int ALIASED_POINT_SIZE_RANGE`
- static `int ALPHA`
- static `int ALPHA_BITS`
- static `int ALREADY_SIGNALED`
- static `int ALWAYS`
- static `int ANY_SAMPLES_PASSED`
- static `int ANY_SAMPLES_PASSED_CONSERVATIVE`
- static `int ARRAY_BUFFER`
- static `int ARRAY_BUFFER_BINDING`
- static `int ATTACHED_SHADERS`
- static `int BACK`
- static `int BLEND`
- static `int BLEND_COLOR`
- static `int BLEND_DST_ALPHA`
- static `int BLEND_DST_RGB`
- static `int BLEND_EQUATION`
- static `int BLEND_EQUATION_ALPHA`
- static `int BLEND_EQUATION_RGB`
- static `int BLEND_SRC_ALPHA`
- static `int BLEND_SRC_RGB`
- static `int BLUE_BITS`
- static `int BOOL`
- static `int BOOL_VEC2`
- static `int BOOL_VEC3`
- static `int BOOL_VEC4`
- static `int BROWSER_DEFAULT_WEBGL`
- static `int BUFFER_SIZE`
- static `int BUFFER_USAGE`
- static `int BYTE`
- static `int CCW`
- static `int CLAMP_TO_EDGE`
- static `int COLOR`
- static `int COLOR_ATTACHMENT0`
- static `int COLOR_ATTACHMENT0_WEBGL`
- static `int COLOR_ATTACHMENT1`
- static `int COLOR_ATTACHMENT10`
- static `int COLOR_ATTACHMENT10_WEBGL`
- static `int COLOR_ATTACHMENT11`
- static `int COLOR_ATTACHMENT11_WEBGL`
- static `int COLOR_ATTACHMENT12`
- static `int COLOR_ATTACHMENT12_WEBGL`
- static `int COLOR_ATTACHMENT13`
- static `int COLOR_ATTACHMENT13_WEBGL`
- static `int COLOR_ATTACHMENT14`
- static `int COLOR_ATTACHMENT14_WEBGL`
- static `int COLOR_ATTACHMENT15`
- static `int COLOR_ATTACHMENT15_WEBGL`
- static `int COLOR_ATTACHMENT1_WEBGL`
- static `int COLOR_ATTACHMENT2`
- static `int COLOR_ATTACHMENT2_WEBGL`
- static `int COLOR_ATTACHMENT3`
- static `int COLOR_ATTACHMENT3_WEBGL`
- static `int COLOR_ATTACHMENT4`
- static `int COLOR_ATTACHMENT4_WEBGL`
- static `int COLOR_ATTACHMENT5`
- static `int COLOR_ATTACHMENT5_WEBGL`
- static `int COLOR_ATTACHMENT6`
- static `int COLOR_ATTACHMENT6_WEBGL`
- static `int COLOR_ATTACHMENT7`
- static `int COLOR_ATTACHMENT7_WEBGL`
- static `int COLOR_ATTACHMENT8`
- static `int COLOR_ATTACHMENT8_WEBGL`
- static `int COLOR_ATTACHMENT9`
- static `int COLOR_ATTACHMENT9_WEBGL`
- static `int COLOR_BUFFER_BIT`
- static `int COLOR_CLEAR_VALUE`
- static `int COLOR_WRITEMASK`
- static `int COMPARE_REF_TO_TEXTURE`
- static `int COMPILE_STATUS`
- static `int COMPRESSED_TEXTURE_FORMATS`
- static `int CONDITION_SATISFIED`
- static `int CONSTANT_ALPHA`
- static `int CONSTANT_COLOR`
- static `int CONTEXT_LOST_WEBGL`
- static `int COPY_READ_BUFFER`
- static `int COPY_READ_BUFFER_BINDING`
- static `int COPY_WRITE_BUFFER`
- static `int COPY_WRITE_BUFFER_BINDING`
- static `int CULL_FACE`
- static `int CULL_FACE_MODE`
- static `int CURRENT_PROGRAM`
- static `int CURRENT_QUERY`
- static `int CURRENT_VERTEX_ATTRIB`
- static `int CW`
- static `int DECR`
- static `int DECR_WRAP`
- static `int DELETE_STATUS`
- static `int DEPTH`
- static `int DEPTH24_STENCIL8`
- static `int DEPTH32F_STENCIL8`
- static `int DEPTH_ATTACHMENT`
- static `int DEPTH_BITS`
- static `int DEPTH_BUFFER_BIT`
- static `int DEPTH_CLEAR_VALUE`
- static `int DEPTH_COMPONENT`
- static `int DEPTH_COMPONENT16`
- static `int DEPTH_COMPONENT24`
- static `int DEPTH_COMPONENT32F`
- static `int DEPTH_FUNC`
- static `int DEPTH_RANGE`
- static `int DEPTH_STENCIL`
- static `int DEPTH_STENCIL_ATTACHMENT`
- static `int DEPTH_TEST`
- static `int DEPTH_WRITEMASK`
- static `int DITHER`
- static `int DONT_CARE`
- static `int DRAW_BUFFER0`
- static `int DRAW_BUFFER0_WEBGL`
- static `int DRAW_BUFFER1`
- static `int DRAW_BUFFER10`
- static `int DRAW_BUFFER10_WEBGL`
- static `int DRAW_BUFFER11`
- static `int DRAW_BUFFER11_WEBGL`
- static `int DRAW_BUFFER12`
- static `int DRAW_BUFFER12_WEBGL`
- static `int DRAW_BUFFER13`
- static `int DRAW_BUFFER13_WEBGL`
- static `int DRAW_BUFFER14`
- static `int DRAW_BUFFER14_WEBGL`
- static `int DRAW_BUFFER15`
- static `int DRAW_BUFFER15_WEBGL`
- static `int DRAW_BUFFER1_WEBGL`
- static `int DRAW_BUFFER2`
- static `int DRAW_BUFFER2_WEBGL`
- static `int DRAW_BUFFER3`
- static `int DRAW_BUFFER3_WEBGL`
- static `int DRAW_BUFFER4`
- static `int DRAW_BUFFER4_WEBGL`
- static `int DRAW_BUFFER5`
- static `int DRAW_BUFFER5_WEBGL`
- static `int DRAW_BUFFER6`
- static `int DRAW_BUFFER6_WEBGL`
- static `int DRAW_BUFFER7`
- static `int DRAW_BUFFER7_WEBGL`
- static `int DRAW_BUFFER8`
- static `int DRAW_BUFFER8_WEBGL`
- static `int DRAW_BUFFER9`
- static `int DRAW_BUFFER9_WEBGL`
- static `int DRAW_FRAMEBUFFER`
- static `int DRAW_FRAMEBUFFER_BINDING`
- static `int DST_ALPHA`
- static `int DST_COLOR`
- static `int DYNAMIC_COPY`
- static `int DYNAMIC_DRAW`
- static `int DYNAMIC_READ`
- static `int ELEMENT_ARRAY_BUFFER`
- static `int ELEMENT_ARRAY_BUFFER_BINDING`
- static `int EQUAL`
- static `int FASTEST`
- static `int FLOAT`
- static `int FLOAT_32_UNSIGNED_INT_24_8_REV`
- static `int FLOAT_MAT2`
- static `int FLOAT_MAT2x3`
- static `int FLOAT_MAT2x4`
- static `int FLOAT_MAT3`
- static `int FLOAT_MAT3x2`
- static `int FLOAT_MAT3x4`
- static `int FLOAT_MAT4`
- static `int FLOAT_MAT4x2`
- static `int FLOAT_MAT4x3`
- static `int FLOAT_VEC2`
- static `int FLOAT_VEC3`
- static `int FLOAT_VEC4`
- static `int FRAGMENT_SHADER`
- static `int FRAGMENT_SHADER_DERIVATIVE_HINT`
- static `int FRAMEBUFFER`
- static `int FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE`
- static `int FRAMEBUFFER_ATTACHMENT_BLUE_SIZE`
- static `int FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING`
- static `int FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE`
- static `int FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE`
- static `int FRAMEBUFFER_ATTACHMENT_GREEN_SIZE`
- static `int FRAMEBUFFER_ATTACHMENT_OBJECT_NAME`
- static `int FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE`
- static `int FRAMEBUFFER_ATTACHMENT_RED_SIZE`
- static `int FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE`
- static `int FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE`
- static `int FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER`
- static `int FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL`
- static `int FRAMEBUFFER_BINDING`
- static `int FRAMEBUFFER_COMPLETE`
- static `int FRAMEBUFFER_DEFAULT`
- static `int FRAMEBUFFER_INCOMPLETE_ATTACHMENT`
- static `int FRAMEBUFFER_INCOMPLETE_DIMENSIONS`
- static `int FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT`
- static `int FRAMEBUFFER_INCOMPLETE_MULTISAMPLE`
- static `int FRAMEBUFFER_UNSUPPORTED`
- static `int FRONT`
- static `int FRONT_AND_BACK`
- static `int FRONT_FACE`
- static `int FUNC_ADD`
- static `int FUNC_REVERSE_SUBTRACT`
- static `int FUNC_SUBTRACT`
- static `int GENERATE_MIPMAP_HINT`
- static `int GEQUAL`
- static `int GREATER`
- static `int GREEN_BITS`
- static `int HALF_FLOAT`
- static `int HIGH_FLOAT`
- static `int HIGH_INT`
- static `int IMPLEMENTATION_COLOR_READ_FORMAT`
- static `int IMPLEMENTATION_COLOR_READ_TYPE`
- static `int INCR`
- static `int INCR_WRAP`
- static `int INT`
- static `int INTERLEAVED_ATTRIBS`
- static `int INT_2_10_10_10_REV`
- static `int INT_SAMPLER_2D`
- static `int INT_SAMPLER_2D_ARRAY`
- static `int INT_SAMPLER_3D`
- static `int INT_SAMPLER_CUBE`
- static `int INT_VEC2`
- static `int INT_VEC3`
- static `int INT_VEC4`
- static `int INVALID_ENUM`
- static `int INVALID_FRAMEBUFFER_OPERATION`
- static `int INVALID_INDEX`
- static `int INVALID_OPERATION`
- static `int INVALID_VALUE`
- static `int INVERT`
- static `int KEEP`
- static `int LEQUAL`
- static `int LESS`
- static `int LINEAR`
- static `int LINEAR_MIPMAP_LINEAR`
- static `int LINEAR_MIPMAP_NEAREST`
- static `int LINES`
- static `int LINE_LOOP`
- static `int LINE_STRIP`
- static `int LINE_WIDTH`
- static `int LINK_STATUS`
- static `int LOW_FLOAT`
- static `int LOW_INT`
- static `int LUMINANCE`
- static `int LUMINANCE_ALPHA`
- static `int MAX`
- static `int MAX_3D_TEXTURE_SIZE`
- static `int MAX_ARRAY_TEXTURE_LAYERS`
- static `int MAX_CLIENT_WAIT_TIMEOUT_WEBGL`
- static `int MAX_COLOR_ATTACHMENTS`
- static `int MAX_COLOR_ATTACHMENTS_WEBGL`
- static `int MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS`
- static `int MAX_COMBINED_TEXTURE_IMAGE_UNITS`
- static `int MAX_COMBINED_UNIFORM_BLOCKS`
- static `int MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS`
- static `int MAX_CUBE_MAP_TEXTURE_SIZE`
- static `int MAX_DRAW_BUFFERS`
- static `int MAX_DRAW_BUFFERS_WEBGL`
- static `int MAX_ELEMENTS_INDICES`
- static `int MAX_ELEMENTS_VERTICES`
- static `int MAX_ELEMENT_INDEX`
- static `int MAX_FRAGMENT_INPUT_COMPONENTS`
- static `int MAX_FRAGMENT_UNIFORM_BLOCKS`
- static `int MAX_FRAGMENT_UNIFORM_COMPONENTS`
- static `int MAX_FRAGMENT_UNIFORM_VECTORS`
- static `int MAX_PROGRAM_TEXEL_OFFSET`
- static `int MAX_RENDERBUFFER_SIZE`
- static `int MAX_SAMPLES`
- static `int MAX_SERVER_WAIT_TIMEOUT`
- static `int MAX_TEXTURE_IMAGE_UNITS`
- static `int MAX_TEXTURE_LOD_BIAS`
- static `int MAX_TEXTURE_SIZE`
- static `int MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS`
- static `int MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS`
- static `int MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS`
- static `int MAX_UNIFORM_BLOCK_SIZE`
- static `int MAX_UNIFORM_BUFFER_BINDINGS`
- static `int MAX_VARYING_COMPONENTS`
- static `int MAX_VARYING_VECTORS`
- static `int MAX_VERTEX_ATTRIBS`
- static `int MAX_VERTEX_OUTPUT_COMPONENTS`
- static `int MAX_VERTEX_TEXTURE_IMAGE_UNITS`
- static `int MAX_VERTEX_UNIFORM_BLOCKS`
- static `int MAX_VERTEX_UNIFORM_COMPONENTS`
- static `int MAX_VERTEX_UNIFORM_VECTORS`
- static `int MAX_VIEWPORT_DIMS`
- static `int MEDIUM_FLOAT`
- static `int MEDIUM_INT`
- static `int MIN`
- static `int MIN_PROGRAM_TEXEL_OFFSET`
- static `int MIRRORED_REPEAT`
- static `int NEAREST`
- static `int NEAREST_MIPMAP_LINEAR`
- static `int NEAREST_MIPMAP_NEAREST`
- static `int NEVER`
- static `int NICEST`
- static `int NONE`
- static `int NOTEQUAL`
- static `int NO_ERROR`
- static `int OBJECT_TYPE`
- static `int ONE`
- static `int ONE_MINUS_CONSTANT_ALPHA`
- static `int ONE_MINUS_CONSTANT_COLOR`
- static `int ONE_MINUS_DST_ALPHA`
- static `int ONE_MINUS_DST_COLOR`
- static `int ONE_MINUS_SRC_ALPHA`
- static `int ONE_MINUS_SRC_COLOR`
- static `int OUT_OF_MEMORY`
- static `int PACK_ALIGNMENT`
- static `int PACK_ROW_LENGTH`
- static `int PACK_SKIP_PIXELS`
- static `int PACK_SKIP_ROWS`
- static `int PIXEL_PACK_BUFFER`
- static `int PIXEL_PACK_BUFFER_BINDING`
- static `int PIXEL_UNPACK_BUFFER`
- static `int PIXEL_UNPACK_BUFFER_BINDING`
- static `int POINTS`
- static `int POLYGON_OFFSET_FACTOR`
- static `int POLYGON_OFFSET_FILL`
- static `int POLYGON_OFFSET_UNITS`
- static `int QUERY_RESULT`
- static `int QUERY_RESULT_AVAILABLE`
- static `int R11F_G11F_B10F`
- static `int R16F`
- static `int R16I`
- static `int R16UI`
- static `int R32F`
- static `int R32I`
- static `int R32UI`
- static `int R8`
- static `int R8I`
- static `int R8UI`
- static `int R8_SNORM`
- static `int RASTERIZER_DISCARD`
- static `int READ_BUFFER`
- static `int READ_FRAMEBUFFER`
- static `int READ_FRAMEBUFFER_BINDING`
- static `int RED`
- static `int RED_BITS`
- static `int RED_INTEGER`
- static `int RENDERBUFFER`
- static `int RENDERBUFFER_ALPHA_SIZE`
- static `int RENDERBUFFER_BINDING`
- static `int RENDERBUFFER_BLUE_SIZE`
- static `int RENDERBUFFER_DEPTH_SIZE`
- static `int RENDERBUFFER_GREEN_SIZE`
- static `int RENDERBUFFER_HEIGHT`
- static `int RENDERBUFFER_INTERNAL_FORMAT`
- static `int RENDERBUFFER_RED_SIZE`
- static `int RENDERBUFFER_SAMPLES`
- static `int RENDERBUFFER_STENCIL_SIZE`
- static `int RENDERBUFFER_WIDTH`
- static `int RENDERER`
- static `int REPEAT`
- static `int REPLACE`
- static `int RG`
- static `int RG16F`
- static `int RG16I`
- static `int RG16UI`
- static `int RG32F`
- static `int RG32I`
- static `int RG32UI`
- static `int RG8`
- static `int RG8I`
- static `int RG8UI`
- static `int RG8_SNORM`
- static `int RGB`
- static `int RGB10_A2`
- static `int RGB10_A2UI`
- static `int RGB16F`
- static `int RGB16I`
- static `int RGB16UI`
- static `int RGB32F`
- static `int RGB32I`
- static `int RGB32UI`
- static `int RGB565`
- static `int RGB5_A1`
- static `int RGB8`
- static `int RGB8I`
- static `int RGB8UI`
- static `int RGB8_SNORM`
- static `int RGB9_E5`
- static `int RGBA`
- static `int RGBA16F`
- static `int RGBA16I`
- static `int RGBA16UI`
- static `int RGBA32F`
- static `int RGBA32I`
- static `int RGBA32UI`
- static `int RGBA4`
- static `int RGBA8`
- static `int RGBA8I`
- static `int RGBA8UI`
- static `int RGBA8_SNORM`
- static `int RGBA_INTEGER`
- static `int RGB_INTEGER`
- static `int RG_INTEGER`
- static `int SAMPLER_2D`
- static `int SAMPLER_2D_ARRAY`
- static `int SAMPLER_2D_ARRAY_SHADOW`
- static `int SAMPLER_2D_SHADOW`
- static `int SAMPLER_3D`
- static `int SAMPLER_BINDING`
- static `int SAMPLER_CUBE`
- static `int SAMPLER_CUBE_SHADOW`
- static `int SAMPLES`
- static `int SAMPLE_ALPHA_TO_COVERAGE`
- static `int SAMPLE_BUFFERS`
- static `int SAMPLE_COVERAGE`
- static `int SAMPLE_COVERAGE_INVERT`
- static `int SAMPLE_COVERAGE_VALUE`
- static `int SCISSOR_BOX`
- static `int SCISSOR_TEST`
- static `int SEPARATE_ATTRIBS`
- static `int SHADER_TYPE`
- static `int SHADING_LANGUAGE_VERSION`
- static `int SHORT`
- static `int SIGNALED`
- static `int SIGNED_NORMALIZED`
- static `int SRC_ALPHA`
- static `int SRC_ALPHA_SATURATE`
- static `int SRC_COLOR`
- static `int SRGB`
- static `int SRGB8`
- static `int SRGB8_ALPHA8`
- static `int STATIC_COPY`
- static `int STATIC_DRAW`
- static `int STATIC_READ`
- static `int STENCIL`
- static `int STENCIL_ATTACHMENT`
- static `int STENCIL_BACK_FAIL`
- static `int STENCIL_BACK_FUNC`
- static `int STENCIL_BACK_PASS_DEPTH_FAIL`
- static `int STENCIL_BACK_PASS_DEPTH_PASS`
- static `int STENCIL_BACK_REF`
- static `int STENCIL_BACK_VALUE_MASK`
- static `int STENCIL_BACK_WRITEMASK`
- static `int STENCIL_BITS`
- static `int STENCIL_BUFFER_BIT`
- static `int STENCIL_CLEAR_VALUE`
- static `int STENCIL_FAIL`
- static `int STENCIL_FUNC`
- static `int STENCIL_INDEX8`
- static `int STENCIL_PASS_DEPTH_FAIL`
- static `int STENCIL_PASS_DEPTH_PASS`
- static `int STENCIL_REF`
- static `int STENCIL_TEST`
- static `int STENCIL_VALUE_MASK`
- static `int STENCIL_WRITEMASK`
- static `int STREAM_COPY`
- static `int STREAM_DRAW`
- static `int STREAM_READ`
- static `int SUBPIXEL_BITS`
- static `int SYNC_CONDITION`
- static `int SYNC_FENCE`
- static `int SYNC_FLAGS`
- static `int SYNC_FLUSH_COMMANDS_BIT`
- static `int SYNC_GPU_COMMANDS_COMPLETE`
- static `int SYNC_STATUS`
- static `int TEXTURE`
- static `int TEXTURE0`
- static `int TEXTURE1`
- static `int TEXTURE10`
- static `int TEXTURE11`
- static `int TEXTURE12`
- static `int TEXTURE13`
- static `int TEXTURE14`
- static `int TEXTURE15`
- static `int TEXTURE16`
- static `int TEXTURE17`
- static `int TEXTURE18`
- static `int TEXTURE19`
- static `int TEXTURE2`
- static `int TEXTURE20`
- static `int TEXTURE21`
- static `int TEXTURE22`
- static `int TEXTURE23`
- static `int TEXTURE24`
- static `int TEXTURE25`
- static `int TEXTURE26`
- static `int TEXTURE27`
- static `int TEXTURE28`
- static `int TEXTURE29`
- static `int TEXTURE3`
- static `int TEXTURE30`
- static `int TEXTURE31`
- static `int TEXTURE4`
- static `int TEXTURE5`
- static `int TEXTURE6`
- static `int TEXTURE7`
- static `int TEXTURE8`
- static `int TEXTURE9`
- static `int TEXTURE_2D`
- static `int TEXTURE_2D_ARRAY`
- static `int TEXTURE_3D`
- static `int TEXTURE_BASE_LEVEL`
- static `int TEXTURE_BINDING_2D`
- static `int TEXTURE_BINDING_2D_ARRAY`
- static `int TEXTURE_BINDING_3D`
- static `int TEXTURE_BINDING_CUBE_MAP`
- static `int TEXTURE_COMPARE_FUNC`
- static `int TEXTURE_COMPARE_MODE`
- static `int TEXTURE_CUBE_MAP`
- static `int TEXTURE_CUBE_MAP_NEGATIVE_X`
- static `int TEXTURE_CUBE_MAP_NEGATIVE_Y`
- static `int TEXTURE_CUBE_MAP_NEGATIVE_Z`
- static `int TEXTURE_CUBE_MAP_POSITIVE_X`
- static `int TEXTURE_CUBE_MAP_POSITIVE_Y`
- static `int TEXTURE_CUBE_MAP_POSITIVE_Z`
- static `int TEXTURE_IMMUTABLE_FORMAT`
- static `int TEXTURE_IMMUTABLE_LEVELS`
- static `int TEXTURE_MAG_FILTER`
- static `int TEXTURE_MAX_LEVEL`
- static `int TEXTURE_MAX_LOD`
- static `int TEXTURE_MIN_FILTER`
- static `int TEXTURE_MIN_LOD`
- static `int TEXTURE_WRAP_R`
- static `int TEXTURE_WRAP_S`
- static `int TEXTURE_WRAP_T`
- static `int TIMEOUT_EXPIRED`
- static `int TIMEOUT_IGNORED`
- static `int TRANSFORM_FEEDBACK`
- static `int TRANSFORM_FEEDBACK_ACTIVE`
- static `int TRANSFORM_FEEDBACK_BINDING`
- static `int TRANSFORM_FEEDBACK_BUFFER`
- static `int TRANSFORM_FEEDBACK_BUFFER_BINDING`
- static `int TRANSFORM_FEEDBACK_BUFFER_MODE`
- static `int TRANSFORM_FEEDBACK_BUFFER_SIZE`
- static `int TRANSFORM_FEEDBACK_BUFFER_START`
- static `int TRANSFORM_FEEDBACK_PAUSED`
- static `int TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN`
- static `int TRANSFORM_FEEDBACK_VARYINGS`
- static `int TRIANGLES`
- static `int TRIANGLE_FAN`
- static `int TRIANGLE_STRIP`
- static `int UNIFORM_ARRAY_STRIDE`
- static `int UNIFORM_BLOCK_ACTIVE_UNIFORMS`
- static `int UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES`
- static `int UNIFORM_BLOCK_BINDING`
- static `int UNIFORM_BLOCK_DATA_SIZE`
- static `int UNIFORM_BLOCK_INDEX`
- static `int UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER`
- static `int UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER`
- static `int UNIFORM_BUFFER`
- static `int UNIFORM_BUFFER_BINDING`
- static `int UNIFORM_BUFFER_OFFSET_ALIGNMENT`
- static `int UNIFORM_BUFFER_SIZE`
- static `int UNIFORM_BUFFER_START`
- static `int UNIFORM_IS_ROW_MAJOR`
- static `int UNIFORM_MATRIX_STRIDE`
- static `int UNIFORM_OFFSET`
- static `int UNIFORM_SIZE`
- static `int UNIFORM_TYPE`
- static `int UNPACK_ALIGNMENT`
- static `int UNPACK_COLORSPACE_CONVERSION_WEBGL`
- static `int UNPACK_FLIP_Y_WEBGL`
- static `int UNPACK_IMAGE_HEIGHT`
- static `int UNPACK_PREMULTIPLY_ALPHA_WEBGL`
- static `int UNPACK_ROW_LENGTH`
- static `int UNPACK_SKIP_IMAGES`
- static `int UNPACK_SKIP_PIXELS`
- static `int UNPACK_SKIP_ROWS`
- static `int UNSIGNALED`
- static `int UNSIGNED_BYTE`
- static `int UNSIGNED_INT`
- static `int UNSIGNED_INT_10F_11F_11F_REV`
- static `int UNSIGNED_INT_24_8`
- static `int UNSIGNED_INT_2_10_10_10_REV`
- static `int UNSIGNED_INT_5_9_9_9_REV`
- static `int UNSIGNED_INT_SAMPLER_2D`
- static `int UNSIGNED_INT_SAMPLER_2D_ARRAY`
- static `int UNSIGNED_INT_SAMPLER_3D`
- static `int UNSIGNED_INT_SAMPLER_CUBE`
- static `int UNSIGNED_INT_VEC2`
- static `int UNSIGNED_INT_VEC3`
- static `int UNSIGNED_INT_VEC4`
- static `int UNSIGNED_NORMALIZED`
- static `int UNSIGNED_SHORT`
- static `int UNSIGNED_SHORT_4_4_4_4`
- static `int UNSIGNED_SHORT_5_5_5_1`
- static `int UNSIGNED_SHORT_5_6_5`
- static `int VALIDATE_STATUS`
- static `int VENDOR`
- static `int VERSION`
- static `int VERTEX_ARRAY_BINDING`
- static `int VERTEX_ATTRIB_ARRAY_BUFFER_BINDING`
- static `int VERTEX_ATTRIB_ARRAY_DIVISOR`
- static `int VERTEX_ATTRIB_ARRAY_ENABLED`
- static `int VERTEX_ATTRIB_ARRAY_INTEGER`
- static `int VERTEX_ATTRIB_ARRAY_NORMALIZED`
- static `int VERTEX_ATTRIB_ARRAY_POINTER`
- static `int VERTEX_ATTRIB_ARRAY_SIZE`
- static `int VERTEX_ATTRIB_ARRAY_STRIDE`
- static `int VERTEX_ATTRIB_ARRAY_TYPE`
- static `int VERTEX_SHADER`
- static `int VIEWPORT`
- static `int WAIT_FAILED`
- static `int ZERO`
