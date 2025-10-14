# Library: dart:html

HTML elements and other resources for web-based applications that need to
interact with the browser and the DOM (Document Object Model).

> [!Note]
> This core library is deprecated, and scheduled for removal in late 2025.
> It has been replaced by [package:web](https://pub.dev/packages/web).
> The [migration guide](https://dart.dev/go/package-web) has more details.

This library includes DOM element types, CSS styling, local storage,
media, speech, events, and more.
To get started,
check out the [Element] class, the base class for many of the HTML
DOM types.

For information on writing web apps with Dart, see https://dart.dev/web.

{@category Web (Legacy)}
{@canonicalFor dart:_internal.HttpStatus}

## Members

- accessor `HtmlDocument get document`: Root node for all content in a web page.
- accessor `Window get window`:
  Top-level container for a web page, which is usually a browser tab or window.
- function `Future<Map<String, dynamic>?> promiseToFutureAsMap(dynamic jsPromise)`:
  Convert a JS Promise to a Future<Map<String, dynamic>>.
- function `Element? querySelector(String selectors)`:
  Finds the first descendant element of this document that matches the
  specified group of selectors.
- function `ElementList<T> querySelectorAll<T extends Element>(String selectors)`:
  Finds all descendant elements of this document that match the specified
  group of selectors.
- type alias `typedef BlobCallback = void Function(Blob?)`
- type alias `typedef CustomElementConstructor = void Function()`
- type alias `typedef DecodeErrorCallback = void Function(DomException)`
- type alias `typedef DecodeSuccessCallback = void Function(AudioBuffer)`
- type alias `typedef EventListener = dynamic Function(Event)`
- type alias `typedef FontFaceSetForEachCallback = void Function(FontFace, FontFace, FontFaceSet)`:
  Emitted for any setlike IDL entry needs a callback signature.
  Today there is only one.
- type alias `typedef FrameRequestCallback = void Function(num)`
- type alias `typedef FunctionStringCallback = void Function(String)`
- type alias `typedef IdleRequestCallback = void Function(IdleDeadline)`
- type alias `typedef IntersectionObserverCallback = void Function(List<dynamic>, IntersectionObserver)`
- type alias `typedef MediaSessionActionHandler = void Function()`
- type alias `typedef MessageCallback = void Function(Map<dynamic, dynamic>)`
- type alias `typedef MetadataCallback = void Function(Metadata)`
- type alias `typedef MojoWatchCallback = void Function(int)`
- type alias `typedef MutationCallback = void Function(List<dynamic>, MutationObserver)`
- type alias `typedef PerformanceObserverCallback = void Function(PerformanceObserverEntryList, PerformanceObserver)`
- type alias `typedef RemotePlaybackAvailabilityCallback = void Function(bool)`
- type alias `typedef ReportingObserverCallback = void Function(List<dynamic>, ReportingObserver)`
- type alias `typedef RequestAnimationFrameCallback = void Function(num)`
- type alias `typedef ResizeObserverCallback = void Function(List<dynamic>, ResizeObserver)`
- type alias `typedef RtcPeerConnectionErrorCallback = void Function(DomException)`
- type alias `typedef RtcStatsCallback = void Function(RtcStatsResponse)`
- type alias `typedef ScrollStateCallback = void Function(ScrollState)`
- type alias `typedef StorageErrorCallback = void Function(DomError)`
- type alias `typedef StorageQuotaCallback = void Function(int)`
- type alias `typedef StorageUsageCallback = void Function(int, int)`
- type alias `typedef TimeoutHandler = void Function()`
- type alias `typedef VoidCallback = void Function()`

## Class: AbortPaymentEvent

```dart
class AbortPaymentEvent extends ExtendableEvent { … }
```

- `AbortPaymentEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `void respondWith(Future<dynamic> paymentAbortedResponse)`

## Class: AbsoluteOrientationSensor

```dart
class AbsoluteOrientationSensor extends OrientationSensor { … }
```

- `AbsoluteOrientationSensor([Map<dynamic, dynamic>? sensorOptions])`

## Class: AbstractWorker

```dart
abstract class AbstractWorker
    extends JavaScriptObject
    implements EventTarget { … }
```

- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [AbstractWorker].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [AbstractWorker].

## Class: Accelerometer

```dart
class Accelerometer extends Sensor { … }
```

- `Accelerometer([Map<dynamic, dynamic>? sensorOptions])`
- `num? get x`
- `num? get y`
- `num? get z`

## Class: AccessibleNode

```dart
class AccessibleNode extends EventTarget { … }
```

- `AccessibleNode()`
- static `EventStreamProvider<Event> accessibleClickEvent`
- static `EventStreamProvider<Event> accessibleContextMenuEvent`
- static `EventStreamProvider<Event> accessibleDecrementEvent`
- static `EventStreamProvider<Event> accessibleFocusEvent`
- static `EventStreamProvider<Event> accessibleIncrementEvent`
- static `EventStreamProvider<Event> accessibleScrollIntoViewEvent`
- `AccessibleNode? get activeDescendant`
- `set activeDescendant=(AccessibleNode? value)`
- `bool? get atomic`
- `set atomic=(bool? value)`
- `set autocomplete=(String? value)`
- `String? get autocomplete`
- `bool? get busy`
- `set busy=(bool? value)`
- `String? get checked`
- `set checked=(String? value)`
- `int? get colCount`
- `set colCount=(int? value)`
- `int? get colIndex`
- `set colIndex=(int? value)`
- `int? get colSpan`
- `set colSpan=(int? value)`
- `AccessibleNodeList? get controls`
- `set controls=(AccessibleNodeList? value)`
- `String? get current`
- `set current=(String? value)`
- `AccessibleNodeList? get describedBy`
- `set describedBy=(AccessibleNodeList? value)`
- `AccessibleNode? get details`
- `set details=(AccessibleNode? value)`
- `bool? get disabled`
- `set disabled=(bool? value)`
- `AccessibleNode? get errorMessage`
- `set errorMessage=(AccessibleNode? value)`
- `bool? get expanded`
- `set expanded=(bool? value)`
- `AccessibleNodeList? get flowTo`
- `set flowTo=(AccessibleNodeList? value)`
- `set hasPopUp=(String? value)`
- `String? get hasPopUp`
- `bool? get hidden`
- `set hidden=(bool? value)`
- `String? get invalid`
- `set invalid=(String? value)`
- `String? get keyShortcuts`
- `set keyShortcuts=(String? value)`
- `String? get label`
- `set label=(String? value)`
- `AccessibleNodeList? get labeledBy`
- `set labeledBy=(AccessibleNodeList? value)`
- `set level=(int? value)`
- `int? get level`
- `String? get live`
- `set live=(String? value)`
- `bool? get modal`
- `set modal=(bool? value)`
- `bool? get multiline`
- `set multiline=(bool? value)`
- `set multiselectable=(bool? value)`
- `bool? get multiselectable`
- `Stream<Event> get onAccessibleClick`
- `Stream<Event> get onAccessibleContextMenu`
- `Stream<Event> get onAccessibleDecrement`
- `Stream<Event> get onAccessibleFocus`
- `Stream<Event> get onAccessibleIncrement`
- `Stream<Event> get onAccessibleScrollIntoView`
- `String? get orientation`
- `set orientation=(String? value)`
- `AccessibleNodeList? get owns`
- `set owns=(AccessibleNodeList? value)`
- `String? get placeholder`
- `set placeholder=(String? value)`
- `set posInSet=(int? value)`
- `int? get posInSet`
- `String? get pressed`
- `set pressed=(String? value)`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `set relevant=(String? value)`
- `String? get relevant`
- `set required=(bool? value)`
- `bool? get required`
- `String? get role`
- `set role=(String? value)`
- `String? get roleDescription`
- `set roleDescription=(String? value)`
- `int? get rowCount`
- `set rowCount=(int? value)`
- `int? get rowIndex`
- `set rowIndex=(int? value)`
- `int? get rowSpan`
- `set rowSpan=(int? value)`
- `bool? get selected`
- `set selected=(bool? value)`
- `set setSize=(int? value)`
- `int? get setSize`
- `String? get sort`
- `set sort=(String? value)`
- `num? get valueMax`
- `set valueMax=(num? value)`
- `num? get valueMin`
- `set valueMin=(num? value)`
- `num? get valueNow`
- `set valueNow=(num? value)`
- `String? get valueText`
- `set valueText=(String? value)`
- `void appendChild(AccessibleNode child)`

## Class: AccessibleNodeList

```dart
class AccessibleNodeList extends JavaScriptObject { … }
```

- `AccessibleNodeList([List<AccessibleNode>? nodes])`
- `int? get length`
- `set length=(int? value)`
- `void add(AccessibleNode node, AccessibleNode? before)`
- `AccessibleNode? item(int index)`
- `void remove(int index)`

## Class: AmbientLightSensor

```dart
class AmbientLightSensor extends Sensor { … }
```

- `AmbientLightSensor([Map<dynamic, dynamic>? sensorOptions])`
- `num? get illuminance`

## Class: AnchorElement

```dart
class AnchorElement
    extends HtmlElement
    implements HtmlHyperlinkElementUtils { … }
```

- `AnchorElement({String? href})`
- `String? get download`
- `set download=(String? value)`
- `String? get hash`
- `set hash=(String? value)`
- `String? get host`
- `set host=(String? value)`
- `String? get hostname`
- `set hostname=(String? value)`
- `String? get href`
- `set href=(String? value)`
- `set hreflang=(String value)`
- `String get hreflang`
- `String? get origin`
- `String? get password`
- `set password=(String? value)`
- `String? get pathname`
- `set pathname=(String? value)`
- `String? get port`
- `set port=(String? value)`
- `String? get protocol`
- `set protocol=(String? value)`
- `set referrerPolicy=(String? value)`
- `String? get referrerPolicy`
- `String get rel`
- `set rel=(String value)`
- `String? get search`
- `set search=(String? value)`
- `String get target`
- `set target=(String value)`
- `String get type`
- `set type=(String value)`
- `String? get username`
- `set username=(String? value)`
- `String toString()`: The string representation of this element.

## Class: Animation

```dart
class Animation extends EventTarget { … }
```

- `Animation([AnimationEffectReadOnly? effect, AnimationTimeline? timeline])`
- static `EventStreamProvider<Event> cancelEvent`
- static `EventStreamProvider<Event> finishEvent`
- `num? get currentTime`
- `set currentTime=(num? value)`
- `AnimationEffectReadOnly? get effect`
- `set effect=(AnimationEffectReadOnly? value)`
- `Future<Animation> get finished`
- `String? get id`
- `set id=(String? value)`
- `Stream<Event> get onCancel`
- `Stream<Event> get onFinish`
- `String? get playState`
- `num? get playbackRate`
- `set playbackRate=(num? value)`
- `Future<Animation> get ready`
- `num? get startTime`
- `set startTime=(num? value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `AnimationTimeline? get timeline`
- `void cancel()`
- `void finish()`
- `void pause()`
- `void play()`
- `void reverse()`

## Class: AnimationEffectReadOnly

```dart
class AnimationEffectReadOnly extends JavaScriptObject { … }
```

- `AnimationEffectTimingReadOnly? get timing`
- `Map<dynamic, dynamic> getComputedTiming()`

## Class: AnimationEffectTiming

```dart
class AnimationEffectTiming extends AnimationEffectTimingReadOnly { … }
```

- `num? get delay`
- `set delay=(num? value)`
- `String? get direction`
- `set direction=(String? value)`
- `Object? get duration`
- `set duration=(Object? value)`
- `String? get easing`
- `set easing=(String? value)`
- `num? get endDelay`
- `set endDelay=(num? value)`
- `String? get fill`
- `set fill=(String? value)`
- `num? get iterationStart`
- `set iterationStart=(num? value)`
- `num? get iterations`
- `set iterations=(num? value)`

## Class: AnimationEffectTimingReadOnly

```dart
class AnimationEffectTimingReadOnly extends JavaScriptObject { … }
```

- `num? get delay`
- `String? get direction`
- `Object? get duration`
- `String? get easing`
- `num? get endDelay`
- `String? get fill`
- `num? get iterationStart`
- `num? get iterations`

## Class: AnimationEvent

```dart
class AnimationEvent extends Event { … }
```

- `AnimationEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `String? get animationName`
- `num? get elapsedTime`

## Class: AnimationPlaybackEvent

```dart
class AnimationPlaybackEvent extends Event { … }
```

- `AnimationPlaybackEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `num? get currentTime`
- `num? get timelineTime`

## Class: AnimationTimeline

```dart
class AnimationTimeline extends JavaScriptObject { … }
```

- `num? get currentTime`

## Class: AnimationWorkletGlobalScope

```dart
class AnimationWorkletGlobalScope extends WorkletGlobalScope { … }
```

- `void registerAnimator(String name, Object animatorConstructor)`

## Class: ApplicationCache

ApplicationCache is accessed via [Window.applicationCache].

```dart
class ApplicationCache extends EventTarget { … }
```

- static `int CHECKING`
- static `int DOWNLOADING`
- static `int IDLE`
- static `int OBSOLETE`
- static `int UNCACHED`
- static `int UPDATEREADY`
- static `EventStreamProvider<Event> cachedEvent`:
  Static factory designed to expose `cached` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<Event> checkingEvent`:
  Static factory designed to expose `checking` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<Event> downloadingEvent`:
  Static factory designed to expose `downloading` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<Event> noUpdateEvent`:
  Static factory designed to expose `noupdate` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<Event> obsoleteEvent`:
  Static factory designed to expose `obsolete` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<ProgressEvent> progressEvent`:
  Static factory designed to expose `progress` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- static `EventStreamProvider<Event> updateReadyEvent`:
  Static factory designed to expose `updateready` events to event
  handlers that are not necessarily instances of [ApplicationCache].
- `Stream<Event> get onCached`:
  Stream of `cached` events handled by this [ApplicationCache].
- `Stream<Event> get onChecking`:
  Stream of `checking` events handled by this [ApplicationCache].
- `Stream<Event> get onDownloading`:
  Stream of `downloading` events handled by this [ApplicationCache].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [ApplicationCache].
- `Stream<Event> get onNoUpdate`:
  Stream of `noupdate` events handled by this [ApplicationCache].
- `Stream<Event> get onObsolete`:
  Stream of `obsolete` events handled by this [ApplicationCache].
- `Stream<ProgressEvent> get onProgress`:
  Stream of `progress` events handled by this [ApplicationCache].
- `Stream<Event> get onUpdateReady`:
  Stream of `updateready` events handled by this [ApplicationCache].
- `int? get status`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void abort()`
- `void swapCache()`
- `void update()`

## Class: ApplicationCacheErrorEvent

```dart
class ApplicationCacheErrorEvent extends Event { … }
```

- `ApplicationCacheErrorEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `String? get message`
- `String? get reason`
- `int? get status`
- `String? get url`

## Class: AreaElement

DOM Area Element, which links regions of an image map with a hyperlink.

```dart
class AreaElement extends HtmlElement implements HtmlHyperlinkElementUtils { … }
```

- `AreaElement()`
- `set alt=(String value)`
- `String get alt`
- `String get coords`
- `set coords=(String value)`
- `String? get download`
- `set download=(String? value)`
- `set hash=(String? value)`
- `String? get hash`
- `set host=(String? value)`
- `String? get host`
- `set hostname=(String? value)`
- `String? get hostname`
- `String? get href`
- `set href=(String? value)`
- `String? get origin`
- `set password=(String? value)`
- `String? get password`
- `set pathname=(String? value)`
- `String? get pathname`
- `set port=(String? value)`
- `String? get port`
- `set protocol=(String? value)`
- `String? get protocol`
- `String? get referrerPolicy`
- `set referrerPolicy=(String? value)`
- `set rel=(String value)`
- `String get rel`
- `String? get search`
- `set search=(String? value)`
- `set shape=(String value)`
- `String get shape`
- `set target=(String value)`
- `String get target`
- `String? get username`
- `set username=(String? value)`
- `String toString()`: The string representation of this element.

## Class: AudioElement

```dart
class AudioElement extends MediaElement { … }
```

- `AudioElement([String? src])`

## Class: AuthenticatorAssertionResponse

```dart
class AuthenticatorAssertionResponse extends AuthenticatorResponse { … }
```

- `ByteBuffer? get authenticatorData`
- `ByteBuffer? get signature`

## Class: AuthenticatorAttestationResponse

```dart
class AuthenticatorAttestationResponse extends AuthenticatorResponse { … }
```

- `ByteBuffer? get attestationObject`

## Class: AuthenticatorResponse

```dart
class AuthenticatorResponse extends JavaScriptObject { … }
```

- `ByteBuffer? get clientDataJson`

## Class: BRElement

```dart
class BRElement extends HtmlElement { … }
```

- `BRElement()`

## Class: BackgroundFetchClickEvent

```dart
class BackgroundFetchClickEvent extends BackgroundFetchEvent { … }
```

- `BackgroundFetchClickEvent(String type, Map<dynamic, dynamic> init)`
- `String? get state`

## Class: BackgroundFetchEvent

```dart
class BackgroundFetchEvent extends ExtendableEvent { … }
```

- `BackgroundFetchEvent(String type, Map<dynamic, dynamic> init)`
- `String? get id`

## Class: BackgroundFetchFailEvent

```dart
class BackgroundFetchFailEvent extends BackgroundFetchEvent { … }
```

- `BackgroundFetchFailEvent(String type, Map<dynamic, dynamic> init)`
- `List<BackgroundFetchSettledFetch>? get fetches`

## Class: BackgroundFetchFetch

```dart
class BackgroundFetchFetch extends JavaScriptObject { … }
```

- `_Request? get request`

## Class: BackgroundFetchManager

```dart
class BackgroundFetchManager extends JavaScriptObject { … }
```

- `Future<BackgroundFetchRegistration> fetch(String id, Object requests, [Map<dynamic, dynamic>? options])`
- `Future<BackgroundFetchRegistration> get(String id)`
- `Future<List<dynamic>> getIds()`

## Class: BackgroundFetchRegistration

```dart
class BackgroundFetchRegistration extends EventTarget { … }
```

- `int? get downloadTotal`
- `int? get downloaded`
- `String? get id`
- `String? get title`
- `int? get totalDownloadSize`
- `int? get uploadTotal`
- `int? get uploaded`
- `Future<bool> abort()`

## Class: BackgroundFetchSettledFetch

```dart
class BackgroundFetchSettledFetch extends BackgroundFetchFetch { … }
```

- `BackgroundFetchSettledFetch(_Request request, _Response response)`
- `_Response? get response`

## Class: BackgroundFetchedEvent

```dart
class BackgroundFetchedEvent extends BackgroundFetchEvent { … }
```

- `BackgroundFetchedEvent(String type, Map<dynamic, dynamic> init)`
- `List<BackgroundFetchSettledFetch>? get fetches`
- `Future<dynamic> updateUI(String title)`

## Class: BarProp

```dart
class BarProp extends JavaScriptObject { … }
```

- `bool? get visible`

## Class: BarcodeDetector

```dart
class BarcodeDetector extends JavaScriptObject { … }
```

- `BarcodeDetector()`
- `Future<List<dynamic>> detect(dynamic image)`

## Class: BaseElement

```dart
class BaseElement extends HtmlElement { … }
```

- `BaseElement()`
- `String get href`
- `set href=(String value)`
- `String get target`
- `set target=(String value)`

## Class: BatteryManager

```dart
class BatteryManager extends EventTarget { … }
```

- `bool? get charging`
- `num? get chargingTime`
- `num? get dischargingTime`
- `num? get level`

## Class: BeforeInstallPromptEvent

```dart
class BeforeInstallPromptEvent extends Event { … }
```

- `BeforeInstallPromptEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `List<String>? get platforms`
- `Future<Map<String, dynamic>?> get userChoice`
- `Future<dynamic> prompt()`

## Class: BeforeUnloadEvent

```dart
class BeforeUnloadEvent extends Event { … }
```

- `String? get returnValue`
- `set returnValue=(String? value)`

## Class: Blob

```dart
class Blob extends JavaScriptObject { … }
```

- `Blob(List<dynamic> blobParts, [String? type, String? endings])`
- `int get size`
- `String get type`
- `Blob slice([int? start, int? end, String? contentType])`

## Class: BlobEvent

```dart
class BlobEvent extends Event { … }
```

- `BlobEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `Blob? get data`
- `num? get timecode`

## Class: BluetoothRemoteGattDescriptor

```dart
class BluetoothRemoteGattDescriptor extends JavaScriptObject { … }
```

- `_BluetoothRemoteGATTCharacteristic? get characteristic`
- `String? get uuid`
- `ByteData? get value`
- `Future<dynamic> readValue()`
- `Future<dynamic> writeValue(dynamic value)`

## Class: Body

```dart
class Body extends JavaScriptObject { … }
```

- `bool? get bodyUsed`
- `Future<dynamic> arrayBuffer()`
- `Future<Blob> blob()`
- `Future<FormData> formData()`
- `Future<dynamic> json()`
- `Future<String> text()`

## Class: BodyElement

```dart
class BodyElement extends HtmlElement implements WindowEventHandlers { … }
```

- `BodyElement()`
- static `EventStreamProvider<Event> blurEvent`:
  Static factory designed to expose `blur` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> focusEvent`:
  Static factory designed to expose `focus` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> hashChangeEvent`:
  Static factory designed to expose `hashchange` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> loadEvent`:
  Static factory designed to expose `load` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> offlineEvent`:
  Static factory designed to expose `offline` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> onlineEvent`:
  Static factory designed to expose `online` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<PopStateEvent> popStateEvent`:
  Static factory designed to expose `popstate` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> resizeEvent`:
  Static factory designed to expose `resize` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> scrollEvent`
- static `EventStreamProvider<StorageEvent> storageEvent`:
  Static factory designed to expose `storage` events to event
  handlers that are not necessarily instances of [BodyElement].
- static `EventStreamProvider<Event> unloadEvent`:
  Static factory designed to expose `unload` events to event
  handlers that are not necessarily instances of [BodyElement].
- `ElementStream<Event> get onBlur`:
  Stream of `blur` events handled by this [BodyElement].
- `ElementStream<Event> get onError`:
  Stream of `error` events handled by this [BodyElement].
- `ElementStream<Event> get onFocus`:
  Stream of `focus` events handled by this [BodyElement].
- `ElementStream<Event> get onHashChange`:
  Stream of `hashchange` events handled by this [BodyElement].
- `ElementStream<Event> get onLoad`:
  Stream of `load` events handled by this [BodyElement].
- `ElementStream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [BodyElement].
- `ElementStream<Event> get onOffline`:
  Stream of `offline` events handled by this [BodyElement].
- `ElementStream<Event> get onOnline`:
  Stream of `online` events handled by this [BodyElement].
- `ElementStream<PopStateEvent> get onPopState`:
  Stream of `popstate` events handled by this [BodyElement].
- `ElementStream<Event> get onResize`:
  Stream of `resize` events handled by this [BodyElement].
- `ElementStream<Event> get onScroll`:
  Stream of `scroll` events handled by this [Element].
- `ElementStream<StorageEvent> get onStorage`:
  Stream of `storage` events handled by this [BodyElement].
- `ElementStream<Event> get onUnload`:
  Stream of `unload` events handled by this [BodyElement].

## Class: BroadcastChannel

```dart
class BroadcastChannel extends EventTarget { … }
```

- `BroadcastChannel(String name)`
- static `EventStreamProvider<MessageEvent> messageEvent`
- `String? get name`
- `Stream<MessageEvent> get onMessage`
- `void close()`
- `void postMessage(Object message)`

## Class: BudgetState

```dart
class BudgetState extends JavaScriptObject { … }
```

- `num? get budgetAt`
- `int? get time`

## Class: ButtonElement

```dart
class ButtonElement extends HtmlElement { … }
```

- `ButtonElement()`
- `bool get autofocus`
- `set autofocus=(bool value)`
- `bool get disabled`
- `set disabled=(bool value)`
- `FormElement? get form`
- `String? get formAction`
- `set formAction=(String? value)`
- `String? get formEnctype`
- `set formEnctype=(String? value)`
- `String? get formMethod`
- `set formMethod=(String? value)`
- `bool get formNoValidate`
- `set formNoValidate=(bool value)`
- `String get formTarget`
- `set formTarget=(String value)`
- `List<Node>? get labels`
- `String get name`
- `set name=(String value)`
- `String get type`
- `set type=(String value)`
- `String get validationMessage`
- `ValidityState get validity`
- `String get value`
- `set value=(String value)`
- `bool get willValidate`
- `bool checkValidity()`
- `bool reportValidity()`
- `void setCustomValidity(String error)`

## Class: ButtonInputElement

A button, with no default behavior.

```dart
abstract class ButtonInputElement implements InputElementBase { … }
```

- `ButtonInputElement()`

## Class: CDataSection

```dart
class CDataSection extends Text { … }
```

## Class: CacheStorage

```dart
class CacheStorage extends JavaScriptObject { … }
```

- `Future<dynamic> delete(String cacheName)`
- `Future<dynamic> has(String cacheName)`
- `Future<dynamic> keys()`
- `Future<dynamic> match(dynamic request, [Map<dynamic, dynamic>? options])`
- `Future<dynamic> open(String cacheName)`

## Class: CanMakePaymentEvent

```dart
class CanMakePaymentEvent extends ExtendableEvent { … }
```

- `CanMakePaymentEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `List<dynamic>? get methodData`
- `List<dynamic>? get modifiers`
- `String? get paymentRequestOrigin`
- `String? get topLevelOrigin`
- `void respondWith(Future<dynamic> canMakePaymentResponse)`

## Class: CanvasCaptureMediaStreamTrack

```dart
class CanvasCaptureMediaStreamTrack extends MediaStreamTrack { … }
```

- `CanvasElement? get canvas`
- `void requestFrame()`

## Class: CanvasElement

```dart
class CanvasElement extends HtmlElement implements CanvasImageSource { … }
```

- `CanvasElement({int? width, int? height})`
- static `EventStreamProvider<ContextEvent> webGlContextLostEvent`:
  Static factory designed to expose `webglcontextlost` events to event
  handlers that are not necessarily instances of [CanvasElement].
- static `EventStreamProvider<ContextEvent> webGlContextRestoredEvent`:
  Static factory designed to expose `webglcontextrestored` events to event
  handlers that are not necessarily instances of [CanvasElement].
- `CanvasRenderingContext2D get context2D`: An API for drawing on this canvas.
- `int? get height`: The height of this canvas element in CSS pixels.
- `set height=(int? value)`
- `ElementStream<ContextEvent> get onWebGlContextLost`:
  Stream of `webglcontextlost` events handled by this [CanvasElement].
- `ElementStream<ContextEvent> get onWebGlContextRestored`:
  Stream of `webglcontextrestored` events handled by this [CanvasElement].
- `int? get width`: The width of this canvas element in CSS pixels.
- `set width=(int? value)`
- `MediaStream captureStream([num? frameRate])`
- `Object? getContext(String contextId, [Map<dynamic, dynamic>? attributes])`
- `RenderingContext? getContext3d({dynamic alpha, dynamic depth, dynamic stencil, dynamic antialias, dynamic premultipliedAlpha, dynamic preserveDrawingBuffer})`:
  Returns a new Web GL context for this canvas.
- `Future<Blob> toBlob([String? type, Object? arguments])`
- `String toDataUrl([String type, num? quality])`:
  Returns a data URI containing a representation of the image in the
  format specified by type (defaults to 'image/png').
- `OffscreenCanvas transferControlToOffscreen()`

## Class: CanvasGradient

An opaque canvas object representing a gradient.

```dart
class CanvasGradient extends JavaScriptObject { … }
```

- `void addColorStop(num offset, String color)`:
  Adds a color stop to this gradient at the offset.

## Class: CanvasImageSource

An object that can be drawn to a 2D canvas rendering context.

```dart
abstract class CanvasImageSource { … }
```

## Class: CanvasPattern

An opaque object representing a pattern of image, canvas, or video.

```dart
class CanvasPattern extends JavaScriptObject { … }
```

- `void setTransform(Matrix transform)`

## Class: CanvasRenderingContext

```dart
abstract class CanvasRenderingContext { … }
```

- `CanvasElement get canvas`

## Class: CanvasRenderingContext2D

```dart
class CanvasRenderingContext2D
    extends JavaScriptObject
    implements CanvasRenderingContext { … }
```

- `double get backingStorePixelRatio`: Deprecated always returns 1.0
- `CanvasElement get canvas`
- `Matrix? get currentTransform`
- `set currentTransform=(Matrix? value)`
- `String? get direction`
- `set direction=(String? value)`
- `Object? get fillStyle`
- `set fillStyle=(Object? value)`
- `String? get filter`
- `set filter=(String? value)`
- `String get font`
- `set font=(String value)`
- `num get globalAlpha`
- `set globalAlpha=(num value)`
- `set globalCompositeOperation=(String value)`
- `String get globalCompositeOperation`
- `bool? get imageSmoothingEnabled`:
  Whether images and patterns on this canvas will be smoothed when this
  canvas is scaled.
- `set imageSmoothingEnabled=(bool? value)`
- `String? get imageSmoothingQuality`
- `set imageSmoothingQuality=(String? value)`
- `String get lineCap`
- `set lineCap=(String value)`
- `set lineDashOffset=(num value)`
- `num get lineDashOffset`
- `String get lineJoin`
- `set lineJoin=(String value)`
- `num get lineWidth`
- `set lineWidth=(num value)`
- `num get miterLimit`
- `set miterLimit=(num value)`
- `num get shadowBlur`
- `set shadowBlur=(num value)`
- `set shadowColor=(String value)`
- `String get shadowColor`
- `set shadowOffsetX=(num value)`
- `num get shadowOffsetX`
- `num get shadowOffsetY`
- `set shadowOffsetY=(num value)`
- `Object? get strokeStyle`
- `set strokeStyle=(Object? value)`
- `String get textAlign`
- `set textAlign=(String value)`
- `String get textBaseline`
- `set textBaseline=(String value)`
- `void addHitRegion([Map<dynamic, dynamic>? options])`
- `void arc(num x, num y, num radius, num startAngle, num endAngle, [bool anticlockwise])`
- `void arcTo(num x1, num y1, num x2, num y2, num radius)`
- `void beginPath()`
- `void bezierCurveTo(num cp1x, num cp1y, num cp2x, num cp2y, num x, num y)`
- `void clearHitRegions()`
- `void clearRect(num x, num y, num width, num height)`
- `void clip([dynamic path_OR_winding, String? winding])`
- `void closePath()`
- `ImageData createImageData(dynamic data_OR_imagedata_OR_sw, [int? sh_OR_sw, dynamic imageDataColorSettings_OR_sh, Map<dynamic, dynamic>? imageDataColorSettings])`
- `ImageData createImageDataFromImageData(ImageData imagedata)`
- `CanvasGradient createLinearGradient(num x0, num y0, num x1, num y1)`
- `CanvasPattern? createPattern(Object image, String repetitionType)`
- `CanvasPattern createPatternFromImage(ImageElement image, String repetitionType)`
- `CanvasGradient createRadialGradient(num x0, num y0, num r0, num x1, num y1, num r1)`
- `void drawFocusIfNeeded(dynamic element_OR_path, [Element? element])`
- `void drawImage(CanvasImageSource source, num destX, num destY)`:
  Draws an image from a CanvasImageSource to this canvas.
- `void drawImageScaled(CanvasImageSource source, num destX, num destY, num destWidth, num destHeight)`:
  Draws an image from a CanvasImageSource to an area of this canvas.
- `void drawImageScaledFromSource(CanvasImageSource source, num sourceX, num sourceY, num sourceWidth, num sourceHeight, num destX, num destY, num destWidth, num destHeight)`:
  Draws an image from a CanvasImageSource to an area of this canvas.
- `void drawImageToRect(CanvasImageSource source, Rectangle<num> destRect, {Rectangle<num>? sourceRect})`:
  Draws an image from a CanvasImageSource to an area of this canvas.
- `void ellipse(num x, num y, num radiusX, num radiusY, num rotation, num startAngle, num endAngle, bool? anticlockwise)`
- `void fill([dynamic path_OR_winding, String? winding])`
- `void fillRect(num x, num y, num width, num height)`
- `void fillText(String text, num x, num y, [num? maxWidth])`:
  Draws text to the canvas.
- `Map<dynamic, dynamic> getContextAttributes()`
- `ImageData getImageData(int sx, int sy, int sw, int sh)`
- `List<num> getLineDash()`
- `bool isContextLost()`
- `bool isPointInPath(dynamic path_OR_x, num x_OR_y, [dynamic winding_OR_y, String? winding])`
- `bool isPointInStroke(dynamic path_OR_x, num x_OR_y, [num? y])`
- `void lineTo(num x, num y)`
- `TextMetrics measureText(String text)`
- `void moveTo(num x, num y)`
- `void putImageData(ImageData imagedata, int dx, int dy, [int? dirtyX, int? dirtyY, int? dirtyWidth, int? dirtyHeight])`
- `void quadraticCurveTo(num cpx, num cpy, num x, num y)`
- `void rect(num x, num y, num width, num height)`
- `void removeHitRegion(String id)`
- `void resetTransform()`
- `void restore()`
- `void rotate(num angle)`
- `void save()`
- `void scale(num x, num y)`
- `void scrollPathIntoView([Path2D? path])`
- `void setFillColorHsl(int h, num s, num l, [num a])`:
  Sets the color used inside shapes.
  [h] is in degrees, 0-360.
  [s], [l] are in percent, 0-100.
  [a] is 0-1.
- `void setFillColorRgb(int r, int g, int b, [num a])`:
  Sets the color used inside shapes.
  [r], [g], [b] are 0-255, [a] is 0-1.
- `void setLineDash(List<num> dash)`
- `void setStrokeColorHsl(int h, num s, num l, [num a])`:
  Sets the color used for stroking shapes.
  [h] is in degrees, 0-360.
  [s], [l] are in percent, 0-100.
  [a] is 0-1.
- `void setStrokeColorRgb(int r, int g, int b, [num a])`:
  Sets the color used for stroking shapes.
  [r], [g], [b] are 0-255, [a] is 0-1.
- `void setTransform(num a, num b, num c, num d, num e, num f)`
- `void stroke([Path2D? path])`
- `void strokeRect(num x, num y, num width, num height)`
- `void strokeText(String text, num x, num y, [num? maxWidth])`
- `void transform(num a, num b, num c, num d, num e, num f)`
- `void translate(num x, num y)`

## Class: CharacterData

```dart
class CharacterData
    extends Node
    implements ChildNode, NonDocumentTypeChildNode { … }
```

- `String? get data`
- `set data=(String? value)`
- `int? get length`
- `Element? get nextElementSibling`
- `Element? get previousElementSibling`
- `void after(Object nodes)`
- `void appendData(String data)`
- `void before(Object nodes)`
- `void deleteData(int offset, int count)`
- `void insertData(int offset, String data)`
- `void replaceData(int offset, int count, String data)`
- `String substringData(int offset, int count)`

## Class: CheckboxInputElement

A boolean editor control.

```dart
abstract class CheckboxInputElement implements InputElementBase { … }
```

- `CheckboxInputElement()`
- `bool? get checked`
- `set checked=(bool? value)`
- `bool get required`
- `set required=(bool value)`

## Class: ChildNode

```dart
abstract class ChildNode extends JavaScriptObject { … }
```

- `void after(Object nodes)`
- `void before(Object nodes)`
- `void remove()`

## Class: Client

```dart
class Client extends JavaScriptObject { … }
```

- `String? get frameType`
- `String? get id`
- `String? get type`
- `String? get url`
- `void postMessage(Object message, [List<Object>? transfer])`

## Class: Clients

```dart
class Clients extends JavaScriptObject { … }
```

- `Future<dynamic> claim()`
- `Future<dynamic> get(String id)`
- `Future<List<dynamic>> matchAll([Map<dynamic, dynamic>? options])`
- `Future<WindowClient> openWindow(String url)`

## Class: ClipboardEvent

```dart
class ClipboardEvent extends Event { … }
```

- `ClipboardEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `DataTransfer? get clipboardData`

## Class: CloseEvent

```dart
class CloseEvent extends Event { … }
```

- `CloseEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `int? get code`
- `String? get reason`
- `bool? get wasClean`

## Class: Comment

```dart
class Comment extends CharacterData { … }
```

- `Comment([String? data])`

## Class: CompositionEvent

```dart
class CompositionEvent extends UIEvent { … }
```

- `CompositionEvent(String type, {bool canBubble, bool cancelable, Window? view, String? data, String? locale})`
- `String? get data`

## Class: Console

```dart
class Console { … }
```

- `MemoryInfo? get memory`
- `void assertCondition([bool? condition, Object? arg])`
- `void clear([Object? arg])`
- `void count([Object? arg])`
- `void countReset([String? arg])`
- `void debug(Object? arg)`
- `void dir([Object? item, Object? options])`
- `void dirxml(Object? arg)`
- `void error(Object? arg)`
- `void group(Object? arg)`
- `void groupCollapsed(Object? arg)`
- `void groupEnd()`
- `void info(Object? arg)`
- `void log(Object? arg)`
- `void markTimeline(Object? arg)`
- `void profile([String? title])`
- `void profileEnd([String? title])`
- `void table([Object? tabularData, List<String>? properties])`
- `void time([String? label])`
- `void timeEnd([String? label])`
- `void timeLog([String? label, Object? arg])`
- `void timeStamp([Object? arg])`
- `void trace(Object? arg)`
- `void warn(Object? arg)`

## Class: ContentElement

```dart
class ContentElement extends HtmlElement { … }
```

- `ContentElement()`
- `String? get select`
- `set select=(String? value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `List<Node> getDistributedNodes()`

## Class: CookieStore

```dart
class CookieStore extends JavaScriptObject { … }
```

- `Future<dynamic> getAll([Map<dynamic, dynamic>? options])`
- `Future<dynamic> set(String name, String value, [Map<dynamic, dynamic>? options])`

## Class: Coordinates

```dart
class Coordinates extends JavaScriptObject { … }
```

- `num? get accuracy`
- `num? get altitude`
- `num? get altitudeAccuracy`
- `num? get heading`
- `num? get latitude`
- `num? get longitude`
- `num? get speed`

## Class: Credential

```dart
class Credential extends JavaScriptObject { … }
```

- `String? get id`
- `String? get type`

## Class: CredentialUserData

```dart
class CredentialUserData extends JavaScriptObject { … }
```

- `String? get iconUrl`
- `String? get name`

## Class: CredentialsContainer

```dart
class CredentialsContainer extends JavaScriptObject { … }
```

- `Future<dynamic> create([Map<dynamic, dynamic>? options])`
- `Future<dynamic> get([Map<dynamic, dynamic>? options])`
- `Future<dynamic> preventSilentAccess()`
- `Future<dynamic> requireUserMediation()`
- `Future<dynamic> store(Credential credential)`

## Class: Crypto

```dart
class Crypto extends JavaScriptObject { … }
```

- `_SubtleCrypto? get subtle`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `TypedData getRandomValues(TypedData array)`

## Class: CryptoKey

```dart
class CryptoKey extends JavaScriptObject { … }
```

- `Object? get algorithm`
- `bool? get extractable`
- `String? get type`
- `Object? get usages`

## Class: Css

```dart
class Css extends JavaScriptObject { … }
```

- static `CssUnitValue Hz(num value)`
- static `CssUnitValue ch(num value)`
- static `CssUnitValue cm(num value)`
- static `CssUnitValue deg(num value)`
- static `CssUnitValue dpcm(num value)`
- static `CssUnitValue dpi(num value)`
- static `CssUnitValue dppx(num value)`
- static `CssUnitValue em(num value)`
- static `String escape(String ident)`
- static `CssUnitValue ex(num value)`
- static `CssUnitValue fr(num value)`
- static `CssUnitValue grad(num value)`
- static `CssUnitValue inch(num value)`
- static `CssUnitValue kHz(num value)`
- static `CssUnitValue mm(num value)`
- static `CssUnitValue ms(num value)`
- static `CssUnitValue number(num value)`
- static `CssUnitValue pc(num value)`
- static `CssUnitValue percent(num value)`
- static `CssUnitValue pt(num value)`
- static `CssUnitValue px(num value)`
- static `CssUnitValue rad(num value)`
- static `void registerProperty(Map<dynamic, dynamic> descriptor)`
- static `CssUnitValue rem(num value)`
- static `CssUnitValue s(num value)`
- static `bool supports(String property, String value)`
- static `bool supportsCondition(String conditionText)`
- static `CssUnitValue turn(num value)`
- static `CssUnitValue vh(num value)`
- static `CssUnitValue vmax(num value)`
- static `CssUnitValue vmin(num value)`
- static `CssUnitValue vw(num value)`
- static `_Worklet? get paintWorklet`

## Class: CssCharsetRule

```dart
class CssCharsetRule extends CssRule { … }
```

- `String? get encoding`
- `set encoding=(String? value)`

## Class: CssClassSet

A Set that stores the CSS class names for an element.

```dart
abstract class CssClassSet implements Set<String> { … }
```

- `bool get frozen`:
  Returns [:true:] if classes cannot be added or removed from this
  [:CssClassSet:].
- `bool add(String value)`: Add the class [value] to element.
- `void addAll(Iterable<String> iterable)`:
  Add all classes specified in [iterable] to element.
- `bool contains(Object? value)`:
  Determine if this element contains the class [value].
- `bool remove(Object? value)`:
  Remove the class [value] from element, and return true on successful
  removal.
- `void removeAll(Iterable<Object?> iterable)`:
  Remove all classes specified in [iterable] from element.
- `bool toggle(String value, [bool? shouldAdd])`:
  Adds the class [value] to the element if it is not on it, removes it if it
  is.
- `void toggleAll(Iterable<String> iterable, [bool? shouldAdd])`:
  Toggles all classes specified in [iterable] on element.

## Class: CssConditionRule

```dart
class CssConditionRule extends CssGroupingRule { … }
```

- `String? get conditionText`

## Class: CssFontFaceRule

```dart
class CssFontFaceRule extends CssRule { … }
```

- `CssStyleDeclaration? get style`

## Class: CssGroupingRule

```dart
class CssGroupingRule extends CssRule { … }
```

- `List<CssRule>? get cssRules`
- `void deleteRule(int index)`
- `int insertRule(String rule, int index)`

## Class: CssImageValue

```dart
class CssImageValue extends CssResourceValue { … }
```

- `num? get intrinsicHeight`
- `num? get intrinsicRatio`
- `num? get intrinsicWidth`

## Class: CssImportRule

```dart
class CssImportRule extends CssRule { … }
```

- `String? get href`
- `MediaList? get media`
- `CssStyleSheet? get styleSheet`

## Class: CssKeyframeRule

```dart
class CssKeyframeRule extends CssRule { … }
```

- `String? get keyText`
- `set keyText=(String? value)`
- `CssStyleDeclaration? get style`

## Class: CssKeyframesRule

```dart
class CssKeyframesRule extends CssRule { … }
```

- `List<CssRule>? get cssRules`
- `String? get name`
- `set name=(String? value)`
- `void appendRule(String rule)`
- `void deleteRule(String select)`
- `CssKeyframeRule? findRule(String select)`

## Class: CssKeywordValue

```dart
class CssKeywordValue extends CssStyleValue { … }
```

- `CssKeywordValue(String keyword)`
- `String? get value`
- `set value=(String? value)`

## Class: CssMatrixComponent

```dart
class CssMatrixComponent extends CssTransformComponent { … }
```

- `CssMatrixComponent(DomMatrixReadOnly matrix, [Map<dynamic, dynamic>? options])`
- `DomMatrix? get matrix`
- `set matrix=(DomMatrix? value)`

## Class: CssMediaRule

```dart
class CssMediaRule extends CssConditionRule { … }
```

- `MediaList? get media`

## Class: CssNamespaceRule

```dart
class CssNamespaceRule extends CssRule { … }
```

- `String? get namespaceUri`
- `String? get prefix`

## Class: CssNumericValue

```dart
class CssNumericValue extends CssStyleValue { … }
```

- static `CssNumericValue parse(String cssText)`
- `CssNumericValue add(CssNumericValue value)`
- `CssNumericValue div(num value)`
- `CssNumericValue mul(num value)`
- `CssNumericValue sub(CssNumericValue value)`
- `CssNumericValue to(String unit)`

## Class: CssPageRule

```dart
class CssPageRule extends CssRule { … }
```

- `String? get selectorText`
- `set selectorText=(String? value)`
- `CssStyleDeclaration? get style`

## Class: CssPerspective

```dart
class CssPerspective extends CssTransformComponent { … }
```

- `CssPerspective(CssNumericValue length)`
- `CssNumericValue? get length`
- `set length=(CssNumericValue? value)`

## Class: CssPositionValue

```dart
class CssPositionValue extends CssStyleValue { … }
```

- `CssPositionValue(CssNumericValue x, CssNumericValue y)`
- `CssNumericValue? get x`
- `set x=(CssNumericValue? value)`
- `CssNumericValue? get y`
- `set y=(CssNumericValue? value)`

## Class: CssRect

A class for representing CSS dimensions.

```dart
abstract class CssRect implements Rectangle<num> { … }
```

- `CssRect(Element _element)`
- `num get bottom`: The y-coordinate of the bottom edge.
- `Point<num> get bottomLeft`
- `Point<num> get bottomRight`
- `int get hashCode`: The hash code for this object.
- `num get height`: The height of this rectangle.
- `set height=(dynamic newHeight)`: Set the height to `newHeight`.
- `num get left`: The x-coordinate of the left edge.
- `num get right`: The x-coordinate of the right edge.
- `num get top`: The y-coordinate of the top edge.
- `Point<num> get topLeft`
- `Point<num> get topRight`
- `num get width`: The width of this rectangle.
- `set width=(dynamic newWidth)`:
  Set the current computed width in pixels of this element.
- `bool operator==(Object other)`: The equality operator.
- `Rectangle<num> boundingBox(Rectangle<num> other)`:
  Returns a new rectangle which completely contains `this` and [other].
- `bool containsPoint(Point<num> another)`:
  Tests whether [another] is inside or along the edges of `this`.
- `bool containsRectangle(Rectangle<num> another)`:
  Tests whether `this` entirely contains [another].
- `Rectangle<num>? intersection(Rectangle<num> other)`:
  Computes the intersection of `this` and [other].
- `bool intersects(Rectangle<num> other)`:
  Returns true if `this` intersects [other].
- `String toString()`: A string representation of this object.

## Class: CssResourceValue

```dart
class CssResourceValue extends CssStyleValue { … }
```

- `String? get state`

## Class: CssRotation

```dart
class CssRotation extends CssTransformComponent { … }
```

- `CssRotation(dynamic angleValue_OR_x, [num? y, num? z, CssNumericValue? angle])`
- `CssNumericValue? get angle`
- `set angle=(CssNumericValue? value)`
- `num? get x`
- `set x=(num? value)`
- `num? get y`
- `set y=(num? value)`
- `num? get z`
- `set z=(num? value)`

## Class: CssRule

```dart
class CssRule extends JavaScriptObject { … }
```

- static `int CHARSET_RULE`
- static `int FONT_FACE_RULE`
- static `int IMPORT_RULE`
- static `int KEYFRAMES_RULE`
- static `int KEYFRAME_RULE`
- static `int MEDIA_RULE`
- static `int NAMESPACE_RULE`
- static `int PAGE_RULE`
- static `int STYLE_RULE`
- static `int SUPPORTS_RULE`
- static `int VIEWPORT_RULE`
- `String? get cssText`
- `set cssText=(String? value)`
- `CssRule? get parentRule`
- `CssStyleSheet? get parentStyleSheet`
- `int? get type`

## Class: CssScale

```dart
class CssScale extends CssTransformComponent { … }
```

- `CssScale(num x, num y, [num? z])`
- `num? get x`
- `set x=(num? value)`
- `num? get y`
- `set y=(num? value)`
- `num? get z`
- `set z=(num? value)`

## Class: CssSkew

```dart
class CssSkew extends CssTransformComponent { … }
```

- `CssSkew(CssNumericValue ax, CssNumericValue ay)`
- `CssNumericValue? get ax`
- `set ax=(CssNumericValue? value)`
- `CssNumericValue? get ay`
- `set ay=(CssNumericValue? value)`

## Class: CssStyleDeclaration

```dart
class CssStyleDeclaration
    extends JavaScriptObject
    with CssStyleDeclarationBase { … }
```

- `CssStyleDeclaration()`
- `CssStyleDeclaration.css(String css)`
- `String get background`: Gets the value of "background"
- `set background=(String? value)`: Sets the value of "background"
- `String get backgroundAttachment`: Gets the value of "background-attachment"
- `set backgroundAttachment=(String? value)`:
  Sets the value of "background-attachment"
- `String get backgroundColor`: Gets the value of "background-color"
- `set backgroundColor=(String? value)`: Sets the value of "background-color"
- `String get backgroundImage`: Gets the value of "background-image"
- `set backgroundImage=(String? value)`: Sets the value of "background-image"
- `String get backgroundPosition`: Gets the value of "background-position"
- `set backgroundPosition=(String? value)`:
  Sets the value of "background-position"
- `String get backgroundRepeat`: Gets the value of "background-repeat"
- `set backgroundRepeat=(String? value)`: Sets the value of "background-repeat"
- `String get border`: Gets the value of "border"
- `set border=(String? value)`: Sets the value of "border"
- `set borderBottom=(String? value)`: Sets the value of "border-bottom"
- `String get borderBottom`: Gets the value of "border-bottom"
- `String get borderBottomColor`: Gets the value of "border-bottom-color"
- `set borderBottomColor=(String? value)`: Sets the value of "border-bottom-color"
- `set borderBottomStyle=(String? value)`: Sets the value of "border-bottom-style"
- `String get borderBottomStyle`: Gets the value of "border-bottom-style"
- `String get borderBottomWidth`: Gets the value of "border-bottom-width"
- `set borderBottomWidth=(String? value)`: Sets the value of "border-bottom-width"
- `String get borderCollapse`: Gets the value of "border-collapse"
- `set borderCollapse=(String? value)`: Sets the value of "border-collapse"
- `String get borderColor`: Gets the value of "border-color"
- `set borderColor=(String? value)`: Sets the value of "border-color"
- `String get borderLeft`: Gets the value of "border-left"
- `set borderLeft=(String? value)`: Sets the value of "border-left"
- `String get borderLeftColor`: Gets the value of "border-left-color"
- `set borderLeftColor=(String? value)`: Sets the value of "border-left-color"
- `String get borderLeftStyle`: Gets the value of "border-left-style"
- `set borderLeftStyle=(String? value)`: Sets the value of "border-left-style"
- `String get borderLeftWidth`: Gets the value of "border-left-width"
- `set borderLeftWidth=(String? value)`: Sets the value of "border-left-width"
- `set borderRight=(String? value)`: Sets the value of "border-right"
- `String get borderRight`: Gets the value of "border-right"
- `String get borderRightColor`: Gets the value of "border-right-color"
- `set borderRightColor=(String? value)`: Sets the value of "border-right-color"
- `String get borderRightStyle`: Gets the value of "border-right-style"
- `set borderRightStyle=(String? value)`: Sets the value of "border-right-style"
- `String get borderRightWidth`: Gets the value of "border-right-width"
- `set borderRightWidth=(String? value)`: Sets the value of "border-right-width"
- `String get borderSpacing`: Gets the value of "border-spacing"
- `set borderSpacing=(String? value)`: Sets the value of "border-spacing"
- `String get borderStyle`: Gets the value of "border-style"
- `set borderStyle=(String? value)`: Sets the value of "border-style"
- `String get borderTop`: Gets the value of "border-top"
- `set borderTop=(String? value)`: Sets the value of "border-top"
- `String get borderTopColor`: Gets the value of "border-top-color"
- `set borderTopColor=(String? value)`: Sets the value of "border-top-color"
- `String get borderTopStyle`: Gets the value of "border-top-style"
- `set borderTopStyle=(String? value)`: Sets the value of "border-top-style"
- `set borderTopWidth=(String? value)`: Sets the value of "border-top-width"
- `String get borderTopWidth`: Gets the value of "border-top-width"
- `set borderWidth=(String? value)`: Sets the value of "border-width"
- `String get borderWidth`: Gets the value of "border-width"
- `String get bottom`: Gets the value of "bottom"
- `set bottom=(String? value)`: Sets the value of "bottom"
- `String get captionSide`: Gets the value of "caption-side"
- `set captionSide=(String? value)`: Sets the value of "caption-side"
- `String get clear`: Gets the value of "clear"
- `set clear=(String? value)`: Sets the value of "clear"
- `set clip=(String? value)`: Sets the value of "clip"
- `String get clip`: Gets the value of "clip"
- `String get color`: Gets the value of "color"
- `set color=(String? value)`: Sets the value of "color"
- `String get content`: Gets the value of "content"
- `set content=(String? value)`: Sets the value of "content"
- `String? get cssFloat`
- `set cssFloat=(String? value)`
- `String? get cssText`
- `set cssText=(String? value)`
- `String get cursor`: Gets the value of "cursor"
- `set cursor=(String? value)`: Sets the value of "cursor"
- `String get direction`: Gets the value of "direction"
- `set direction=(String? value)`: Sets the value of "direction"
- `String get display`: Gets the value of "display"
- `set display=(String? value)`: Sets the value of "display"
- `String get emptyCells`: Gets the value of "empty-cells"
- `set emptyCells=(String? value)`: Sets the value of "empty-cells"
- `String get font`: Gets the value of "font"
- `set font=(String? value)`: Sets the value of "font"
- `String get fontFamily`: Gets the value of "font-family"
- `set fontFamily=(String? value)`: Sets the value of "font-family"
- `set fontSize=(String? value)`: Sets the value of "font-size"
- `String get fontSize`: Gets the value of "font-size"
- `String get fontStyle`: Gets the value of "font-style"
- `set fontStyle=(String? value)`: Sets the value of "font-style"
- `String get fontVariant`: Gets the value of "font-variant"
- `set fontVariant=(String? value)`: Sets the value of "font-variant"
- `String get fontWeight`: Gets the value of "font-weight"
- `set fontWeight=(String? value)`: Sets the value of "font-weight"
- `String get height`: Gets the value of "height"
- `set height=(String? value)`: Sets the value of "height"
- `set left=(String? value)`: Sets the value of "left"
- `String get left`: Gets the value of "left"
- `int get length`
- `set letterSpacing=(String? value)`: Sets the value of "letter-spacing"
- `String get letterSpacing`: Gets the value of "letter-spacing"
- `String get lineHeight`: Gets the value of "line-height"
- `set lineHeight=(String? value)`: Sets the value of "line-height"
- `String get listStyle`: Gets the value of "list-style"
- `set listStyle=(String? value)`: Sets the value of "list-style"
- `String get listStyleImage`: Gets the value of "list-style-image"
- `set listStyleImage=(String? value)`: Sets the value of "list-style-image"
- `set listStylePosition=(String? value)`: Sets the value of "list-style-position"
- `String get listStylePosition`: Gets the value of "list-style-position"
- `String get listStyleType`: Gets the value of "list-style-type"
- `set listStyleType=(String? value)`: Sets the value of "list-style-type"
- `String get margin`: Gets the value of "margin"
- `set margin=(String? value)`: Sets the value of "margin"
- `String get marginBottom`: Gets the value of "margin-bottom"
- `set marginBottom=(String? value)`: Sets the value of "margin-bottom"
- `String get marginLeft`: Gets the value of "margin-left"
- `set marginLeft=(String? value)`: Sets the value of "margin-left"
- `String get marginRight`: Gets the value of "margin-right"
- `set marginRight=(String? value)`: Sets the value of "margin-right"
- `String get marginTop`: Gets the value of "margin-top"
- `set marginTop=(String? value)`: Sets the value of "margin-top"
- `String get maxHeight`: Gets the value of "max-height"
- `set maxHeight=(String? value)`: Sets the value of "max-height"
- `String get maxWidth`: Gets the value of "max-width"
- `set maxWidth=(String? value)`: Sets the value of "max-width"
- `String get minHeight`: Gets the value of "min-height"
- `set minHeight=(String? value)`: Sets the value of "min-height"
- `String get minWidth`: Gets the value of "min-width"
- `set minWidth=(String? value)`: Sets the value of "min-width"
- `set outline=(String? value)`: Sets the value of "outline"
- `String get outline`: Gets the value of "outline"
- `String get outlineColor`: Gets the value of "outline-color"
- `set outlineColor=(String? value)`: Sets the value of "outline-color"
- `String get outlineStyle`: Gets the value of "outline-style"
- `set outlineStyle=(String? value)`: Sets the value of "outline-style"
- `String get outlineWidth`: Gets the value of "outline-width"
- `set outlineWidth=(String? value)`: Sets the value of "outline-width"
- `String get overflow`: Gets the value of "overflow"
- `set overflow=(String? value)`: Sets the value of "overflow"
- `String get padding`: Gets the value of "padding"
- `set padding=(String? value)`: Sets the value of "padding"
- `set paddingBottom=(String? value)`: Sets the value of "padding-bottom"
- `String get paddingBottom`: Gets the value of "padding-bottom"
- `set paddingLeft=(String? value)`: Sets the value of "padding-left"
- `String get paddingLeft`: Gets the value of "padding-left"
- `String get paddingRight`: Gets the value of "padding-right"
- `set paddingRight=(String? value)`: Sets the value of "padding-right"
- `String get paddingTop`: Gets the value of "padding-top"
- `set paddingTop=(String? value)`: Sets the value of "padding-top"
- `String get pageBreakAfter`: Gets the value of "page-break-after"
- `set pageBreakAfter=(String? value)`: Sets the value of "page-break-after"
- `set pageBreakBefore=(String? value)`: Sets the value of "page-break-before"
- `String get pageBreakBefore`: Gets the value of "page-break-before"
- `String get pageBreakInside`: Gets the value of "page-break-inside"
- `set pageBreakInside=(String? value)`: Sets the value of "page-break-inside"
- `CssRule? get parentRule`
- `String get position`: Gets the value of "position"
- `set position=(String? value)`: Sets the value of "position"
- `String get quotes`: Gets the value of "quotes"
- `set quotes=(String? value)`: Sets the value of "quotes"
- `String get right`: Gets the value of "right"
- `set right=(String? value)`: Sets the value of "right"
- static `bool get supportsTransitions`:
  Checks to see if CSS Transitions are supported.
- `String get tableLayout`: Gets the value of "table-layout"
- `set tableLayout=(String? value)`: Sets the value of "table-layout"
- `String get textAlign`: Gets the value of "text-align"
- `set textAlign=(String? value)`: Sets the value of "text-align"
- `String get textDecoration`: Gets the value of "text-decoration"
- `set textDecoration=(String? value)`: Sets the value of "text-decoration"
- `String get textIndent`: Gets the value of "text-indent"
- `set textIndent=(String? value)`: Sets the value of "text-indent"
- `String get textTransform`: Gets the value of "text-transform"
- `set textTransform=(String? value)`: Sets the value of "text-transform"
- `String get top`: Gets the value of "top"
- `set top=(String? value)`: Sets the value of "top"
- `String get unicodeBidi`: Gets the value of "unicode-bidi"
- `set unicodeBidi=(String? value)`: Sets the value of "unicode-bidi"
- `String get verticalAlign`: Gets the value of "vertical-align"
- `set verticalAlign=(String? value)`: Sets the value of "vertical-align"
- `String get visibility`: Gets the value of "visibility"
- `set visibility=(String? value)`: Sets the value of "visibility"
- `String get whiteSpace`: Gets the value of "white-space"
- `set whiteSpace=(String? value)`: Sets the value of "white-space"
- `String get width`: Gets the value of "width"
- `set width=(String? value)`: Sets the value of "width"
- `String get wordSpacing`: Gets the value of "word-spacing"
- `set wordSpacing=(String? value)`: Sets the value of "word-spacing"
- `String get zIndex`: Gets the value of "z-index"
- `set zIndex=(String? value)`: Sets the value of "z-index"
- `String getPropertyPriority(String property)`
- `String getPropertyValue(String propertyName)`:
  Returns the value of the property if the provided *CSS* property
  name is supported on this element and if the value is set. Otherwise
  returns an empty string.
- `String item(int index)`
- `String removeProperty(String property)`
- `void setProperty(String propertyName, String? value, [String? priority])`
- `bool supportsProperty(String propertyName)`:
  Returns true if the provided *CSS* property name is supported on this
  element.

## Class: CssStyleDeclarationBase

```dart
abstract mixin class CssStyleDeclarationBase { … }
```

- `String get alignContent`: Gets the value of "align-content"
- `set alignContent=(String value)`: Sets the value of "align-content"
- `String get alignItems`: Gets the value of "align-items"
- `set alignItems=(String value)`: Sets the value of "align-items"
- `String get alignSelf`: Gets the value of "align-self"
- `set alignSelf=(String value)`: Sets the value of "align-self"
- `String get animation`: Gets the value of "animation"
- `set animation=(String value)`: Sets the value of "animation"
- `String get animationDelay`: Gets the value of "animation-delay"
- `set animationDelay=(String value)`: Sets the value of "animation-delay"
- `String get animationDirection`: Gets the value of "animation-direction"
- `set animationDirection=(String value)`: Sets the value of "animation-direction"
- `String get animationDuration`: Gets the value of "animation-duration"
- `set animationDuration=(String value)`: Sets the value of "animation-duration"
- `String get animationFillMode`: Gets the value of "animation-fill-mode"
- `set animationFillMode=(String value)`: Sets the value of "animation-fill-mode"
- `String get animationIterationCount`:
  Gets the value of "animation-iteration-count"
- `set animationIterationCount=(String value)`:
  Sets the value of "animation-iteration-count"
- `String get animationName`: Gets the value of "animation-name"
- `set animationName=(String value)`: Sets the value of "animation-name"
- `String get animationPlayState`: Gets the value of "animation-play-state"
- `set animationPlayState=(String value)`:
  Sets the value of "animation-play-state"
- `String get animationTimingFunction`:
  Gets the value of "animation-timing-function"
- `set animationTimingFunction=(String value)`:
  Sets the value of "animation-timing-function"
- `set appRegion=(String value)`: Sets the value of "app-region"
- `String get appRegion`: Gets the value of "app-region"
- `set appearance=(String value)`: Sets the value of "appearance"
- `String get appearance`: Gets the value of "appearance"
- `String get aspectRatio`: Gets the value of "aspect-ratio"
- `set aspectRatio=(String value)`: Sets the value of "aspect-ratio"
- `String get backfaceVisibility`: Gets the value of "backface-visibility"
- `set backfaceVisibility=(String value)`: Sets the value of "backface-visibility"
- `String get background`: Gets the value of "background"
- `set background=(String value)`: Sets the value of "background"
- `String get backgroundAttachment`: Gets the value of "background-attachment"
- `set backgroundAttachment=(String value)`:
  Sets the value of "background-attachment"
- `String get backgroundBlendMode`: Gets the value of "background-blend-mode"
- `set backgroundBlendMode=(String value)`:
  Sets the value of "background-blend-mode"
- `String get backgroundClip`: Gets the value of "background-clip"
- `set backgroundClip=(String value)`: Sets the value of "background-clip"
- `String get backgroundColor`: Gets the value of "background-color"
- `set backgroundColor=(String value)`: Sets the value of "background-color"
- `String get backgroundComposite`: Gets the value of "background-composite"
- `set backgroundComposite=(String value)`:
  Sets the value of "background-composite"
- `String get backgroundImage`: Gets the value of "background-image"
- `set backgroundImage=(String value)`: Sets the value of "background-image"
- `String get backgroundOrigin`: Gets the value of "background-origin"
- `set backgroundOrigin=(String value)`: Sets the value of "background-origin"
- `String get backgroundPosition`: Gets the value of "background-position"
- `set backgroundPosition=(String value)`: Sets the value of "background-position"
- `String get backgroundPositionX`: Gets the value of "background-position-x"
- `set backgroundPositionX=(String value)`:
  Sets the value of "background-position-x"
- `String get backgroundPositionY`: Gets the value of "background-position-y"
- `set backgroundPositionY=(String value)`:
  Sets the value of "background-position-y"
- `String get backgroundRepeat`: Gets the value of "background-repeat"
- `set backgroundRepeat=(String value)`: Sets the value of "background-repeat"
- `String get backgroundRepeatX`: Gets the value of "background-repeat-x"
- `set backgroundRepeatX=(String value)`: Sets the value of "background-repeat-x"
- `String get backgroundRepeatY`: Gets the value of "background-repeat-y"
- `set backgroundRepeatY=(String value)`: Sets the value of "background-repeat-y"
- `String get backgroundSize`: Gets the value of "background-size"
- `set backgroundSize=(String value)`: Sets the value of "background-size"
- `String get border`: Gets the value of "border"
- `set border=(String value)`: Sets the value of "border"
- `String get borderAfter`: Gets the value of "border-after"
- `set borderAfter=(String value)`: Sets the value of "border-after"
- `String get borderAfterColor`: Gets the value of "border-after-color"
- `set borderAfterColor=(String value)`: Sets the value of "border-after-color"
- `String get borderAfterStyle`: Gets the value of "border-after-style"
- `set borderAfterStyle=(String value)`: Sets the value of "border-after-style"
- `String get borderAfterWidth`: Gets the value of "border-after-width"
- `set borderAfterWidth=(String value)`: Sets the value of "border-after-width"
- `String get borderBefore`: Gets the value of "border-before"
- `set borderBefore=(String value)`: Sets the value of "border-before"
- `String get borderBeforeColor`: Gets the value of "border-before-color"
- `set borderBeforeColor=(String value)`: Sets the value of "border-before-color"
- `String get borderBeforeStyle`: Gets the value of "border-before-style"
- `set borderBeforeStyle=(String value)`: Sets the value of "border-before-style"
- `String get borderBeforeWidth`: Gets the value of "border-before-width"
- `set borderBeforeWidth=(String value)`: Sets the value of "border-before-width"
- `String get borderBottom`: Gets the value of "border-bottom"
- `set borderBottom=(String value)`: Sets the value of "border-bottom"
- `String get borderBottomColor`: Gets the value of "border-bottom-color"
- `set borderBottomColor=(String value)`: Sets the value of "border-bottom-color"
- `String get borderBottomLeftRadius`:
  Gets the value of "border-bottom-left-radius"
- `set borderBottomLeftRadius=(String value)`:
  Sets the value of "border-bottom-left-radius"
- `String get borderBottomRightRadius`:
  Gets the value of "border-bottom-right-radius"
- `set borderBottomRightRadius=(String value)`:
  Sets the value of "border-bottom-right-radius"
- `String get borderBottomStyle`: Gets the value of "border-bottom-style"
- `set borderBottomStyle=(String value)`: Sets the value of "border-bottom-style"
- `String get borderBottomWidth`: Gets the value of "border-bottom-width"
- `set borderBottomWidth=(String value)`: Sets the value of "border-bottom-width"
- `String get borderCollapse`: Gets the value of "border-collapse"
- `set borderCollapse=(String value)`: Sets the value of "border-collapse"
- `String get borderColor`: Gets the value of "border-color"
- `set borderColor=(String value)`: Sets the value of "border-color"
- `String get borderEnd`: Gets the value of "border-end"
- `set borderEnd=(String value)`: Sets the value of "border-end"
- `String get borderEndColor`: Gets the value of "border-end-color"
- `set borderEndColor=(String value)`: Sets the value of "border-end-color"
- `String get borderEndStyle`: Gets the value of "border-end-style"
- `set borderEndStyle=(String value)`: Sets the value of "border-end-style"
- `String get borderEndWidth`: Gets the value of "border-end-width"
- `set borderEndWidth=(String value)`: Sets the value of "border-end-width"
- `String get borderFit`: Gets the value of "border-fit"
- `set borderFit=(String value)`: Sets the value of "border-fit"
- `String get borderHorizontalSpacing`:
  Gets the value of "border-horizontal-spacing"
- `set borderHorizontalSpacing=(String value)`:
  Sets the value of "border-horizontal-spacing"
- `String get borderImage`: Gets the value of "border-image"
- `set borderImage=(String value)`: Sets the value of "border-image"
- `String get borderImageOutset`: Gets the value of "border-image-outset"
- `set borderImageOutset=(String value)`: Sets the value of "border-image-outset"
- `String get borderImageRepeat`: Gets the value of "border-image-repeat"
- `set borderImageRepeat=(String value)`: Sets the value of "border-image-repeat"
- `String get borderImageSlice`: Gets the value of "border-image-slice"
- `set borderImageSlice=(String value)`: Sets the value of "border-image-slice"
- `String get borderImageSource`: Gets the value of "border-image-source"
- `set borderImageSource=(String value)`: Sets the value of "border-image-source"
- `String get borderImageWidth`: Gets the value of "border-image-width"
- `set borderImageWidth=(String value)`: Sets the value of "border-image-width"
- `String get borderLeft`: Gets the value of "border-left"
- `set borderLeft=(String value)`: Sets the value of "border-left"
- `String get borderLeftColor`: Gets the value of "border-left-color"
- `set borderLeftColor=(String value)`: Sets the value of "border-left-color"
- `String get borderLeftStyle`: Gets the value of "border-left-style"
- `set borderLeftStyle=(String value)`: Sets the value of "border-left-style"
- `String get borderLeftWidth`: Gets the value of "border-left-width"
- `set borderLeftWidth=(String value)`: Sets the value of "border-left-width"
- `String get borderRadius`: Gets the value of "border-radius"
- `set borderRadius=(String value)`: Sets the value of "border-radius"
- `String get borderRight`: Gets the value of "border-right"
- `set borderRight=(String value)`: Sets the value of "border-right"
- `String get borderRightColor`: Gets the value of "border-right-color"
- `set borderRightColor=(String value)`: Sets the value of "border-right-color"
- `String get borderRightStyle`: Gets the value of "border-right-style"
- `set borderRightStyle=(String value)`: Sets the value of "border-right-style"
- `String get borderRightWidth`: Gets the value of "border-right-width"
- `set borderRightWidth=(String value)`: Sets the value of "border-right-width"
- `String get borderSpacing`: Gets the value of "border-spacing"
- `set borderSpacing=(String value)`: Sets the value of "border-spacing"
- `String get borderStart`: Gets the value of "border-start"
- `set borderStart=(String value)`: Sets the value of "border-start"
- `String get borderStartColor`: Gets the value of "border-start-color"
- `set borderStartColor=(String value)`: Sets the value of "border-start-color"
- `String get borderStartStyle`: Gets the value of "border-start-style"
- `set borderStartStyle=(String value)`: Sets the value of "border-start-style"
- `String get borderStartWidth`: Gets the value of "border-start-width"
- `set borderStartWidth=(String value)`: Sets the value of "border-start-width"
- `String get borderStyle`: Gets the value of "border-style"
- `set borderStyle=(String value)`: Sets the value of "border-style"
- `String get borderTop`: Gets the value of "border-top"
- `set borderTop=(String value)`: Sets the value of "border-top"
- `String get borderTopColor`: Gets the value of "border-top-color"
- `set borderTopColor=(String value)`: Sets the value of "border-top-color"
- `String get borderTopLeftRadius`: Gets the value of "border-top-left-radius"
- `set borderTopLeftRadius=(String value)`:
  Sets the value of "border-top-left-radius"
- `String get borderTopRightRadius`: Gets the value of "border-top-right-radius"
- `set borderTopRightRadius=(String value)`:
  Sets the value of "border-top-right-radius"
- `String get borderTopStyle`: Gets the value of "border-top-style"
- `set borderTopStyle=(String value)`: Sets the value of "border-top-style"
- `String get borderTopWidth`: Gets the value of "border-top-width"
- `set borderTopWidth=(String value)`: Sets the value of "border-top-width"
- `String get borderVerticalSpacing`: Gets the value of "border-vertical-spacing"
- `set borderVerticalSpacing=(String value)`:
  Sets the value of "border-vertical-spacing"
- `String get borderWidth`: Gets the value of "border-width"
- `set borderWidth=(String value)`: Sets the value of "border-width"
- `String get bottom`: Gets the value of "bottom"
- `set bottom=(String value)`: Sets the value of "bottom"
- `String get boxAlign`: Gets the value of "box-align"
- `set boxAlign=(String value)`: Sets the value of "box-align"
- `String get boxDecorationBreak`: Gets the value of "box-decoration-break"
- `set boxDecorationBreak=(String value)`:
  Sets the value of "box-decoration-break"
- `String get boxDirection`: Gets the value of "box-direction"
- `set boxDirection=(String value)`: Sets the value of "box-direction"
- `String get boxFlex`: Gets the value of "box-flex"
- `set boxFlex=(String value)`: Sets the value of "box-flex"
- `String get boxFlexGroup`: Gets the value of "box-flex-group"
- `set boxFlexGroup=(String value)`: Sets the value of "box-flex-group"
- `String get boxLines`: Gets the value of "box-lines"
- `set boxLines=(String value)`: Sets the value of "box-lines"
- `String get boxOrdinalGroup`: Gets the value of "box-ordinal-group"
- `set boxOrdinalGroup=(String value)`: Sets the value of "box-ordinal-group"
- `String get boxOrient`: Gets the value of "box-orient"
- `set boxOrient=(String value)`: Sets the value of "box-orient"
- `String get boxPack`: Gets the value of "box-pack"
- `set boxPack=(String value)`: Sets the value of "box-pack"
- `String get boxReflect`: Gets the value of "box-reflect"
- `set boxReflect=(String value)`: Sets the value of "box-reflect"
- `String get boxShadow`: Gets the value of "box-shadow"
- `set boxShadow=(String value)`: Sets the value of "box-shadow"
- `String get boxSizing`: Gets the value of "box-sizing"
- `set boxSizing=(String value)`: Sets the value of "box-sizing"
- `String get captionSide`: Gets the value of "caption-side"
- `set captionSide=(String value)`: Sets the value of "caption-side"
- `String get clear`: Gets the value of "clear"
- `set clear=(String value)`: Sets the value of "clear"
- `String get clip`: Gets the value of "clip"
- `set clip=(String value)`: Sets the value of "clip"
- `String get clipPath`: Gets the value of "clip-path"
- `set clipPath=(String value)`: Sets the value of "clip-path"
- `String get color`: Gets the value of "color"
- `set color=(String value)`: Sets the value of "color"
- `String get columnBreakAfter`: Gets the value of "column-break-after"
- `set columnBreakAfter=(String value)`: Sets the value of "column-break-after"
- `String get columnBreakBefore`: Gets the value of "column-break-before"
- `set columnBreakBefore=(String value)`: Sets the value of "column-break-before"
- `String get columnBreakInside`: Gets the value of "column-break-inside"
- `set columnBreakInside=(String value)`: Sets the value of "column-break-inside"
- `String get columnCount`: Gets the value of "column-count"
- `set columnCount=(String value)`: Sets the value of "column-count"
- `String get columnFill`: Gets the value of "column-fill"
- `set columnFill=(String value)`: Sets the value of "column-fill"
- `String get columnGap`: Gets the value of "column-gap"
- `set columnGap=(String value)`: Sets the value of "column-gap"
- `String get columnRule`: Gets the value of "column-rule"
- `set columnRule=(String value)`: Sets the value of "column-rule"
- `String get columnRuleColor`: Gets the value of "column-rule-color"
- `set columnRuleColor=(String value)`: Sets the value of "column-rule-color"
- `String get columnRuleStyle`: Gets the value of "column-rule-style"
- `set columnRuleStyle=(String value)`: Sets the value of "column-rule-style"
- `String get columnRuleWidth`: Gets the value of "column-rule-width"
- `set columnRuleWidth=(String value)`: Sets the value of "column-rule-width"
- `String get columnSpan`: Gets the value of "column-span"
- `set columnSpan=(String value)`: Sets the value of "column-span"
- `String get columnWidth`: Gets the value of "column-width"
- `set columnWidth=(String value)`: Sets the value of "column-width"
- `String get columns`: Gets the value of "columns"
- `set columns=(String value)`: Sets the value of "columns"
- `String get content`: Gets the value of "content"
- `set content=(String value)`: Sets the value of "content"
- `String get counterIncrement`: Gets the value of "counter-increment"
- `set counterIncrement=(String value)`: Sets the value of "counter-increment"
- `String get counterReset`: Gets the value of "counter-reset"
- `set counterReset=(String value)`: Sets the value of "counter-reset"
- `String get cursor`: Gets the value of "cursor"
- `set cursor=(String value)`: Sets the value of "cursor"
- `String get direction`: Gets the value of "direction"
- `set direction=(String value)`: Sets the value of "direction"
- `String get display`: Gets the value of "display"
- `set display=(String value)`: Sets the value of "display"
- `String get emptyCells`: Gets the value of "empty-cells"
- `set emptyCells=(String value)`: Sets the value of "empty-cells"
- `String get filter`: Gets the value of "filter"
- `set filter=(String value)`: Sets the value of "filter"
- `String get flex`: Gets the value of "flex"
- `set flex=(String value)`: Sets the value of "flex"
- `String get flexBasis`: Gets the value of "flex-basis"
- `set flexBasis=(String value)`: Sets the value of "flex-basis"
- `String get flexDirection`: Gets the value of "flex-direction"
- `set flexDirection=(String value)`: Sets the value of "flex-direction"
- `String get flexFlow`: Gets the value of "flex-flow"
- `set flexFlow=(String value)`: Sets the value of "flex-flow"
- `String get flexGrow`: Gets the value of "flex-grow"
- `set flexGrow=(String value)`: Sets the value of "flex-grow"
- `String get flexShrink`: Gets the value of "flex-shrink"
- `set flexShrink=(String value)`: Sets the value of "flex-shrink"
- `String get flexWrap`: Gets the value of "flex-wrap"
- `set flexWrap=(String value)`: Sets the value of "flex-wrap"
- `String get float`: Gets the value of "float"
- `set float=(String value)`: Sets the value of "float"
- `String get font`: Gets the value of "font"
- `set font=(String value)`: Sets the value of "font"
- `String get fontFamily`: Gets the value of "font-family"
- `set fontFamily=(String value)`: Sets the value of "font-family"
- `String get fontFeatureSettings`: Gets the value of "font-feature-settings"
- `set fontFeatureSettings=(String value)`:
  Sets the value of "font-feature-settings"
- `String get fontKerning`: Gets the value of "font-kerning"
- `set fontKerning=(String value)`: Sets the value of "font-kerning"
- `String get fontSize`: Gets the value of "font-size"
- `set fontSize=(String value)`: Sets the value of "font-size"
- `String get fontSizeDelta`: Gets the value of "font-size-delta"
- `set fontSizeDelta=(String value)`: Sets the value of "font-size-delta"
- `String get fontSmoothing`: Gets the value of "font-smoothing"
- `set fontSmoothing=(String value)`: Sets the value of "font-smoothing"
- `String get fontStretch`: Gets the value of "font-stretch"
- `set fontStretch=(String value)`: Sets the value of "font-stretch"
- `String get fontStyle`: Gets the value of "font-style"
- `set fontStyle=(String value)`: Sets the value of "font-style"
- `String get fontVariant`: Gets the value of "font-variant"
- `set fontVariant=(String value)`: Sets the value of "font-variant"
- `String get fontVariantLigatures`: Gets the value of "font-variant-ligatures"
- `set fontVariantLigatures=(String value)`:
  Sets the value of "font-variant-ligatures"
- `String get fontWeight`: Gets the value of "font-weight"
- `set fontWeight=(String value)`: Sets the value of "font-weight"
- `String get gap`: Gets the value of "gap"
- `set gap=(String value)`: Sets the value of "gap"
- `String get grid`: Gets the value of "grid"
- `set grid=(String value)`: Sets the value of "grid"
- `String get gridArea`: Gets the value of "grid-area"
- `set gridArea=(String value)`: Sets the value of "grid-area"
- `String get gridAutoColumns`: Gets the value of "grid-auto-columns"
- `set gridAutoColumns=(String value)`: Sets the value of "grid-auto-columns"
- `String get gridAutoFlow`: Gets the value of "grid-auto-flow"
- `set gridAutoFlow=(String value)`: Sets the value of "grid-auto-flow"
- `String get gridAutoRows`: Gets the value of "grid-auto-rows"
- `set gridAutoRows=(String value)`: Sets the value of "grid-auto-rows"
- `String get gridColumn`: Gets the value of "grid-column"
- `set gridColumn=(String value)`: Sets the value of "grid-column"
- `String get gridColumnEnd`: Gets the value of "grid-column-end"
- `set gridColumnEnd=(String value)`: Sets the value of "grid-column-end"
- `String get gridColumnStart`: Gets the value of "grid-column-start"
- `set gridColumnStart=(String value)`: Sets the value of "grid-column-start"
- `String get gridRow`: Gets the value of "grid-row"
- `set gridRow=(String value)`: Sets the value of "grid-row"
- `set gridRowEnd=(String value)`: Sets the value of "grid-row-end"
- `String get gridRowEnd`: Gets the value of "grid-row-end"
- `String get gridRowStart`: Gets the value of "grid-row-start"
- `set gridRowStart=(String value)`: Sets the value of "grid-row-start"
- `String get gridTemplate`: Gets the value of "grid-template"
- `set gridTemplate=(String value)`: Sets the value of "grid-template"
- `String get gridTemplateAreas`: Gets the value of "grid-template-areas"
- `set gridTemplateAreas=(String value)`: Sets the value of "grid-template-areas"
- `String get gridTemplateColumns`: Gets the value of "grid-template-columns"
- `set gridTemplateColumns=(String value)`:
  Sets the value of "grid-template-columns"
- `String get gridTemplateRows`: Gets the value of "grid-template-rows"
- `set gridTemplateRows=(String value)`: Sets the value of "grid-template-rows"
- `String get height`: Gets the value of "height"
- `set height=(String value)`: Sets the value of "height"
- `String get highlight`: Gets the value of "highlight"
- `set highlight=(String value)`: Sets the value of "highlight"
- `String get hyphenateCharacter`: Gets the value of "hyphenate-character"
- `set hyphenateCharacter=(String value)`: Sets the value of "hyphenate-character"
- `String get imageRendering`: Gets the value of "image-rendering"
- `set imageRendering=(String value)`: Sets the value of "image-rendering"
- `String get isolation`: Gets the value of "isolation"
- `set isolation=(String value)`: Sets the value of "isolation"
- `String get justifyContent`: Gets the value of "justify-content"
- `set justifyContent=(String value)`: Sets the value of "justify-content"
- `String get justifySelf`: Gets the value of "justify-self"
- `set justifySelf=(String value)`: Sets the value of "justify-self"
- `String get left`: Gets the value of "left"
- `set left=(String value)`: Sets the value of "left"
- `String get letterSpacing`: Gets the value of "letter-spacing"
- `set letterSpacing=(String value)`: Sets the value of "letter-spacing"
- `String get lineBoxContain`: Gets the value of "line-box-contain"
- `set lineBoxContain=(String value)`: Sets the value of "line-box-contain"
- `String get lineBreak`: Gets the value of "line-break"
- `set lineBreak=(String value)`: Sets the value of "line-break"
- `String get lineClamp`: Gets the value of "line-clamp"
- `set lineClamp=(String value)`: Sets the value of "line-clamp"
- `String get lineHeight`: Gets the value of "line-height"
- `set lineHeight=(String value)`: Sets the value of "line-height"
- `String get listStyle`: Gets the value of "list-style"
- `set listStyle=(String value)`: Sets the value of "list-style"
- `String get listStyleImage`: Gets the value of "list-style-image"
- `set listStyleImage=(String value)`: Sets the value of "list-style-image"
- `String get listStylePosition`: Gets the value of "list-style-position"
- `set listStylePosition=(String value)`: Sets the value of "list-style-position"
- `String get listStyleType`: Gets the value of "list-style-type"
- `set listStyleType=(String value)`: Sets the value of "list-style-type"
- `String get locale`: Gets the value of "locale"
- `set locale=(String value)`: Sets the value of "locale"
- `String get logicalHeight`: Gets the value of "logical-height"
- `set logicalHeight=(String value)`: Sets the value of "logical-height"
- `String get logicalWidth`: Gets the value of "logical-width"
- `set logicalWidth=(String value)`: Sets the value of "logical-width"
- `String get margin`: Gets the value of "margin"
- `set margin=(String value)`: Sets the value of "margin"
- `String get marginAfter`: Gets the value of "margin-after"
- `set marginAfter=(String value)`: Sets the value of "margin-after"
- `String get marginAfterCollapse`: Gets the value of "margin-after-collapse"
- `set marginAfterCollapse=(String value)`:
  Sets the value of "margin-after-collapse"
- `String get marginBefore`: Gets the value of "margin-before"
- `set marginBefore=(String value)`: Sets the value of "margin-before"
- `String get marginBeforeCollapse`: Gets the value of "margin-before-collapse"
- `set marginBeforeCollapse=(String value)`:
  Sets the value of "margin-before-collapse"
- `String get marginBottom`: Gets the value of "margin-bottom"
- `set marginBottom=(String value)`: Sets the value of "margin-bottom"
- `String get marginBottomCollapse`: Gets the value of "margin-bottom-collapse"
- `set marginBottomCollapse=(String value)`:
  Sets the value of "margin-bottom-collapse"
- `String get marginCollapse`: Gets the value of "margin-collapse"
- `set marginCollapse=(String value)`: Sets the value of "margin-collapse"
- `String get marginEnd`: Gets the value of "margin-end"
- `set marginEnd=(String value)`: Sets the value of "margin-end"
- `String get marginLeft`: Gets the value of "margin-left"
- `set marginLeft=(String value)`: Sets the value of "margin-left"
- `String get marginRight`: Gets the value of "margin-right"
- `set marginRight=(String value)`: Sets the value of "margin-right"
- `String get marginStart`: Gets the value of "margin-start"
- `set marginStart=(String value)`: Sets the value of "margin-start"
- `set marginTop=(String value)`: Sets the value of "margin-top"
- `String get marginTop`: Gets the value of "margin-top"
- `String get marginTopCollapse`: Gets the value of "margin-top-collapse"
- `set marginTopCollapse=(String value)`: Sets the value of "margin-top-collapse"
- `String get mask`: Gets the value of "mask"
- `set mask=(String value)`: Sets the value of "mask"
- `String get maskBoxImage`: Gets the value of "mask-box-image"
- `set maskBoxImage=(String value)`: Sets the value of "mask-box-image"
- `String get maskBoxImageOutset`: Gets the value of "mask-box-image-outset"
- `set maskBoxImageOutset=(String value)`:
  Sets the value of "mask-box-image-outset"
- `String get maskBoxImageRepeat`: Gets the value of "mask-box-image-repeat"
- `set maskBoxImageRepeat=(String value)`:
  Sets the value of "mask-box-image-repeat"
- `String get maskBoxImageSlice`: Gets the value of "mask-box-image-slice"
- `set maskBoxImageSlice=(String value)`: Sets the value of "mask-box-image-slice"
- `String get maskBoxImageSource`: Gets the value of "mask-box-image-source"
- `set maskBoxImageSource=(String value)`:
  Sets the value of "mask-box-image-source"
- `String get maskBoxImageWidth`: Gets the value of "mask-box-image-width"
- `set maskBoxImageWidth=(String value)`: Sets the value of "mask-box-image-width"
- `String get maskClip`: Gets the value of "mask-clip"
- `set maskClip=(String value)`: Sets the value of "mask-clip"
- `String get maskComposite`: Gets the value of "mask-composite"
- `set maskComposite=(String value)`: Sets the value of "mask-composite"
- `String get maskImage`: Gets the value of "mask-image"
- `set maskImage=(String value)`: Sets the value of "mask-image"
- `String get maskOrigin`: Gets the value of "mask-origin"
- `set maskOrigin=(String value)`: Sets the value of "mask-origin"
- `set maskPosition=(String value)`: Sets the value of "mask-position"
- `String get maskPosition`: Gets the value of "mask-position"
- `String get maskPositionX`: Gets the value of "mask-position-x"
- `set maskPositionX=(String value)`: Sets the value of "mask-position-x"
- `String get maskPositionY`: Gets the value of "mask-position-y"
- `set maskPositionY=(String value)`: Sets the value of "mask-position-y"
- `String get maskRepeat`: Gets the value of "mask-repeat"
- `set maskRepeat=(String value)`: Sets the value of "mask-repeat"
- `String get maskRepeatX`: Gets the value of "mask-repeat-x"
- `set maskRepeatX=(String value)`: Sets the value of "mask-repeat-x"
- `String get maskRepeatY`: Gets the value of "mask-repeat-y"
- `set maskRepeatY=(String value)`: Sets the value of "mask-repeat-y"
- `String get maskSize`: Gets the value of "mask-size"
- `set maskSize=(String value)`: Sets the value of "mask-size"
- `String get maskSourceType`: Gets the value of "mask-source-type"
- `set maskSourceType=(String value)`: Sets the value of "mask-source-type"
- `String get maxHeight`: Gets the value of "max-height"
- `set maxHeight=(String value)`: Sets the value of "max-height"
- `String get maxLogicalHeight`: Gets the value of "max-logical-height"
- `set maxLogicalHeight=(String value)`: Sets the value of "max-logical-height"
- `String get maxLogicalWidth`: Gets the value of "max-logical-width"
- `set maxLogicalWidth=(String value)`: Sets the value of "max-logical-width"
- `String get maxWidth`: Gets the value of "max-width"
- `set maxWidth=(String value)`: Sets the value of "max-width"
- `String get maxZoom`: Gets the value of "max-zoom"
- `set maxZoom=(String value)`: Sets the value of "max-zoom"
- `set minHeight=(String value)`: Sets the value of "min-height"
- `String get minHeight`: Gets the value of "min-height"
- `String get minLogicalHeight`: Gets the value of "min-logical-height"
- `set minLogicalHeight=(String value)`: Sets the value of "min-logical-height"
- `String get minLogicalWidth`: Gets the value of "min-logical-width"
- `set minLogicalWidth=(String value)`: Sets the value of "min-logical-width"
- `String get minWidth`: Gets the value of "min-width"
- `set minWidth=(String value)`: Sets the value of "min-width"
- `String get minZoom`: Gets the value of "min-zoom"
- `set minZoom=(String value)`: Sets the value of "min-zoom"
- `String get mixBlendMode`: Gets the value of "mix-blend-mode"
- `set mixBlendMode=(String value)`: Sets the value of "mix-blend-mode"
- `String get objectFit`: Gets the value of "object-fit"
- `set objectFit=(String value)`: Sets the value of "object-fit"
- `String get objectPosition`: Gets the value of "object-position"
- `set objectPosition=(String value)`: Sets the value of "object-position"
- `String get opacity`: Gets the value of "opacity"
- `set opacity=(String value)`: Sets the value of "opacity"
- `String get order`: Gets the value of "order"
- `set order=(String value)`: Sets the value of "order"
- `String get orientation`: Gets the value of "orientation"
- `set orientation=(String value)`: Sets the value of "orientation"
- `String get orphans`: Gets the value of "orphans"
- `set orphans=(String value)`: Sets the value of "orphans"
- `String get outline`: Gets the value of "outline"
- `set outline=(String value)`: Sets the value of "outline"
- `String get outlineColor`: Gets the value of "outline-color"
- `set outlineColor=(String value)`: Sets the value of "outline-color"
- `String get outlineOffset`: Gets the value of "outline-offset"
- `set outlineOffset=(String value)`: Sets the value of "outline-offset"
- `String get outlineStyle`: Gets the value of "outline-style"
- `set outlineStyle=(String value)`: Sets the value of "outline-style"
- `String get outlineWidth`: Gets the value of "outline-width"
- `set outlineWidth=(String value)`: Sets the value of "outline-width"
- `String get overflow`: Gets the value of "overflow"
- `set overflow=(String value)`: Sets the value of "overflow"
- `String get overflowWrap`: Gets the value of "overflow-wrap"
- `set overflowWrap=(String value)`: Sets the value of "overflow-wrap"
- `String get overflowX`: Gets the value of "overflow-x"
- `set overflowX=(String value)`: Sets the value of "overflow-x"
- `String get overflowY`: Gets the value of "overflow-y"
- `set overflowY=(String value)`: Sets the value of "overflow-y"
- `String get padding`: Gets the value of "padding"
- `set padding=(String value)`: Sets the value of "padding"
- `String get paddingAfter`: Gets the value of "padding-after"
- `set paddingAfter=(String value)`: Sets the value of "padding-after"
- `String get paddingBefore`: Gets the value of "padding-before"
- `set paddingBefore=(String value)`: Sets the value of "padding-before"
- `String get paddingBottom`: Gets the value of "padding-bottom"
- `set paddingBottom=(String value)`: Sets the value of "padding-bottom"
- `set paddingEnd=(String value)`: Sets the value of "padding-end"
- `String get paddingEnd`: Gets the value of "padding-end"
- `set paddingLeft=(String value)`: Sets the value of "padding-left"
- `String get paddingLeft`: Gets the value of "padding-left"
- `String get paddingRight`: Gets the value of "padding-right"
- `set paddingRight=(String value)`: Sets the value of "padding-right"
- `String get paddingStart`: Gets the value of "padding-start"
- `set paddingStart=(String value)`: Sets the value of "padding-start"
- `String get paddingTop`: Gets the value of "padding-top"
- `set paddingTop=(String value)`: Sets the value of "padding-top"
- `String get page`: Gets the value of "page"
- `set page=(String value)`: Sets the value of "page"
- `String get pageBreakAfter`: Gets the value of "page-break-after"
- `set pageBreakAfter=(String value)`: Sets the value of "page-break-after"
- `String get pageBreakBefore`: Gets the value of "page-break-before"
- `set pageBreakBefore=(String value)`: Sets the value of "page-break-before"
- `String get pageBreakInside`: Gets the value of "page-break-inside"
- `set pageBreakInside=(String value)`: Sets the value of "page-break-inside"
- `String get perspective`: Gets the value of "perspective"
- `set perspective=(String value)`: Sets the value of "perspective"
- `String get perspectiveOrigin`: Gets the value of "perspective-origin"
- `set perspectiveOrigin=(String value)`: Sets the value of "perspective-origin"
- `String get perspectiveOriginX`: Gets the value of "perspective-origin-x"
- `set perspectiveOriginX=(String value)`:
  Sets the value of "perspective-origin-x"
- `String get perspectiveOriginY`: Gets the value of "perspective-origin-y"
- `set perspectiveOriginY=(String value)`:
  Sets the value of "perspective-origin-y"
- `String get pointerEvents`: Gets the value of "pointer-events"
- `set pointerEvents=(String value)`: Sets the value of "pointer-events"
- `String get position`: Gets the value of "position"
- `set position=(String value)`: Sets the value of "position"
- `String get printColorAdjust`: Gets the value of "print-color-adjust"
- `set printColorAdjust=(String value)`: Sets the value of "print-color-adjust"
- `String get quotes`: Gets the value of "quotes"
- `set quotes=(String value)`: Sets the value of "quotes"
- `String get resize`: Gets the value of "resize"
- `set resize=(String value)`: Sets the value of "resize"
- `String get right`: Gets the value of "right"
- `set right=(String value)`: Sets the value of "right"
- `String get rowGap`: Gets the value of "row-gap"
- `set rowGap=(String value)`: Sets the value of "row-gap"
- `String get rtlOrdering`: Gets the value of "rtl-ordering"
- `set rtlOrdering=(String value)`: Sets the value of "rtl-ordering"
- `String get rubyPosition`: Gets the value of "ruby-position"
- `set rubyPosition=(String value)`: Sets the value of "ruby-position"
- `String get scrollBehavior`: Gets the value of "scroll-behavior"
- `set scrollBehavior=(String value)`: Sets the value of "scroll-behavior"
- `String get shapeImageThreshold`: Gets the value of "shape-image-threshold"
- `set shapeImageThreshold=(String value)`:
  Sets the value of "shape-image-threshold"
- `String get shapeMargin`: Gets the value of "shape-margin"
- `set shapeMargin=(String value)`: Sets the value of "shape-margin"
- `String get shapeOutside`: Gets the value of "shape-outside"
- `set shapeOutside=(String value)`: Sets the value of "shape-outside"
- `String get size`: Gets the value of "size"
- `set size=(String value)`: Sets the value of "size"
- `String get speak`: Gets the value of "speak"
- `set speak=(String value)`: Sets the value of "speak"
- `String get src`: Gets the value of "src"
- `set src=(String value)`: Sets the value of "src"
- `String get tabSize`: Gets the value of "tab-size"
- `set tabSize=(String value)`: Sets the value of "tab-size"
- `String get tableLayout`: Gets the value of "table-layout"
- `set tableLayout=(String value)`: Sets the value of "table-layout"
- `String get tapHighlightColor`: Gets the value of "tap-highlight-color"
- `set tapHighlightColor=(String value)`: Sets the value of "tap-highlight-color"
- `String get textAlign`: Gets the value of "text-align"
- `set textAlign=(String value)`: Sets the value of "text-align"
- `String get textAlignLast`: Gets the value of "text-align-last"
- `set textAlignLast=(String value)`: Sets the value of "text-align-last"
- `String get textCombine`: Gets the value of "text-combine"
- `set textCombine=(String value)`: Sets the value of "text-combine"
- `String get textDecoration`: Gets the value of "text-decoration"
- `set textDecoration=(String value)`: Sets the value of "text-decoration"
- `String get textDecorationColor`: Gets the value of "text-decoration-color"
- `set textDecorationColor=(String value)`:
  Sets the value of "text-decoration-color"
- `String get textDecorationLine`: Gets the value of "text-decoration-line"
- `set textDecorationLine=(String value)`:
  Sets the value of "text-decoration-line"
- `set textDecorationStyle=(String value)`:
  Sets the value of "text-decoration-style"
- `String get textDecorationStyle`: Gets the value of "text-decoration-style"
- `String get textDecorationsInEffect`:
  Gets the value of "text-decorations-in-effect"
- `set textDecorationsInEffect=(String value)`:
  Sets the value of "text-decorations-in-effect"
- `String get textEmphasis`: Gets the value of "text-emphasis"
- `set textEmphasis=(String value)`: Sets the value of "text-emphasis"
- `String get textEmphasisColor`: Gets the value of "text-emphasis-color"
- `set textEmphasisColor=(String value)`: Sets the value of "text-emphasis-color"
- `String get textEmphasisPosition`: Gets the value of "text-emphasis-position"
- `set textEmphasisPosition=(String value)`:
  Sets the value of "text-emphasis-position"
- `String get textEmphasisStyle`: Gets the value of "text-emphasis-style"
- `set textEmphasisStyle=(String value)`: Sets the value of "text-emphasis-style"
- `String get textFillColor`: Gets the value of "text-fill-color"
- `set textFillColor=(String value)`: Sets the value of "text-fill-color"
- `String get textIndent`: Gets the value of "text-indent"
- `set textIndent=(String value)`: Sets the value of "text-indent"
- `String get textJustify`: Gets the value of "text-justify"
- `set textJustify=(String value)`: Sets the value of "text-justify"
- `String get textLineThroughColor`: Gets the value of "text-line-through-color"
- `set textLineThroughColor=(String value)`:
  Sets the value of "text-line-through-color"
- `String get textLineThroughMode`: Gets the value of "text-line-through-mode"
- `set textLineThroughMode=(String value)`:
  Sets the value of "text-line-through-mode"
- `String get textLineThroughStyle`: Gets the value of "text-line-through-style"
- `set textLineThroughStyle=(String value)`:
  Sets the value of "text-line-through-style"
- `String get textLineThroughWidth`: Gets the value of "text-line-through-width"
- `set textLineThroughWidth=(String value)`:
  Sets the value of "text-line-through-width"
- `set textOrientation=(String value)`: Sets the value of "text-orientation"
- `String get textOrientation`: Gets the value of "text-orientation"
- `set textOverflow=(String value)`: Sets the value of "text-overflow"
- `String get textOverflow`: Gets the value of "text-overflow"
- `String get textOverlineColor`: Gets the value of "text-overline-color"
- `set textOverlineColor=(String value)`: Sets the value of "text-overline-color"
- `String get textOverlineMode`: Gets the value of "text-overline-mode"
- `set textOverlineMode=(String value)`: Sets the value of "text-overline-mode"
- `String get textOverlineStyle`: Gets the value of "text-overline-style"
- `set textOverlineStyle=(String value)`: Sets the value of "text-overline-style"
- `String get textOverlineWidth`: Gets the value of "text-overline-width"
- `set textOverlineWidth=(String value)`: Sets the value of "text-overline-width"
- `String get textRendering`: Gets the value of "text-rendering"
- `set textRendering=(String value)`: Sets the value of "text-rendering"
- `String get textSecurity`: Gets the value of "text-security"
- `set textSecurity=(String value)`: Sets the value of "text-security"
- `String get textShadow`: Gets the value of "text-shadow"
- `set textShadow=(String value)`: Sets the value of "text-shadow"
- `String get textStroke`: Gets the value of "text-stroke"
- `set textStroke=(String value)`: Sets the value of "text-stroke"
- `String get textStrokeColor`: Gets the value of "text-stroke-color"
- `set textStrokeColor=(String value)`: Sets the value of "text-stroke-color"
- `String get textStrokeWidth`: Gets the value of "text-stroke-width"
- `set textStrokeWidth=(String value)`: Sets the value of "text-stroke-width"
- `String get textTransform`: Gets the value of "text-transform"
- `set textTransform=(String value)`: Sets the value of "text-transform"
- `set textUnderlineColor=(String value)`:
  Sets the value of "text-underline-color"
- `String get textUnderlineColor`: Gets the value of "text-underline-color"
- `set textUnderlineMode=(String value)`: Sets the value of "text-underline-mode"
- `String get textUnderlineMode`: Gets the value of "text-underline-mode"
- `String get textUnderlinePosition`: Gets the value of "text-underline-position"
- `set textUnderlinePosition=(String value)`:
  Sets the value of "text-underline-position"
- `String get textUnderlineStyle`: Gets the value of "text-underline-style"
- `set textUnderlineStyle=(String value)`:
  Sets the value of "text-underline-style"
- `String get textUnderlineWidth`: Gets the value of "text-underline-width"
- `set textUnderlineWidth=(String value)`:
  Sets the value of "text-underline-width"
- `String get top`: Gets the value of "top"
- `set top=(String value)`: Sets the value of "top"
- `String get touchAction`: Gets the value of "touch-action"
- `set touchAction=(String value)`: Sets the value of "touch-action"
- `String get touchActionDelay`: Gets the value of "touch-action-delay"
- `set touchActionDelay=(String value)`: Sets the value of "touch-action-delay"
- `String get transform`: Gets the value of "transform"
- `set transform=(String value)`: Sets the value of "transform"
- `String get transformOrigin`: Gets the value of "transform-origin"
- `set transformOrigin=(String value)`: Sets the value of "transform-origin"
- `String get transformOriginX`: Gets the value of "transform-origin-x"
- `set transformOriginX=(String value)`: Sets the value of "transform-origin-x"
- `String get transformOriginY`: Gets the value of "transform-origin-y"
- `set transformOriginY=(String value)`: Sets the value of "transform-origin-y"
- `String get transformOriginZ`: Gets the value of "transform-origin-z"
- `set transformOriginZ=(String value)`: Sets the value of "transform-origin-z"
- `set transformStyle=(String value)`: Sets the value of "transform-style"
- `String get transformStyle`: Gets the value of "transform-style"
- `set transition=(String value)`: Sets the value of "transition"
- `String get transition`: Gets the value of "transition"
- `String get transitionDelay`: Gets the value of "transition-delay"
- `set transitionDelay=(String value)`: Sets the value of "transition-delay"
- `String get transitionDuration`: Gets the value of "transition-duration"
- `set transitionDuration=(String value)`: Sets the value of "transition-duration"
- `String get transitionProperty`: Gets the value of "transition-property"
- `set transitionProperty=(String value)`: Sets the value of "transition-property"
- `String get transitionTimingFunction`:
  Gets the value of "transition-timing-function"
- `set transitionTimingFunction=(String value)`:
  Sets the value of "transition-timing-function"
- `String get unicodeBidi`: Gets the value of "unicode-bidi"
- `set unicodeBidi=(String value)`: Sets the value of "unicode-bidi"
- `String get unicodeRange`: Gets the value of "unicode-range"
- `set unicodeRange=(String value)`: Sets the value of "unicode-range"
- `String get userDrag`: Gets the value of "user-drag"
- `set userDrag=(String value)`: Sets the value of "user-drag"
- `String get userModify`: Gets the value of "user-modify"
- `set userModify=(String value)`: Sets the value of "user-modify"
- `String get userSelect`: Gets the value of "user-select"
- `set userSelect=(String value)`: Sets the value of "user-select"
- `String get userZoom`: Gets the value of "user-zoom"
- `set userZoom=(String value)`: Sets the value of "user-zoom"
- `String get verticalAlign`: Gets the value of "vertical-align"
- `set verticalAlign=(String value)`: Sets the value of "vertical-align"
- `String get visibility`: Gets the value of "visibility"
- `set visibility=(String value)`: Sets the value of "visibility"
- `String get whiteSpace`: Gets the value of "white-space"
- `set whiteSpace=(String value)`: Sets the value of "white-space"
- `String get widows`: Gets the value of "widows"
- `set widows=(String value)`: Sets the value of "widows"
- `String get width`: Gets the value of "width"
- `set width=(String value)`: Sets the value of "width"
- `String get willChange`: Gets the value of "will-change"
- `set willChange=(String value)`: Sets the value of "will-change"
- `String get wordBreak`: Gets the value of "word-break"
- `set wordBreak=(String value)`: Sets the value of "word-break"
- `String get wordSpacing`: Gets the value of "word-spacing"
- `set wordSpacing=(String value)`: Sets the value of "word-spacing"
- `String get wordWrap`: Gets the value of "word-wrap"
- `set wordWrap=(String value)`: Sets the value of "word-wrap"
- `String get wrapFlow`: Gets the value of "wrap-flow"
- `set wrapFlow=(String value)`: Sets the value of "wrap-flow"
- `String get wrapThrough`: Gets the value of "wrap-through"
- `set wrapThrough=(String value)`: Sets the value of "wrap-through"
- `String get writingMode`: Gets the value of "writing-mode"
- `set writingMode=(String value)`: Sets the value of "writing-mode"
- `String get zIndex`: Gets the value of "z-index"
- `set zIndex=(String value)`: Sets the value of "z-index"
- `String get zoom`: Gets the value of "zoom"
- `set zoom=(String value)`: Sets the value of "zoom"
- `String getPropertyValue(String propertyName)`
- `void setProperty(String propertyName, String? value, [String? priority])`

## Class: CssStyleRule

```dart
class CssStyleRule extends CssRule { … }
```

- `String get selectorText`
- `set selectorText=(String value)`
- `CssStyleDeclaration get style`

## Class: CssStyleSheet

```dart
class CssStyleSheet extends StyleSheet { … }
```

- `List<CssRule> get cssRules`
- `CssRule? get ownerRule`
- `List<CssRule>? get rules`
- `int addRule(String? selector, String? style, [int? index])`
- `void deleteRule(int index)`
- `int insertRule(String rule, [int? index])`
- `void removeRule(int? index)`

## Class: CssStyleValue

```dart
class CssStyleValue extends JavaScriptObject { … }
```

- static `Object? parse(String property, String cssText)`

## Class: CssSupportsRule

```dart
class CssSupportsRule extends CssConditionRule { … }
```

## Class: CssTransformComponent

```dart
class CssTransformComponent extends JavaScriptObject { … }
```

- `bool? get is2D`
- `set is2D=(bool? value)`

## Class: CssTransformValue

```dart
class CssTransformValue extends CssStyleValue { … }
```

- `CssTransformValue([List<CssTransformComponent>? transformComponents])`
- `bool? get is2D`
- `int? get length`
- `CssTransformComponent componentAtIndex(int index)`
- `DomMatrix toMatrix()`

## Class: CssTranslation

```dart
class CssTranslation extends CssTransformComponent { … }
```

- `CssTranslation(CssNumericValue x, CssNumericValue y, [CssNumericValue? z])`
- `CssNumericValue? get x`
- `set x=(CssNumericValue? value)`
- `CssNumericValue? get y`
- `set y=(CssNumericValue? value)`
- `CssNumericValue? get z`
- `set z=(CssNumericValue? value)`

## Class: CssUnitValue

```dart
class CssUnitValue extends CssNumericValue { … }
```

- `CssUnitValue(num value, String unit)`
- `String? get type`
- `String? get unit`
- `set unit=(String? value)`
- `num? get value`
- `set value=(num? value)`

## Class: CssUnparsedValue

```dart
class CssUnparsedValue extends CssStyleValue { … }
```

- `int? get length`
- `Object? fragmentAtIndex(int index)`

## Class: CssVariableReferenceValue

```dart
class CssVariableReferenceValue extends JavaScriptObject { … }
```

- `CssUnparsedValue? get fallback`
- `String? get variable`

## Class: CssViewportRule

```dart
class CssViewportRule extends CssRule { … }
```

- `CssStyleDeclaration? get style`

## Class: CssurlImageValue

```dart
class CssurlImageValue extends CssImageValue { … }
```

- `CssurlImageValue(String url)`
- `String? get url`

## Class: CustomElementRegistry

```dart
class CustomElementRegistry extends JavaScriptObject { … }
```

- `void define(String name, Object constructor, [Map<dynamic, dynamic>? options])`
- `Object? get(String name)`
- `Future<dynamic> whenDefined(String name)`

## Class: CustomEvent

```dart
class CustomEvent extends Event { … }
```

- `CustomEvent(String type, {bool canBubble, bool cancelable, Object? detail})`
- `dynamic get detail`

## Class: CustomStream

A stream of custom events, which enables the user to "fire" (add) their own
custom events to a stream.

```dart
abstract class CustomStream<T extends Event> implements Stream<T> { … }
```

- `void add(T event)`:
  Add the following custom event to the stream for dispatching to interested
  listeners.

## Class: DListElement

```dart
class DListElement extends HtmlElement { … }
```

- `DListElement()`

## Class: DataElement

```dart
class DataElement extends HtmlElement { … }
```

- `String? get value`
- `set value=(String? value)`

## Class: DataListElement

```dart
class DataListElement extends HtmlElement { … }
```

- `DataListElement()`
- `List<Node>? get options`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: DataTransfer

```dart
class DataTransfer extends JavaScriptObject { … }
```

- `DataTransfer()`
- `String? get dropEffect`
- `set dropEffect=(String? value)`
- `String? get effectAllowed`
- `set effectAllowed=(String? value)`
- `List<File>? get files`
- `DataTransferItemList? get items`
- `List<String>? get types`
- `void clearData([String? format])`
- `String getData(String format)`
- `void setData(String format, String data)`
- `void setDragImage(Element image, int x, int y)`

## Class: DataTransferItem

```dart
class DataTransferItem extends JavaScriptObject { … }
```

- `String? get kind`
- `String? get type`
- `Entry getAsEntry()`
- `File? getAsFile()`

## Class: DataTransferItemList

```dart
class DataTransferItemList extends JavaScriptObject { … }
```

- `int? get length`
- `DataTransferItem operator[](int index)`
- `DataTransferItem? add(dynamic data_OR_file, [String? type])`
- `DataTransferItem? addData(String data, String type)`
- `DataTransferItem? addFile(File file)`
- `void clear()`
- `DataTransferItem item(int index)`
- `void remove(int index)`

## Class: DateInputElement

A date (year, month, day) with no time zone.

```dart
abstract class DateInputElement implements RangeInputElementBase { … }
```

- `DateInputElement()`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.
- `DateTime get valueAsDate`
- `set valueAsDate=(DateTime value)`

## Class: DedicatedWorkerGlobalScope

```dart
class DedicatedWorkerGlobalScope extends WorkerGlobalScope { … }
```

- static `int PERSISTENT`
- static `int TEMPORARY`
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [DedicatedWorkerGlobalScope].
- static `DedicatedWorkerGlobalScope get instance`
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [DedicatedWorkerGlobalScope].
- `void close()`
- `void postMessage(dynamic message, [List<Object>? transfer])`
- `_DOMFileSystemSync requestFileSystemSync(int type, int size)`
- `_EntrySync resolveLocalFileSystemSyncUrl(String url)`

## Class: DeprecatedStorageInfo

```dart
class DeprecatedStorageInfo extends JavaScriptObject { … }
```

- static `int PERSISTENT`
- static `int TEMPORARY`
- `void queryUsageAndQuota(int storageType, [void Function(int, int)? usageCallback, void Function(DomError)? errorCallback])`
- `void requestQuota(int storageType, int newQuotaInBytes, [void Function(int)? quotaCallback, void Function(DomError)? errorCallback])`

## Class: DeprecatedStorageQuota

```dart
class DeprecatedStorageQuota extends JavaScriptObject { … }
```

- `void queryUsageAndQuota(void Function(int, int) usageCallback, [void Function(DomError)? errorCallback])`
- `void requestQuota(int newQuotaInBytes, [void Function(int)? quotaCallback, void Function(DomError)? errorCallback])`

## Class: DeprecationReport

```dart
class DeprecationReport extends ReportBody { … }
```

- `int? get lineNumber`
- `String? get message`
- `String? get sourceFile`

## Class: DetailsElement

```dart
class DetailsElement extends HtmlElement { … }
```

- `DetailsElement()`
- `bool? get open`
- `set open=(bool? value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: DetectedBarcode

```dart
class DetectedBarcode extends JavaScriptObject { … }
```

- `DetectedBarcode()`
- `Rectangle<num>? get boundingBox`
- `List<dynamic>? get cornerPoints`
- `String? get rawValue`

## Class: DetectedFace

```dart
class DetectedFace extends JavaScriptObject { … }
```

- `DetectedFace()`
- `Rectangle<num>? get boundingBox`
- `List<dynamic>? get landmarks`

## Class: DetectedText

```dart
class DetectedText extends JavaScriptObject { … }
```

- `DetectedText()`
- `Rectangle<num>? get boundingBox`
- `List<dynamic>? get cornerPoints`
- `String? get rawValue`

## Class: DeviceAcceleration

```dart
class DeviceAcceleration extends JavaScriptObject { … }
```

- `num? get x`
- `num? get y`
- `num? get z`

## Class: DeviceMotionEvent

```dart
class DeviceMotionEvent extends Event { … }
```

- `DeviceMotionEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `DeviceAcceleration? get acceleration`
- `DeviceAcceleration? get accelerationIncludingGravity`
- `num? get interval`
- `DeviceRotationRate? get rotationRate`

## Class: DeviceOrientationEvent

```dart
class DeviceOrientationEvent extends Event { … }
```

- `DeviceOrientationEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `bool? get absolute`
- `num? get alpha`
- `num? get beta`
- `num? get gamma`

## Class: DeviceRotationRate

```dart
class DeviceRotationRate extends JavaScriptObject { … }
```

- `num? get alpha`
- `num? get beta`
- `num? get gamma`

## Class: DialogElement

```dart
class DialogElement extends HtmlElement { … }
```

- `bool? get open`
- `set open=(bool? value)`
- `String? get returnValue`
- `set returnValue=(String? value)`
- `void close([String? returnValue])`
- `void show()`
- `void showModal()`

## Class: Dimension

Class representing a
[length measurement](https://developer.mozilla.org/en-US/docs/Web/CSS/length)
in CSS.

```dart
class Dimension { … }
```

- `Dimension.cm(num _value)`: Set this CSS Dimension to a centimeter `value`.
- `Dimension.css(String cssValue)`:
  Construct a Dimension object from the valid, simple CSS string `cssValue`
  that represents a distance measurement.
- `Dimension.em(num _value)`:
  Set this CSS Dimension to the specified number of ems.
- `Dimension.ex(num _value)`:
  Set this CSS Dimension to the specified number of x-heights.
- `Dimension.inch(num _value)`: Set this CSS Dimension to an inch `value`.
- `Dimension.mm(num _value)`: Set this CSS Dimension to a millimeter `value`.
- `Dimension.pc(num _value)`: Set this CSS Dimension to a pica `value`.
- `Dimension.percent(num _value)`: Set this CSS Dimension to a percentage `value`.
- `Dimension.pt(num _value)`: Set this CSS Dimension to a point `value`.
- `Dimension.px(num _value)`: Set this CSS Dimension to a pixel `value`.
- `num get value`: Return a unitless, numerical value of this CSS value.
- `String toString()`: Print out the CSS String representation of this value.

## Class: DirectoryEntry

```dart
class DirectoryEntry extends Entry { … }
```

- `Future<Entry> createDirectory(String path, {bool exclusive})`:
  Create a new directory with the specified `path`. If `exclusive` is true,
  the returned Future will complete with an error if a directory already
  exists with the specified `path`.
- `Future<Entry> createFile(String path, {bool exclusive})`:
  Create a new file with the specified `path`. If `exclusive` is true,
  the returned Future will complete with an error if a file already
  exists at the specified `path`.
- `DirectoryReader createReader()`
- `Future<Entry> getDirectory(String path)`:
  Retrieve an already existing directory entry. The returned future will
  result in an error if a directory at `path` does not exist or if the item
  at `path` is not a directory.
- `Future<Entry> getFile(String path)`:
  Retrieve an already existing file entry. The returned future will
  result in an error if a file at `path` does not exist or if the item at
  `path` is not a file.
- `Future<dynamic> removeRecursively()`

## Class: DirectoryReader

```dart
class DirectoryReader extends JavaScriptObject { … }
```

- `Future<List<Entry>> readEntries()`

## Class: DivElement

A generic container for content on an HTML page;
corresponds to the &lt;div&gt; tag.

```dart
class DivElement extends HtmlElement { … }
```

- `DivElement()`

## Class: Document

The base class for all documents.

```dart
class Document extends Node { … }
```

- `Document()`
- static `EventStreamProvider<Event> pointerLockChangeEvent`
- static `EventStreamProvider<Event> pointerLockErrorEvent`
- static `EventStreamProvider<Event> readyStateChangeEvent`:
  Static factory designed to expose `readystatechange` events to event
  handlers that are not necessarily instances of [Document].
- static `EventStreamProvider<SecurityPolicyViolationEvent> securityPolicyViolationEvent`:
  Static factory designed to expose `securitypolicyviolation` events to event
  handlers that are not necessarily instances of [Document].
- static `EventStreamProvider<Event> selectionChangeEvent`:
  Static factory designed to expose `selectionchange` events to event
  handlers that are not necessarily instances of [Document].
- `Element? get activeElement`
- `String? get addressSpace`
- `String? get contentType`
- `String? get cookie`
- `set cookie=(String? value)`
- `ScriptElement? get currentScript`
- `Element? get documentElement`
- `String? get domain`
- `FontFaceSet? get fonts`
- `Element? get fullscreenElement`
- `bool? get fullscreenEnabled`
- `bool? get hidden`
- `DomImplementation? get implementation`
- `Stream<Event> get onAbort`:
  Stream of `abort` events handled by this [Document].
- `Stream<Event> get onBeforeCopy`:
  Stream of `beforecopy` events handled by this [Document].
- `Stream<Event> get onBeforeCut`:
  Stream of `beforecut` events handled by this [Document].
- `Stream<Event> get onBeforePaste`:
  Stream of `beforepaste` events handled by this [Document].
- `Stream<Event> get onBlur`: Stream of `blur` events handled by this [Document].
- `Stream<Event> get onCanPlay`
- `Stream<Event> get onCanPlayThrough`
- `Stream<Event> get onChange`:
  Stream of `change` events handled by this [Document].
- `Stream<MouseEvent> get onClick`:
  Stream of `click` events handled by this [Document].
- `Stream<MouseEvent> get onContextMenu`:
  Stream of `contextmenu` events handled by this [Document].
- `Stream<ClipboardEvent> get onCopy`:
  Stream of `copy` events handled by this [Document].
- `Stream<ClipboardEvent> get onCut`:
  Stream of `cut` events handled by this [Document].
- `Stream<Event> get onDoubleClick`:
  Stream of `doubleclick` events handled by this [Document].
- `Stream<MouseEvent> get onDrag`:
  Stream of `drag` events handled by this [Document].
- `Stream<MouseEvent> get onDragEnd`:
  Stream of `dragend` events handled by this [Document].
- `Stream<MouseEvent> get onDragEnter`:
  Stream of `dragenter` events handled by this [Document].
- `Stream<MouseEvent> get onDragLeave`:
  Stream of `dragleave` events handled by this [Document].
- `Stream<MouseEvent> get onDragOver`:
  Stream of `dragover` events handled by this [Document].
- `Stream<MouseEvent> get onDragStart`:
  Stream of `dragstart` events handled by this [Document].
- `Stream<MouseEvent> get onDrop`:
  Stream of `drop` events handled by this [Document].
- `Stream<Event> get onDurationChange`
- `Stream<Event> get onEmptied`
- `Stream<Event> get onEnded`
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [Document].
- `Stream<Event> get onFocus`:
  Stream of `focus` events handled by this [Document].
- `Stream<Event> get onFullscreenChange`:
  Stream of `fullscreenchange` events handled by this [Document].
- `Stream<Event> get onFullscreenError`:
  Stream of `fullscreenerror` events handled by this [Document].
- `Stream<Event> get onInput`:
  Stream of `input` events handled by this [Document].
- `Stream<Event> get onInvalid`:
  Stream of `invalid` events handled by this [Document].
- `Stream<KeyboardEvent> get onKeyDown`:
  Stream of `keydown` events handled by this [Document].
- `Stream<KeyboardEvent> get onKeyPress`:
  Stream of `keypress` events handled by this [Document].
- `Stream<KeyboardEvent> get onKeyUp`:
  Stream of `keyup` events handled by this [Document].
- `Stream<Event> get onLoad`: Stream of `load` events handled by this [Document].
- `Stream<Event> get onLoadedData`
- `Stream<Event> get onLoadedMetadata`
- `Stream<MouseEvent> get onMouseDown`:
  Stream of `mousedown` events handled by this [Document].
- `Stream<MouseEvent> get onMouseEnter`:
  Stream of `mouseenter` events handled by this [Document].
- `Stream<MouseEvent> get onMouseLeave`:
  Stream of `mouseleave` events handled by this [Document].
- `Stream<MouseEvent> get onMouseMove`:
  Stream of `mousemove` events handled by this [Document].
- `Stream<MouseEvent> get onMouseOut`:
  Stream of `mouseout` events handled by this [Document].
- `Stream<MouseEvent> get onMouseOver`:
  Stream of `mouseover` events handled by this [Document].
- `Stream<MouseEvent> get onMouseUp`:
  Stream of `mouseup` events handled by this [Document].
- `Stream<WheelEvent> get onMouseWheel`:
  Stream of `mousewheel` events handled by this [Document].
- `Stream<ClipboardEvent> get onPaste`:
  Stream of `paste` events handled by this [Document].
- `Stream<Event> get onPause`
- `Stream<Event> get onPlay`
- `Stream<Event> get onPlaying`
- `Stream<Event> get onPointerLockChange`
- `Stream<Event> get onPointerLockError`
- `Stream<Event> get onRateChange`
- `Stream<Event> get onReadyStateChange`:
  Stream of `readystatechange` events handled by this [Document].
- `Stream<Event> get onReset`:
  Stream of `reset` events handled by this [Document].
- `Stream<Event> get onResize`
- `Stream<Event> get onScroll`:
  Stream of `scroll` events handled by this [Document].
- `Stream<Event> get onSearch`:
  Stream of `search` events handled by this [Document].
- `Stream<SecurityPolicyViolationEvent> get onSecurityPolicyViolation`:
  Stream of `securitypolicyviolation` events handled by this [Document].
- `Stream<Event> get onSeeked`
- `Stream<Event> get onSeeking`
- `Stream<Event> get onSelect`:
  Stream of `select` events handled by this [Document].
- `Stream<Event> get onSelectStart`:
  Stream of `selectstart` events handled by this [Document].
- `Stream<Event> get onSelectionChange`:
  Stream of `selectionchange` events handled by this [Document].
- `Stream<Event> get onStalled`
- `Stream<Event> get onSubmit`:
  Stream of `submit` events handled by this [Document].
- `Stream<Event> get onSuspend`
- `Stream<Event> get onTimeUpdate`
- `Stream<TouchEvent> get onTouchCancel`:
  Stream of `touchcancel` events handled by this [Document].
- `Stream<TouchEvent> get onTouchEnd`:
  Stream of `touchend` events handled by this [Document].
- `Stream<TouchEvent> get onTouchMove`:
  Stream of `touchmove` events handled by this [Document].
- `Stream<TouchEvent> get onTouchStart`:
  Stream of `touchstart` events handled by this [Document].
- `Stream<Event> get onVolumeChange`
- `Stream<Event> get onWaiting`
- `String? get origin`
- `Element? get pointerLockElement`
- `String? get readyState`
- `SvgSvgElement? get rootElement`
- `Element? get rootScroller`
- `set rootScroller=(Element? value)`
- `Element? get scrollingElement`
- `String? get suborigin`
- `DocumentTimeline? get timeline`
- `String get visibilityState`
- `WindowBase? get window`
- `Node adoptNode(Node node)`
- `DocumentFragment createDocumentFragment()`
- `Element createElement(String tagName, [String? typeExtension])`
- `Element createElementNS(String namespaceURI, String qualifiedName, [String? typeExtension])`
- `Range createRange()`
- `List<Element> elementsFromPoint(int x, int y)`
- `bool execCommand(String commandId, [bool? showUI, String? value])`
- `void exitFullscreen()`
- `void exitPointerLock()`
- `List<Animation> getAnimations()`
- `Element? getElementById(String elementId)`
- `List<Node> getElementsByClassName(String classNames)`
- `List<Node> getElementsByName(String elementName)`
- `List<Node> getElementsByTagName(String localName)`
- `Node importNode(Node node, [bool? deep])`
- `bool queryCommandEnabled(String commandId)`
- `bool queryCommandIndeterm(String commandId)`
- `bool queryCommandState(String commandId)`
- `bool queryCommandSupported(String commandId)`
- `String queryCommandValue(String commandId)`
- `Element? querySelector(String selectors)`:
  Finds the first descendant element of this document that matches the
  specified group of selectors.
- `ElementList<T> querySelectorAll<T extends Element>(String selectors)`:
  Finds all descendant elements of this document that match the specified
  group of selectors.

## Class: DocumentFragment

```dart
class DocumentFragment
    extends Node
    implements ParentNode, NonElementParentNode { … }
```

- `DocumentFragment()`
- `DocumentFragment.html(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`
- `DocumentFragment.svg(String? svgContent, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`
- `List<Element> get children`
- `set children=(List<Element> value)`
- `String? get innerHtml`
- `set innerHtml=(String? value)`
- `void appendHtml(String text, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Parses the specified text as HTML and adds the resulting node after the
  last child of this document fragment.
- `void appendText(String text)`:
  Adds the specified text as a text node after the last child of this
  document fragment.
- `Element? getElementById(String elementId)`
- `Element? querySelector(String selectors)`:
  Finds the first descendant element of this document fragment that matches
  the specified group of selectors.
- `ElementList<T> querySelectorAll<T extends Element>(String selectors)`:
  Finds all descendant elements of this document fragment that match the
  specified group of selectors.
- `void setInnerHtml(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`

## Class: DocumentOrShadowRoot

```dart
class DocumentOrShadowRoot extends JavaScriptObject { … }
```

- `Element? get activeElement`
- `Element? get fullscreenElement`
- `Element? get pointerLockElement`
- `List<StyleSheet>? get styleSheets`
- `Element? elementFromPoint(int x, int y)`
- `List<Element> elementsFromPoint(int x, int y)`
- `Selection? getSelection()`

## Class: DocumentTimeline

```dart
class DocumentTimeline extends AnimationTimeline { … }
```

- `DocumentTimeline([Map<dynamic, dynamic>? options])`

## Class: DomError

```dart
class DomError extends JavaScriptObject { … }
```

- `DomError(String name, [String? message])`
- `String? get message`
- `String? get name`

## Class: DomException

```dart
class DomException extends JavaScriptObject { … }
```

- static `String ABORT`
- static `String CONSTRAINT`
- static `String DATA_CLONE`
- static `String ENCODING`
- static `String HIERARCHY_REQUEST`
- static `String INDEX_SIZE`
- static `String INVALID_ACCESS`
- static `String INVALID_CHARACTER`
- static `String INVALID_MODIFICATION`
- static `String INVALID_NODE_TYPE`
- static `String INVALID_STATE`
- static `String NAMESPACE`
- static `String NETWORK`
- static `String NOT_ALLOWED`
- static `String NOT_FOUND`
- static `String NOT_READABLE`
- static `String NOT_SUPPORTED`
- static `String NO_MODIFICATION_ALLOWED`
- static `String OPERATION`
- static `String QUOTA_EXCEEDED`
- static `String READ_ONLY`
- static `String SECURITY`
- static `String SYNTAX`
- static `String TIMEOUT`
- static `String TRANSACTION_INACTIVE`
- static `String TYPE_ERROR`
- static `String TYPE_MISMATCH`
- static `String UNKNOWN`
- static `String URL_MISMATCH`
- static `String VERSION`
- static `String WRONG_DOCUMENT`
- `String? get message`
- `String get name`
- `String toString()`: A string representation of this object.

## Class: DomImplementation

```dart
class DomImplementation extends JavaScriptObject { … }
```

- `XmlDocument createDocument(String? namespaceURI, String qualifiedName, _DocumentType? doctype)`
- `_DocumentType createDocumentType(String qualifiedName, String publicId, String systemId)`
- `HtmlDocument createHtmlDocument([String? title])`
- `bool hasFeature()`

## Class: DomIterator

```dart
class DomIterator extends JavaScriptObject { … }
```

- `Object? next([Object? value])`

## Class: DomMatrix

```dart
class DomMatrix extends DomMatrixReadOnly { … }
```

- `DomMatrix([Object? init])`
- static `DomMatrix fromFloat32Array(Float32List array32)`
- static `DomMatrix fromFloat64Array(Float64List array64)`
- static `DomMatrix fromMatrix([Map<dynamic, dynamic>? other])`
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
- `num? get m11`
- `set m11=(num? value)`
- `num? get m12`
- `set m12=(num? value)`
- `num? get m13`
- `set m13=(num? value)`
- `num? get m14`
- `set m14=(num? value)`
- `num? get m21`
- `set m21=(num? value)`
- `num? get m22`
- `set m22=(num? value)`
- `num? get m23`
- `set m23=(num? value)`
- `num? get m24`
- `set m24=(num? value)`
- `set m31=(num? value)`
- `num? get m31`
- `num? get m32`
- `set m32=(num? value)`
- `num? get m33`
- `set m33=(num? value)`
- `num? get m34`
- `set m34=(num? value)`
- `num? get m41`
- `set m41=(num? value)`
- `set m42=(num? value)`
- `num? get m42`
- `set m43=(num? value)`
- `num? get m43`
- `set m44=(num? value)`
- `num? get m44`
- `DomMatrix invertSelf()`
- `DomMatrix multiplySelf([Map<dynamic, dynamic>? other])`
- `DomMatrix preMultiplySelf([Map<dynamic, dynamic>? other])`
- `DomMatrix rotateAxisAngleSelf([num? x, num? y, num? z, num? angle])`
- `DomMatrix rotateFromVectorSelf([num? x, num? y])`
- `DomMatrix rotateSelf([num? rotX, num? rotY, num? rotZ])`
- `DomMatrix scale3dSelf([num? scale, num? originX, num? originY, num? originZ])`
- `DomMatrix scaleSelf([num? scaleX, num? scaleY, num? scaleZ, num? originX, num? originY, num? originZ])`
- `DomMatrix setMatrixValue(String transformList)`
- `DomMatrix skewXSelf([num? sx])`
- `DomMatrix skewYSelf([num? sy])`
- `DomMatrix translateSelf([num? tx, num? ty, num? tz])`

## Class: DomMatrixReadOnly

```dart
class DomMatrixReadOnly extends JavaScriptObject { … }
```

- `DomMatrixReadOnly([Object? init])`
- static `DomMatrixReadOnly fromFloat32Array(Float32List array32)`
- static `DomMatrixReadOnly fromFloat64Array(Float64List array64)`
- static `DomMatrixReadOnly fromMatrix([Map<dynamic, dynamic>? other])`
- `num? get a`
- `num? get b`
- `num? get c`
- `num? get d`
- `num? get e`
- `num? get f`
- `bool? get is2D`
- `bool? get isIdentity`
- `num? get m11`
- `num? get m12`
- `num? get m13`
- `num? get m14`
- `num? get m21`
- `num? get m22`
- `num? get m23`
- `num? get m24`
- `num? get m31`
- `num? get m32`
- `num? get m33`
- `num? get m34`
- `num? get m41`
- `num? get m42`
- `num? get m43`
- `num? get m44`
- `DomMatrix flipX()`
- `DomMatrix flipY()`
- `DomMatrix inverse()`
- `DomMatrix multiply([Map<dynamic, dynamic>? other])`
- `DomMatrix rotate([num? rotX, num? rotY, num? rotZ])`
- `DomMatrix rotateAxisAngle([num? x, num? y, num? z, num? angle])`
- `DomMatrix rotateFromVector([num? x, num? y])`
- `DomMatrix scale([num? scaleX, num? scaleY, num? scaleZ, num? originX, num? originY, num? originZ])`
- `DomMatrix scale3d([num? scale, num? originX, num? originY, num? originZ])`
- `DomMatrix skewX([num? sx])`
- `DomMatrix skewY([num? sy])`
- `Float32List toFloat32Array()`
- `Float64List toFloat64Array()`
- `DomPoint transformPoint([Map<dynamic, dynamic>? point])`
- `DomMatrix translate([num? tx, num? ty, num? tz])`

## Class: DomParser

```dart
class DomParser extends JavaScriptObject { … }
```

- `DomParser()`
- `Document parseFromString(String str, String type)`

## Class: DomPoint

```dart
class DomPoint extends DomPointReadOnly { … }
```

- `DomPoint([num? x, num? y, num? z, num? w])`
- static `DomPoint fromPoint([Map<dynamic, dynamic>? other])`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `num? get w`
- `set w=(num? value)`
- `num? get x`
- `set x=(num? value)`
- `num? get y`
- `set y=(num? value)`
- `num? get z`
- `set z=(num? value)`

## Class: DomPointReadOnly

```dart
class DomPointReadOnly extends JavaScriptObject { … }
```

- `DomPointReadOnly([num? x, num? y, num? z, num? w])`
- static `DomPointReadOnly fromPoint([Map<dynamic, dynamic>? other])`
- `num? get w`
- `num? get x`
- `num? get y`
- `num? get z`
- `DomPoint matrixTransform([Map<dynamic, dynamic>? matrix])`

## Class: DomQuad

```dart
class DomQuad extends JavaScriptObject { … }
```

- `DomQuad([Map<dynamic, dynamic>? p1, Map<dynamic, dynamic>? p2, Map<dynamic, dynamic>? p3, Map<dynamic, dynamic>? p4])`
- static `DomQuad fromQuad([Map<dynamic, dynamic>? other])`
- static `DomQuad fromRect([Map<dynamic, dynamic>? other])`
- `DomPoint? get p1`
- `DomPoint? get p2`
- `DomPoint? get p3`
- `DomPoint? get p4`
- `Rectangle<num> getBounds()`

## Class: DomRectList

```dart
class DomRectList
    extends JavaScriptObject
    with ListBase<Rectangle<num>>, ImmutableListMixin<Rectangle<num>>
    implements List<Rectangle<num>>, JavaScriptIndexingBehavior<Rectangle<num>> { … }
```

- `Rectangle<num> get first`: The first element.
- `Rectangle<num> get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `Rectangle<num> get single`:
  Checks that this iterable has only one element, and returns that element.
- `Rectangle<num> operator[](int index)`:
  The object at the given [index] in the list.
- `void operator[]=(int index, Rectangle<num> value)`:
  Sets the value at the given [index] in the list to [value].
- `Rectangle<num> elementAt(int index)`: Returns the [index]th element.
- `Rectangle<num>? item(int index)`

## Class: DomRectReadOnly

```dart
class DomRectReadOnly extends JavaScriptObject implements Rectangle<num> { … }
```

- `DomRectReadOnly([num? x, num? y, num? width, num? height])`
- static `DomRectReadOnly fromRect([Map<dynamic, dynamic>? other])`
- `num get bottom`: The y-coordinate of the bottom edge.
- `Point<num> get bottomLeft`
- `Point<num> get bottomRight`
- `int get hashCode`: The hash code for this object.
- `num get height`: The height of the rectangle.
- `num get left`: The x-coordinate of the left edge.
- `num get right`: The x-coordinate of the right edge.
- `num get top`: The y-coordinate of the top edge.
- `Point<num> get topLeft`
- `Point<num> get topRight`
- `num get width`: The width of the rectangle.
- `num? get x`
- `num? get y`
- `bool operator==(Object other)`: The equality operator.
- `Rectangle<num> boundingBox(Rectangle<num> other)`:
  Returns a new rectangle which completely contains `this` and [other].
- `bool containsPoint(Point<num> another)`:
  Tests whether [another] is inside or along the edges of `this`.
- `bool containsRectangle(Rectangle<num> another)`:
  Tests whether `this` entirely contains [another].
- `Rectangle<num>? intersection(Rectangle<num> other)`:
  Computes the intersection of `this` and [other].
- `bool intersects(Rectangle<num> other)`:
  Returns true if `this` intersects [other].
- `String toString()`: A string representation of this object.

## Class: DomStringList

```dart
class DomStringList
    extends JavaScriptObject
    with ListBase<String>, ImmutableListMixin<String>
    implements List<String>, JavaScriptIndexingBehavior<String> { … }
```

- `String get first`: The first element.
- `String get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `String get single`:
  Checks that this iterable has only one element, and returns that element.
- `String operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, String value)`:
  Sets the value at the given [index] in the list to [value].
- `String elementAt(int index)`: Returns the [index]th element.
- `String? item(int index)`

## Class: DomStringMap

```dart
class DomStringMap extends JavaScriptObject { … }
```

- `String item(String name)`

## Class: DomTokenList

```dart
class DomTokenList extends JavaScriptObject { … }
```

- `int get length`
- `String? get value`
- `set value=(String? value)`
- `void add(String tokens)`
- `bool contains(String token)`
- `String? item(int index)`
- `void remove(String tokens)`
- `void replace(String token, String newToken)`
- `bool supports(String token)`
- `bool toggle(String token, [bool? force])`

## Class: Element

An abstract class, which all HTML elements extend.

```dart
class Element
    extends Node
    implements ParentNode, ChildNode, NonDocumentTypeChildNode, GlobalEventHandlers { … }
```

- `Element.a()`: Creates a new `<a>` element.
- `Element.article()`: Creates a new `<article>` element.
- `Element.aside()`: Creates a new `<aside>` element.
- `Element.audio()`: Creates a new `<audio>` element.
- `Element.br()`: Creates a new `<br>` element.
- `Element.canvas()`: Creates a new `<canvas>` element.
- `Element.div()`: Creates a new `<div>` element.
- `Element.footer()`: Creates a new `<footer>` element.
- `Element.header()`: Creates a new `<header>` element.
- `Element.hr()`: Creates a new `<hr>` element.
- `Element.html(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Creates an HTML element from a valid fragment of HTML.
- `Element.iframe()`: Creates a new `<iframe>` element.
- `Element.img()`: Creates a new `<img>` element.
- `Element.li()`: Creates a new `<li>` element.
- `Element.nav()`: Creates a new `<nav>` element.
- `Element.ol()`: Creates a new `<ol>` element.
- `Element.option()`: Creates a new `<option>` element.
- `Element.p()`: Creates a new `<p>` element.
- `Element.pre()`: Creates a new `<pre>` element.
- `Element.section()`: Creates a new `<section>` element.
- `Element.select()`: Creates a new `<select>` element.
- `Element.span()`: Creates a new `<span>` element.
- `Element.svg()`: Creates a new `<svg>` element.
- `Element.table()`: Creates a new `<table>` element.
- `Element.tag(String tag, [String? typeExtension])`:
  Creates the HTML element specified by the tag name.
- `Element.td()`: Creates a new `<td>` element.
- `Element.textarea()`: Creates a new `<textarea>` element.
- `Element.th()`: Creates a new `<th>` element.
- `Element.tr()`: Creates a new `<tr>` element.
- `Element.ul()`: Creates a new `<ul>` element.
- `Element.video()`: Creates a new `<video>` element.
- static `EventStreamProvider<Event> abortEvent`:
  Static factory designed to expose `abort` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> beforeCopyEvent`:
  Static factory designed to expose `beforecopy` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> beforeCutEvent`:
  Static factory designed to expose `beforecut` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> beforePasteEvent`:
  Static factory designed to expose `beforepaste` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> blurEvent`:
  Static factory designed to expose `blur` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> canPlayEvent`
- static `EventStreamProvider<Event> canPlayThroughEvent`
- static `EventStreamProvider<Event> changeEvent`:
  Static factory designed to expose `change` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> clickEvent`:
  Static factory designed to expose `click` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> contextMenuEvent`:
  Static factory designed to expose `contextmenu` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<ClipboardEvent> copyEvent`:
  Static factory designed to expose `copy` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<ClipboardEvent> cutEvent`:
  Static factory designed to expose `cut` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> doubleClickEvent`:
  Static factory designed to expose `doubleclick` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> dragEndEvent`:
  A stream of `dragend` events fired when an element completes a drag
  operation.
- static `EventStreamProvider<MouseEvent> dragEnterEvent`:
  A stream of `dragenter` events fired when a dragged object is first dragged
  over an element.
- static `EventStreamProvider<MouseEvent> dragEvent`:
  A stream of `drag` events fired when an element is currently being dragged.
- static `EventStreamProvider<MouseEvent> dragLeaveEvent`:
  A stream of `dragleave` events fired when an object being dragged over an
  element leaves the element's target area.
- static `EventStreamProvider<MouseEvent> dragOverEvent`:
  A stream of `dragover` events fired when a dragged object is currently
  being dragged over an element.
- static `EventStreamProvider<MouseEvent> dragStartEvent`:
  A stream of `dragstart` events for a dragged element whose drag has begun.
- static `EventStreamProvider<MouseEvent> dropEvent`:
  A stream of `drop` events fired when a dragged object is dropped on an
  element.
- static `EventStreamProvider<Event> durationChangeEvent`
- static `EventStreamProvider<Event> emptiedEvent`
- static `EventStreamProvider<Event> endedEvent`
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> focusEvent`:
  Static factory designed to expose `focus` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> fullscreenChangeEvent`:
  Static factory designed to expose `fullscreenchange` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> fullscreenErrorEvent`:
  Static factory designed to expose `fullscreenerror` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> inputEvent`:
  Static factory designed to expose `input` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> invalidEvent`:
  Static factory designed to expose `invalid` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<KeyboardEvent> keyDownEvent`:
  Static factory designed to expose `keydown` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<KeyboardEvent> keyPressEvent`:
  Static factory designed to expose `keypress` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<KeyboardEvent> keyUpEvent`:
  Static factory designed to expose `keyup` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> loadEvent`:
  Static factory designed to expose `load` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> loadedDataEvent`
- static `EventStreamProvider<Event> loadedMetadataEvent`
- static `EventStreamProvider<MouseEvent> mouseDownEvent`:
  Static factory designed to expose `mousedown` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> mouseEnterEvent`:
  Static factory designed to expose `mouseenter` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> mouseLeaveEvent`:
  Static factory designed to expose `mouseleave` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> mouseMoveEvent`:
  Static factory designed to expose `mousemove` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> mouseOutEvent`:
  Static factory designed to expose `mouseout` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> mouseOverEvent`:
  Static factory designed to expose `mouseover` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<MouseEvent> mouseUpEvent`:
  Static factory designed to expose `mouseup` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<WheelEvent> mouseWheelEvent`:
  Static factory designed to expose `mousewheel` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<ClipboardEvent> pasteEvent`:
  Static factory designed to expose `paste` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> pauseEvent`
- static `EventStreamProvider<Event> playEvent`
- static `EventStreamProvider<Event> playingEvent`
- static `EventStreamProvider<Event> rateChangeEvent`
- static `EventStreamProvider<Event> resetEvent`:
  Static factory designed to expose `reset` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> resizeEvent`
- static `EventStreamProvider<Event> scrollEvent`:
  Static factory designed to expose `scroll` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> searchEvent`:
  Static factory designed to expose `search` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> seekedEvent`
- static `EventStreamProvider<Event> seekingEvent`
- static `EventStreamProvider<Event> selectEvent`:
  Static factory designed to expose `select` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> selectStartEvent`:
  Static factory designed to expose `selectstart` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> stalledEvent`
- static `EventStreamProvider<Event> submitEvent`:
  Static factory designed to expose `submit` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> suspendEvent`
- static `EventStreamProvider<Event> timeUpdateEvent`
- static `EventStreamProvider<TouchEvent> touchCancelEvent`:
  Static factory designed to expose `touchcancel` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<TouchEvent> touchEndEvent`:
  Static factory designed to expose `touchend` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<TouchEvent> touchEnterEvent`:
  Static factory designed to expose `touchenter` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<TouchEvent> touchLeaveEvent`:
  Static factory designed to expose `touchleave` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<TouchEvent> touchMoveEvent`:
  Static factory designed to expose `touchmove` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<TouchEvent> touchStartEvent`:
  Static factory designed to expose `touchstart` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<TransitionEvent> transitionEndEvent`:
  Static factory designed to expose `transitionend` events to event
  handlers that are not necessarily instances of [Element].
- static `EventStreamProvider<Event> volumeChangeEvent`
- static `EventStreamProvider<Event> waitingEvent`
- static `EventStreamProvider<WheelEvent> wheelEvent`
- static `bool isTagSupported(String tag)`:
  Checks to see if the tag name is supported by the current platform.
- `AccessibleNode? get accessibleNode`
- `SlotElement? get assignedSlot`
- `Map<String, String> get attributes`: All attributes on this element.
- `set attributes=(Map<String, String> value)`
- `CssRect get borderEdge`:
  Access the dimensions and position of this element's content + padding +
  border box.
- `List<Element> get children`: List of the direct children of this element.
- `set children=(List<Element> value)`
- `String get className`
- `set className=(String value)`
- `CssClassSet get classes`: The set of CSS classes applied to this element.
- `set classes=(Iterable<String> value)`
- `Rectangle<num> get client`:
  Gets the position of this element relative to the client area of the page.
- `int get clientHeight`
- `int? get clientLeft`
- `int? get clientTop`
- `int get clientWidth`
- `String? get computedName`
- `String? get computedRole`
- `CssRect get contentEdge`: Access this element's content position.
- `String get contentEditable`
- `set contentEditable=(String value)`
- `set dataset=(Map<String, String> value)`
- `Map<String, String> get dataset`:
  Allows access to all custom data attributes (data-*) set on this element.
- `String? get dir`
- `set dir=(String? value)`
- `Point<num> get documentOffset`:
  Provides the coordinates of the element relative to the top of the
  document.
- `bool get draggable`: Indicates whether the element can be dragged and dropped.
- `set draggable=(bool value)`
- `bool get hidden`:
  Indicates whether the element is not relevant to the page's current state.
- `set hidden=(bool value)`
- `set id=(String value)`
- `String get id`
- `bool? get inert`
- `set inert=(bool? value)`
- `String? get innerHtml`
- `set innerHtml=(String? html)`:
  Parses the HTML fragment and sets it as the contents of this element.
- `set innerText=(String value)`
- `String get innerText`
- `String? get inputMode`
- `set inputMode=(String? value)`
- `bool? get isContentEditable`
- `String? get lang`
- `set lang=(String? value)`
- `String get localName`
- `CssRect get marginEdge`:
  Access the dimensions and position of this element's content + padding +
  border + margin box.
- `String? get namespaceUri`:
  A URI that identifies the XML namespace of this element.
- `Element? get nextElementSibling`
- `Rectangle<num> get offset`:
  Gets the offset of this element relative to its offsetParent.
- `int get offsetHeight`
- `int get offsetLeft`
- `Element? get offsetParent`
- `int get offsetTop`
- `int get offsetWidth`
- `ElementEvents get on`:
  This is an ease-of-use accessor for event streams which should only be
  used when an explicit accessor is not available.
- `ElementStream<Event> get onAbort`:
  Stream of `abort` events handled by this [Element].
- `ElementStream<Event> get onBeforeCopy`:
  Stream of `beforecopy` events handled by this [Element].
- `ElementStream<Event> get onBeforeCut`:
  Stream of `beforecut` events handled by this [Element].
- `ElementStream<Event> get onBeforePaste`:
  Stream of `beforepaste` events handled by this [Element].
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
- `ElementStream<ClipboardEvent> get onCopy`:
  Stream of `copy` events handled by this [Element].
- `ElementStream<ClipboardEvent> get onCut`:
  Stream of `cut` events handled by this [Element].
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
- `ElementStream<Event> get onFullscreenChange`:
  Stream of `fullscreenchange` events handled by this [Element].
- `ElementStream<Event> get onFullscreenError`:
  Stream of `fullscreenerror` events handled by this [Element].
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
- `ElementStream<ClipboardEvent> get onPaste`:
  Stream of `paste` events handled by this [Element].
- `ElementStream<Event> get onPause`
- `ElementStream<Event> get onPlay`
- `ElementStream<Event> get onPlaying`
- `ElementStream<Event> get onRateChange`
- `ElementStream<Event> get onReset`:
  Stream of `reset` events handled by this [Element].
- `ElementStream<Event> get onResize`
- `ElementStream<Event> get onScroll`:
  Stream of `scroll` events handled by this [Element].
- `ElementStream<Event> get onSearch`:
  Stream of `search` events handled by this [Element].
- `ElementStream<Event> get onSeeked`
- `ElementStream<Event> get onSeeking`
- `ElementStream<Event> get onSelect`:
  Stream of `select` events handled by this [Element].
- `ElementStream<Event> get onSelectStart`:
  Stream of `selectstart` events handled by this [Element].
- `ElementStream<Event> get onStalled`
- `ElementStream<Event> get onSubmit`:
  Stream of `submit` events handled by this [Element].
- `ElementStream<Event> get onSuspend`
- `ElementStream<Event> get onTimeUpdate`
- `ElementStream<TouchEvent> get onTouchCancel`:
  Stream of `touchcancel` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchEnd`:
  Stream of `touchend` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchEnter`:
  Stream of `touchenter` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchLeave`:
  Stream of `touchleave` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchMove`:
  Stream of `touchmove` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchStart`:
  Stream of `touchstart` events handled by this [Element].
- `ElementStream<TransitionEvent> get onTransitionEnd`:
  Stream of `transitionend` events handled by this [Element].
- `ElementStream<Event> get onVolumeChange`
- `ElementStream<Event> get onWaiting`
- `ElementStream<WheelEvent> get onWheel`
- `String? get outerHtml`
- `CssRect get paddingEdge`:
  Access the dimensions and position of this element's content + padding box.
- `Element? get previousElementSibling`
- `int get scrollHeight`
- `set scrollLeft=(int value)`
- `int get scrollLeft`
- `set scrollTop=(int value)`
- `int get scrollTop`
- `int get scrollWidth`
- `ShadowRoot? get shadowRoot`: The shadow root of this shadow host.
- `set slot=(String? value)`
- `String? get slot`
- `set spellcheck=(bool? value)`
- `bool? get spellcheck`
- `CssStyleDeclaration get style`
- `StylePropertyMap? get styleMap`
- `set tabIndex=(int? value)`
- `int? get tabIndex`
- `String get tagName`
- `set title=(String? value)`
- `String? get title`
- `set translate=(bool? value)`
- `bool? get translate`:
  Specifies whether this element's text content changes when the page is
  localized.
- `void after(Object nodes)`
- `Animation animate(Iterable<Map<String, dynamic>> frames, [dynamic timing])`:
  Creates a new AnimationEffect object whose target element is the object
  on which the method is called, and calls the play() method of the
  AnimationTimeline object of the document timeline of the node document
  of the element, passing the newly created AnimationEffect as the argument
  to the method. Returns an Animation for the effect.
- `void appendHtml(String text, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Parses the specified text as HTML and adds the resulting node after the
  last child of this element.
- `void appendText(String text)`:
  Adds the specified text after the last child of this element.
- `ShadowRoot attachShadow(Map<dynamic, dynamic> shadowRootInitDict)`
- `void attached()`:
  Called by the DOM when this element has been inserted into the live
  document.
- `void attributeChanged(String name, String oldValue, String newValue)`:
  Called by the DOM whenever an attribute on this has been changed.
- `void before(Object nodes)`
- `void blur()`
- `void click()`
- `Element? closest(String selectors)`
- `DocumentFragment createFragment(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Create a DocumentFragment from the HTML fragment and ensure that it follows
  the sanitization rules specified by the validator or treeSanitizer.
- `ShadowRoot createShadowRoot()`: Creates a new shadow root for this shadow host.
- `void detached()`:
  Called by the DOM when this element has been removed from the live
  document.
- `void enteredView()`: Deprecated*: override [attached] instead.
- `void focus()`
- `List<Animation> getAnimations()`
- `String? getAttribute(String name)`
- `String? getAttributeNS(String? namespaceURI, String name)`
- `List<String> getAttributeNames()`
- `Rectangle<num> getBoundingClientRect()`:
  Returns the smallest bounding rectangle that encompasses this element's
  padding, scrollbar, and border.
- `List<Rectangle<num>> getClientRects()`
- `CssStyleDeclaration getComputedStyle([String? pseudoElement])`:
  The set of all CSS values applied to this element, including inherited
  and default values.
- `List<Node> getDestinationInsertionPoints()`:
  Returns a list of shadow DOM insertion points to which this element is
  distributed.
- `List<Node> getElementsByClassName(String classNames)`:
  Returns a list of nodes with the given class name inside this element.
- `Map<String, String> getNamespacedAttributes(String namespace)`:
  Gets a map for manipulating the attributes of a particular namespace.
- `bool hasAttribute(String name)`
- `bool hasAttributeNS(String? namespaceURI, String name)`
- `bool hasPointerCapture(int pointerId)`
- `Element insertAdjacentElement(String where, Element element)`:
  Inserts [element] into the DOM at the specified location.
- `void insertAdjacentHtml(String where, String html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Parses text as an HTML fragment and inserts it into the DOM at the
  specified location.
- `void insertAdjacentText(String where, String text)`:
  Inserts text into the DOM at the specified location.
- `void leftView()`: Deprecated*: override [detached] instead.
- `bool matches(String selectors)`:
  Checks if this element matches the CSS selectors.
- `bool matchesWithAncestors(String selectors)`:
  Checks if this element or any of its parents match the CSS selectors.
- `Point<num> offsetTo(Element parent)`:
  Provides the offset of this element's [borderEdge] relative to the
  specified [parent].
- `Element? querySelector(String selectors)`:
  Finds the first descendant element of this element that matches the
  specified group of selectors.
- `ElementList<T> querySelectorAll<T extends Element>(String selectors)`:
  Finds all descendent elements of this element that match the specified
  group of selectors.
- `void releasePointerCapture(int pointerId)`
- `void removeAttribute(String name)`
- `void removeAttributeNS(String? namespaceURI, String name)`
- `Future<void> requestFullscreen([Map<dynamic, dynamic>? options])`:
  Displays this element fullscreen.
- `void requestPointerLock()`
- `void scroll([dynamic options_OR_x, num? y])`
- `void scrollBy([dynamic options_OR_x, num? y])`
- `void scrollIntoView([ScrollAlignment? alignment])`:
  Scrolls this element into view.
- `void scrollIntoViewIfNeeded([bool? centerIfNeeded])`:
  Nonstandard version of `scrollIntoView` that scrolls the current element
  into the visible area of the browser window if it's not already within the
  visible area of the browser window. If the element is already within the
  visible area of the browser window, then no scrolling takes place.
- `void scrollTo([dynamic options_OR_x, num? y])`
- `Future<ScrollState> setApplyScroll(String nativeScrollBehavior)`
- `void setAttribute(String name, Object value)`
- `void setAttributeNS(String? namespaceURI, String name, Object value)`
- `Future<ScrollState> setDistributeScroll(String nativeScrollBehavior)`
- `void setInnerHtml(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Parses the HTML fragment and sets it as the contents of this element.
  This ensures that the generated content follows the sanitization rules
  specified by the validator or treeSanitizer.
- `void setPointerCapture(int pointerId)`
- `String toString()`: The string representation of this element.

## Class: ElementEvents

```dart
class ElementEvents extends Events { … }
```

- `ElementEvents(Element ptr)`
- static `Map<String, String> webkitEvents`
- `Stream<Event> operator[](String type)`

## Class: ElementList

An immutable list containing HTML elements. This list contains some
additional methods when compared to regular lists for ease of CSS
manipulation on a group of elements.

```dart
abstract class ElementList<T extends Element> extends ListBase<T> { … }
```

- `CssRect get borderEdge`:
  Access dimensions and position of the first [Element]'s content + padding +
  border box in this list.
- `CssClassSet get classes`:
  The union of all CSS classes applied to the elements in this list.
- `set classes=(Iterable<String> value)`:
  Replace the classes with `value` for every element in this list.
- `CssRect get contentEdge`:
  Access dimensions and position of the [Element]s in this list.
- `CssRect get marginEdge`:
  Access dimensions and position of the first [Element]'s content + padding +
  border + margin box in this list.
- `ElementStream<Event> get onAbort`:
  Stream of `abort` events handled by this [Element].
- `ElementStream<Event> get onBeforeCopy`:
  Stream of `beforecopy` events handled by this [Element].
- `ElementStream<Event> get onBeforeCut`:
  Stream of `beforecut` events handled by this [Element].
- `ElementStream<Event> get onBeforePaste`:
  Stream of `beforepaste` events handled by this [Element].
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
- `ElementStream<ClipboardEvent> get onCopy`:
  Stream of `copy` events handled by this [Element].
- `ElementStream<ClipboardEvent> get onCut`:
  Stream of `cut` events handled by this [Element].
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
- `ElementStream<Event> get onFullscreenChange`:
  Stream of `fullscreenchange` events handled by this [Element].
- `ElementStream<Event> get onFullscreenError`:
  Stream of `fullscreenerror` events handled by this [Element].
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
- `ElementStream<ClipboardEvent> get onPaste`:
  Stream of `paste` events handled by this [Element].
- `ElementStream<Event> get onPause`
- `ElementStream<Event> get onPlay`
- `ElementStream<Event> get onPlaying`
- `ElementStream<Event> get onRateChange`
- `ElementStream<Event> get onReset`:
  Stream of `reset` events handled by this [Element].
- `ElementStream<Event> get onResize`
- `ElementStream<Event> get onScroll`:
  Stream of `scroll` events handled by this [Element].
- `ElementStream<Event> get onSearch`:
  Stream of `search` events handled by this [Element].
- `ElementStream<Event> get onSeeked`
- `ElementStream<Event> get onSeeking`
- `ElementStream<Event> get onSelect`:
  Stream of `select` events handled by this [Element].
- `ElementStream<Event> get onSelectStart`:
  Stream of `selectstart` events handled by this [Element].
- `ElementStream<Event> get onStalled`
- `ElementStream<Event> get onSubmit`:
  Stream of `submit` events handled by this [Element].
- `ElementStream<Event> get onSuspend`
- `ElementStream<Event> get onTimeUpdate`
- `ElementStream<TouchEvent> get onTouchCancel`:
  Stream of `touchcancel` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchEnd`:
  Stream of `touchend` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchEnter`:
  Stream of `touchenter` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchLeave`:
  Stream of `touchleave` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchMove`:
  Stream of `touchmove` events handled by this [Element].
- `ElementStream<TouchEvent> get onTouchStart`:
  Stream of `touchstart` events handled by this [Element].
- `ElementStream<TransitionEvent> get onTransitionEnd`:
  Stream of `transitionend` events handled by this [Element].
- `ElementStream<Event> get onVolumeChange`
- `ElementStream<Event> get onWaiting`
- `ElementStream<WheelEvent> get onWheel`
- `CssRect get paddingEdge`:
  Access dimensions and position of the first [Element]'s content + padding
  box in this list.
- `CssStyleDeclarationBase get style`:
  Access the union of all [CssStyleDeclaration]s that are associated with an
  [ElementList].

## Class: ElementStream

A specialized Stream available to [Element]s to enable event delegation.

```dart
abstract class ElementStream<T extends Event> implements Stream<T> { … }
```

- `StreamSubscription<T> capture(void Function(T) onData)`:
  Adds a capturing subscription to this stream.
- `Stream<T> matches(String selector)`:
  Return a stream that only fires when the particular event fires for
  elements matching the specified CSS selector.

## Class: ElementUpgrader

A utility for changing the Dart wrapper type for elements.

```dart
abstract class ElementUpgrader { … }
```

- `Element upgrade(Element element)`:
  Upgrade the specified element to be of the Dart type this was created for.

## Class: EmailInputElement

An e-mail address or list of e-mail addresses.

```dart
abstract class EmailInputElement implements TextInputElementBase { … }
```

- `EmailInputElement()`
- `String get autocomplete`
- `set autocomplete=(String value)`
- `bool get autofocus`
- `set autofocus=(bool value)`
- `Element? get list`
- `int? get maxLength`
- `set maxLength=(int? value)`
- `bool? get multiple`
- `set multiple=(bool? value)`
- `String get pattern`
- `set pattern=(String value)`
- `String get placeholder`
- `set placeholder=(String value)`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- `int? get size`
- `set size=(int? value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: EmbedElement

```dart
class EmbedElement extends HtmlElement { … }
```

- `EmbedElement()`
- `String get height`
- `set height=(String value)`
- `String? get name`
- `set name=(String? value)`
- `String get src`
- `set src=(String value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `String get type`
- `set type=(String value)`
- `String get width`
- `set width=(String value)`

## Class: Entry

```dart
class Entry extends JavaScriptObject { … }
```

- `FileSystem? get filesystem`
- `String? get fullPath`
- `bool? get isDirectory`
- `bool? get isFile`
- `String? get name`
- `Future<Entry> copyTo(DirectoryEntry parent, {String? name})`
- `Future<Metadata> getMetadata()`
- `Future<Entry> getParent()`
- `Future<Entry> moveTo(DirectoryEntry parent, {String? name})`
- `Future<dynamic> remove()`
- `String toUrl()`

## Class: ErrorEvent

```dart
class ErrorEvent extends Event { … }
```

- `ErrorEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `int? get colno`
- `Object? get error`
- `String? get filename`
- `int? get lineno`
- `String? get message`

## Class: Event

```dart
class Event extends JavaScriptObject { … }
```

- `Event(String type, {bool canBubble, bool cancelable})`
- `Event.eventType(String type, String name, {bool canBubble, bool cancelable})`:
  Creates a new Event object of the specified type.
- static `int AT_TARGET`: This event is being handled by the event target.
- static `int BUBBLING_PHASE`:
  This event is bubbling up through the target's ancestors.
- static `int CAPTURING_PHASE`:
  This event is propagating through the target's ancestors, starting from the
  document.
- `bool? get bubbles`
- `bool? get cancelable`
- `bool? get composed`
- `EventTarget? get currentTarget`
- `bool get defaultPrevented`
- `int get eventPhase`
- `bool? get isTrusted`
- `Element get matchingTarget`:
  A pointer to the element whose CSS selector matched within which an event
  was fired. If this Event was not associated with any Event delegation,
  accessing this value will throw an [UnsupportedError].
- `List<EventTarget> get path`
- `EventTarget? get target`
- `num? get timeStamp`
- `String get type`
- `List<EventTarget> composedPath()`
- `void preventDefault()`
- `void stopImmediatePropagation()`
- `void stopPropagation()`

## Class: EventSource

```dart
class EventSource extends EventTarget { … }
```

- `EventSource(String url, {dynamic withCredentials})`
- static `int CLOSED`
- static `int CONNECTING`
- static `int OPEN`
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [EventSource].
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [EventSource].
- static `EventStreamProvider<Event> openEvent`:
  Static factory designed to expose `open` events to event
  handlers that are not necessarily instances of [EventSource].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [EventSource].
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [EventSource].
- `Stream<Event> get onOpen`:
  Stream of `open` events handled by this [EventSource].
- `int? get readyState`
- `String? get url`
- `bool? get withCredentials`
- `void close()`

## Class: EventStreamProvider

A factory to expose DOM events as Streams.

```dart
class EventStreamProvider<T extends Event> { … }
```

- `EventStreamProvider(String _eventType)`
- `ElementStream<T> forElement(Element e, {bool useCapture})`:
  Gets a [Stream] for this event type, on the specified element.
- `Stream<T> forTarget(EventTarget? e, {bool useCapture})`:
  Gets a [Stream] for this event type, on the specified target.
- `String getEventType(EventTarget target)`:
  Gets the type of the event which this would listen for on the specified
  event target.

## Class: EventTarget

Base class for all browser objects that support events.

```dart
class EventTarget extends JavaScriptObject { … }
```

- `Events get on`:
  This is an ease-of-use accessor for event streams which should only be
  used when an explicit accessor is not available.
- `void addEventListener(String type, dynamic Function(Event)? listener, [bool? useCapture])`
- `bool dispatchEvent(Event event)`
- `void removeEventListener(String type, dynamic Function(Event)? listener, [bool? useCapture])`

## Class: Events

Base class that supports listening for and dispatching browser events.

```dart
class Events { … }
```

- `Events(EventTarget _ptr)`
- `Stream<Event> operator[](String type)`

## Class: ExtendableEvent

```dart
class ExtendableEvent extends Event { … }
```

- `ExtendableEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `void waitUntil(Future<dynamic> f)`

## Class: ExtendableMessageEvent

```dart
class ExtendableMessageEvent extends ExtendableEvent { … }
```

- `Object? get data`
- `String? get lastEventId`
- `String? get origin`
- `List<MessagePort>? get ports`
- `Object? get source`

## Class: External

```dart
class External extends JavaScriptObject { … }
```

- `void AddSearchProvider()`
- `void IsSearchProviderInstalled()`

## Class: FaceDetector

```dart
class FaceDetector extends JavaScriptObject { … }
```

- `FaceDetector([Map<dynamic, dynamic>? faceDetectorOptions])`
- `Future<List<dynamic>> detect(dynamic image)`

## Class: FederatedCredential

```dart
class FederatedCredential extends Credential implements CredentialUserData { … }
```

- `FederatedCredential(Map<dynamic, dynamic> data)`
- `String? get iconUrl`
- `String? get name`
- `String? get protocol`
- `String? get provider`

## Class: FetchEvent

```dart
class FetchEvent extends ExtendableEvent { … }
```

- `FetchEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `String? get clientId`
- `bool? get isReload`
- `Future<dynamic> get preloadResponse`
- `_Request? get request`
- `void respondWith(Future<dynamic> r)`

## Class: FieldSetElement

```dart
class FieldSetElement extends HtmlElement { … }
```

- `FieldSetElement()`
- `bool? get disabled`
- `set disabled=(bool? value)`
- `List<Node>? get elements`
- `FormElement? get form`
- `String get name`
- `set name=(String value)`
- `String get type`
- `String get validationMessage`
- `ValidityState get validity`
- `bool get willValidate`
- `bool checkValidity()`
- `bool reportValidity()`
- `void setCustomValidity(String error)`

## Class: File

```dart
class File extends Blob { … }
```

- `File(List<Object> fileBits, String fileName, [Map<dynamic, dynamic>? options])`
- `int? get lastModified`
- `DateTime get lastModifiedDate`
- `String get name`
- `String? get relativePath`

## Class: FileEntry

```dart
class FileEntry extends Entry { … }
```

- `Future<FileWriter> createWriter()`
- `Future<File> file()`

## Class: FileList

```dart
class FileList
    extends JavaScriptObject
    with ListBase<File>, ImmutableListMixin<File>
    implements List<File>, JavaScriptIndexingBehavior<File> { … }
```

- `File get first`: The first element.
- `File get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `File get single`:
  Checks that this iterable has only one element, and returns that element.
- `File operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, File value)`:
  Sets the value at the given [index] in the list to [value].
- `File elementAt(int index)`: Returns the [index]th element.
- `File? item(int index)`

## Class: FileReader

```dart
class FileReader extends EventTarget { … }
```

- `FileReader()`
- static `int DONE`
- static `int EMPTY`
- static `int LOADING`
- static `EventStreamProvider<ProgressEvent> abortEvent`:
  Static factory designed to expose `abort` events to event
  handlers that are not necessarily instances of [FileReader].
- static `EventStreamProvider<ProgressEvent> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [FileReader].
- static `EventStreamProvider<ProgressEvent> loadEndEvent`:
  Static factory designed to expose `loadend` events to event
  handlers that are not necessarily instances of [FileReader].
- static `EventStreamProvider<ProgressEvent> loadEvent`:
  Static factory designed to expose `load` events to event
  handlers that are not necessarily instances of [FileReader].
- static `EventStreamProvider<ProgressEvent> loadStartEvent`:
  Static factory designed to expose `loadstart` events to event
  handlers that are not necessarily instances of [FileReader].
- static `EventStreamProvider<ProgressEvent> progressEvent`:
  Static factory designed to expose `progress` events to event
  handlers that are not necessarily instances of [FileReader].
- `DomException? get error`
- `Stream<ProgressEvent> get onAbort`:
  Stream of `abort` events handled by this [FileReader].
- `Stream<ProgressEvent> get onError`:
  Stream of `error` events handled by this [FileReader].
- `Stream<ProgressEvent> get onLoad`:
  Stream of `load` events handled by this [FileReader].
- `Stream<ProgressEvent> get onLoadEnd`:
  Stream of `loadend` events handled by this [FileReader].
- `Stream<ProgressEvent> get onLoadStart`:
  Stream of `loadstart` events handled by this [FileReader].
- `Stream<ProgressEvent> get onProgress`:
  Stream of `progress` events handled by this [FileReader].
- `int get readyState`
- `Object? get result`
- `void abort()`
- `void readAsArrayBuffer(Blob blob)`
- `void readAsDataUrl(Blob blob)`
- `void readAsText(Blob blob, [String? label])`

## Class: FileSystem

```dart
class FileSystem extends JavaScriptObject { … }
```

- `String? get name`
- `DirectoryEntry? get root`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: FileUploadInputElement

A control for picking files from the user's computer.

```dart
abstract class FileUploadInputElement implements InputElementBase { … }
```

- `FileUploadInputElement()`
- `List<File>? files`
- `String? get accept`
- `set accept=(String? value)`
- `bool? get multiple`
- `set multiple=(bool? value)`
- `bool get required`
- `set required=(bool value)`

## Class: FileWriter

```dart
class FileWriter extends EventTarget { … }
```

- static `int DONE`
- static `int INIT`
- static `int WRITING`
- static `EventStreamProvider<ProgressEvent> abortEvent`:
  Static factory designed to expose `abort` events to event
  handlers that are not necessarily instances of [FileWriter].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [FileWriter].
- static `EventStreamProvider<ProgressEvent> progressEvent`:
  Static factory designed to expose `progress` events to event
  handlers that are not necessarily instances of [FileWriter].
- static `EventStreamProvider<ProgressEvent> writeEndEvent`:
  Static factory designed to expose `writeend` events to event
  handlers that are not necessarily instances of [FileWriter].
- static `EventStreamProvider<ProgressEvent> writeEvent`:
  Static factory designed to expose `write` events to event
  handlers that are not necessarily instances of [FileWriter].
- static `EventStreamProvider<ProgressEvent> writeStartEvent`:
  Static factory designed to expose `writestart` events to event
  handlers that are not necessarily instances of [FileWriter].
- `DomException? get error`
- `int? get length`
- `Stream<ProgressEvent> get onAbort`:
  Stream of `abort` events handled by this [FileWriter].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [FileWriter].
- `Stream<ProgressEvent> get onProgress`:
  Stream of `progress` events handled by this [FileWriter].
- `Stream<ProgressEvent> get onWrite`:
  Stream of `write` events handled by this [FileWriter].
- `Stream<ProgressEvent> get onWriteEnd`:
  Stream of `writeend` events handled by this [FileWriter].
- `Stream<ProgressEvent> get onWriteStart`:
  Stream of `writestart` events handled by this [FileWriter].
- `int? get position`
- `int? get readyState`
- `void abort()`
- `void seek(int position)`
- `void truncate(int size)`
- `void write(Blob data)`

## Class: FixedSizeListIterator

```dart
class FixedSizeListIterator<T> implements Iterator<T> { … }
```

- `FixedSizeListIterator(List<T> array)`
- `T get current`: The current element.
- `bool moveNext()`: Advances the iterator to the next element of the iteration.

## Class: FocusEvent

```dart
class FocusEvent extends UIEvent { … }
```

- `FocusEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `EventTarget? get relatedTarget`

## Class: FontFace

```dart
class FontFace extends JavaScriptObject { … }
```

- `FontFace(String family, Object source, [Map<dynamic, dynamic>? descriptors])`
- `String? get display`
- `set display=(String? value)`
- `String? get family`
- `set family=(String? value)`
- `String? get featureSettings`
- `set featureSettings=(String? value)`
- `Future<FontFace> get loaded`
- `String? get status`
- `String? get stretch`
- `set stretch=(String? value)`
- `String? get style`
- `set style=(String? value)`
- `String? get unicodeRange`
- `set unicodeRange=(String? value)`
- `String? get variant`
- `set variant=(String? value)`
- `String? get weight`
- `set weight=(String? value)`
- `Future<FontFace> load()`

## Class: FontFaceSet

```dart
class FontFaceSet extends EventTarget { … }
```

- static `EventStreamProvider<FontFaceSetLoadEvent> loadingDoneEvent`
- static `EventStreamProvider<FontFaceSetLoadEvent> loadingErrorEvent`
- static `EventStreamProvider<FontFaceSetLoadEvent> loadingEvent`
- `Stream<FontFaceSetLoadEvent> get onLoading`
- `Stream<FontFaceSetLoadEvent> get onLoadingDone`
- `Stream<FontFaceSetLoadEvent> get onLoadingError`
- `String? get status`
- `FontFaceSet? add(FontFace arg)`
- `bool check(String font, [String? text])`
- `void clear()`
- `bool delete(FontFace arg)`
- `void forEach(void Function(FontFace, FontFace, FontFaceSet) callback, [Object? thisArg])`
- `bool has(FontFace arg)`

## Class: FontFaceSetLoadEvent

```dart
class FontFaceSetLoadEvent extends Event { … }
```

- `FontFaceSetLoadEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `List<FontFace>? get fontfaces`

## Class: FontFaceSource

```dart
class FontFaceSource extends JavaScriptObject { … }
```

- `FontFaceSet? get fonts`

## Class: ForeignFetchEvent

```dart
class ForeignFetchEvent extends ExtendableEvent { … }
```

- `ForeignFetchEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `String? get origin`
- `_Request? get request`
- `void respondWith(Future<dynamic> r)`

## Class: FormData

```dart
class FormData extends JavaScriptObject { … }
```

- `FormData([FormElement? form])`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void append(String name, String value)`
- `void appendBlob(String name, Blob value, [String? filename])`
- `void delete(String name)`
- `Object? get(String name)`
- `List<Object> getAll(String name)`
- `bool has(String name)`
- `void set(String name, dynamic value, [String? filename])`

## Class: FormElement

```dart
class FormElement extends HtmlElement { … }
```

- `FormElement()`
- `String? get acceptCharset`
- `set acceptCharset=(String? value)`
- `String? get action`
- `set action=(String? value)`
- `String? get autocomplete`
- `set autocomplete=(String? value)`
- `String? get encoding`
- `set encoding=(String? value)`
- `String? get enctype`
- `set enctype=(String? value)`
- `int? get length`
- `String? get method`
- `set method=(String? value)`
- `String? get name`
- `set name=(String? value)`
- `bool? get noValidate`
- `set noValidate=(bool? value)`
- `String? get target`
- `set target=(String? value)`
- `bool checkValidity()`
- `Element item(int index)`
- `bool reportValidity()`
- `void requestAutocomplete(Map<dynamic, dynamic>? details)`
- `void reset()`
- `void submit()`

## Class: Gamepad

```dart
class Gamepad extends JavaScriptObject { … }
```

- `List<num>? get axes`
- `List<GamepadButton>? get buttons`
- `bool? get connected`
- `int? get displayId`
- `String? get hand`
- `String? get id`
- `int? get index`
- `String? get mapping`
- `GamepadPose? get pose`
- `int? get timestamp`

## Class: GamepadButton

```dart
class GamepadButton extends JavaScriptObject { … }
```

- `bool? get pressed`
- `bool? get touched`
- `num? get value`

## Class: GamepadEvent

```dart
class GamepadEvent extends Event { … }
```

- `GamepadEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `Gamepad? get gamepad`

## Class: GamepadPose

```dart
class GamepadPose extends JavaScriptObject { … }
```

- `Float32List? get angularAcceleration`
- `Float32List? get angularVelocity`
- `bool? get hasOrientation`
- `bool? get hasPosition`
- `Float32List? get linearAcceleration`
- `Float32List? get linearVelocity`
- `Float32List? get orientation`
- `Float32List? get position`

## Class: Geolocation

```dart
class Geolocation extends JavaScriptObject { … }
```

- `Future<Geoposition> getCurrentPosition({bool? enableHighAccuracy, Duration? timeout, Duration? maximumAge})`
- `Stream<Geoposition> watchPosition({bool? enableHighAccuracy, Duration? timeout, Duration? maximumAge})`

## Class: Geoposition

```dart
class Geoposition extends JavaScriptObject { … }
```

- `Coordinates? get coords`
- `int? get timestamp`

## Class: GlobalEventHandlers

```dart
abstract class GlobalEventHandlers implements EventTarget { … }
```

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
- `Events get on`:
  This is an ease-of-use accessor for event streams which should only be
  used when an explicit accessor is not available.
- `Stream<Event> get onAbort`
- `Stream<Event> get onBlur`
- `Stream<Event> get onCanPlay`
- `Stream<Event> get onCanPlayThrough`
- `Stream<Event> get onChange`
- `Stream<MouseEvent> get onClick`
- `Stream<MouseEvent> get onContextMenu`
- `Stream<Event> get onDoubleClick`
- `Stream<MouseEvent> get onDrag`
- `Stream<MouseEvent> get onDragEnd`
- `Stream<MouseEvent> get onDragEnter`
- `Stream<MouseEvent> get onDragLeave`
- `Stream<MouseEvent> get onDragOver`
- `Stream<MouseEvent> get onDragStart`
- `Stream<MouseEvent> get onDrop`
- `Stream<Event> get onDurationChange`
- `Stream<Event> get onEmptied`
- `Stream<Event> get onEnded`
- `Stream<Event> get onError`
- `Stream<Event> get onFocus`
- `Stream<Event> get onInput`
- `Stream<Event> get onInvalid`
- `Stream<KeyboardEvent> get onKeyDown`
- `Stream<KeyboardEvent> get onKeyPress`
- `Stream<KeyboardEvent> get onKeyUp`
- `Stream<Event> get onLoad`
- `Stream<Event> get onLoadedData`
- `Stream<Event> get onLoadedMetadata`
- `Stream<MouseEvent> get onMouseDown`
- `Stream<MouseEvent> get onMouseEnter`
- `Stream<MouseEvent> get onMouseLeave`
- `Stream<MouseEvent> get onMouseMove`
- `Stream<MouseEvent> get onMouseOut`
- `Stream<MouseEvent> get onMouseOver`
- `Stream<MouseEvent> get onMouseUp`
- `Stream<WheelEvent> get onMouseWheel`
- `Stream<Event> get onPause`
- `Stream<Event> get onPlay`
- `Stream<Event> get onPlaying`
- `Stream<Event> get onRateChange`
- `Stream<Event> get onReset`
- `Stream<Event> get onResize`
- `Stream<Event> get onScroll`
- `Stream<Event> get onSeeked`
- `Stream<Event> get onSeeking`
- `Stream<Event> get onSelect`
- `Stream<Event> get onStalled`
- `Stream<Event> get onSubmit`
- `Stream<Event> get onSuspend`
- `Stream<Event> get onTimeUpdate`
- `Stream<TouchEvent> get onTouchCancel`
- `Stream<TouchEvent> get onTouchEnd`
- `Stream<TouchEvent> get onTouchMove`
- `Stream<TouchEvent> get onTouchStart`
- `Stream<Event> get onVolumeChange`
- `Stream<Event> get onWaiting`
- `Stream<WheelEvent> get onWheel`
- `void addEventListener(String type, dynamic Function(Event)? listener, [bool? useCapture])`
- `bool dispatchEvent(Event event)`
- `void removeEventListener(String type, dynamic Function(Event)? listener, [bool? useCapture])`

## Class: Gyroscope

```dart
class Gyroscope extends Sensor { … }
```

- `Gyroscope([Map<dynamic, dynamic>? sensorOptions])`
- `num? get x`
- `num? get y`
- `num? get z`

## Class: HRElement

An `<hr>` tag.

```dart
class HRElement extends HtmlElement { … }
```

- `HRElement()`
- `String get color`
- `set color=(String value)`

## Class: HashChangeEvent

```dart
class HashChangeEvent extends Event { … }
```

- `HashChangeEvent(String type, {bool canBubble, bool cancelable, String? oldUrl, String? newUrl})`
- `String? get newUrl`
- `String? get oldUrl`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: HeadElement

```dart
class HeadElement extends HtmlElement { … }
```

- `HeadElement()`

## Class: Headers

```dart
class Headers extends JavaScriptObject { … }
```

- `Headers([Object? init])`

## Class: HeadingElement

```dart
class HeadingElement extends HtmlElement { … }
```

- `HeadingElement.h1()`
- `HeadingElement.h2()`
- `HeadingElement.h3()`
- `HeadingElement.h4()`
- `HeadingElement.h5()`
- `HeadingElement.h6()`

## Class: HiddenInputElement

Hidden input which is not intended to be seen or edited by the user.

```dart
abstract class HiddenInputElement implements InputElementBase { … }
```

- `HiddenInputElement()`

## Class: History

```dart
class History extends JavaScriptObject implements HistoryBase { … }
```

- `int get length`
- `String? get scrollRestoration`
- `set scrollRestoration=(String? value)`
- `dynamic get state`
- static `bool get supportsState`:
  Checks if the State APIs are supported on the current platform.
- `void back()`
- `void forward()`
- `void go([int? delta])`
- `void pushState(dynamic data, String title, String? url)`
- `void replaceState(dynamic data, String title, String? url)`

## Class: HistoryBase

```dart
abstract class HistoryBase { … }
```

- `void back()`
- `void forward()`
- `void go(int distance)`

## Class: HtmlCollection

```dart
class HtmlCollection
    extends JavaScriptObject
    with ListBase<Node>, ImmutableListMixin<Node>
    implements List<Node>, JavaScriptIndexingBehavior<Node> { … }
```

- `Node get first`: The first element.
- `Node get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `Node get single`:
  Checks that this iterable has only one element, and returns that element.
- `Node operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Node value)`:
  Sets the value at the given [index] in the list to [value].
- `Node elementAt(int index)`: Returns the [index]th element.
- `Node? item(int? index)`
- `Object? namedItem(String name)`

## Class: HtmlDocument

```dart
class HtmlDocument extends Document { … }
```

- static `EventStreamProvider<Event> visibilityChangeEvent`:
  Static factory designed to expose `visibilitychange` events to event
  handlers that are not necessarily instances of [Document].
- `BodyElement? get body`
- `set body=(BodyElement? value)`
- `HeadElement? get head`
- `String? get lastModified`
- `Stream<Event> get onVisibilityChange`
- `String? get preferredStylesheetSet`
- `String get referrer`
- `String? get selectedStylesheetSet`
- `set selectedStylesheetSet=(String? value)`
- `List<StyleSheet>? get styleSheets`
- `String get title`
- `set title=(String value)`
- `Range caretRangeFromPoint(int? x, int? y)`:
  UNSTABLE: Chrome-only - create a Range from the given point.
- `ElementUpgrader createElementUpgrader(Type type, {String? extendsTag})`:
  Creates an element upgrader which can be used to change the Dart wrapper
  type for elements.
- `Element? elementFromPoint(int x, int y)`
- `void exitFullscreen()`: Returns page to standard layout.

## Class: HtmlElement

```dart
class HtmlElement extends Element implements NoncedElement { … }
```

- `HtmlElement()`
- `String? get nonce`
- `set nonce=(String? value)`

## Class: HtmlFormControlsCollection

```dart
class HtmlFormControlsCollection extends HtmlCollection { … }
```

- `Object? namedItem(String name)`

## Class: HtmlHtmlElement

```dart
class HtmlHtmlElement extends HtmlElement { … }
```

- `HtmlHtmlElement()`

## Class: HtmlHyperlinkElementUtils

```dart
class HtmlHyperlinkElementUtils extends JavaScriptObject { … }
```

- `String? get hash`
- `set hash=(String? value)`
- `String? get host`
- `set host=(String? value)`
- `String? get hostname`
- `set hostname=(String? value)`
- `String? get href`
- `set href=(String? value)`
- `String? get origin`
- `String? get password`
- `set password=(String? value)`
- `String? get pathname`
- `set pathname=(String? value)`
- `String? get port`
- `set port=(String? value)`
- `String? get protocol`
- `set protocol=(String? value)`
- `String? get search`
- `set search=(String? value)`
- `String? get username`
- `set username=(String? value)`

## Class: HtmlOptionsCollection

```dart
class HtmlOptionsCollection extends HtmlCollection { … }
```

## Class: HttpRequest

A client-side XHR request for getting data from a URL,
formally known as XMLHttpRequest.

```dart
class HttpRequest extends HttpRequestEventTarget { … }
```

- `HttpRequest()`: General constructor for any type of request (GET, POST, etc).
- static `int DONE`
- static `int HEADERS_RECEIVED`
- static `int LOADING`
- static `int OPENED`
- static `int UNSENT`
- static `EventStreamProvider<Event> readyStateChangeEvent`:
  Static factory designed to expose `readystatechange` events to event
  handlers that are not necessarily instances of [HttpRequest].
- static `Future<String> getString(String url, {bool? withCredentials, void Function(ProgressEvent)? onProgress})`:
  Creates a GET request for the specified [url].
- static `Future<HttpRequest> postFormData(String url, Map<String, String> data, {bool? withCredentials, String? responseType, Map<String, String>? requestHeaders, void Function(ProgressEvent)? onProgress})`:
  Makes a server POST request with the specified data encoded as form data.
- static `Future<HttpRequest> request(String url, {String? method, bool? withCredentials, String? responseType, String? mimeType, Map<String, String>? requestHeaders, dynamic sendData, void Function(ProgressEvent)? onProgress})`:
  Creates and sends a URL request for the specified [url].
- static `Future<String> requestCrossOrigin(String url, {String? method, String? sendData})`:
  Makes a cross-origin request to the specified URL.
- `Stream<Event> get onReadyStateChange`:
  Event listeners to be notified every time the [HttpRequest]
  object's `readyState` changes values.
- `int get readyState`: Indicator of the current state of the request:
- `dynamic get response`: The data received as a reponse from the request.
- `Map<String, String> get responseHeaders`:
  Returns all response headers as a key-value map.
- `String? get responseText`:
  The response in String form or empty String on failure.
- `String get responseType`:
  [String] telling the server the desired response format.
- `set responseType=(String value)`
- `String? get responseUrl`
- `Document? get responseXml`: The request response, or null on failure.
- `int? get status`: The HTTP result code from the request (200, 404, etc).
  See also: [HTTP Status Codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
- `String? get statusText`: The request response string (such as \"OK\").
  See also: [HTTP Status Codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
- static `bool get supportsCrossOrigin`:
  Checks to see if the current platform supports making cross origin
  requests.
- static `bool get supportsLoadEndEvent`:
  Checks to see if the LoadEnd event is supported on the current platform.
- static `bool get supportsOverrideMimeType`:
  Checks to see if the overrideMimeType method is supported on the current
  platform.
- static `bool get supportsProgressEvent`:
  Checks to see if the Progress event is supported on the current platform.
- `int? get timeout`:
  Length of time in milliseconds before a request is automatically
  terminated.
- `set timeout=(int? value)`
- `HttpRequestUpload get upload`:
  [EventTarget] that can hold listeners to track the progress of the request.
- `set withCredentials=(bool? value)`
- `bool? get withCredentials`:
  True if cross-site requests should use credentials such as cookies
  or authorization headers; false otherwise.
- `void abort()`: Stop the current request.
- `String getAllResponseHeaders()`:
  Retrieve all the response headers from a request.
- `String? getResponseHeader(String name)`:
  Return the response header named `header`, or null if not found.
- `void open(String method, String url, {bool? async, String? user, String? password})`:
  Specify the desired `url`, and `method` to use in making the request.
- `void overrideMimeType(String mime)`:
  Specify a particular MIME type (such as `text/xml`) desired for the
  response.
- `void send([dynamic body_OR_data])`: Send the request with any given `data`.
- `void setRequestHeader(String name, String value)`:
  Sets the value of an HTTP request header.

## Class: HttpRequestEventTarget

```dart
class HttpRequestEventTarget extends EventTarget { … }
```

- static `EventStreamProvider<ProgressEvent> abortEvent`:
  Static factory designed to expose `abort` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- static `EventStreamProvider<ProgressEvent> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- static `EventStreamProvider<ProgressEvent> loadEndEvent`:
  Static factory designed to expose `loadend` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- static `EventStreamProvider<ProgressEvent> loadEvent`:
  Static factory designed to expose `load` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- static `EventStreamProvider<ProgressEvent> loadStartEvent`:
  Static factory designed to expose `loadstart` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- static `EventStreamProvider<ProgressEvent> progressEvent`:
  Static factory designed to expose `progress` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- static `EventStreamProvider<ProgressEvent> timeoutEvent`:
  Static factory designed to expose `timeout` events to event
  handlers that are not necessarily instances of [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onAbort`:
  Stream of `abort` events handled by this [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onError`:
  Stream of `error` events handled by this [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onLoad`:
  Stream of `load` events handled by this [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onLoadEnd`:
  Stream of `loadend` events handled by this [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onLoadStart`:
  Stream of `loadstart` events handled by this [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onProgress`:
  Stream of `progress` events handled by this [HttpRequestEventTarget].
- `Stream<ProgressEvent> get onTimeout`:
  Stream of `timeout` events handled by this [HttpRequestEventTarget].

## Class: HttpRequestUpload

```dart
class HttpRequestUpload extends HttpRequestEventTarget { … }
```

## Class: HttpStatus

HTTP status codes.  Exported in dart:io and dart:html.

```dart
abstract class HttpStatus { … }
```

- static `int ACCEPTED`
- static `int BAD_GATEWAY`
- static `int BAD_REQUEST`
- static `int CONFLICT`
- static `int CONTINUE`
- static `int CREATED`
- static `int EXPECTATION_FAILED`
- static `int FORBIDDEN`
- static `int FOUND`
- static `int GATEWAY_TIMEOUT`
- static `int GONE`
- static `int HTTP_VERSION_NOT_SUPPORTED`
- static `int INTERNAL_SERVER_ERROR`
- static `int LENGTH_REQUIRED`
- static `int METHOD_NOT_ALLOWED`
- static `int MOVED_PERMANENTLY`
- static `int MOVED_TEMPORARILY`
- static `int MULTIPLE_CHOICES`
- static `int NETWORK_CONNECT_TIMEOUT_ERROR`
- static `int NON_AUTHORITATIVE_INFORMATION`
- static `int NOT_ACCEPTABLE`
- static `int NOT_FOUND`
- static `int NOT_IMPLEMENTED`
- static `int NOT_MODIFIED`
- static `int NO_CONTENT`
- static `int OK`
- static `int PARTIAL_CONTENT`
- static `int PAYMENT_REQUIRED`
- static `int PRECONDITION_FAILED`
- static `int PROXY_AUTHENTICATION_REQUIRED`
- static `int REQUESTED_RANGE_NOT_SATISFIABLE`
- static `int REQUEST_ENTITY_TOO_LARGE`
- static `int REQUEST_TIMEOUT`
- static `int REQUEST_URI_TOO_LONG`
- static `int RESET_CONTENT`
- static `int SEE_OTHER`
- static `int SERVICE_UNAVAILABLE`
- static `int SWITCHING_PROTOCOLS`
- static `int TEMPORARY_REDIRECT`
- static `int UNAUTHORIZED`
- static `int UNSUPPORTED_MEDIA_TYPE`
- static `int UPGRADE_REQUIRED`
- static `int USE_PROXY`
- static `int accepted`
- static `int alreadyReported`
- static `int badGateway`
- static `int badRequest`
- static `int clientClosedRequest`
- static `int conflict`
- static `int connectionClosedWithoutResponse`
- static `int continue_`
- static `int created`
- static `int expectationFailed`
- static `int failedDependency`
- static `int forbidden`
- static `int found`
- static `int gatewayTimeout`
- static `int gone`
- static `int httpVersionNotSupported`
- static `int imUsed`
- static `int insufficientStorage`
- static `int internalServerError`
- static `int lengthRequired`
- static `int locked`
- static `int loopDetected`
- static `int methodNotAllowed`
- static `int misdirectedRequest`
- static `int movedPermanently`
- static `int movedTemporarily`
- static `int multiStatus`
- static `int multipleChoices`
- static `int networkAuthenticationRequired`
- static `int networkConnectTimeoutError`
- static `int noContent`
- static `int nonAuthoritativeInformation`
- static `int notAcceptable`
- static `int notExtended`
- static `int notFound`
- static `int notImplemented`
- static `int notModified`
- static `int ok`
- static `int partialContent`
- static `int paymentRequired`
- static `int permanentRedirect`
- static `int preconditionFailed`
- static `int preconditionRequired`
- static `int processing`
- static `int proxyAuthenticationRequired`
- static `int requestEntityTooLarge`
- static `int requestHeaderFieldsTooLarge`
- static `int requestTimeout`
- static `int requestUriTooLong`
- static `int requestedRangeNotSatisfiable`
- static `int resetContent`
- static `int seeOther`
- static `int serviceUnavailable`
- static `int switchingProtocols`
- static `int temporaryRedirect`
- static `int tooManyRequests`
- static `int unauthorized`
- static `int unavailableForLegalReasons`
- static `int unprocessableEntity`
- static `int unsupportedMediaType`
- static `int upgradeRequired`
- static `int useProxy`
- static `int variantAlsoNegotiates`

## Class: IFrameElement

```dart
class IFrameElement extends HtmlElement { … }
```

- `IFrameElement()`
- `String? get allow`
- `set allow=(String? value)`
- `bool? get allowFullscreen`
- `set allowFullscreen=(bool? value)`
- `bool? get allowPaymentRequest`
- `set allowPaymentRequest=(bool? value)`
- `WindowBase? get contentWindow`
- `String? get csp`
- `set csp=(String? value)`
- `String? get height`
- `set height=(String? value)`
- `String? get name`
- `set name=(String? value)`
- `String? get referrerPolicy`
- `set referrerPolicy=(String? value)`
- `DomTokenList? get sandbox`
- `String? get src`
- `set src=(String? value)`
- `String? get srcdoc`
- `set srcdoc=(String? value)`
- `String? get width`
- `set width=(String? value)`

## Class: IdleDeadline

```dart
class IdleDeadline extends JavaScriptObject { … }
```

- `bool? get didTimeout`
- `double timeRemaining()`

## Class: ImageBitmap

```dart
class ImageBitmap extends JavaScriptObject { … }
```

- `int? get height`
- `int? get width`
- `void close()`

## Class: ImageBitmapRenderingContext

```dart
class ImageBitmapRenderingContext extends JavaScriptObject { … }
```

- `CanvasElement? get canvas`
- `void transferFromImageBitmap(ImageBitmap? bitmap)`

## Class: ImageButtonInputElement

Either an image which the user can select a coordinate to or a form
submit button.

```dart
abstract class ImageButtonInputElement implements InputElementBase { … }
```

- `ImageButtonInputElement()`
- `String? get alt`
- `set alt=(String? value)`
- `String get formAction`
- `set formAction=(String value)`
- `String get formEnctype`
- `set formEnctype=(String value)`
- `String get formMethod`
- `set formMethod=(String value)`
- `bool get formNoValidate`
- `set formNoValidate=(bool value)`
- `String get formTarget`
- `set formTarget=(String value)`
- `int? get height`
- `set height=(int? value)`
- `String? get src`
- `set src=(String? value)`
- `int? get width`
- `set width=(int? value)`

## Class: ImageCapture

```dart
class ImageCapture extends JavaScriptObject { … }
```

- `ImageCapture(MediaStreamTrack track)`
- `MediaStreamTrack? get track`
- `Future<PhotoCapabilities> getPhotoCapabilities()`
- `Future<Map<String, dynamic>?> getPhotoSettings()`
- `Future<ImageBitmap> grabFrame()`
- `Future<dynamic> setOptions(Map<dynamic, dynamic> photoSettings)`
- `Future<Blob> takePhoto([Map<dynamic, dynamic>? photoSettings])`

## Class: ImageData

```dart
class ImageData extends JavaScriptObject { … }
```

- `ImageData(dynamic data_OR_sw, int sh_OR_sw, [int? sh])`
- `Uint8ClampedList get data`
- `int get height`
- `int get width`

## Class: ImageElement

```dart
class ImageElement extends HtmlElement implements CanvasImageSource { … }
```

- `ImageElement({String? src, int? width, int? height})`
- `String? get alt`
- `set alt=(String? value)`
- `String? get async`
- `set async=(String? value)`
- `bool? get complete`
- `String? get crossOrigin`
- `set crossOrigin=(String? value)`
- `String? get currentSrc`
- `int? get height`
- `set height=(int? value)`
- `bool? get isMap`
- `set isMap=(bool? value)`
- `int get naturalHeight`
- `int get naturalWidth`
- `String? get referrerPolicy`
- `set referrerPolicy=(String? value)`
- `String? get sizes`
- `set sizes=(String? value)`
- `String? get src`
- `set src=(String? value)`
- `String? get srcset`
- `set srcset=(String? value)`
- `String? get useMap`
- `set useMap=(String? value)`
- `int? get width`
- `set width=(int? value)`
- `Future<dynamic> decode()`

## Class: ImmutableListMixin

```dart
abstract mixin class ImmutableListMixin<E> implements List<E> { … }
```

- `Iterator<E> get iterator`:
  A new `Iterator` that allows iterating the elements of this `Iterable`.
- `void add(E value)`: Adds [value] to the end of this list,
  extending the length by one.
- `void addAll(Iterable<E> iterable)`:
  Appends all objects of [iterable] to the end of this list.
- `void fillRange(int start, int end, [E? fillValue])`:
  Overwrites a range of elements with [fillValue].
- `void insert(int index, E element)`:
  Inserts [element] at position [index] in this list.
- `void insertAll(int index, Iterable<E> iterable)`:
  Inserts all objects of [iterable] at position [index] in this list.
- `bool remove(Object? object)`:
  Removes the first occurrence of [value] from this list.
- `E removeAt(int pos)`: Removes the object at position [index] from this list.
- `E removeLast()`: Removes and returns the last object in this list.
- `void removeRange(int start, int end)`:
  Removes a range of elements from the list.
- `void removeWhere(bool Function(E) test)`:
  Removes all objects from this list that satisfy [test].
- `void replaceRange(int start, int end, Iterable<E> iterable)`:
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

## Class: InputDeviceCapabilities

```dart
class InputDeviceCapabilities extends JavaScriptObject { … }
```

- `InputDeviceCapabilities([Map<dynamic, dynamic>? deviceInitDict])`
- `bool? get firesTouchEvents`

## Class: InputElement

```dart
class InputElement
    extends HtmlElement
    implements HiddenInputElement, SearchInputElement, TextInputElement, UrlInputElement, TelephoneInputElement, EmailInputElement, PasswordInputElement, DateInputElement, MonthInputElement, WeekInputElement, TimeInputElement, LocalDateTimeInputElement, NumberInputElement, RangeInputElement, CheckboxInputElement, RadioButtonInputElement, FileUploadInputElement, SubmitButtonInputElement, ImageButtonInputElement, ResetButtonInputElement, ButtonInputElement { … }
```

- `InputElement({String? type})`
- `set accept=(String? value)`
- `String? get accept`
- `String? get alt`
- `set alt=(String? value)`
- `String? get autocapitalize`
- `set autocapitalize=(String? value)`
- `String get autocomplete`
- `set autocomplete=(String value)`
- `bool get autofocus`
- `set autofocus=(bool value)`
- `String? get capture`
- `set capture=(String? value)`
- `bool? get checked`
- `set checked=(bool? value)`
- `bool? get defaultChecked`
- `set defaultChecked=(bool? value)`
- `String? get defaultValue`
- `set defaultValue=(String? value)`
- `String? get dirName`
- `set dirName=(String? value)`
- `set directory=(bool? value)`
- `bool? get directory`
- `bool? get disabled`
- `set disabled=(bool? value)`
- `List<Entry>? get entries`
- `List<File>? get files`
- `set files=(List<File>? value)`
- `FormElement? get form`
- `String get formAction`
- `set formAction=(String value)`
- `String get formEnctype`
- `set formEnctype=(String value)`
- `set formMethod=(String value)`
- `String get formMethod`
- `bool get formNoValidate`
- `set formNoValidate=(bool value)`
- `String get formTarget`
- `set formTarget=(String value)`
- `int? get height`
- `set height=(int? value)`
- `bool? get incremental`
- `set incremental=(bool? value)`
- `bool? get indeterminate`
- `set indeterminate=(bool? value)`
- `List<Node>? get labels`
- `HtmlElement? get list`
- `String? get max`
- `set max=(String? value)`
- `int? get maxLength`
- `set maxLength=(int? value)`
- `String? get min`
- `set min=(String? value)`
- `int? get minLength`
- `set minLength=(int? value)`
- `bool? get multiple`
- `set multiple=(bool? value)`
- `String? get name`
- `set name=(String? value)`
- `String get pattern`
- `set pattern=(String value)`
- `String get placeholder`
- `set placeholder=(String value)`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- `set selectionDirection=(String? value)`
- `String? get selectionDirection`
- `int? get selectionEnd`
- `set selectionEnd=(int? value)`
- `int? get selectionStart`
- `set selectionStart=(int? value)`
- `int? get size`
- `set size=(int? value)`
- `String? get src`
- `set src=(String? value)`
- `String? get step`
- `set step=(String? value)`
- `String? get type`
- `set type=(String? value)`
- `String get validationMessage`
- `ValidityState get validity`
- `String? get value`
- `set value=(String? value)`
- `DateTime get valueAsDate`
- `set valueAsDate=(DateTime? value)`
- `num? get valueAsNumber`
- `set valueAsNumber=(num? value)`
- `int? get width`
- `set width=(int? value)`
- `bool get willValidate`
- `bool checkValidity()`
- `bool reportValidity()`
- `void select()`
- `void setCustomValidity(String error)`
- `void setRangeText(String replacement, {int? start, int? end, String? selectionMode})`
- `void setSelectionRange(int start, int end, [String? direction])`
- `void stepDown([int? n])`
- `void stepUp([int? n])`

## Class: InputElementBase

Exposes the functionality common between all InputElement types.

```dart
abstract class InputElementBase implements Element { … }
```

- `bool get autofocus`
- `set autofocus=(bool value)`
- `bool? get disabled`
- `set disabled=(bool? value)`
- `bool? get incremental`
- `set incremental=(bool? value)`
- `bool? get indeterminate`
- `set indeterminate=(bool? value)`
- `List<Node>? get labels`
- `String? get name`
- `set name=(String? value)`
- `String get validationMessage`
- `ValidityState get validity`
- `String? get value`
- `set value=(String? value)`
- `bool get willValidate`
- `bool checkValidity()`
- `void setCustomValidity(String error)`

## Class: InstallEvent

```dart
class InstallEvent extends ExtendableEvent { … }
```

- `InstallEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `void registerForeignFetch(Map<dynamic, dynamic> options)`

## Class: IntersectionObserver

```dart
class IntersectionObserver extends JavaScriptObject { … }
```

- `IntersectionObserver(void Function(List<dynamic>, IntersectionObserver) callback, [Map<dynamic, dynamic>? options])`
- `Element? get root`
- `String? get rootMargin`
- `List<num>? get thresholds`
- `void disconnect()`
- `void observe(Element target)`
- `List<IntersectionObserverEntry> takeRecords()`
- `void unobserve(Element target)`

## Class: IntersectionObserverEntry

```dart
class IntersectionObserverEntry extends JavaScriptObject { … }
```

- `DomRectReadOnly? get boundingClientRect`
- `num? get intersectionRatio`
- `DomRectReadOnly? get intersectionRect`
- `bool? get isIntersecting`
- `DomRectReadOnly? get rootBounds`
- `Element? get target`
- `num? get time`

## Class: InterventionReport

```dart
class InterventionReport extends ReportBody { … }
```

- `int? get lineNumber`
- `String? get message`
- `String? get sourceFile`

## Class: KeyCode

Defines the keycode values for keys that are returned by
KeyboardEvent.keyCode.

```dart
abstract class KeyCode { … }
```

- static `int A`
- static `int ALT`
- static `int APOSTROPHE`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int B`
- static `int BACKSLASH`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int BACKSPACE`
- static `int C`
- static `int CAPS_LOCK`
- static `int CLOSE_SQUARE_BRACKET`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int COMMA`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int CONTEXT_MENU`
- static `int CTRL`
- static `int D`
- static `int DASH`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int DELETE`
- static `int DOWN`
- static `int E`
- static `int EIGHT`
- static `int END`
- static `int ENTER`
- static `int EQUALS`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int ESC`
- static `int F`
- static `int F1`
- static `int F10`
- static `int F11`
- static `int F12`
- static `int F2`
- static `int F3`
- static `int F4`
- static `int F5`
- static `int F6`
- static `int F7`
- static `int F8`
- static `int F9`
- static `int FF_EQUALS`
- static `int FF_SEMICOLON`
- static `int FIRST_MEDIA_KEY`
- static `int FIVE`
- static `int FOUR`
- static `int G`
- static `int H`
- static `int HOME`
- static `int I`
- static `int INSERT`
- static `int J`
- static `int K`
- static `int L`
- static `int LAST_MEDIA_KEY`
- static `int LEFT`
- static `int M`
- static `int MAC_ENTER`
- static `int MAC_FF_META`
- static `int META`
- static `int N`
- static `int NINE`
- static `int NUMLOCK`
- static `int NUM_CENTER`: NUM_CENTER is also NUMLOCK for FF and Safari on Mac.
- static `int NUM_DELETE`
- static `int NUM_DIVISION`
- static `int NUM_EAST`
- static `int NUM_EIGHT`
- static `int NUM_FIVE`
- static `int NUM_FOUR`
- static `int NUM_INSERT`
- static `int NUM_MINUS`
- static `int NUM_MULTIPLY`
- static `int NUM_NINE`
- static `int NUM_NORTH`
- static `int NUM_NORTH_EAST`
- static `int NUM_NORTH_WEST`
- static `int NUM_ONE`
- static `int NUM_PERIOD`
- static `int NUM_PLUS`
- static `int NUM_SEVEN`
- static `int NUM_SIX`
- static `int NUM_SOUTH`
- static `int NUM_SOUTH_EAST`
- static `int NUM_SOUTH_WEST`
- static `int NUM_THREE`
- static `int NUM_TWO`
- static `int NUM_WEST`
- static `int NUM_ZERO`
- static `int O`
- static `int ONE`
- static `int OPEN_SQUARE_BRACKET`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int P`
- static `int PAGE_DOWN`
- static `int PAGE_UP`
- static `int PAUSE`
- static `int PERIOD`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int PRINT_SCREEN`
- static `int Q`
- static `int QUESTION_MARK`:
  CAUTION: The question mark is for US-keyboard layouts. It varies
  for other locales and keyboard layouts.
- static `int R`
- static `int RIGHT`
- static `int S`
- static `int SCROLL_LOCK`
- static `int SEMICOLON`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int SEVEN`
- static `int SHIFT`
- static `int SINGLE_QUOTE`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int SIX`
- static `int SLASH`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int SPACE`
- static `int T`
- static `int TAB`
- static `int THREE`
- static `int TILDE`:
  CAUTION: This constant requires localization for other locales and keyboard
  layouts.
- static `int TWO`
- static `int U`
- static `int UNKNOWN`: A sentinel value if the keycode could not be determined.
- static `int UP`
- static `int V`
- static `int W`
- static `int WIN_IME`
- static `int WIN_KEY`
- static `int WIN_KEY_FF_LINUX`
- static `int WIN_KEY_LEFT`
- static `int WIN_KEY_RIGHT`
- static `int X`
- static `int Y`
- static `int Z`
- static `int ZERO`
- static `bool isCharacterKey(int keyCode)`:
  Returns true if the keyCode produces a (US keyboard) character.
  Note: This does not (yet) cover characters on non-US keyboards (Russian,
  Hebrew, etc.).

## Class: KeyEvent

A custom KeyboardEvent that attempts to eliminate cross-browser
inconsistencies, and also provide both keyCode and charCode information
for all key events (when such information can be determined).

```dart
class KeyEvent extends _WrappedEvent implements KeyboardEvent { … }
```

- `KeyEvent(String type, {Window? view, bool canBubble, bool cancelable, int keyCode, int charCode, int location, bool ctrlKey, bool altKey, bool shiftKey, bool metaKey, EventTarget? currentTarget})`:
  Programmatically create a new KeyEvent (and KeyboardEvent).
- `KeyEvent.wrap(KeyboardEvent parent)`:
  Construct a KeyEvent with [parent] as the event we're emulating.
- static `EventStreamProvider<KeyEvent> keyDownEvent`:
  Accessor to provide a stream of KeyEvents on the desired target.
- static `EventStreamProvider<KeyEvent> keyPressEvent`:
  Accessor to provide a stream of KeyEvents on the desired target.
- static `EventStreamProvider<KeyEvent> keyUpEvent`:
  Accessor to provide a stream of KeyEvents on the desired target.
- `bool get altKey`:
  Calculated value of whether the alt key is pressed is for this event.
- static `bool get canUseDispatchEvent`
- `int get charCode`:
  Calculated value of what the estimated charCode is for this event.
- `String get code`
- `bool get ctrlKey`: True if the ctrl key is pressed during this event.
- `EventTarget? get currentTarget`:
  The currently registered target for this event.
- `int get detail`
- `bool get isComposed`
- `bool get isComposing`
- `String get key`
- `int get keyCode`:
  Calculated value of what the estimated keyCode is for this event.
- `int get location`:
  Accessor to the part of the keyboard that the key was pressed from (one of
  KeyLocation.STANDARD, KeyLocation.RIGHT, KeyLocation.LEFT,
  KeyLocation.NUMPAD, KeyLocation.MOBILE, KeyLocation.JOYSTICK).
- `bool get metaKey`:
  True if the Meta (or Mac command) key is pressed during this event.
- `bool get repeat`
- `bool get shiftKey`: True if the shift key was pressed during this event.
- `InputDeviceCapabilities? get sourceCapabilities`
- `WindowBase? get view`
- `int get which`:
  Calculated value of what the estimated keyCode is for this event.
- `bool getModifierState(String keyArgument)`

## Class: KeyLocation

Defines the standard key locations returned by
KeyboardEvent.getKeyLocation.

```dart
abstract class KeyLocation { … }
```

- static `int JOYSTICK`:
  The event key originated on a game controller or a joystick on a mobile
  device.
- static `int LEFT`: The event key is in the left key location.
- static `int MOBILE`:
  The event key originated on a mobile device, either on a physical
  keypad or a virtual keyboard.
- static `int NUMPAD`:
  The event key originated on the numeric keypad or with a virtual key
  corresponding to the numeric keypad.
- static `int RIGHT`: The event key is in the right key location.
- static `int STANDARD`:
  The event key is not distinguished as the left or right version
  of the key, and did not originate from the numeric keypad (or did not
  originate with a virtual key corresponding to the numeric keypad).

## Class: KeyboardEvent

An event that describes user interaction with the keyboard.

```dart
class KeyboardEvent extends UIEvent { … }
```

- `KeyboardEvent(String type, {Window? view, bool canBubble, bool cancelable, int? location, int? keyLocation, bool ctrlKey, bool altKey, bool shiftKey, bool metaKey})`:
  Programmatically create a KeyboardEvent.
- static `int DOM_KEY_LOCATION_LEFT`
- static `int DOM_KEY_LOCATION_NUMPAD`
- static `int DOM_KEY_LOCATION_RIGHT`
- static `int DOM_KEY_LOCATION_STANDARD`
- `bool get altKey`
- `int get charCode`
- `String? get code`
- `bool get ctrlKey`
- `bool? get isComposing`
- `String? get key`
- `int get keyCode`
- `int get location`
- `bool get metaKey`
- `bool? get repeat`
- `bool get shiftKey`
- `int? get which`
- `bool getModifierState(String keyArg)`

## Class: KeyboardEventStream

Records KeyboardEvents that occur on a particular element, and provides a
stream of outgoing KeyEvents with cross-browser consistent keyCode and
charCode values despite the fact that a multitude of browsers that have
varying keyboard default behavior.

```dart
class KeyboardEventStream { … }
```

- static `CustomStream<KeyEvent> onKeyDown(EventTarget target)`:
  Named constructor to produce a stream for onKeyDown events.
- static `CustomStream<KeyEvent> onKeyPress(EventTarget target)`:
  Named constructor to produce a stream for onKeyPress events.
- static `CustomStream<KeyEvent> onKeyUp(EventTarget target)`:
  Named constructor to produce a stream for onKeyUp events.

## Class: KeyframeEffect

```dart
class KeyframeEffect extends KeyframeEffectReadOnly { … }
```

- `KeyframeEffect(Element? target, Object? effect, [Object? options])`

## Class: KeyframeEffectReadOnly

```dart
class KeyframeEffectReadOnly extends AnimationEffectReadOnly { … }
```

- `KeyframeEffectReadOnly(Element? target, Object? effect, [Object? options])`

## Class: LIElement

```dart
class LIElement extends HtmlElement { … }
```

- `LIElement()`
- `int get value`
- `set value=(int value)`

## Class: LabelElement

```dart
class LabelElement extends HtmlElement { … }
```

- `LabelElement()`
- `HtmlElement? get control`
- `FormElement? get form`
- `String get htmlFor`
- `set htmlFor=(String value)`

## Class: LegendElement

```dart
class LegendElement extends HtmlElement { … }
```

- `LegendElement()`
- `FormElement? get form`

## Class: LinearAccelerationSensor

```dart
class LinearAccelerationSensor extends Accelerometer { … }
```

- `LinearAccelerationSensor([Map<dynamic, dynamic>? sensorOptions])`

## Class: LinkElement

```dart
class LinkElement extends HtmlElement { … }
```

- `LinkElement()`
- `String? get as`
- `set as=(String? value)`
- `String? get crossOrigin`
- `set crossOrigin=(String? value)`
- `bool? get disabled`
- `set disabled=(bool? value)`
- `String get href`
- `set href=(String value)`
- `String get hreflang`
- `set hreflang=(String value)`
- `Document? get import`
- `String? get integrity`
- `set integrity=(String? value)`
- `String get media`
- `set media=(String value)`
- `String? get referrerPolicy`
- `set referrerPolicy=(String? value)`
- `String get rel`
- `set rel=(String value)`
- `DomTokenList? get relList`
- `String? get scope`
- `set scope=(String? value)`
- `StyleSheet? get sheet`
- `DomTokenList? get sizes`
- `bool get supportsImport`:
  Checks if HTML imports are supported on the current platform.
- `String get type`
- `set type=(String value)`

## Class: LocalDateTimeInputElement

A date and time (year, month, day, hour, minute, second, fraction of a
second) with no time zone.

```dart
abstract class LocalDateTimeInputElement implements RangeInputElementBase { … }
```

- `LocalDateTimeInputElement()`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: Location

```dart
class Location extends JavaScriptObject implements LocationBase { … }
```

- `List<String>? get ancestorOrigins`
- `String get hash`
- `set hash=(String value)`
- `String get host`
- `set host=(String value)`
- `String? get hostname`
- `set hostname=(String? value)`
- `String get href`
- `set href=(String value)`
- `String get origin`
- `String? get pathname`
- `set pathname=(String? value)`
- `String get port`
- `set port=(String value)`
- `String get protocol`
- `set protocol=(String value)`
- `String? get search`
- `set search=(String? value)`
- `TrustedUrl? get trustedHref`
- `set trustedHref=(TrustedUrl? value)`
- `void assign([String? url])`
- `void reload()`
- `void replace(String? url)`
- `String toString()`: A string representation of this object.

## Class: LocationBase

```dart
abstract class LocationBase { … }
```

- `set href=(String val)`

## Class: Magnetometer

```dart
class Magnetometer extends Sensor { … }
```

- `Magnetometer([Map<dynamic, dynamic>? sensorOptions])`
- `num? get x`
- `num? get y`
- `num? get z`

## Class: MapElement

```dart
class MapElement extends HtmlElement { … }
```

- `MapElement()`
- `List<Node> get areas`
- `String get name`
- `set name=(String value)`

## Class: MathMLElement

```dart
class MathMLElement extends Element { … }
```

## Class: MediaCapabilities

```dart
class MediaCapabilities extends JavaScriptObject { … }
```

- `Future<MediaCapabilitiesInfo> decodingInfo(Map<dynamic, dynamic> configuration)`
- `Future<MediaCapabilitiesInfo> encodingInfo(Map<dynamic, dynamic> configuration)`

## Class: MediaCapabilitiesInfo

```dart
class MediaCapabilitiesInfo extends JavaScriptObject { … }
```

- `bool? get powerEfficient`
- `bool? get smooth`
- `bool? get supported`

## Class: MediaDeviceInfo

```dart
class MediaDeviceInfo extends JavaScriptObject { … }
```

- `String? get deviceId`
- `String? get groupId`
- `String? get kind`
- `String? get label`

## Class: MediaDevices

```dart
class MediaDevices extends EventTarget { … }
```

- `Future<List<dynamic>> enumerateDevices()`
- `Map<dynamic, dynamic> getSupportedConstraints()`
- `Future<MediaStream> getUserMedia([Map<dynamic, dynamic>? constraints])`

## Class: MediaElement

```dart
class MediaElement extends HtmlElement { … }
```

- static `int HAVE_CURRENT_DATA`
- static `int HAVE_ENOUGH_DATA`
- static `int HAVE_FUTURE_DATA`
- static `int HAVE_METADATA`
- static `int HAVE_NOTHING`
- static `int NETWORK_EMPTY`
- static `int NETWORK_IDLE`
- static `int NETWORK_LOADING`
- static `int NETWORK_NO_SOURCE`
- `int? get audioDecodedByteCount`
- `AudioTrackList? get audioTracks`
- `bool get autoplay`
- `set autoplay=(bool value)`
- `TimeRanges get buffered`
- `bool get controls`
- `set controls=(bool value)`
- `DomTokenList? get controlsList`
- `String? get crossOrigin`
- `set crossOrigin=(String? value)`
- `String get currentSrc`
- `num get currentTime`
- `set currentTime=(num value)`
- `bool? get defaultMuted`
- `set defaultMuted=(bool? value)`
- `set defaultPlaybackRate=(num value)`
- `num get defaultPlaybackRate`
- `bool get disableRemotePlayback`
- `set disableRemotePlayback=(bool value)`
- `num get duration`
- `bool get ended`
- `MediaError? get error`
- `bool get loop`
- `set loop=(bool value)`
- `MediaKeys? get mediaKeys`
- `bool get muted`
- `set muted=(bool value)`
- `int? get networkState`
- `bool get paused`
- `num get playbackRate`
- `set playbackRate=(num value)`
- `TimeRanges get played`
- `set preload=(String value)`
- `String get preload`
- `int get readyState`
- `RemotePlayback? get remote`
- `TimeRanges get seekable`
- `bool get seeking`
- `String? get sinkId`
- `String get src`
- `set src=(String value)`
- `MediaStream? get srcObject`
- `set srcObject=(MediaStream? value)`
- `TextTrackList? get textTracks`
- `int? get videoDecodedByteCount`
- `VideoTrackList? get videoTracks`
- `num get volume`
- `set volume=(num value)`
- `TextTrack addTextTrack(String kind, [String? label, String? language])`
- `String canPlayType(String? type, [String? keySystem])`
- `MediaStream captureStream()`
- `void load()`
- `void pause()`
- `Future<dynamic> play()`
- `Future<dynamic> setMediaKeys(MediaKeys? mediaKeys)`
- `Future<dynamic> setSinkId(String sinkId)`

## Class: MediaEncryptedEvent

```dart
class MediaEncryptedEvent extends Event { … }
```

- `MediaEncryptedEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `ByteBuffer? get initData`
- `String? get initDataType`

## Class: MediaError

```dart
class MediaError extends JavaScriptObject { … }
```

- static `int MEDIA_ERR_ABORTED`
- static `int MEDIA_ERR_DECODE`
- static `int MEDIA_ERR_NETWORK`
- static `int MEDIA_ERR_SRC_NOT_SUPPORTED`
- `int get code`
- `String? get message`

## Class: MediaKeyMessageEvent

```dart
class MediaKeyMessageEvent extends Event { … }
```

- `MediaKeyMessageEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `ByteBuffer? get message`
- `String? get messageType`

## Class: MediaKeySession

```dart
class MediaKeySession extends EventTarget { … }
```

- static `EventStreamProvider<MessageEvent> messageEvent`
- `Future<void> get closed`
- `num? get expiration`
- `MediaKeyStatusMap? get keyStatuses`
- `Stream<MessageEvent> get onMessage`
- `String? get sessionId`
- `Future<dynamic> close()`
- `Future<dynamic> generateRequest(String initDataType, dynamic initData)`
- `Future<dynamic> load(String sessionId)`
- `Future<dynamic> remove()`

## Class: MediaKeyStatusMap

```dart
class MediaKeyStatusMap extends JavaScriptObject { … }
```

- `int? get size`
- `Object? get(dynamic keyId)`
- `bool has(dynamic keyId)`

## Class: MediaKeySystemAccess

```dart
class MediaKeySystemAccess extends JavaScriptObject { … }
```

- `String? get keySystem`
- `Future<dynamic> createMediaKeys()`
- `Map<dynamic, dynamic> getConfiguration()`

## Class: MediaKeys

```dart
class MediaKeys extends JavaScriptObject { … }
```

- `Future<dynamic> getStatusForPolicy(MediaKeysPolicy policy)`
- `Future<dynamic> setServerCertificate(dynamic serverCertificate)`

## Class: MediaKeysPolicy

```dart
class MediaKeysPolicy extends JavaScriptObject { … }
```

- `MediaKeysPolicy(Map<dynamic, dynamic> init)`
- `String? get minHdcpVersion`

## Class: MediaList

```dart
class MediaList extends JavaScriptObject { … }
```

- `int? get length`
- `String? get mediaText`
- `set mediaText=(String? value)`
- `void appendMedium(String medium)`
- `void deleteMedium(String medium)`
- `String? item(int index)`

## Class: MediaMetadata

```dart
class MediaMetadata extends JavaScriptObject { … }
```

- `MediaMetadata([Map<dynamic, dynamic>? metadata])`
- `String? get album`
- `set album=(String? value)`
- `String? get artist`
- `set artist=(String? value)`
- `List<dynamic>? get artwork`
- `set artwork=(List<dynamic>? value)`
- `String? get title`
- `set title=(String? value)`

## Class: MediaQueryList

```dart
class MediaQueryList extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `bool get matches`
- `String get media`
- `Stream<Event> get onChange`
- `void addListener(dynamic Function(Event)? listener)`
- `void removeListener(dynamic Function(Event)? listener)`

## Class: MediaQueryListEvent

```dart
class MediaQueryListEvent extends Event { … }
```

- `MediaQueryListEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `bool? get matches`
- `String? get media`

## Class: MediaRecorder

```dart
class MediaRecorder extends EventTarget { … }
```

- `MediaRecorder(MediaStream stream, [Map<dynamic, dynamic>? options])`
- static `EventStreamProvider<Event> errorEvent`
- static `EventStreamProvider<Event> pauseEvent`
- static `bool isTypeSupported(String type)`
- `int? get audioBitsPerSecond`
- `String? get mimeType`
- `Stream<Event> get onError`
- `Stream<Event> get onPause`
- `String? get state`
- `MediaStream? get stream`
- `int? get videoBitsPerSecond`
- `void pause()`
- `void requestData()`
- `void resume()`
- `void start([int? timeslice])`
- `void stop()`

## Class: MediaSession

```dart
class MediaSession extends JavaScriptObject { … }
```

- `MediaMetadata? get metadata`
- `set metadata=(MediaMetadata? value)`
- `String? get playbackState`
- `set playbackState=(String? value)`
- `void setActionHandler(String action, void Function()? handler)`

## Class: MediaSettingsRange

```dart
class MediaSettingsRange extends JavaScriptObject { … }
```

- `num? get max`
- `num? get min`
- `num? get step`

## Class: MediaSource

```dart
class MediaSource extends EventTarget { … }
```

- `MediaSource()`
- static `bool isTypeSupported(String type)`
- `SourceBufferList? get activeSourceBuffers`
- `num? get duration`
- `set duration=(num? value)`
- `String? get readyState`
- `SourceBufferList? get sourceBuffers`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `SourceBuffer addSourceBuffer(String type)`
- `void clearLiveSeekableRange()`
- `void endOfStream([String? error])`
- `void removeSourceBuffer(SourceBuffer buffer)`
- `void setLiveSeekableRange(num start, num end)`

## Class: MediaStream

```dart
class MediaStream extends EventTarget { … }
```

- `MediaStream([dynamic stream_OR_tracks])`
- static `EventStreamProvider<Event> addTrackEvent`:
  Static factory designed to expose `addtrack` events to event
  handlers that are not necessarily instances of [MediaStream].
- static `EventStreamProvider<Event> removeTrackEvent`:
  Static factory designed to expose `removetrack` events to event
  handlers that are not necessarily instances of [MediaStream].
- `bool? get active`
- `String? get id`
- `Stream<Event> get onAddTrack`:
  Stream of `addtrack` events handled by this [MediaStream].
- `Stream<Event> get onRemoveTrack`:
  Stream of `removetrack` events handled by this [MediaStream].
- static `bool get supported`:
  Checks if the MediaStream APIs are supported on the current platform.
- `void addTrack(MediaStreamTrack track)`
- `MediaStream clone()`
- `List<MediaStreamTrack> getAudioTracks()`
- `MediaStreamTrack? getTrackById(String trackId)`
- `List<MediaStreamTrack> getTracks()`
- `List<MediaStreamTrack> getVideoTracks()`
- `void removeTrack(MediaStreamTrack track)`

## Class: MediaStreamEvent

```dart
class MediaStreamEvent extends Event { … }
```

- `MediaStreamEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `MediaStream? get stream`
- static `bool get supported`:
  Checks if this type is supported on the current platform.

## Class: MediaStreamTrack

```dart
class MediaStreamTrack extends EventTarget { … }
```

- static `EventStreamProvider<Event> endedEvent`:
  Static factory designed to expose `ended` events to event
  handlers that are not necessarily instances of [MediaStreamTrack].
- static `EventStreamProvider<Event> muteEvent`:
  Static factory designed to expose `mute` events to event
  handlers that are not necessarily instances of [MediaStreamTrack].
- static `EventStreamProvider<Event> unmuteEvent`:
  Static factory designed to expose `unmute` events to event
  handlers that are not necessarily instances of [MediaStreamTrack].
- `String? get contentHint`
- `set contentHint=(String? value)`
- `bool? get enabled`
- `set enabled=(bool? value)`
- `String? get id`
- `String? get kind`
- `String? get label`
- `bool? get muted`
- `Stream<Event> get onEnded`:
  Stream of `ended` events handled by this [MediaStreamTrack].
- `Stream<Event> get onMute`:
  Stream of `mute` events handled by this [MediaStreamTrack].
- `Stream<Event> get onUnmute`:
  Stream of `unmute` events handled by this [MediaStreamTrack].
- `String? get readyState`
- `Future<dynamic> applyConstraints([Map<dynamic, dynamic>? constraints])`
- `MediaStreamTrack clone()`
- `Map<dynamic, dynamic> getCapabilities()`
- `Map<dynamic, dynamic> getConstraints()`
- `Map<dynamic, dynamic> getSettings()`
- `void stop()`

## Class: MediaStreamTrackEvent

```dart
class MediaStreamTrackEvent extends Event { … }
```

- `MediaStreamTrackEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `MediaStreamTrack? get track`

## Class: MemoryInfo

```dart
class MemoryInfo extends JavaScriptObject { … }
```

- `int? get jsHeapSizeLimit`
- `int? get totalJSHeapSize`
- `int? get usedJSHeapSize`

## Class: MenuElement

An HTML <menu> element.

```dart
class MenuElement extends HtmlElement { … }
```

- `MenuElement()`

## Class: MessageChannel

```dart
class MessageChannel extends JavaScriptObject { … }
```

- `MessageChannel()`
- `MessagePort get port1`
- `MessagePort get port2`

## Class: MessageEvent

```dart
class MessageEvent extends Event { … }
```

- `MessageEvent(String type, {bool canBubble, bool cancelable, Object? data, String? origin, String? lastEventId, Window? source, List<MessagePort> messagePorts})`
- `dynamic get data`
- `String get lastEventId`
- `String get origin`
- `List<MessagePort> get ports`
- `EventTarget? get source`
- `String? get suborigin`

## Class: MessagePort

```dart
class MessagePort extends EventTarget { … }
```

- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [MessagePort].
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [MessagePort].
- `void addEventListener(String type, dynamic Function(Event)? listener, [bool? useCapture])`
- `void close()`
- `void postMessage(dynamic message, [List<Object>? transfer])`

## Class: MetaElement

```dart
class MetaElement extends HtmlElement { … }
```

- `MetaElement()`
- `String get content`
- `set content=(String value)`
- `String? get httpEquiv`
- `set httpEquiv=(String? value)`
- `String get name`
- `set name=(String value)`

## Class: Metadata

```dart
class Metadata extends JavaScriptObject { … }
```

- `DateTime get modificationTime`
- `int? get size`

## Class: MeterElement

```dart
class MeterElement extends HtmlElement { … }
```

- `MeterElement()`
- `num? get high`
- `set high=(num? value)`
- `List<Node>? get labels`
- `num? get low`
- `set low=(num? value)`
- `num? get max`
- `set max=(num? value)`
- `num? get min`
- `set min=(num? value)`
- `num? get optimum`
- `set optimum=(num? value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `num? get value`
- `set value=(num? value)`

## Class: MidiAccess

```dart
class MidiAccess extends EventTarget { … }
```

- `MidiInputMap? get inputs`
- `MidiOutputMap? get outputs`
- `bool? get sysexEnabled`

## Class: MidiConnectionEvent

```dart
class MidiConnectionEvent extends Event { … }
```

- `MidiConnectionEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `MidiPort? get port`

## Class: MidiInput

```dart
class MidiInput extends MidiPort { … }
```

- static `EventStreamProvider<MidiMessageEvent> midiMessageEvent`:
  Static factory designed to expose `midimessage` events to event
  handlers that are not necessarily instances of [MidiInput].
- `Stream<MidiMessageEvent> get onMidiMessage`:
  Stream of `midimessage` events handled by this [MidiInput].

## Class: MidiInputMap

```dart
class MidiInputMap extends JavaScriptObject with MapBase<String, dynamic> { … }
```

- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<String> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<Map<dynamic, dynamic>> get values`: The values of this [Map].
- `Map<dynamic, dynamic>? operator[](dynamic key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(String key, dynamic value)`:
  Associates the [key] with the given [value].
- `void addAll(Map<String, dynamic> other)`:
  Adds all key/value pairs of [other] to this map.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(dynamic key)`: Whether this map contains the given [key].
- `bool containsValue(dynamic value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(String, dynamic) f)`:
  Applies [action] to each key/value pair of the map.
- `dynamic putIfAbsent(String key, dynamic Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `String remove(dynamic key)`:
  Removes [key] and its associated value, if present, from the map.

## Class: MidiMessageEvent

```dart
class MidiMessageEvent extends Event { … }
```

- `MidiMessageEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `Uint8List? get data`

## Class: MidiOutput

```dart
class MidiOutput extends MidiPort { … }
```

- `void send(Uint8List data, [num? timestamp])`

## Class: MidiOutputMap

```dart
class MidiOutputMap extends JavaScriptObject with MapBase<String, dynamic> { … }
```

- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<String> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<Map<dynamic, dynamic>> get values`: The values of this [Map].
- `Map<dynamic, dynamic>? operator[](dynamic key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(String key, dynamic value)`:
  Associates the [key] with the given [value].
- `void addAll(Map<String, dynamic> other)`:
  Adds all key/value pairs of [other] to this map.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(dynamic key)`: Whether this map contains the given [key].
- `bool containsValue(dynamic value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(String, dynamic) f)`:
  Applies [action] to each key/value pair of the map.
- `dynamic putIfAbsent(String key, dynamic Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `String remove(dynamic key)`:
  Removes [key] and its associated value, if present, from the map.

## Class: MidiPort

```dart
class MidiPort extends EventTarget { … }
```

- `String? get connection`
- `String? get id`
- `String? get manufacturer`
- `String? get name`
- `String? get state`
- `String? get type`
- `String? get version`
- `Future<dynamic> close()`
- `Future<dynamic> open()`

## Class: MimeType

```dart
class MimeType extends JavaScriptObject { … }
```

- `String? get description`
- `Plugin? get enabledPlugin`
- `String? get suffixes`
- `String? get type`

## Class: MimeTypeArray

```dart
class MimeTypeArray
    extends JavaScriptObject
    with ListBase<MimeType>, ImmutableListMixin<MimeType>
    implements List<MimeType>, JavaScriptIndexingBehavior<MimeType> { … }
```

- `MimeType get first`: The first element.
- `MimeType get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `MimeType get single`:
  Checks that this iterable has only one element, and returns that element.
- `MimeType operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, MimeType value)`:
  Sets the value at the given [index] in the list to [value].
- `MimeType elementAt(int index)`: Returns the [index]th element.
- `MimeType? item(int index)`
- `MimeType? namedItem(String name)`

## Class: ModElement

```dart
class ModElement extends HtmlElement { … }
```

- `String get cite`
- `set cite=(String value)`
- `String get dateTime`
- `set dateTime=(String value)`

## Class: MonthInputElement

A date consisting of a year and a month with no time zone.

```dart
abstract class MonthInputElement implements RangeInputElementBase { … }
```

- `MonthInputElement()`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.
- `DateTime get valueAsDate`
- `set valueAsDate=(DateTime value)`

## Class: MouseEvent

```dart
class MouseEvent extends UIEvent { … }
```

- `MouseEvent(String type, {Window? view, int detail, int screenX, int screenY, int clientX, int clientY, int button, bool canBubble, bool cancelable, bool ctrlKey, bool altKey, bool shiftKey, bool metaKey, EventTarget? relatedTarget})`
- `bool get altKey`
- `int get button`
- `int? get buttons`
- `Point<num> get client`
- `bool get ctrlKey`
- `DataTransfer get dataTransfer`
- `Node? get fromElement`:
  The nonstandard way to access the element that the mouse comes
  from in the case of a `mouseover` event.
- `Point<num> get layer`
- `bool get metaKey`
- `Point<num> get movement`
- `Point<num> get offset`:
  The coordinates of the mouse pointer in target node coordinates.
- `Point<num> get page`
- `String? get region`
- `EventTarget? get relatedTarget`
- `Point<num> get screen`
- `bool get shiftKey`
- `Node? get toElement`:
  The nonstandard way to access the element that the mouse goes
  to in the case of a `mouseout` event.
- `bool getModifierState(String keyArg)`

## Class: MutationEvent

```dart
class MutationEvent extends Event { … }
```

- static `int ADDITION`
- static `int MODIFICATION`
- static `int REMOVAL`
- `int? get attrChange`
- `String? get attrName`
- `String? get newValue`
- `String? get prevValue`
- `Node? get relatedNode`
- `void initMutationEvent(String? type, bool? bubbles, bool? cancelable, Node? relatedNode, String? prevValue, String? newValue, String? attrName, int? attrChange)`

## Class: MutationObserver

```dart
class MutationObserver extends JavaScriptObject { … }
```

- `MutationObserver(void Function(List<dynamic>, MutationObserver) callback)`
- static `bool get supported`:
  Checks to see if the mutation observer API is supported on the current
  platform.
- `void disconnect()`
- `void observe(Node target, {bool? childList, bool? attributes, bool? characterData, bool? subtree, bool? attributeOldValue, bool? characterDataOldValue, List<String>? attributeFilter})`:
  Observes the target for the specified changes.
- `List<MutationRecord> takeRecords()`

## Class: MutationRecord

```dart
class MutationRecord extends JavaScriptObject { … }
```

- `List<Node>? get addedNodes`
- `String? get attributeName`
- `String? get attributeNamespace`
- `Node? get nextSibling`
- `String? get oldValue`
- `Node? get previousSibling`
- `List<Node>? get removedNodes`
- `Node? get target`
- `String? get type`

## Class: NavigationPreloadManager

```dart
class NavigationPreloadManager extends JavaScriptObject { … }
```

- `Future<dynamic> disable()`
- `Future<dynamic> enable()`
- `Future<Map<String, dynamic>?> getState()`

## Class: Navigator

```dart
class Navigator
    extends NavigatorConcurrentHardware
    implements NavigatorCookies, NavigatorID, NavigatorLanguage, NavigatorOnLine, NavigatorAutomationInformation { … }
```

- `String get appCodeName`
- `String get appName`
- `String get appVersion`
- `_BudgetService? get budget`
- `_Clipboard? get clipboard`
- `NetworkInformation? get connection`
- `bool? get cookieEnabled`
- `CredentialsContainer? get credentials`
- `bool? get dartEnabled`
- `num? get deviceMemory`
- `String? get doNotTrack`
- `Geolocation get geolocation`
- `String get language`
- `List<String>? get languages`
- `int? get maxTouchPoints`
- `MediaCapabilities? get mediaCapabilities`
- `MediaDevices? get mediaDevices`
- `MediaSession? get mediaSession`
- `MimeTypeArray? get mimeTypes`
- `_NFC? get nfc`
- `bool? get onLine`
- `Permissions? get permissions`
- `DeprecatedStorageQuota? get persistentStorage`
- `String? get platform`
- `Presentation? get presentation`
- `String get product`
- `String? get productSub`
- `ServiceWorkerContainer? get serviceWorker`
- `StorageManager? get storage`
- `DeprecatedStorageQuota? get temporaryStorage`
- `String get userAgent`
- `String get vendor`
- `String get vendorSub`
- `VR? get vr`
- `bool? get webdriver`
- `void cancelKeyboardLock()`
- `Future<dynamic> getBattery()`
- `List<Gamepad?> getGamepads()`
- `Future<RelatedApplication> getInstalledRelatedApps()`
- `Future<MediaStream> getUserMedia({dynamic audio, dynamic video})`:
  Gets a stream (video and or audio) from the local computer.
- `Future<dynamic> getVRDisplays()`
- `void registerProtocolHandler(String scheme, String url, String title)`
- `Future<dynamic> requestKeyboardLock([List<String>? keyCodes])`
- `Future<dynamic> requestMediaKeySystemAccess(String keySystem, List<Map<dynamic, dynamic>> supportedConfigurations)`
- `Future<dynamic> requestMidiAccess([Map<dynamic, dynamic>? options])`
- `bool sendBeacon(String url, Object? data)`
- `Future<dynamic> share([Map<dynamic, dynamic>? data])`

## Class: NavigatorAutomationInformation

```dart
class NavigatorAutomationInformation extends JavaScriptObject { … }
```

- `bool? get webdriver`

## Class: NavigatorConcurrentHardware

```dart
class NavigatorConcurrentHardware extends JavaScriptObject { … }
```

- `int? get hardwareConcurrency`

## Class: NavigatorCookies

```dart
class NavigatorCookies extends JavaScriptObject { … }
```

- `bool? get cookieEnabled`

## Class: NavigatorID

```dart
abstract class NavigatorID extends JavaScriptObject { … }
```

- `String get appCodeName`
- `String get appName`
- `String get appVersion`
- `bool? get dartEnabled`
- `String? get platform`
- `String get product`
- `String get userAgent`

## Class: NavigatorLanguage

```dart
abstract class NavigatorLanguage extends JavaScriptObject { … }
```

- `String? get language`
- `List<String>? get languages`

## Class: NavigatorOnLine

```dart
abstract class NavigatorOnLine extends JavaScriptObject { … }
```

- `bool? get onLine`

## Class: NavigatorUserMediaError

```dart
class NavigatorUserMediaError extends JavaScriptObject { … }
```

- `String? get constraintName`
- `String? get message`
- `String? get name`

## Class: NetworkInformation

```dart
class NetworkInformation extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `num? get downlink`
- `num? get downlinkMax`
- `String? get effectiveType`
- `Stream<Event> get onChange`
- `int? get rtt`
- `String? get type`

## Class: Node

```dart
class Node extends EventTarget { … }
```

- static `int ATTRIBUTE_NODE`
- static `int CDATA_SECTION_NODE`
- static `int COMMENT_NODE`
- static `int DOCUMENT_FRAGMENT_NODE`
- static `int DOCUMENT_NODE`
- static `int DOCUMENT_TYPE_NODE`
- static `int ELEMENT_NODE`
- static `int ENTITY_NODE`
- static `int ENTITY_REFERENCE_NODE`
- static `int NOTATION_NODE`
- static `int PROCESSING_INSTRUCTION_NODE`
- static `int TEXT_NODE`
- `String? get baseUri`
- `List<Node> get childNodes`: A list of this node's children.
- `Node? get firstChild`: The first child of this node.
- `bool? get isConnected`
- `Node? get lastChild`: The last child of this node.
- `Node? get nextNode`: The next sibling node.
- `String? get nodeName`: The name of this node.
- `int get nodeType`: The type of node.
- `String? get nodeValue`: The value of this node.
- `List<Node> get nodes`: A modifiable list of this node's children.
- `set nodes=(Iterable<Node> value)`
- `Document? get ownerDocument`: The document this node belongs to.
- `Element? get parent`: The parent element of this node.
- `Node? get parentNode`: The parent node of this node.
- `Node? get previousNode`: The previous sibling node.
- `String? get text`: All text within this node and its descendants.
- `set text=(String? value)`
- `Node append(Node node)`:
  Adds a node to the end of the child [nodes] list of this node.
- `Node clone(bool? deep)`: Returns a copy of this node.
- `bool contains(Node? other)`:
  Returns true if this node contains the specified node.
- `Node getRootNode([Map<dynamic, dynamic>? options])`
- `bool hasChildNodes()`: Returns true if this node has any children.
- `void insertAllBefore(Iterable<Node> newNodes, Node child)`:
  Inserts all of the nodes into this node directly before child.
- `Node insertBefore(Node node, Node? child)`:
  Inserts the given node into this node directly before child.
  If child is `null`, then the given node is inserted at the end
  of this node's child nodes.
- `void remove()`: Removes this node from the DOM.
- `Node replaceWith(Node otherNode)`: Replaces this node with another node.
- `String toString()`: Print out a String representation of this Node.

## Class: NodeFilter

```dart
class NodeFilter extends JavaScriptObject { … }
```

- static `int FILTER_ACCEPT`
- static `int FILTER_REJECT`
- static `int FILTER_SKIP`
- static `int SHOW_ALL`
- static `int SHOW_COMMENT`
- static `int SHOW_DOCUMENT`
- static `int SHOW_DOCUMENT_FRAGMENT`
- static `int SHOW_DOCUMENT_TYPE`
- static `int SHOW_ELEMENT`
- static `int SHOW_PROCESSING_INSTRUCTION`
- static `int SHOW_TEXT`

## Class: NodeIterator

```dart
class NodeIterator extends JavaScriptObject { … }
```

- `NodeIterator(Node root, int whatToShow)`
- `bool? get pointerBeforeReferenceNode`
- `Node? get referenceNode`
- `Node get root`
- `int get whatToShow`
- `void detach()`
- `Node? nextNode()`
- `Node? previousNode()`

## Class: NodeList

```dart
class NodeList
    extends JavaScriptObject
    with ListBase<Node>, ImmutableListMixin<Node>
    implements List<Node>, JavaScriptIndexingBehavior<Node> { … }
```

- `Node get first`: The first element.
- `Node get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `Node get single`:
  Checks that this iterable has only one element, and returns that element.
- `Node operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Node value)`:
  Sets the value at the given [index] in the list to [value].
- `Node elementAt(int index)`: Returns the [index]th element.

## Class: NodeTreeSanitizer

Performs sanitization of a node tree after construction to ensure that it
does not contain any disallowed elements or attributes.

```dart
abstract class NodeTreeSanitizer { … }
```

- `NodeTreeSanitizer(NodeValidator validator)`:
  Constructs a default tree sanitizer which will remove all elements and
  attributes which are not allowed by the provided validator.
- static `_TrustedHtmlTreeSanitizer trusted`:
  A sanitizer for trees that we trust. It does no validation and allows
  any elements. It is also more efficient, since it can pass the text
  directly through to the underlying APIs without creating a document
  fragment to be sanitized.
- `void sanitizeTree(Node node)`:
  Called with the root of the tree which is to be sanitized.

## Class: NodeValidator

Interface used to validate that only accepted elements and attributes are
allowed while parsing HTML strings into DOM nodes.

```dart
abstract class NodeValidator { … }
```

- `NodeValidator({UriPolicy? uriPolicy})`:
  Construct a default NodeValidator which only accepts whitelisted HTML5
  elements and attributes.
- `NodeValidator.throws(NodeValidator base)`
- `bool allowsAttribute(Element element, String attributeName, String value)`:
  Returns true if the attribute is allowed.
- `bool allowsElement(Element element)`:
  Returns true if the tagName is an accepted type.

## Class: NodeValidatorBuilder

Class which helps construct standard node validation policies.

```dart
class NodeValidatorBuilder implements NodeValidator { … }
```

- `NodeValidatorBuilder()`
- `NodeValidatorBuilder.common()`:
  Creates a new NodeValidatorBuilder which accepts common constructs.
- `void add(NodeValidator validator)`:
  Add an additional validator to the current list of validators.
- `void allowCustomElement(String tagName, {UriPolicy? uriPolicy, Iterable<String>? attributes, Iterable<String>? uriAttributes})`:
  Allow custom elements with the specified tag name and specified attributes.
- `void allowElement(String tagName, {UriPolicy? uriPolicy, Iterable<String>? attributes, Iterable<String>? uriAttributes})`
- `void allowHtml5({UriPolicy? uriPolicy})`:
  Allow common safe HTML5 elements and attributes.
- `void allowImages([UriPolicy? uriPolicy])`: Allows image elements.
- `void allowInlineStyles({String? tagName})`: Allow inline styles on elements.
- `void allowNavigation([UriPolicy? uriPolicy])`:
  Allows navigation elements- Form and Anchor tags, along with common
  attributes.
- `void allowSvg()`: Allow SVG elements and attributes except for known bad ones.
- `void allowTagExtension(String tagName, String baseName, {UriPolicy? uriPolicy, Iterable<String>? attributes, Iterable<String>? uriAttributes})`:
  Allow custom tag extensions with the specified type name and specified
  attributes.
- `void allowTemplating()`:
  Allow templating elements (such as <template> and template-related
  attributes.
- `void allowTextElements()`: Allow basic text elements.
- `bool allowsAttribute(Element element, String attributeName, String value)`:
  Returns true if the attribute is allowed.
- `bool allowsElement(Element element)`:
  Returns true if the tagName is an accepted type.

## Class: NonDocumentTypeChildNode

```dart
class NonDocumentTypeChildNode extends JavaScriptObject { … }
```

- `Element? get nextElementSibling`
- `Element? get previousElementSibling`

## Class: NonElementParentNode

```dart
class NonElementParentNode extends JavaScriptObject { … }
```

- `Element? getElementById(String elementId)`

## Class: NoncedElement

```dart
class NoncedElement extends JavaScriptObject { … }
```

- `String? get nonce`
- `set nonce=(String? value)`

## Class: Notification

```dart
class Notification extends EventTarget { … }
```

- `Notification(String title, {String? dir, String? body, String? lang, String? tag, String? icon})`
- static `EventStreamProvider<Event> clickEvent`:
  Static factory designed to expose `click` events to event
  handlers that are not necessarily instances of [Notification].
- static `EventStreamProvider<Event> closeEvent`:
  Static factory designed to expose `close` events to event
  handlers that are not necessarily instances of [Notification].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [Notification].
- static `EventStreamProvider<Event> showEvent`:
  Static factory designed to expose `show` events to event
  handlers that are not necessarily instances of [Notification].
- static `Future<String> requestPermission()`
- `List<dynamic>? get actions`
- `String? get badge`
- `String? get body`
- `Object? get data`
- `String? get dir`
- `String? get icon`
- `String? get image`
- `String? get lang`
- static `int? get maxActions`
- `Stream<Event> get onClick`:
  Stream of `click` events handled by this [Notification].
- `Stream<Event> get onClose`:
  Stream of `close` events handled by this [Notification].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [Notification].
- `Stream<Event> get onShow`:
  Stream of `show` events handled by this [Notification].
- static `String? get permission`
- `bool? get renotify`
- `bool? get requireInteraction`
- `bool? get silent`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `String? get tag`
- `int? get timestamp`
- `String? get title`
- `List<int>? get vibrate`
- `void close()`

## Class: NotificationEvent

```dart
class NotificationEvent extends ExtendableEvent { … }
```

- `NotificationEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `String? get action`
- `Notification? get notification`
- `String? get reply`

## Class: NullWindowException

```dart
class NullWindowException implements Exception { … }
```

- `String toString()`: A string representation of this object.

## Class: NumberInputElement

A numeric editor control.

```dart
abstract class NumberInputElement implements RangeInputElementBase { … }
```

- `NumberInputElement()`
- `String get placeholder`
- `set placeholder=(String value)`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: OListElement

```dart
class OListElement extends HtmlElement { … }
```

- `OListElement()`
- `bool? get reversed`
- `set reversed=(bool? value)`
- `int get start`
- `set start=(int value)`
- `String get type`
- `set type=(String value)`

## Class: ObjectElement

```dart
class ObjectElement extends HtmlElement { … }
```

- `ObjectElement()`
- `WindowBase? get contentWindow`
- `String get data`
- `set data=(String value)`
- `FormElement? get form`
- `String get height`
- `set height=(String value)`
- `String get name`
- `set name=(String value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `String get type`
- `set type=(String value)`
- `String get useMap`
- `set useMap=(String value)`
- `String get validationMessage`
- `ValidityState get validity`
- `String get width`
- `set width=(String value)`
- `bool get willValidate`
- `bool checkValidity()`
- `bool reportValidity()`
- `void setCustomValidity(String error)`

## Class: OffscreenCanvas

```dart
class OffscreenCanvas extends EventTarget { … }
```

- `OffscreenCanvas(int width, int height)`
- `int? get height`
- `set height=(int? value)`
- `int? get width`
- `set width=(int? value)`
- `Future<Blob> convertToBlob([Map<dynamic, dynamic>? options])`
- `Object? getContext(String contextType, [Map<dynamic, dynamic>? attributes])`
- `ImageBitmap transferToImageBitmap()`

## Class: OffscreenCanvasRenderingContext2D

```dart
class OffscreenCanvasRenderingContext2D
    extends JavaScriptObject
    implements _CanvasPath { … }
```

- `OffscreenCanvas? get canvas`
- `String? get direction`
- `set direction=(String? value)`
- `Object? get fillStyle`
- `set fillStyle=(Object? value)`
- `String? get filter`
- `set filter=(String? value)`
- `String? get font`
- `set font=(String? value)`
- `num? get globalAlpha`
- `set globalAlpha=(num? value)`
- `String? get globalCompositeOperation`
- `set globalCompositeOperation=(String? value)`
- `set imageSmoothingEnabled=(bool? value)`
- `bool? get imageSmoothingEnabled`
- `String? get imageSmoothingQuality`
- `set imageSmoothingQuality=(String? value)`
- `String? get lineCap`
- `set lineCap=(String? value)`
- `num? get lineDashOffset`
- `set lineDashOffset=(num? value)`
- `String? get lineJoin`
- `set lineJoin=(String? value)`
- `num? get lineWidth`
- `set lineWidth=(num? value)`
- `set miterLimit=(num? value)`
- `num? get miterLimit`
- `num? get shadowBlur`
- `set shadowBlur=(num? value)`
- `String? get shadowColor`
- `set shadowColor=(String? value)`
- `num? get shadowOffsetX`
- `set shadowOffsetX=(num? value)`
- `num? get shadowOffsetY`
- `set shadowOffsetY=(num? value)`
- `Object? get strokeStyle`
- `set strokeStyle=(Object? value)`
- `String? get textAlign`
- `set textAlign=(String? value)`
- `String? get textBaseline`
- `set textBaseline=(String? value)`
- `void arc(num x, num y, num radius, num startAngle, num endAngle, bool? anticlockwise)`
- `void arcTo(num x1, num y1, num x2, num y2, num radius)`
- `void beginPath()`
- `void bezierCurveTo(num cp1x, num cp1y, num cp2x, num cp2y, num x, num y)`
- `void clearRect(num x, num y, num width, num height)`
- `void clip([Path2D? path])`
- `void closePath()`
- `Future<dynamic> commit()`
- `ImageData createImageData(dynamic data_OR_imagedata_OR_sw, [int? sh_OR_sw, dynamic imageDataColorSettings_OR_sh, Map<dynamic, dynamic>? imageDataColorSettings])`
- `CanvasGradient createLinearGradient(num x0, num y0, num x1, num y1)`
- `CanvasPattern? createPattern(dynamic image, String repetitionType)`
- `CanvasGradient createRadialGradient(num x0, num y0, num r0, num x1, num y1, num r1)`
- `void drawImage(dynamic image, num sx_OR_x, num sy_OR_y, [num? sw_OR_width, num? height_OR_sh, num? dx, num? dy, num? dw, num? dh])`
- `void ellipse(num x, num y, num radiusX, num radiusY, num rotation, num startAngle, num endAngle, bool? anticlockwise)`
- `void fill([dynamic path_OR_winding, String? winding])`
- `void fillRect(num x, num y, num width, num height)`
- `void fillText(String text, num x, num y, [num? maxWidth])`
- `ImageData getImageData(int sx, int sy, int sw, int sh)`
- `List<num> getLineDash()`
- `bool isPointInPath(dynamic path_OR_x, num x_OR_y, [dynamic winding_OR_y, String? winding])`
- `bool isPointInStroke(dynamic path_OR_x, num x_OR_y, [num? y])`
- `void lineTo(num x, num y)`
- `TextMetrics measureText(String text)`
- `void moveTo(num x, num y)`
- `void putImageData(ImageData imagedata, int dx, int dy, [int? dirtyX, int? dirtyY, int? dirtyWidth, int? dirtyHeight])`
- `void quadraticCurveTo(num cpx, num cpy, num x, num y)`
- `void rect(num x, num y, num width, num height)`
- `void resetTransform()`
- `void restore()`
- `void rotate(num angle)`
- `void save()`
- `void scale(num x, num y)`
- `void setLineDash(List<num> dash)`
- `void setTransform(num a, num b, num c, num d, num e, num f)`
- `void stroke([Path2D? path])`
- `void strokeRect(num x, num y, num width, num height)`
- `void strokeText(String text, num x, num y, [num? maxWidth])`
- `void transform(num a, num b, num c, num d, num e, num f)`
- `void translate(num x, num y)`

## Class: OptGroupElement

```dart
class OptGroupElement extends HtmlElement { … }
```

- `OptGroupElement()`
- `bool get disabled`
- `set disabled=(bool value)`
- `String get label`
- `set label=(String value)`

## Class: OptionElement

```dart
class OptionElement extends HtmlElement { … }
```

- `OptionElement({String data, String value, bool selected})`
- `bool get defaultSelected`
- `set defaultSelected=(bool value)`
- `bool get disabled`
- `set disabled=(bool value)`
- `FormElement? get form`
- `int get index`
- `String? get label`
- `set label=(String? value)`
- `bool get selected`
- `set selected=(bool value)`
- `String get value`
- `set value=(String value)`

## Class: OrientationSensor

```dart
class OrientationSensor extends Sensor { … }
```

- `List<num>? get quaternion`
- `void populateMatrix(Object targetBuffer)`

## Class: OutputElement

```dart
class OutputElement extends HtmlElement { … }
```

- `OutputElement()`
- `String? get defaultValue`
- `set defaultValue=(String? value)`
- `FormElement? get form`
- `DomTokenList? get htmlFor`
- `List<Node>? get labels`
- `String? get name`
- `set name=(String? value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `String? get type`
- `String? get validationMessage`
- `ValidityState? get validity`
- `String? get value`
- `set value=(String? value)`
- `bool? get willValidate`
- `bool checkValidity()`
- `bool reportValidity()`
- `void setCustomValidity(String error)`

## Class: OverconstrainedError

```dart
class OverconstrainedError extends JavaScriptObject { … }
```

- `OverconstrainedError(String constraint, String message)`
- `String? get constraint`
- `String? get message`
- `String? get name`

## Class: PageTransitionEvent

```dart
class PageTransitionEvent extends Event { … }
```

- `PageTransitionEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `bool? get persisted`

## Class: PaintRenderingContext2D

```dart
class PaintRenderingContext2D
    extends JavaScriptObject
    implements _CanvasPath { … }
```

- `Matrix? get currentTransform`
- `set currentTransform=(Matrix? value)`
- `Object? get fillStyle`
- `set fillStyle=(Object? value)`
- `String? get filter`
- `set filter=(String? value)`
- `num? get globalAlpha`
- `set globalAlpha=(num? value)`
- `String? get globalCompositeOperation`
- `set globalCompositeOperation=(String? value)`
- `set imageSmoothingEnabled=(bool? value)`
- `bool? get imageSmoothingEnabled`
- `String? get imageSmoothingQuality`
- `set imageSmoothingQuality=(String? value)`
- `String? get lineCap`
- `set lineCap=(String? value)`
- `num? get lineDashOffset`
- `set lineDashOffset=(num? value)`
- `String? get lineJoin`
- `set lineJoin=(String? value)`
- `set lineWidth=(num? value)`
- `num? get lineWidth`
- `num? get miterLimit`
- `set miterLimit=(num? value)`
- `num? get shadowBlur`
- `set shadowBlur=(num? value)`
- `String? get shadowColor`
- `set shadowColor=(String? value)`
- `num? get shadowOffsetX`
- `set shadowOffsetX=(num? value)`
- `num? get shadowOffsetY`
- `set shadowOffsetY=(num? value)`
- `Object? get strokeStyle`
- `set strokeStyle=(Object? value)`
- `void arc(num x, num y, num radius, num startAngle, num endAngle, bool? anticlockwise)`
- `void arcTo(num x1, num y1, num x2, num y2, num radius)`
- `void beginPath()`
- `void bezierCurveTo(num cp1x, num cp1y, num cp2x, num cp2y, num x, num y)`
- `void clearRect(num x, num y, num width, num height)`
- `void clip([dynamic path_OR_winding, String? winding])`
- `void closePath()`
- `CanvasGradient createLinearGradient(num x0, num y0, num x1, num y1)`
- `CanvasPattern? createPattern(dynamic image, String repetitionType)`
- `CanvasGradient createRadialGradient(num x0, num y0, num r0, num x1, num y1, num r1)`
- `void drawImage(dynamic image, num sx_OR_x, num sy_OR_y, [num? sw_OR_width, num? height_OR_sh, num? dx, num? dy, num? dw, num? dh])`
- `void ellipse(num x, num y, num radiusX, num radiusY, num rotation, num startAngle, num endAngle, bool? anticlockwise)`
- `void fill([dynamic path_OR_winding, String? winding])`
- `void fillRect(num x, num y, num width, num height)`
- `List<num> getLineDash()`
- `bool isPointInPath(dynamic path_OR_x, num x_OR_y, [dynamic winding_OR_y, String? winding])`
- `bool isPointInStroke(dynamic path_OR_x, num x_OR_y, [num? y])`
- `void lineTo(num x, num y)`
- `void moveTo(num x, num y)`
- `void quadraticCurveTo(num cpx, num cpy, num x, num y)`
- `void rect(num x, num y, num width, num height)`
- `void resetTransform()`
- `void restore()`
- `void rotate(num angle)`
- `void save()`
- `void scale(num x, num y)`
- `void setLineDash(List<num> dash)`
- `void setTransform(num a, num b, num c, num d, num e, num f)`
- `void stroke([Path2D? path])`
- `void strokeRect(num x, num y, num width, num height)`
- `void transform(num a, num b, num c, num d, num e, num f)`
- `void translate(num x, num y)`

## Class: PaintSize

```dart
class PaintSize extends JavaScriptObject { … }
```

- `num? get height`
- `num? get width`

## Class: PaintWorkletGlobalScope

```dart
class PaintWorkletGlobalScope extends WorkletGlobalScope { … }
```

- `num? get devicePixelRatio`
- `void registerPaint(String name, Object paintCtor)`

## Class: ParagraphElement

```dart
class ParagraphElement extends HtmlElement { … }
```

- `ParagraphElement()`

## Class: ParamElement

```dart
class ParamElement extends HtmlElement { … }
```

- `ParamElement()`
- `String get name`
- `set name=(String value)`
- `String get value`
- `set value=(String value)`

## Class: ParentNode

```dart
abstract class ParentNode extends JavaScriptObject { … }
```

- `Element? querySelector(String selectors)`

## Class: PasswordCredential

```dart
class PasswordCredential extends Credential implements CredentialUserData { … }
```

- `PasswordCredential(dynamic data_OR_form)`
- `Object? get additionalData`
- `set additionalData=(Object? value)`
- `String? get iconUrl`
- `String? get idName`
- `set idName=(String? value)`
- `String? get name`
- `String? get password`
- `String? get passwordName`
- `set passwordName=(String? value)`

## Class: PasswordInputElement

Text with no line breaks (sensitive information).

```dart
abstract class PasswordInputElement implements TextInputElementBase { … }
```

- `PasswordInputElement()`

## Class: Path2D

```dart
class Path2D extends JavaScriptObject implements _CanvasPath { … }
```

- `Path2D([dynamic path_OR_text])`
- `void addPath(Path2D path, [Matrix? transform])`
- `void arc(num x, num y, num radius, num startAngle, num endAngle, bool? anticlockwise)`
- `void arcTo(num x1, num y1, num x2, num y2, num radius)`
- `void bezierCurveTo(num cp1x, num cp1y, num cp2x, num cp2y, num x, num y)`
- `void closePath()`
- `void ellipse(num x, num y, num radiusX, num radiusY, num rotation, num startAngle, num endAngle, bool? anticlockwise)`
- `void lineTo(num x, num y)`
- `void moveTo(num x, num y)`
- `void quadraticCurveTo(num cpx, num cpy, num x, num y)`
- `void rect(num x, num y, num width, num height)`

## Class: PaymentAddress

```dart
class PaymentAddress extends JavaScriptObject { … }
```

- `List<String>? get addressLine`
- `String? get city`
- `String? get country`
- `String? get dependentLocality`
- `String? get languageCode`
- `String? get organization`
- `String? get phone`
- `String? get postalCode`
- `String? get recipient`
- `String? get region`
- `String? get sortingCode`

## Class: PaymentInstruments

```dart
class PaymentInstruments extends JavaScriptObject { … }
```

- `Future<dynamic> clear()`
- `Future<bool> delete(String instrumentKey)`
- `Future<Map<String, dynamic>?> get(String instrumentKey)`
- `Future<dynamic> has(String instrumentKey)`
- `Future<List<dynamic>> keys()`
- `Future<dynamic> set(String instrumentKey, Map<dynamic, dynamic> details)`

## Class: PaymentManager

```dart
class PaymentManager extends JavaScriptObject { … }
```

- `PaymentInstruments? get instruments`
- `String? get userHint`
- `set userHint=(String? value)`

## Class: PaymentRequest

```dart
class PaymentRequest extends EventTarget { … }
```

- `PaymentRequest(List<Map<dynamic, dynamic>> methodData, Map<dynamic, dynamic> details, [Map<dynamic, dynamic>? options])`
- `String? get id`
- `PaymentAddress? get shippingAddress`
- `String? get shippingOption`
- `String? get shippingType`
- `Future<dynamic> abort()`
- `Future<bool> canMakePayment()`
- `Future<PaymentResponse> show()`

## Class: PaymentRequestEvent

```dart
class PaymentRequestEvent extends ExtendableEvent { … }
```

- `PaymentRequestEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `String? get instrumentKey`
- `List<dynamic>? get methodData`
- `List<dynamic>? get modifiers`
- `String? get paymentRequestId`
- `String? get paymentRequestOrigin`
- `String? get topLevelOrigin`
- `Object? get total`
- `Future<WindowClient> openWindow(String url)`
- `void respondWith(Future<dynamic> response)`

## Class: PaymentRequestUpdateEvent

```dart
class PaymentRequestUpdateEvent extends Event { … }
```

- `PaymentRequestUpdateEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `void updateWith(Future<dynamic> detailsPromise)`

## Class: PaymentResponse

```dart
class PaymentResponse extends JavaScriptObject { … }
```

- `Object? get details`
- `String? get methodName`
- `String? get payerEmail`
- `String? get payerName`
- `String? get payerPhone`
- `String? get requestId`
- `PaymentAddress? get shippingAddress`
- `String? get shippingOption`
- `Future<dynamic> complete([String? paymentResult])`

## Class: Performance

```dart
class Performance extends EventTarget { … }
```

- `MemoryInfo? get memory`
- `PerformanceNavigation get navigation`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `num? get timeOrigin`
- `PerformanceTiming get timing`
- `void clearMarks(String? markName)`
- `void clearMeasures(String? measureName)`
- `void clearResourceTimings()`
- `List<PerformanceEntry> getEntries()`
- `List<PerformanceEntry> getEntriesByName(String name, String? entryType)`
- `List<PerformanceEntry> getEntriesByType(String entryType)`
- `PerformanceEntry? mark(String markName, [Map<dynamic, dynamic>? markOptions])`
- `PerformanceMeasure? measure(String measureName, [dynamic measureOptions_OR_startMark, String? endMark])`
- `double now()`
- `void setResourceTimingBufferSize(int maxSize)`

## Class: PerformanceEntry

```dart
class PerformanceEntry extends JavaScriptObject { … }
```

- `num get duration`
- `String get entryType`
- `String get name`
- `num get startTime`

## Class: PerformanceLongTaskTiming

```dart
class PerformanceLongTaskTiming extends PerformanceEntry { … }
```

- `List<TaskAttributionTiming>? get attribution`

## Class: PerformanceMark

```dart
class PerformanceMark extends PerformanceEntry { … }
```

## Class: PerformanceMeasure

```dart
class PerformanceMeasure extends PerformanceEntry { … }
```

## Class: PerformanceNavigation

```dart
class PerformanceNavigation extends JavaScriptObject { … }
```

- static `int TYPE_BACK_FORWARD`
- static `int TYPE_NAVIGATE`
- static `int TYPE_RELOAD`
- static `int TYPE_RESERVED`
- `int? get redirectCount`
- `int? get type`

## Class: PerformanceNavigationTiming

```dart
class PerformanceNavigationTiming extends PerformanceResourceTiming { … }
```

- `num? get domComplete`
- `num? get domContentLoadedEventEnd`
- `num? get domContentLoadedEventStart`
- `num? get domInteractive`
- `num? get loadEventEnd`
- `num? get loadEventStart`
- `int? get redirectCount`
- `String? get type`
- `num? get unloadEventEnd`
- `num? get unloadEventStart`

## Class: PerformanceObserver

```dart
class PerformanceObserver extends JavaScriptObject { … }
```

- `PerformanceObserver(void Function(PerformanceObserverEntryList, PerformanceObserver) callback)`
- `void disconnect()`
- `void observe(Map<dynamic, dynamic> options)`

## Class: PerformanceObserverEntryList

```dart
class PerformanceObserverEntryList extends JavaScriptObject { … }
```

- `List<PerformanceEntry> getEntries()`
- `List<PerformanceEntry> getEntriesByName(String name, String? entryType)`
- `List<PerformanceEntry> getEntriesByType(String entryType)`

## Class: PerformancePaintTiming

```dart
class PerformancePaintTiming extends PerformanceEntry { … }
```

## Class: PerformanceResourceTiming

```dart
class PerformanceResourceTiming extends PerformanceEntry { … }
```

- `num get connectEnd`
- `num get connectStart`
- `int? get decodedBodySize`
- `num? get domainLookupEnd`
- `num? get domainLookupStart`
- `int? get encodedBodySize`
- `num? get fetchStart`
- `String? get initiatorType`
- `String? get nextHopProtocol`
- `num? get redirectEnd`
- `num? get redirectStart`
- `num? get requestStart`
- `num? get responseEnd`
- `num? get responseStart`
- `num? get secureConnectionStart`
- `List<PerformanceServerTiming>? get serverTiming`
- `int? get transferSize`
- `num? get workerStart`

## Class: PerformanceServerTiming

```dart
class PerformanceServerTiming extends JavaScriptObject { … }
```

- `String? get description`
- `num? get duration`
- `String? get name`

## Class: PerformanceTiming

```dart
class PerformanceTiming extends JavaScriptObject { … }
```

- `int get connectEnd`
- `int get connectStart`
- `int get domComplete`
- `int get domContentLoadedEventEnd`
- `int get domContentLoadedEventStart`
- `int get domInteractive`
- `int get domLoading`
- `int get domainLookupEnd`
- `int get domainLookupStart`
- `int get fetchStart`
- `int get loadEventEnd`
- `int get loadEventStart`
- `int get navigationStart`
- `int get redirectEnd`
- `int get redirectStart`
- `int get requestStart`
- `int get responseEnd`
- `int get responseStart`
- `int get secureConnectionStart`
- `int get unloadEventEnd`
- `int get unloadEventStart`

## Class: PermissionStatus

```dart
class PermissionStatus extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `Stream<Event> get onChange`
- `String? get state`

## Class: Permissions

```dart
class Permissions extends JavaScriptObject { … }
```

- `Future<PermissionStatus> query(Map<dynamic, dynamic> permission)`
- `Future<PermissionStatus> request(Map<dynamic, dynamic> permissions)`
- `Future<PermissionStatus> requestAll(List<Map<dynamic, dynamic>> permissions)`
- `Future<PermissionStatus> revoke(Map<dynamic, dynamic> permission)`

## Class: PhotoCapabilities

```dart
class PhotoCapabilities extends JavaScriptObject { … }
```

- `List<dynamic>? get fillLightMode`
- `MediaSettingsRange? get imageHeight`
- `MediaSettingsRange? get imageWidth`
- `String? get redEyeReduction`

## Class: PictureElement

```dart
class PictureElement extends HtmlElement { … }
```

## Class: Platform

```dart
class Platform { … }
```

- static `bool supportsSimd`:
  Returns true if SIMD types in dart:typed_data types are supported
  on this browser.  If false, using these types will generate a runtime
  error.
- static `bool supportsTypedData`:
  Returns true if dart:typed_data types are supported on this
  browser.  If false, using these types will generate a runtime
  error.

## Class: Plugin

```dart
class Plugin extends JavaScriptObject { … }
```

- `String? get description`
- `String? get filename`
- `int? get length`
- `String? get name`
- `MimeType? item(int index)`
- `MimeType? namedItem(String name)`

## Class: PluginArray

```dart
class PluginArray
    extends JavaScriptObject
    with ListBase<Plugin>, ImmutableListMixin<Plugin>
    implements List<Plugin>, JavaScriptIndexingBehavior<Plugin> { … }
```

- `Plugin get first`: The first element.
- `Plugin get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `Plugin get single`:
  Checks that this iterable has only one element, and returns that element.
- `Plugin operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Plugin value)`:
  Sets the value at the given [index] in the list to [value].
- `Plugin elementAt(int index)`: Returns the [index]th element.
- `Plugin? item(int index)`
- `Plugin? namedItem(String name)`
- `void refresh(bool? reload)`

## Class: PointerEvent

```dart
class PointerEvent extends MouseEvent { … }
```

- `PointerEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `num? get height`
- `bool? get isPrimary`
- `int? get pointerId`
- `String? get pointerType`
- `num? get pressure`
- static `bool get supported`:
  PointerEvent used for both touch and mouse.  To check if touch is supported
  call the property TouchEvent.supported
- `num? get tangentialPressure`
- `int? get tiltX`
- `int? get tiltY`
- `int? get twist`
- `num? get width`
- `List<PointerEvent> getCoalescedEvents()`

## Class: PopStateEvent

```dart
class PopStateEvent extends Event { … }
```

- `PopStateEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `dynamic get state`

## Class: PositionError

```dart
class PositionError extends JavaScriptObject { … }
```

- static `int PERMISSION_DENIED`
- static `int POSITION_UNAVAILABLE`
- static `int TIMEOUT`
- `int? get code`
- `String? get message`

## Class: PreElement

```dart
class PreElement extends HtmlElement { … }
```

- `PreElement()`

## Class: Presentation

```dart
class Presentation extends JavaScriptObject { … }
```

- `PresentationRequest? get defaultRequest`
- `set defaultRequest=(PresentationRequest? value)`
- `PresentationReceiver? get receiver`

## Class: PresentationAvailability

```dart
class PresentationAvailability extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `Stream<Event> get onChange`
- `bool? get value`

## Class: PresentationConnection

```dart
class PresentationConnection extends EventTarget { … }
```

- static `EventStreamProvider<MessageEvent> messageEvent`
- `String? get binaryType`
- `set binaryType=(String? value)`
- `String? get id`
- `Stream<MessageEvent> get onMessage`
- `String? get state`
- `String? get url`
- `void close()`
- `void send(dynamic data_OR_message)`
- `void terminate()`

## Class: PresentationConnectionAvailableEvent

```dart
class PresentationConnectionAvailableEvent extends Event { … }
```

- `PresentationConnectionAvailableEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `PresentationConnection? get connection`

## Class: PresentationConnectionCloseEvent

```dart
class PresentationConnectionCloseEvent extends Event { … }
```

- `PresentationConnectionCloseEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `String? get message`
- `String? get reason`

## Class: PresentationConnectionList

```dart
class PresentationConnectionList extends EventTarget { … }
```

- `List<PresentationConnection>? get connections`

## Class: PresentationReceiver

```dart
class PresentationReceiver extends JavaScriptObject { … }
```

- `Future<PresentationConnectionList> get connectionList`

## Class: PresentationRequest

```dart
class PresentationRequest extends EventTarget { … }
```

- `PresentationRequest(dynamic url_OR_urls)`
- `Future<PresentationAvailability> getAvailability()`
- `Future<PresentationConnection> reconnect(String id)`
- `Future<PresentationConnection> start()`

## Class: ProcessingInstruction

```dart
class ProcessingInstruction extends CharacterData { … }
```

- `StyleSheet? get sheet`
- `String? get target`

## Class: ProgressElement

```dart
class ProgressElement extends HtmlElement { … }
```

- `ProgressElement()`
- `List<Node>? get labels`
- `num get max`
- `set max=(num value)`
- `num get position`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `num get value`
- `set value=(num value)`

## Class: ProgressEvent

```dart
class ProgressEvent extends Event { … }
```

- `ProgressEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `bool get lengthComputable`
- `int? get loaded`
- `int? get total`

## Class: PromiseRejectionEvent

```dart
class PromiseRejectionEvent extends Event { … }
```

- `PromiseRejectionEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `Future<dynamic> get promise`
- `Object? get reason`

## Class: PublicKeyCredential

```dart
class PublicKeyCredential extends Credential { … }
```

- `ByteBuffer? get rawId`
- `AuthenticatorResponse? get response`

## Class: PushEvent

```dart
class PushEvent extends ExtendableEvent { … }
```

- `PushEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `PushMessageData? get data`

## Class: PushManager

```dart
class PushManager extends JavaScriptObject { … }
```

- static `List<String>? get supportedContentEncodings`
- `Future<PushSubscription> getSubscription()`
- `Future<dynamic> permissionState([Map<dynamic, dynamic>? options])`
- `Future<PushSubscription> subscribe([Map<dynamic, dynamic>? options])`

## Class: PushMessageData

```dart
class PushMessageData extends JavaScriptObject { … }
```

- `ByteBuffer arrayBuffer()`
- `Blob blob()`
- `Object json()`
- `String text()`

## Class: PushSubscription

```dart
class PushSubscription extends JavaScriptObject { … }
```

- `String? get endpoint`
- `int? get expirationTime`
- `PushSubscriptionOptions? get options`
- `ByteBuffer? getKey(String name)`
- `Future<bool> unsubscribe()`

## Class: PushSubscriptionOptions

```dart
class PushSubscriptionOptions extends JavaScriptObject { … }
```

- `ByteBuffer? get applicationServerKey`
- `bool? get userVisibleOnly`

## Class: QuoteElement

```dart
class QuoteElement extends HtmlElement { … }
```

- `QuoteElement()`
- `String get cite`
- `set cite=(String value)`

## Class: RadioButtonInputElement

A control that when used with other [RadioButtonInputElement] controls
forms a radio button group in which only one control can be checked at a
time.

```dart
abstract class RadioButtonInputElement implements InputElementBase { … }
```

- `RadioButtonInputElement()`
- `bool? get checked`
- `set checked=(bool? value)`
- `bool get required`
- `set required=(bool value)`

## Class: Range

```dart
class Range extends JavaScriptObject { … }
```

- `Range()`
- `Range.fromPoint(Point<num> point)`
- static `int END_TO_END`
- static `int END_TO_START`
- static `int START_TO_END`
- static `int START_TO_START`
- `bool get collapsed`
- `Node get commonAncestorContainer`
- `Node get endContainer`
- `int get endOffset`
- `Node get startContainer`
- `int get startOffset`
- static `bool get supportsCreateContextualFragment`:
  Checks if createContextualFragment is supported.
- `DocumentFragment cloneContents()`
- `Range cloneRange()`
- `void collapse([bool? toStart])`
- `int compareBoundaryPoints(int how, Range sourceRange)`
- `int comparePoint(Node node, int offset)`
- `DocumentFragment createContextualFragment(String fragment)`
- `void deleteContents()`
- `void detach()`
- `void expand(String? unit)`
- `DocumentFragment extractContents()`
- `Rectangle<num> getBoundingClientRect()`
- `List<Rectangle<num>> getClientRects()`
- `void insertNode(Node node)`
- `bool isPointInRange(Node node, int offset)`
- `void selectNode(Node node)`
- `void selectNodeContents(Node node)`
- `void setEnd(Node node, int offset)`
- `void setEndAfter(Node node)`
- `void setEndBefore(Node node)`
- `void setStart(Node node, int offset)`
- `void setStartAfter(Node node)`
- `void setStartBefore(Node node)`
- `void surroundContents(Node newParent)`

## Class: RangeInputElement

Similar to [NumberInputElement] but the browser may provide more optimal
styling (such as a slider control).

```dart
abstract class RangeInputElement implements RangeInputElementBase { … }
```

- `RangeInputElement()`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: RangeInputElementBase

Base interface for all input element types which involve ranges.

```dart
abstract class RangeInputElementBase implements InputElementBase { … }
```

- `Element? get list`
- `String? get max`
- `set max=(String? value)`
- `String? get min`
- `set min=(String? value)`
- `String? get step`
- `set step=(String? value)`
- `num? get valueAsNumber`
- `set valueAsNumber=(num? value)`
- `void stepDown([int? n])`
- `void stepUp([int? n])`

## Class: ReadyState

Contains the set of standard values returned by HTMLDocument.getReadyState.

```dart
abstract class ReadyState { … }
```

- static `String COMPLETE`:
  Indicates the document and all subresources have been loaded.
- static `String INTERACTIVE`:
  Indicates the document is finished parsing but is still loading
  subresources.
- static `String LOADING`: Indicates the document is still loading and parsing.

## Class: RelatedApplication

```dart
class RelatedApplication extends JavaScriptObject { … }
```

- `String? get id`
- `String? get platform`
- `String? get url`

## Class: RelativeOrientationSensor

```dart
class RelativeOrientationSensor extends OrientationSensor { … }
```

- `RelativeOrientationSensor([Map<dynamic, dynamic>? sensorOptions])`

## Class: RemotePlayback

```dart
class RemotePlayback extends EventTarget { … }
```

- `String? get state`
- `Future<dynamic> cancelWatchAvailability([int? id])`
- `Future<dynamic> prompt()`
- `Future<int> watchAvailability(void Function(bool) callback)`

## Class: ReportBody

```dart
class ReportBody extends JavaScriptObject { … }
```

## Class: ReportingObserver

```dart
class ReportingObserver extends JavaScriptObject { … }
```

- `ReportingObserver(void Function(List<dynamic>, ReportingObserver) callback)`
- `void disconnect()`
- `void observe()`

## Class: ResetButtonInputElement

A button, which when clicked, resets the form.

```dart
abstract class ResetButtonInputElement implements InputElementBase { … }
```

- `ResetButtonInputElement()`

## Class: ResizeObserver

```dart
class ResizeObserver extends JavaScriptObject { … }
```

- `ResizeObserver(void Function(List<dynamic>, ResizeObserver) callback)`
- `void disconnect()`
- `void observe(Element target)`
- `void unobserve(Element target)`

## Class: ResizeObserverEntry

```dart
class ResizeObserverEntry extends JavaScriptObject { … }
```

- `DomRectReadOnly? get contentRect`
- `Element? get target`

## Class: RtcCertificate

```dart
class RtcCertificate extends JavaScriptObject { … }
```

- `int? get expires`
- `List<Map<dynamic, dynamic>> getFingerprints()`

## Class: RtcDataChannel

```dart
class RtcDataChannel extends EventTarget { … }
```

- static `EventStreamProvider<Event> closeEvent`:
  Static factory designed to expose `close` events to event
  handlers that are not necessarily instances of [RtcDataChannel].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [RtcDataChannel].
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [RtcDataChannel].
- static `EventStreamProvider<Event> openEvent`:
  Static factory designed to expose `open` events to event
  handlers that are not necessarily instances of [RtcDataChannel].
- `String? get binaryType`
- `set binaryType=(String? value)`
- `int? get bufferedAmount`
- `int? get bufferedAmountLowThreshold`
- `set bufferedAmountLowThreshold=(int? value)`
- `int? get id`
- `String? get label`
- `int? get maxRetransmitTime`
- `int? get maxRetransmits`
- `bool? get negotiated`
- `Stream<Event> get onClose`:
  Stream of `close` events handled by this [RtcDataChannel].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [RtcDataChannel].
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [RtcDataChannel].
- `Stream<Event> get onOpen`:
  Stream of `open` events handled by this [RtcDataChannel].
- `bool? get ordered`
- `String? get protocol`
- `String? get readyState`
- `bool? get reliable`
- `void close()`
- `void send(dynamic data)`
- `void sendBlob(Blob data)`
- `void sendByteBuffer(ByteBuffer data)`
- `void sendString(String data)`
- `void sendTypedData(TypedData data)`

## Class: RtcDataChannelEvent

```dart
class RtcDataChannelEvent extends Event { … }
```

- `RtcDataChannelEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `RtcDataChannel? get channel`

## Class: RtcDtmfSender

```dart
class RtcDtmfSender extends EventTarget { … }
```

- static `EventStreamProvider<RtcDtmfToneChangeEvent> toneChangeEvent`:
  Static factory designed to expose `tonechange` events to event
  handlers that are not necessarily instances of [RtcDtmfSender].
- `bool? get canInsertDtmf`
- `int? get duration`
- `int? get interToneGap`
- `Stream<RtcDtmfToneChangeEvent> get onToneChange`:
  Stream of `tonechange` events handled by this [RtcDtmfSender].
- `String? get toneBuffer`
- `MediaStreamTrack? get track`
- `void insertDtmf(String tones, [int? duration, int? interToneGap])`

## Class: RtcDtmfToneChangeEvent

```dart
class RtcDtmfToneChangeEvent extends Event { … }
```

- `RtcDtmfToneChangeEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `String? get tone`

## Class: RtcIceCandidate

```dart
class RtcIceCandidate extends JavaScriptObject { … }
```

- `RtcIceCandidate(Map<dynamic, dynamic> dictionary)`
- `String? get candidate`
- `set candidate=(String? value)`
- `int? get sdpMLineIndex`
- `set sdpMLineIndex=(int? value)`
- `String? get sdpMid`
- `set sdpMid=(String? value)`

## Class: RtcLegacyStatsReport

```dart
class RtcLegacyStatsReport extends JavaScriptObject { … }
```

- `String? get id`
- `DateTime get timestamp`
- `String? get type`
- `List<String> names()`
- `String stat(String name)`

## Class: RtcPeerConnection

```dart
class RtcPeerConnection extends EventTarget { … }
```

- `RtcPeerConnection(Map<dynamic, dynamic> rtcIceServers, [Map<dynamic, dynamic>? mediaConstraints])`
- static `EventStreamProvider<MediaStreamEvent> addStreamEvent`:
  Static factory designed to expose `addstream` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<Event> connectionStateChangeEvent`:
  Static factory designed to expose `connectionstatechange` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<RtcDataChannelEvent> dataChannelEvent`:
  Static factory designed to expose `datachannel` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<RtcPeerConnectionIceEvent> iceCandidateEvent`:
  Static factory designed to expose `icecandidate` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<Event> iceConnectionStateChangeEvent`:
  Static factory designed to expose `iceconnectionstatechange` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<Event> negotiationNeededEvent`:
  Static factory designed to expose `negotiationneeded` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<MediaStreamEvent> removeStreamEvent`:
  Static factory designed to expose `removestream` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<Event> signalingStateChangeEvent`:
  Static factory designed to expose `signalingstatechange` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `EventStreamProvider<RtcTrackEvent> trackEvent`:
  Static factory designed to expose `track` events to event
  handlers that are not necessarily instances of [RtcPeerConnection].
- static `Future<dynamic> generateCertificate(dynamic keygenAlgorithm)`
- `String? get connectionState`
- `String? get iceConnectionState`
- `String? get iceGatheringState`
- `RtcSessionDescription? get localDescription`
- `Stream<MediaStreamEvent> get onAddStream`:
  Stream of `addstream` events handled by this [RtcPeerConnection].
- `Stream<Event> get onConnectionStateChange`:
  Stream of `connectionstatechange` events handled by this [RtcPeerConnection].
- `Stream<RtcDataChannelEvent> get onDataChannel`:
  Stream of `datachannel` events handled by this [RtcPeerConnection].
- `Stream<RtcPeerConnectionIceEvent> get onIceCandidate`:
  Stream of `icecandidate` events handled by this [RtcPeerConnection].
- `Stream<Event> get onIceConnectionStateChange`:
  Stream of `iceconnectionstatechange` events handled by this [RtcPeerConnection].
- `Stream<Event> get onNegotiationNeeded`:
  Stream of `negotiationneeded` events handled by this [RtcPeerConnection].
- `Stream<MediaStreamEvent> get onRemoveStream`:
  Stream of `removestream` events handled by this [RtcPeerConnection].
- `Stream<Event> get onSignalingStateChange`:
  Stream of `signalingstatechange` events handled by this [RtcPeerConnection].
- `Stream<RtcTrackEvent> get onTrack`:
  Stream of `track` events handled by this [RtcPeerConnection].
- `RtcSessionDescription? get remoteDescription`
- `String? get signalingState`
- static `bool get supported`:
  Checks if Real Time Communication (RTC) APIs are supported and enabled on
  the current platform.
- `Future<dynamic> addIceCandidate(Object candidate, [void Function()? successCallback, void Function(DomException)? failureCallback])`
- `void addStream(MediaStream? stream, [Map<dynamic, dynamic>? mediaConstraints])`
- `RtcRtpSender addTrack(MediaStreamTrack track, MediaStream streams)`
- `void close()`
- `Future<RtcSessionDescription> createAnswer([Map<dynamic, dynamic>? options])`
- `RtcDataChannel createDataChannel(String label, [Map<dynamic, dynamic>? dataChannelDict])`
- `RtcDtmfSender createDtmfSender(MediaStreamTrack track)`
- `Future<RtcSessionDescription> createOffer([Map<dynamic, dynamic>? options])`
- `Future<RtcStatsResponse> getLegacyStats([MediaStreamTrack? selector])`:
  Temporarily exposes _getStats and old getStats as getLegacyStats until Chrome fully supports
  new getStats API.
- `List<MediaStream> getLocalStreams()`
- `List<RtcRtpReceiver> getReceivers()`
- `List<MediaStream> getRemoteStreams()`
- `List<RtcRtpSender> getSenders()`
- `Future<RtcStatsReport> getStats()`
- `void removeStream(MediaStream? stream)`
- `void removeTrack(RtcRtpSender sender)`
- `void setConfiguration(Map<dynamic, dynamic> configuration)`
- `Future<dynamic> setLocalDescription(Map<dynamic, dynamic> description)`
- `Future<dynamic> setRemoteDescription(Map<dynamic, dynamic> description)`

## Class: RtcPeerConnectionIceEvent

```dart
class RtcPeerConnectionIceEvent extends Event { … }
```

- `RtcPeerConnectionIceEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `RtcIceCandidate? get candidate`

## Class: RtcRtpContributingSource

```dart
class RtcRtpContributingSource extends JavaScriptObject { … }
```

- `int? get source`
- `num? get timestamp`

## Class: RtcRtpReceiver

```dart
class RtcRtpReceiver extends JavaScriptObject { … }
```

- `MediaStreamTrack? get track`
- `List<RtcRtpContributingSource> getContributingSources()`

## Class: RtcRtpSender

```dart
class RtcRtpSender extends JavaScriptObject { … }
```

- `MediaStreamTrack? get track`

## Class: RtcSessionDescription

```dart
class RtcSessionDescription extends JavaScriptObject { … }
```

- `RtcSessionDescription(Map<dynamic, dynamic> dictionary)`
- `String? get sdp`
- `set sdp=(String? value)`
- `String? get type`
- `set type=(String? value)`

## Class: RtcStatsReport

```dart
class RtcStatsReport
    extends JavaScriptObject
    with MapBase<String, dynamic> { … }
```

- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<String> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<Map<dynamic, dynamic>> get values`: The values of this [Map].
- `Map<dynamic, dynamic>? operator[](dynamic key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(String key, dynamic value)`:
  Associates the [key] with the given [value].
- `void addAll(Map<String, dynamic> other)`:
  Adds all key/value pairs of [other] to this map.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(dynamic key)`: Whether this map contains the given [key].
- `bool containsValue(dynamic value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(String, dynamic) f)`:
  Applies [action] to each key/value pair of the map.
- `dynamic putIfAbsent(String key, dynamic Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `String remove(dynamic key)`:
  Removes [key] and its associated value, if present, from the map.

## Class: RtcStatsResponse

```dart
class RtcStatsResponse extends JavaScriptObject { … }
```

- `RtcLegacyStatsReport namedItem(String? name)`
- `List<RtcLegacyStatsReport> result()`

## Class: RtcTrackEvent

```dart
class RtcTrackEvent extends Event { … }
```

- `RtcTrackEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `RtcRtpReceiver? get receiver`
- `List<MediaStream>? get streams`
- `MediaStreamTrack? get track`

## Class: Screen

```dart
class Screen extends JavaScriptObject { … }
```

- `Rectangle<num> get available`
- `int? get colorDepth`
- `int? get height`
- `bool? get keepAwake`
- `set keepAwake=(bool? value)`
- `ScreenOrientation? get orientation`
- `int? get pixelDepth`
- `int? get width`

## Class: ScreenOrientation

```dart
class ScreenOrientation extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `int? get angle`
- `Stream<Event> get onChange`
- `String? get type`
- `Future<dynamic> lock(String orientation)`
- `void unlock()`

## Class: ScriptElement

```dart
class ScriptElement extends HtmlElement { … }
```

- `ScriptElement()`
- `bool? get async`
- `set async=(bool? value)`
- `String get charset`
- `set charset=(String value)`
- `String? get crossOrigin`
- `set crossOrigin=(String? value)`
- `bool? get defer`
- `set defer=(bool? value)`
- `String? get integrity`
- `set integrity=(String? value)`
- `bool? get noModule`
- `set noModule=(bool? value)`
- `String get src`
- `set src=(String value)`
- `String get type`
- `set type=(String value)`

## Class: ScrollAlignment

Options for Element.scrollIntoView.

```dart
class ScrollAlignment { … }
```

- static `ScrollAlignment BOTTOM`:
  Attempt to align the element to the bottom of the scrollable area.
- static `ScrollAlignment CENTER`:
  Attempt to center the element in the scrollable area.
- static `ScrollAlignment TOP`:
  Attempt to align the element to the top of the scrollable area.
- `String toString()`: A string representation of this object.

## Class: ScrollState

```dart
class ScrollState extends JavaScriptObject { … }
```

- `ScrollState([Map<dynamic, dynamic>? scrollStateInit])`
- `num? get deltaGranularity`
- `num? get deltaX`
- `num? get deltaY`
- `bool? get fromUserInput`
- `bool? get inInertialPhase`
- `bool? get isBeginning`
- `bool? get isDirectManipulation`
- `bool? get isEnding`
- `int? get positionX`
- `int? get positionY`
- `num? get velocityX`
- `num? get velocityY`
- `void consumeDelta(num x, num y)`
- `void distributeToScrollChainDescendant()`

## Class: ScrollTimeline

```dart
class ScrollTimeline extends AnimationTimeline { … }
```

- `ScrollTimeline([Map<dynamic, dynamic>? options])`
- `String? get orientation`
- `Element? get scrollSource`
- `Object? get timeRange`

## Class: SearchInputElement

Similar to [TextInputElement], but on platforms where search is styled
differently this will get the search style.

```dart
abstract class SearchInputElement implements TextInputElementBase { … }
```

- `SearchInputElement()`
- `String? get dirName`
- `set dirName=(String? value)`
- `Element? get list`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: SecurityPolicyViolationEvent

```dart
class SecurityPolicyViolationEvent extends Event { … }
```

- `SecurityPolicyViolationEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `String? get blockedUri`
- `int? get columnNumber`
- `String? get disposition`
- `String? get documentUri`
- `String? get effectiveDirective`
- `int? get lineNumber`
- `String? get originalPolicy`
- `String? get referrer`
- `String? get sample`
- `String? get sourceFile`
- `int? get statusCode`
- `String? get violatedDirective`

## Class: SelectElement

```dart
class SelectElement extends HtmlElement { … }
```

- `SelectElement()`
- `bool get autofocus`
- `set autofocus=(bool value)`
- `bool get disabled`
- `set disabled=(bool value)`
- `FormElement? get form`
- `List<Node>? get labels`
- `int? get length`
- `set length=(int? value)`
- `bool? get multiple`
- `set multiple=(bool? value)`
- `String? get name`
- `set name=(String? value)`
- `List<OptionElement> get options`
- `bool? get required`
- `set required=(bool? value)`
- `int? get selectedIndex`
- `set selectedIndex=(int? value)`
- `List<OptionElement> get selectedOptions`
- `int? get size`
- `set size=(int? value)`
- `String get type`
- `String get validationMessage`
- `ValidityState get validity`
- `String? get value`
- `set value=(String? value)`
- `bool get willValidate`
- `void add(Object element, Object? before)`
- `bool checkValidity()`
- `Element? item(int index)`
- `OptionElement? namedItem(String name)`
- `bool reportValidity()`
- `void setCustomValidity(String error)`

## Class: Selection

```dart
class Selection extends JavaScriptObject { … }
```

- `Node? get anchorNode`
- `int? get anchorOffset`
- `Node? get baseNode`
- `int? get baseOffset`
- `Node? get extentNode`
- `int? get extentOffset`
- `Node? get focusNode`
- `int? get focusOffset`
- `bool? get isCollapsed`
- `int? get rangeCount`
- `String? get type`
- `void addRange(Range range)`
- `void collapse(Node? node, [int? offset])`
- `void collapseToEnd()`
- `void collapseToStart()`
- `bool containsNode(Node node, [bool? allowPartialContainment])`
- `void deleteFromDocument()`
- `void empty()`
- `void extend(Node node, [int? offset])`
- `Range getRangeAt(int index)`
- `void modify(String? alter, String? direction, String? granularity)`
- `void removeAllRanges()`
- `void removeRange(Range range)`
- `void selectAllChildren(Node node)`
- `void setBaseAndExtent(Node? baseNode, int baseOffset, Node? extentNode, int extentOffset)`
- `void setPosition(Node? node, [int? offset])`

## Class: Sensor

```dart
class Sensor extends EventTarget { … }
```

- static `EventStreamProvider<Event> errorEvent`
- `bool? get activated`
- `bool? get hasReading`
- `Stream<Event> get onError`
- `num? get timestamp`
- `void start()`
- `void stop()`

## Class: SensorErrorEvent

```dart
class SensorErrorEvent extends Event { … }
```

- `SensorErrorEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `DomException? get error`

## Class: ServiceWorker

```dart
class ServiceWorker extends EventTarget implements AbstractWorker { … }
```

- static `EventStreamProvider<Event> errorEvent`
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [AbstractWorker].
- `String? get scriptUrl`
- `String? get state`
- `void postMessage(dynamic message, [List<Object>? transfer])`

## Class: ServiceWorkerContainer

```dart
class ServiceWorkerContainer extends EventTarget { … }
```

- static `EventStreamProvider<MessageEvent> messageEvent`
- `ServiceWorker? get controller`
- `Stream<MessageEvent> get onMessage`
- `Future<ServiceWorkerRegistration> get ready`
- `Future<ServiceWorkerRegistration> getRegistration([String? documentURL])`
- `Future<List<dynamic>> getRegistrations()`
- `Future<ServiceWorkerRegistration> register(String url, [Map<dynamic, dynamic>? options])`

## Class: ServiceWorkerGlobalScope

```dart
class ServiceWorkerGlobalScope extends WorkerGlobalScope { … }
```

- static `EventStreamProvider<Event> activateEvent`
- static `EventStreamProvider<Event> fetchEvent`
- static `EventStreamProvider<ForeignFetchEvent> foreignfetchEvent`
- static `EventStreamProvider<Event> installEvent`
- static `EventStreamProvider<MessageEvent> messageEvent`
- `Clients? get clients`
- static `ServiceWorkerGlobalScope get instance`
- `Stream<Event> get onActivate`
- `Stream<Event> get onFetch`
- `Stream<ForeignFetchEvent> get onForeignfetch`
- `Stream<Event> get onInstall`
- `Stream<MessageEvent> get onMessage`
- `ServiceWorkerRegistration? get registration`
- `Future<dynamic> skipWaiting()`

## Class: ServiceWorkerRegistration

```dart
class ServiceWorkerRegistration extends EventTarget { … }
```

- `ServiceWorker? get active`
- `BackgroundFetchManager? get backgroundFetch`
- `ServiceWorker? get installing`
- `NavigationPreloadManager? get navigationPreload`
- `PaymentManager? get paymentManager`
- `PushManager? get pushManager`
- `String? get scope`
- `SyncManager? get sync`
- `ServiceWorker? get waiting`
- `Future<List<dynamic>> getNotifications([Map<dynamic, dynamic>? filter])`
- `Future<dynamic> showNotification(String title, [Map<dynamic, dynamic>? options])`
- `Future<bool> unregister()`
- `Future<dynamic> update()`

## Class: ShadowElement

```dart
class ShadowElement extends HtmlElement { … }
```

- `ShadowElement()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `List<Node> getDistributedNodes()`

## Class: ShadowRoot

```dart
class ShadowRoot extends DocumentFragment implements DocumentOrShadowRoot { … }
```

- `Element? get activeElement`
- `bool get applyAuthorStyles`
- `set applyAuthorStyles=(bool value)`
- `bool? get delegatesFocus`
- `Element? get fullscreenElement`
- `Element? get host`
- `String? get innerHtml`
- `set innerHtml=(String? value)`
- `String? get mode`
- `ShadowRoot? get olderShadowRoot`
- `Element? get pointerLockElement`
- `bool get resetStyleInheritance`
- `set resetStyleInheritance=(bool value)`
- `List<StyleSheet>? get styleSheets`
- static `bool get supported`
- `Element? elementFromPoint(int x, int y)`
- `List<Element> elementsFromPoint(int x, int y)`
- `Selection? getSelection()`

## Class: SharedArrayBuffer

```dart
abstract interface class SharedArrayBuffer extends JavaScriptObject { … }
```

- `SharedArrayBuffer([int? length])`
- `int? get byteLength`
- `SharedArrayBuffer slice([int? begin, int? end])`

## Class: SharedWorker

```dart
class SharedWorker extends EventTarget implements AbstractWorker { … }
```

- `SharedWorker(String scriptURL, [String? name])`
- static `EventStreamProvider<Event> errorEvent`
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [AbstractWorker].
- `MessagePort? get port`

## Class: SharedWorkerGlobalScope

```dart
class SharedWorkerGlobalScope extends WorkerGlobalScope { … }
```

- static `int PERSISTENT`
- static `int TEMPORARY`
- static `EventStreamProvider<Event> connectEvent`:
  Static factory designed to expose `connect` events to event
  handlers that are not necessarily instances of [SharedWorkerGlobalScope].
- static `SharedWorkerGlobalScope get instance`
- `String? get name`
- `Stream<Event> get onConnect`:
  Stream of `connect` events handled by this [SharedWorkerGlobalScope].
- `void close()`
- `_DOMFileSystemSync requestFileSystemSync(int type, int size)`
- `_EntrySync resolveLocalFileSystemSyncUrl(String url)`

## Class: SlotElement

```dart
class SlotElement extends HtmlElement { … }
```

- `String? get name`
- `set name=(String? value)`
- `List<Node> assignedNodes([Map<dynamic, dynamic>? options])`

## Class: SourceBuffer

```dart
class SourceBuffer extends EventTarget { … }
```

- static `EventStreamProvider<Event> abortEvent`
- static `EventStreamProvider<Event> errorEvent`
- `num? get appendWindowEnd`
- `set appendWindowEnd=(num? value)`
- `num? get appendWindowStart`
- `set appendWindowStart=(num? value)`
- `AudioTrackList? get audioTracks`
- `TimeRanges? get buffered`
- `String? get mode`
- `set mode=(String? value)`
- `Stream<Event> get onAbort`
- `Stream<Event> get onError`
- `num? get timestampOffset`
- `set timestampOffset=(num? value)`
- `TrackDefaultList? get trackDefaults`
- `set trackDefaults=(TrackDefaultList? value)`
- `bool? get updating`
- `VideoTrackList? get videoTracks`
- `void abort()`
- `void appendBuffer(ByteBuffer data)`
- `void appendTypedData(TypedData data)`
- `void remove(num start, num end)`

## Class: SourceBufferList

```dart
class SourceBufferList
    extends EventTarget
    with ListBase<SourceBuffer>, ImmutableListMixin<SourceBuffer>
    implements List<SourceBuffer>, JavaScriptIndexingBehavior<SourceBuffer> { … }
```

- `SourceBuffer get first`: The first element.
- `SourceBuffer get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `SourceBuffer get single`:
  Checks that this iterable has only one element, and returns that element.
- `SourceBuffer operator[](int index)`:
  The object at the given [index] in the list.
- `void operator[]=(int index, SourceBuffer value)`:
  Sets the value at the given [index] in the list to [value].
- `SourceBuffer elementAt(int index)`: Returns the [index]th element.
- `SourceBuffer item(int index)`

## Class: SourceElement

```dart
class SourceElement extends HtmlElement { … }
```

- `SourceElement()`
- `String get media`
- `set media=(String value)`
- `String? get sizes`
- `set sizes=(String? value)`
- `String get src`
- `set src=(String value)`
- `String? get srcset`
- `set srcset=(String? value)`
- `String get type`
- `set type=(String value)`

## Class: SpanElement

```dart
class SpanElement extends HtmlElement { … }
```

- `SpanElement()`

## Class: SpeechGrammar

```dart
class SpeechGrammar extends JavaScriptObject { … }
```

- `SpeechGrammar()`
- `String? get src`
- `set src=(String? value)`
- `num? get weight`
- `set weight=(num? value)`

## Class: SpeechGrammarList

```dart
class SpeechGrammarList
    extends JavaScriptObject
    with ListBase<SpeechGrammar>, ImmutableListMixin<SpeechGrammar>
    implements List<SpeechGrammar>, JavaScriptIndexingBehavior<SpeechGrammar> { … }
```

- `SpeechGrammarList()`
- `SpeechGrammar get first`: The first element.
- `SpeechGrammar get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `SpeechGrammar get single`:
  Checks that this iterable has only one element, and returns that element.
- `SpeechGrammar operator[](int index)`:
  The object at the given [index] in the list.
- `void operator[]=(int index, SpeechGrammar value)`:
  Sets the value at the given [index] in the list to [value].
- `void addFromString(String string, [num? weight])`
- `void addFromUri(String src, [num? weight])`
- `SpeechGrammar elementAt(int index)`: Returns the [index]th element.
- `SpeechGrammar item(int index)`

## Class: SpeechRecognition

```dart
class SpeechRecognition extends EventTarget { … }
```

- `SpeechRecognition()`
- static `EventStreamProvider<Event> audioEndEvent`:
  Static factory designed to expose `audioend` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> audioStartEvent`:
  Static factory designed to expose `audiostart` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> endEvent`:
  Static factory designed to expose `end` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<SpeechRecognitionError> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<SpeechRecognitionEvent> noMatchEvent`:
  Static factory designed to expose `nomatch` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<SpeechRecognitionEvent> resultEvent`:
  Static factory designed to expose `result` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> soundEndEvent`:
  Static factory designed to expose `soundend` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> soundStartEvent`:
  Static factory designed to expose `soundstart` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> speechEndEvent`:
  Static factory designed to expose `speechend` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> speechStartEvent`:
  Static factory designed to expose `speechstart` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- static `EventStreamProvider<Event> startEvent`:
  Static factory designed to expose `start` events to event
  handlers that are not necessarily instances of [SpeechRecognition].
- `set audioTrack=(MediaStreamTrack? value)`
- `MediaStreamTrack? get audioTrack`
- `bool? get continuous`
- `set continuous=(bool? value)`
- `SpeechGrammarList? get grammars`
- `set grammars=(SpeechGrammarList? value)`
- `bool? get interimResults`
- `set interimResults=(bool? value)`
- `String? get lang`
- `set lang=(String? value)`
- `int? get maxAlternatives`
- `set maxAlternatives=(int? value)`
- `Stream<Event> get onAudioEnd`:
  Stream of `audioend` events handled by this [SpeechRecognition].
- `Stream<Event> get onAudioStart`:
  Stream of `audiostart` events handled by this [SpeechRecognition].
- `Stream<Event> get onEnd`:
  Stream of `end` events handled by this [SpeechRecognition].
- `Stream<SpeechRecognitionError> get onError`:
  Stream of `error` events handled by this [SpeechRecognition].
- `Stream<SpeechRecognitionEvent> get onNoMatch`:
  Stream of `nomatch` events handled by this [SpeechRecognition].
- `Stream<SpeechRecognitionEvent> get onResult`:
  Stream of `result` events handled by this [SpeechRecognition].
- `Stream<Event> get onSoundEnd`:
  Stream of `soundend` events handled by this [SpeechRecognition].
- `Stream<Event> get onSoundStart`:
  Stream of `soundstart` events handled by this [SpeechRecognition].
- `Stream<Event> get onSpeechEnd`:
  Stream of `speechend` events handled by this [SpeechRecognition].
- `Stream<Event> get onSpeechStart`:
  Stream of `speechstart` events handled by this [SpeechRecognition].
- `Stream<Event> get onStart`:
  Stream of `start` events handled by this [SpeechRecognition].
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void abort()`
- `void start()`
- `void stop()`

## Class: SpeechRecognitionAlternative

```dart
class SpeechRecognitionAlternative extends JavaScriptObject { … }
```

- `num? get confidence`
- `String? get transcript`

## Class: SpeechRecognitionError

```dart
class SpeechRecognitionError extends Event { … }
```

- `SpeechRecognitionError(String type, [Map<dynamic, dynamic>? initDict])`
- `String? get error`
- `String? get message`

## Class: SpeechRecognitionEvent

```dart
class SpeechRecognitionEvent extends Event { … }
```

- `SpeechRecognitionEvent(String type, [Map<dynamic, dynamic>? initDict])`
- `Document? get emma`
- `Document? get interpretation`
- `int? get resultIndex`
- `List<SpeechRecognitionResult>? get results`

## Class: SpeechRecognitionResult

```dart
class SpeechRecognitionResult extends JavaScriptObject { … }
```

- `bool? get isFinal`
- `int? get length`
- `SpeechRecognitionAlternative item(int index)`

## Class: SpeechSynthesis

```dart
class SpeechSynthesis extends EventTarget { … }
```

- `bool? get paused`
- `bool? get pending`
- `bool? get speaking`
- `void cancel()`
- `List<SpeechSynthesisVoice> getVoices()`
- `void pause()`
- `void resume()`
- `void speak(SpeechSynthesisUtterance utterance)`

## Class: SpeechSynthesisEvent

```dart
class SpeechSynthesisEvent extends Event { … }
```

- `int? get charIndex`
- `num? get elapsedTime`
- `String? get name`
- `SpeechSynthesisUtterance? get utterance`

## Class: SpeechSynthesisUtterance

```dart
class SpeechSynthesisUtterance extends EventTarget { … }
```

- `SpeechSynthesisUtterance([String? text])`
- static `EventStreamProvider<SpeechSynthesisEvent> boundaryEvent`:
  Static factory designed to expose `boundary` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- static `EventStreamProvider<SpeechSynthesisEvent> endEvent`:
  Static factory designed to expose `end` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- static `EventStreamProvider<SpeechSynthesisEvent> markEvent`:
  Static factory designed to expose `mark` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- static `EventStreamProvider<Event> pauseEvent`:
  Static factory designed to expose `pause` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- static `EventStreamProvider<SpeechSynthesisEvent> resumeEvent`:
  Static factory designed to expose `resume` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- static `EventStreamProvider<SpeechSynthesisEvent> startEvent`:
  Static factory designed to expose `start` events to event
  handlers that are not necessarily instances of [SpeechSynthesisUtterance].
- `String? get lang`
- `set lang=(String? value)`
- `Stream<SpeechSynthesisEvent> get onBoundary`:
  Stream of `boundary` events handled by this [SpeechSynthesisUtterance].
- `Stream<SpeechSynthesisEvent> get onEnd`:
  Stream of `end` events handled by this [SpeechSynthesisUtterance].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [SpeechSynthesisUtterance].
- `Stream<SpeechSynthesisEvent> get onMark`:
  Stream of `mark` events handled by this [SpeechSynthesisUtterance].
- `Stream<Event> get onPause`:
  Stream of `pause` events handled by this [SpeechSynthesisUtterance].
- `Stream<SpeechSynthesisEvent> get onResume`:
  Stream of `resume` events handled by this [SpeechSynthesisUtterance].
- `Stream<SpeechSynthesisEvent> get onStart`:
  Stream of `start` events handled by this [SpeechSynthesisUtterance].
- `num? get pitch`
- `set pitch=(num? value)`
- `num? get rate`
- `set rate=(num? value)`
- `String? get text`
- `set text=(String? value)`
- `SpeechSynthesisVoice? get voice`
- `set voice=(SpeechSynthesisVoice? value)`
- `num? get volume`
- `set volume=(num? value)`

## Class: SpeechSynthesisVoice

```dart
class SpeechSynthesisVoice extends JavaScriptObject { … }
```

- `bool? get defaultValue`
- `String? get lang`
- `bool? get localService`
- `String? get name`
- `String? get voiceUri`

## Class: StaticRange

```dart
class StaticRange extends JavaScriptObject { … }
```

- `bool? get collapsed`
- `Node? get endContainer`
- `int? get endOffset`
- `Node? get startContainer`
- `int? get startOffset`

## Class: Storage

The type used by the
[Window.localStorage] and [Window.sessionStorage] properties.
Storage is implemented as a Map&lt;String, String>.

```dart
class Storage extends JavaScriptObject with MapBase<String, String> { … }
```

- `bool get isEmpty`: Whether there is no key/value pair in the map.
- `bool get isNotEmpty`: Whether there is at least one key/value pair in the map.
- `Iterable<String> get keys`: The keys of this [Map].
- `int get length`: The number of key/value pairs in the map.
- `Iterable<String> get values`: The values of this [Map].
- `String? operator[](Object? key)`:
  The value for the given [key], or `null` if [key] is not in the map.
- `void operator[]=(String key, String value)`:
  Associates the [key] with the given [value].
- `void addAll(Map<String, String> other)`:
  Adds all key/value pairs of [other] to this map.
- `void clear()`: Removes all entries from the map.
- `bool containsKey(Object? key)`: Whether this map contains the given [key].
- `bool containsValue(Object? value)`:
  Whether this map contains the given [value].
- `void forEach(void Function(String, String) f)`:
  Applies [action] to each key/value pair of the map.
- `String putIfAbsent(String key, String Function() ifAbsent)`:
  Look up the value of [key], or add a new entry if it isn't there.
- `String? remove(Object? key)`:
  Removes [key] and its associated value, if present, from the map.

## Class: StorageEvent

```dart
class StorageEvent extends Event { … }
```

- `StorageEvent(String type, {bool canBubble, bool cancelable, String? key, String? oldValue, String? newValue, String? url, Storage? storageArea})`
- `String? get key`
- `String? get newValue`
- `String? get oldValue`
- `Storage? get storageArea`
- `String? get url`

## Class: StorageManager

```dart
class StorageManager extends JavaScriptObject { … }
```

- `Future<Map<String, dynamic>?> estimate()`
- `Future<bool> persist()`
- `Future<bool> persisted()`

## Class: StyleElement

```dart
class StyleElement extends HtmlElement { … }
```

- `StyleElement()`
- `bool get disabled`
- `set disabled=(bool value)`
- `String get media`
- `set media=(String value)`
- `StyleSheet? get sheet`
- `String? get type`
- `set type=(String? value)`

## Class: StyleMedia

```dart
class StyleMedia extends JavaScriptObject { … }
```

- `String? get type`
- `bool matchMedium(String? mediaquery)`

## Class: StylePropertyMap

```dart
class StylePropertyMap extends StylePropertyMapReadonly { … }
```

- `void append(String property, Object value)`
- `void delete(String property)`
- `void set(String property, Object value)`

## Class: StylePropertyMapReadonly

```dart
class StylePropertyMapReadonly extends JavaScriptObject { … }
```

- `CssStyleValue? get(String property)`
- `List<CssStyleValue> getAll(String property)`
- `List<String> getProperties()`
- `bool has(String property)`

## Class: StyleSheet

```dart
class StyleSheet extends JavaScriptObject { … }
```

- `bool? get disabled`
- `set disabled=(bool? value)`
- `String? get href`
- `MediaList? get media`
- `Node? get ownerNode`
- `StyleSheet? get parentStyleSheet`
- `String? get title`
- `String? get type`

## Class: SubmitButtonInputElement

A button, which when clicked, submits the form.

```dart
abstract class SubmitButtonInputElement implements InputElementBase { … }
```

- `SubmitButtonInputElement()`
- `String get formAction`
- `set formAction=(String value)`
- `String get formEnctype`
- `set formEnctype=(String value)`
- `String get formMethod`
- `set formMethod=(String value)`
- `bool get formNoValidate`
- `set formNoValidate=(bool value)`
- `String get formTarget`
- `set formTarget=(String value)`

## Class: SyncEvent

```dart
class SyncEvent extends ExtendableEvent { … }
```

- `SyncEvent(String type, Map<dynamic, dynamic> init)`
- `bool? get lastChance`
- `String? get tag`

## Class: SyncManager

```dart
class SyncManager extends JavaScriptObject { … }
```

- `Future<List<dynamic>> getTags()`
- `Future<dynamic> register(String tag)`

## Class: TableCaptionElement

```dart
class TableCaptionElement extends HtmlElement { … }
```

- `TableCaptionElement()`

## Class: TableCellElement

```dart
class TableCellElement extends HtmlElement { … }
```

- `TableCellElement()`
- `int get cellIndex`
- `int get colSpan`
- `set colSpan=(int value)`
- `String get headers`
- `set headers=(String? value)`
- `int get rowSpan`
- `set rowSpan=(int value)`

## Class: TableColElement

```dart
class TableColElement extends HtmlElement { … }
```

- `TableColElement()`
- `int get span`
- `set span=(int value)`

## Class: TableElement

```dart
class TableElement extends HtmlElement { … }
```

- `TableElement()`
- `TableCaptionElement? get caption`
- `set caption=(TableCaptionElement? value)`
- `List<TableRowElement> get rows`
- `List<TableSectionElement> get tBodies`
- `TableSectionElement? get tFoot`
- `set tFoot=(TableSectionElement? value)`
- `TableSectionElement? get tHead`
- `set tHead=(TableSectionElement? value)`
- `TableRowElement addRow()`
- `TableCaptionElement createCaption()`
- `DocumentFragment createFragment(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Create a DocumentFragment from the HTML fragment and ensure that it follows
  the sanitization rules specified by the validator or treeSanitizer.
- `TableSectionElement createTBody()`
- `TableSectionElement createTFoot()`
- `TableSectionElement createTHead()`
- `void deleteCaption()`
- `void deleteRow(int index)`
- `void deleteTFoot()`
- `void deleteTHead()`
- `TableRowElement insertRow(int index)`

## Class: TableRowElement

```dart
class TableRowElement extends HtmlElement { … }
```

- `TableRowElement()`
- `List<TableCellElement> get cells`
- `int get rowIndex`
- `int get sectionRowIndex`
- `TableCellElement addCell()`
- `DocumentFragment createFragment(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Create a DocumentFragment from the HTML fragment and ensure that it follows
  the sanitization rules specified by the validator or treeSanitizer.
- `void deleteCell(int index)`
- `TableCellElement insertCell(int index)`

## Class: TableSectionElement

```dart
class TableSectionElement extends HtmlElement { … }
```

- `List<TableRowElement> get rows`
- `TableRowElement addRow()`
- `DocumentFragment createFragment(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  Create a DocumentFragment from the HTML fragment and ensure that it follows
  the sanitization rules specified by the validator or treeSanitizer.
- `void deleteRow(int index)`
- `TableRowElement insertRow(int index)`

## Class: TaskAttributionTiming

```dart
class TaskAttributionTiming extends PerformanceEntry { … }
```

- `String? get containerId`
- `String? get containerName`
- `String? get containerSrc`
- `String? get containerType`
- `String? get scriptUrl`

## Class: TelephoneInputElement

Represents a control for editing a telephone number.

```dart
abstract class TelephoneInputElement implements TextInputElementBase { … }
```

- `TelephoneInputElement()`
- `Element? get list`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: TemplateElement

```dart
class TemplateElement extends HtmlElement { … }
```

- `TemplateElement()`
- `DocumentFragment? get content`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void setInnerHtml(String? html, {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer})`:
  An override to place the contents into content rather than as child nodes.

## Class: Text

```dart
class Text extends CharacterData { … }
```

- `Text(String data)`
- `SlotElement? get assignedSlot`
- `String get wholeText`
- `List<Node> getDestinationInsertionPoints()`
- `Text splitText(int offset)`

## Class: TextAreaElement

```dart
class TextAreaElement extends HtmlElement { … }
```

- `TextAreaElement()`
- `String? get autocapitalize`
- `set autocapitalize=(String? value)`
- `bool get autofocus`
- `set autofocus=(bool value)`
- `int get cols`
- `set cols=(int value)`
- `String? get defaultValue`
- `set defaultValue=(String? value)`
- `String? get dirName`
- `set dirName=(String? value)`
- `bool get disabled`
- `set disabled=(bool value)`
- `FormElement? get form`
- `List<Node>? get labels`
- `set maxLength=(int value)`
- `int get maxLength`
- `int get minLength`
- `set minLength=(int value)`
- `String get name`
- `set name=(String value)`
- `String get placeholder`
- `set placeholder=(String value)`
- `bool get readOnly`
- `set readOnly=(bool value)`
- `bool get required`
- `set required=(bool value)`
- `int get rows`
- `set rows=(int value)`
- `set selectionDirection=(String? value)`
- `String? get selectionDirection`
- `int? get selectionEnd`
- `set selectionEnd=(int? value)`
- `int? get selectionStart`
- `set selectionStart=(int? value)`
- `int? get textLength`
- `String? get type`
- `String? get validationMessage`
- `ValidityState? get validity`
- `String? get value`
- `set value=(String? value)`
- `bool? get willValidate`
- `String get wrap`
- `set wrap=(String value)`
- `bool checkValidity()`
- `bool reportValidity()`
- `void select()`
- `void setCustomValidity(String error)`
- `void setRangeText(String replacement, {int? start, int? end, String? selectionMode})`
- `void setSelectionRange(int start, int end, [String? direction])`

## Class: TextDetector

```dart
class TextDetector extends JavaScriptObject { … }
```

- `TextDetector()`
- `Future<List<dynamic>> detect(dynamic image)`

## Class: TextEvent

```dart
class TextEvent extends UIEvent { … }
```

- `TextEvent(String type, {bool canBubble, bool cancelable, Window? view, String? data})`
- `String? get data`

## Class: TextInputElement

A basic text input editor control.

```dart
abstract class TextInputElement implements TextInputElementBase { … }
```

- `TextInputElement()`
- `String? get dirName`
- `set dirName=(String? value)`
- `Element? get list`

## Class: TextInputElementBase

Base interface for all inputs which involve text editing.

```dart
abstract class TextInputElementBase implements InputElementBase { … }
```

- `String get autocomplete`
- `set autocomplete=(String value)`
- `int? get maxLength`
- `set maxLength=(int? value)`
- `String get pattern`
- `set pattern=(String value)`
- `String get placeholder`
- `set placeholder=(String value)`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- `String? get selectionDirection`
- `set selectionDirection=(String? value)`
- `int? get selectionEnd`
- `set selectionEnd=(int? value)`
- `int? get selectionStart`
- `set selectionStart=(int? value)`
- `int? get size`
- `set size=(int? value)`
- `void select()`
- `void setSelectionRange(int start, int end, [String? direction])`

## Class: TextMetrics

```dart
class TextMetrics extends JavaScriptObject { … }
```

- `num? get actualBoundingBoxAscent`
- `num? get actualBoundingBoxDescent`
- `num? get actualBoundingBoxLeft`
- `num? get actualBoundingBoxRight`
- `num? get alphabeticBaseline`
- `num? get emHeightAscent`
- `num? get emHeightDescent`
- `num? get fontBoundingBoxAscent`
- `num? get fontBoundingBoxDescent`
- `num? get hangingBaseline`
- `num? get ideographicBaseline`
- `num? get width`

## Class: TextTrack

```dart
class TextTrack extends EventTarget { … }
```

- static `EventStreamProvider<Event> cueChangeEvent`:
  Static factory designed to expose `cuechange` events to event
  handlers that are not necessarily instances of [TextTrack].
- `TextTrackCueList? get activeCues`
- `TextTrackCueList? get cues`
- `String get id`
- `String get kind`
- `String get label`
- `String get language`
- `String? get mode`
- `set mode=(String? value)`
- `Stream<Event> get onCueChange`:
  Stream of `cuechange` events handled by this [TextTrack].
- `void addCue(TextTrackCue cue)`
- `void removeCue(TextTrackCue cue)`

## Class: TextTrackCue

```dart
class TextTrackCue extends EventTarget { … }
```

- static `EventStreamProvider<Event> enterEvent`:
  Static factory designed to expose `enter` events to event
  handlers that are not necessarily instances of [TextTrackCue].
- static `EventStreamProvider<Event> exitEvent`:
  Static factory designed to expose `exit` events to event
  handlers that are not necessarily instances of [TextTrackCue].
- `num? get endTime`
- `set endTime=(num? value)`
- `String? get id`
- `set id=(String? value)`
- `Stream<Event> get onEnter`:
  Stream of `enter` events handled by this [TextTrackCue].
- `Stream<Event> get onExit`:
  Stream of `exit` events handled by this [TextTrackCue].
- `bool? get pauseOnExit`
- `set pauseOnExit=(bool? value)`
- `num? get startTime`
- `set startTime=(num? value)`
- `TextTrack? get track`

## Class: TextTrackCueList

```dart
class TextTrackCueList
    extends JavaScriptObject
    with ListBase<TextTrackCue>, ImmutableListMixin<TextTrackCue>
    implements List<TextTrackCue>, JavaScriptIndexingBehavior<TextTrackCue> { … }
```

- `TextTrackCue get first`: The first element.
- `TextTrackCue get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `TextTrackCue get single`:
  Checks that this iterable has only one element, and returns that element.
- `TextTrackCue operator[](int index)`:
  The object at the given [index] in the list.
- `void operator[]=(int index, TextTrackCue value)`:
  Sets the value at the given [index] in the list to [value].
- `TextTrackCue elementAt(int index)`: Returns the [index]th element.
- `TextTrackCue? getCueById(String id)`

## Class: TextTrackList

```dart
class TextTrackList
    extends EventTarget
    with ListBase<TextTrack>, ImmutableListMixin<TextTrack>
    implements List<TextTrack>, JavaScriptIndexingBehavior<TextTrack> { … }
```

- static `EventStreamProvider<TrackEvent> addTrackEvent`:
  Static factory designed to expose `addtrack` events to event
  handlers that are not necessarily instances of [TextTrackList].
- static `EventStreamProvider<Event> changeEvent`
- `TextTrack get first`: The first element.
- `TextTrack get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `Stream<TrackEvent> get onAddTrack`:
  Stream of `addtrack` events handled by this [TextTrackList].
- `Stream<Event> get onChange`
- `TextTrack get single`:
  Checks that this iterable has only one element, and returns that element.
- `TextTrack operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, TextTrack value)`:
  Sets the value at the given [index] in the list to [value].
- `TextTrack elementAt(int index)`: Returns the [index]th element.
- `TextTrack? getTrackById(String id)`

## Class: TimeElement

```dart
class TimeElement extends HtmlElement { … }
```

- `String? get dateTime`
- `set dateTime=(String? value)`

## Class: TimeInputElement

A time (hour, minute, seconds, fractional seconds) with no time zone.

```dart
abstract class TimeInputElement implements RangeInputElementBase { … }
```

- `TimeInputElement()`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.
- `DateTime get valueAsDate`
- `set valueAsDate=(DateTime value)`

## Class: TimeRanges

```dart
class TimeRanges extends JavaScriptObject { … }
```

- `int get length`
- `double end(int index)`
- `double start(int index)`

## Class: TitleElement

```dart
class TitleElement extends HtmlElement { … }
```

- `TitleElement()`

## Class: Touch

```dart
class Touch extends JavaScriptObject { … }
```

- `Touch(Map<dynamic, dynamic> initDict)`
- `Point<num> get client`
- `num? get force`
- `int? get identifier`
- `Point<num> get page`
- `int get radiusX`
- `int get radiusY`
- `String? get region`
- `num? get rotationAngle`
- `Point<num> get screen`
- `EventTarget? get target`

## Class: TouchEvent

```dart
class TouchEvent extends UIEvent { … }
```

- `TouchEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `bool? get altKey`
- `TouchList? get changedTouches`
- `bool? get ctrlKey`
- `bool? get metaKey`
- `bool? get shiftKey`
- static `bool get supported`:
  Checks if touch events supported on the current platform.
- `TouchList? get targetTouches`
- `TouchList? get touches`

## Class: TouchList

```dart
class TouchList
    extends JavaScriptObject
    with ListBase<Touch>, ImmutableListMixin<Touch>
    implements List<Touch>, JavaScriptIndexingBehavior<Touch> { … }
```

- `Touch get first`: The first element.
- `Touch get last`: The last element.
- `int get length`: The number of objects in this list.
- `set length=(int newLength)`
- `Touch get single`:
  Checks that this iterable has only one element, and returns that element.
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `Touch operator[](int index)`: The object at the given [index] in the list.
- `void operator[]=(int index, Touch value)`:
  Sets the value at the given [index] in the list to [value].
- `Touch elementAt(int index)`: Returns the [index]th element.
- `Touch? item(int index)`

## Class: TrackDefault

```dart
class TrackDefault extends JavaScriptObject { … }
```

- `TrackDefault(String type, String language, String label, List<String> kinds, [String? byteStreamTrackID])`
- `String? get byteStreamTrackID`
- `Object? get kinds`
- `String? get label`
- `String? get language`
- `String? get type`

## Class: TrackDefaultList

```dart
class TrackDefaultList extends JavaScriptObject { … }
```

- `TrackDefaultList([List<TrackDefault>? trackDefaults])`
- `int? get length`
- `TrackDefault item(int index)`

## Class: TrackElement

```dart
class TrackElement extends HtmlElement { … }
```

- `TrackElement()`
- static `int ERROR`
- static `int LOADED`
- static `int LOADING`
- static `int NONE`
- `bool? get defaultValue`
- `set defaultValue=(bool? value)`
- `String? get kind`
- `set kind=(String? value)`
- `String? get label`
- `set label=(String? value)`
- `int? get readyState`
- `String? get src`
- `set src=(String? value)`
- `String? get srclang`
- `set srclang=(String? value)`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `TextTrack? get track`

## Class: TrackEvent

```dart
class TrackEvent extends Event { … }
```

- `TrackEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `Object? get track`

## Class: TransitionEvent

```dart
class TransitionEvent extends Event { … }
```

- `TransitionEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `num? get elapsedTime`
- `String? get propertyName`
- `String? get pseudoElement`

## Class: TreeWalker

```dart
class TreeWalker extends JavaScriptObject { … }
```

- `TreeWalker(Node root, int whatToShow)`
- `Node get currentNode`
- `set currentNode=(Node value)`
- `NodeFilter? get filter`
- `Node get root`
- `int get whatToShow`
- `Node? firstChild()`
- `Node? lastChild()`
- `Node? nextNode()`
- `Node? nextSibling()`
- `Node? parentNode()`
- `Node? previousNode()`
- `Node? previousSibling()`

## Class: TrustedHtml

```dart
class TrustedHtml extends JavaScriptObject { … }
```

- static `TrustedHtml escape(String html)`
- static `TrustedHtml unsafelyCreate(String html)`

## Class: TrustedScriptUrl

```dart
class TrustedScriptUrl extends JavaScriptObject { … }
```

- static `TrustedScriptUrl unsafelyCreate(String url)`

## Class: TrustedUrl

```dart
class TrustedUrl extends JavaScriptObject { … }
```

- static `TrustedUrl create(String url)`
- static `TrustedUrl unsafelyCreate(String url)`

## Class: UIEvent

```dart
class UIEvent extends Event { … }
```

- `UIEvent(String type, {Window? view, int detail, bool canBubble, bool cancelable})`
- `int? get detail`
- `InputDeviceCapabilities? get sourceCapabilities`
- `WindowBase? get view`

## Class: UListElement

```dart
class UListElement extends HtmlElement { … }
```

- `UListElement()`

## Class: UnderlyingSourceBase

```dart
class UnderlyingSourceBase extends JavaScriptObject { … }
```

- `Future<dynamic> cancel(Object? reason)`
- `void notifyLockAcquired()`
- `void notifyLockReleased()`
- `Future<dynamic> pull()`
- `Future<dynamic> start(Object stream)`

## Class: UnknownElement

```dart
class UnknownElement extends HtmlElement { … }
```

## Class: UriPolicy

Defines the policy for what types of uris are allowed for particular
attribute values.

```dart
abstract class UriPolicy { … }
```

- `UriPolicy()`:
  Constructs the default UriPolicy which is to only allow Uris to the same
  origin as the application was launched from.
- `bool allowsUri(String uri)`:
  Checks if the uri is allowed on the specified attribute.

## Class: Url

```dart
class Url extends JavaScriptObject { … }
```

- static `String createObjectUrl(dynamic blob_OR_source_OR_stream)`
- static `String createObjectUrlFromBlob(Blob blob)`
- static `String createObjectUrlFromSource(MediaSource source)`
- static `String createObjectUrlFromStream(MediaStream stream)`
- static `void revokeObjectUrl(String url)`
- `String? get hash`
- `set hash=(String? value)`
- `String? get host`
- `set host=(String? value)`
- `String? get hostname`
- `set hostname=(String? value)`
- `String? get href`
- `set href=(String? value)`
- `String? get origin`
- `String? get password`
- `set password=(String? value)`
- `String? get pathname`
- `set pathname=(String? value)`
- `String? get port`
- `set port=(String? value)`
- `String? get protocol`
- `set protocol=(String? value)`
- `String? get search`
- `set search=(String? value)`
- `UrlSearchParams? get searchParams`
- `String? get username`
- `set username=(String? value)`
- `String toString()`: A string representation of this object.

## Class: UrlInputElement

A control for editing an absolute URL.

```dart
abstract class UrlInputElement implements TextInputElementBase { … }
```

- `UrlInputElement()`
- `Element? get list`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.

## Class: UrlSearchParams

```dart
class UrlSearchParams extends JavaScriptObject { … }
```

- `UrlSearchParams([Object? init])`
- `void append(String name, String value)`
- `void delete(String name)`
- `String? get(String name)`
- `List<String> getAll(String name)`
- `bool has(String name)`
- `void set(String name, String value)`
- `void sort()`

## Class: UrlUtilsReadOnly

```dart
abstract class UrlUtilsReadOnly extends JavaScriptObject { … }
```

- `String? get hash`
- `String? get host`
- `String? get hostname`
- `String? get href`
- `String? get origin`
- `String? get pathname`
- `String? get port`
- `String? get protocol`
- `String? get search`

## Class: VR

```dart
class VR extends EventTarget { … }
```

- `Future<dynamic> getDevices()`

## Class: VRCoordinateSystem

```dart
class VRCoordinateSystem extends JavaScriptObject { … }
```

- `Float32List? getTransformTo(VRCoordinateSystem other)`

## Class: VRDevice

```dart
class VRDevice extends EventTarget { … }
```

- `String? get deviceName`
- `bool? get isExternal`
- `Future<dynamic> requestSession([Map<dynamic, dynamic>? options])`
- `Future<dynamic> supportsSession([Map<dynamic, dynamic>? options])`

## Class: VRDeviceEvent

```dart
class VRDeviceEvent extends Event { … }
```

- `VRDeviceEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `VRDevice? get device`

## Class: VRDisplay

```dart
class VRDisplay extends EventTarget { … }
```

- `VRDisplayCapabilities? get capabilities`
- `num? get depthFar`
- `set depthFar=(num? value)`
- `num? get depthNear`
- `set depthNear=(num? value)`
- `int? get displayId`
- `String? get displayName`
- `bool? get isPresenting`
- `VRStageParameters? get stageParameters`
- `void cancelAnimationFrame(int handle)`
- `Future<dynamic> exitPresent()`
- `VREyeParameters getEyeParameters(String whichEye)`
- `bool getFrameData(VRFrameData frameData)`
- `List<Map<dynamic, dynamic>> getLayers()`
- `int requestAnimationFrame(void Function(num) callback)`
- `Future<dynamic> requestPresent(List<Map<dynamic, dynamic>> layers)`
- `void submitFrame()`

## Class: VRDisplayCapabilities

```dart
class VRDisplayCapabilities extends JavaScriptObject { … }
```

- `bool? get canPresent`
- `bool? get hasExternalDisplay`
- `bool? get hasPosition`
- `int? get maxLayers`

## Class: VRDisplayEvent

```dart
class VRDisplayEvent extends Event { … }
```

- `VRDisplayEvent(String type, [Map<dynamic, dynamic>? eventInitDict])`
- `VRDisplay? get display`
- `String? get reason`

## Class: VREyeParameters

```dart
class VREyeParameters extends JavaScriptObject { … }
```

- `Float32List? get offset`
- `int? get renderHeight`
- `int? get renderWidth`

## Class: VRFrameData

```dart
class VRFrameData extends JavaScriptObject { … }
```

- `VRFrameData()`
- `Float32List? get leftProjectionMatrix`
- `Float32List? get leftViewMatrix`
- `VRPose? get pose`
- `Float32List? get rightProjectionMatrix`
- `Float32List? get rightViewMatrix`

## Class: VRFrameOfReference

```dart
class VRFrameOfReference extends VRCoordinateSystem { … }
```

- `VRStageBounds? get bounds`
- `num? get emulatedHeight`

## Class: VRPose

```dart
class VRPose extends JavaScriptObject { … }
```

- `Float32List? get angularAcceleration`
- `Float32List? get angularVelocity`
- `Float32List? get linearAcceleration`
- `Float32List? get linearVelocity`
- `Float32List? get orientation`
- `Float32List? get position`

## Class: VRSession

```dart
class VRSession extends EventTarget { … }
```

- static `EventStreamProvider<Event> blurEvent`
- static `EventStreamProvider<Event> focusEvent`
- `num? get depthFar`
- `set depthFar=(num? value)`
- `num? get depthNear`
- `set depthNear=(num? value)`
- `VRDevice? get device`
- `bool? get exclusive`
- `Stream<Event> get onBlur`
- `Stream<Event> get onFocus`
- `Future<dynamic> end()`
- `Future<dynamic> requestFrameOfReference(String type, [Map<dynamic, dynamic>? options])`

## Class: VRSessionEvent

```dart
class VRSessionEvent extends Event { … }
```

- `VRSessionEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `VRSession? get session`

## Class: VRStageBounds

```dart
class VRStageBounds extends JavaScriptObject { … }
```

- `List<VRStageBoundsPoint>? get geometry`

## Class: VRStageBoundsPoint

```dart
class VRStageBoundsPoint extends JavaScriptObject { … }
```

- `num? get x`
- `num? get z`

## Class: VRStageParameters

```dart
class VRStageParameters extends JavaScriptObject { … }
```

- `Float32List? get sittingToStandingTransform`
- `num? get sizeX`
- `num? get sizeZ`

## Class: ValidityState

```dart
class ValidityState extends JavaScriptObject { … }
```

- `bool? get badInput`
- `bool? get customError`
- `bool? get patternMismatch`
- `bool? get rangeOverflow`
- `bool? get rangeUnderflow`
- `bool? get stepMismatch`
- `bool? get tooLong`
- `bool? get tooShort`
- `bool? get typeMismatch`
- `bool? get valid`
- `bool? get valueMissing`

## Class: VideoElement

```dart
class VideoElement extends MediaElement implements CanvasImageSource { … }
```

- `VideoElement()`
- `int? get decodedFrameCount`
- `int? get droppedFrameCount`
- `int get height`
- `set height=(int value)`
- `String get poster`
- `set poster=(String value)`
- `int get videoHeight`
- `int get videoWidth`
- `int get width`
- `set width=(int value)`
- `void enterFullscreen()`
- `void exitFullscreen()`
- `VideoPlaybackQuality getVideoPlaybackQuality()`

## Class: VideoPlaybackQuality

```dart
class VideoPlaybackQuality extends JavaScriptObject { … }
```

- `int? get corruptedVideoFrames`
- `num? get creationTime`
- `int? get droppedVideoFrames`
- `int? get totalVideoFrames`

## Class: VideoTrack

```dart
class VideoTrack extends JavaScriptObject { … }
```

- `String? get id`
- `String? get kind`
- `String? get label`
- `String? get language`
- `bool? get selected`
- `set selected=(bool? value)`
- `SourceBuffer? get sourceBuffer`

## Class: VideoTrackList

```dart
class VideoTrackList extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `int? get length`
- `Stream<Event> get onChange`
- `int? get selectedIndex`
- `VideoTrack? getTrackById(String id)`

## Class: VisualViewport

```dart
class VisualViewport extends EventTarget { … }
```

- static `EventStreamProvider<Event> resizeEvent`
- static `EventStreamProvider<Event> scrollEvent`
- `num? get height`
- `num? get offsetLeft`
- `num? get offsetTop`
- `Stream<Event> get onResize`
- `Stream<Event> get onScroll`
- `num? get pageLeft`
- `num? get pageTop`
- `num? get scale`
- `num? get width`

## Class: VttCue

```dart
class VttCue extends TextTrackCue { … }
```

- `VttCue(num startTime, num endTime, String text)`
- `String? get align`
- `set align=(String? value)`
- `Object? get line`
- `set line=(Object? value)`
- `Object? get position`
- `set position=(Object? value)`
- `VttRegion? get region`
- `set region=(VttRegion? value)`
- `num? get size`
- `set size=(num? value)`
- `bool? get snapToLines`
- `set snapToLines=(bool? value)`
- `String? get text`
- `set text=(String? value)`
- `String? get vertical`
- `set vertical=(String? value)`
- `DocumentFragment getCueAsHtml()`

## Class: VttRegion

```dart
class VttRegion extends JavaScriptObject { … }
```

- `VttRegion()`
- `String? get id`
- `set id=(String? value)`
- `int? get lines`
- `set lines=(int? value)`
- `num? get regionAnchorX`
- `set regionAnchorX=(num? value)`
- `num? get regionAnchorY`
- `set regionAnchorY=(num? value)`
- `String? get scroll`
- `set scroll=(String? value)`
- `num? get viewportAnchorX`
- `set viewportAnchorX=(num? value)`
- `num? get viewportAnchorY`
- `set viewportAnchorY=(num? value)`
- `num? get width`
- `set width=(num? value)`

## Class: WebSocket

Use the WebSocket interface to connect to a WebSocket,
and to send and receive data on that WebSocket.

```dart
class WebSocket extends EventTarget { … }
```

- `WebSocket(String url, [Object? protocols])`
- static `int CLOSED`
- static `int CLOSING`
- static `int CONNECTING`
- static `int OPEN`
- static `EventStreamProvider<CloseEvent> closeEvent`:
  Static factory designed to expose `close` events to event
  handlers that are not necessarily instances of [WebSocket].
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [WebSocket].
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [WebSocket].
- static `EventStreamProvider<Event> openEvent`:
  Static factory designed to expose `open` events to event
  handlers that are not necessarily instances of [WebSocket].
- `String? get binaryType`
- `set binaryType=(String? value)`
- `int? get bufferedAmount`
- `String? get extensions`
- `Stream<CloseEvent> get onClose`:
  Stream of `close` events handled by this [WebSocket].
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [WebSocket].
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [WebSocket].
- `Stream<Event> get onOpen`: Stream of `open` events handled by this [WebSocket].
- `String? get protocol`
- `int get readyState`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `String? get url`
- `void close([int? code, String? reason])`
- `void send(dynamic data)`: Transmit data to the server over this connection.
- `void sendBlob(Blob data)`: Transmit data to the server over this connection.
- `void sendByteBuffer(ByteBuffer data)`:
  Transmit data to the server over this connection.
- `void sendString(String data)`:
  Transmit data to the server over this connection.
- `void sendTypedData(TypedData data)`:
  Transmit data to the server over this connection.

## Class: WeekInputElement

A date consisting of a week-year number and a week number with no time zone.

```dart
abstract class WeekInputElement implements RangeInputElementBase { … }
```

- `WeekInputElement()`
- `bool? get readOnly`
- `set readOnly=(bool? value)`
- `bool get required`
- `set required=(bool value)`
- static `bool get supported`:
  Returns true if this input type is supported on the current platform.
- `DateTime get valueAsDate`
- `set valueAsDate=(DateTime value)`

## Class: WheelEvent

```dart
class WheelEvent extends MouseEvent { … }
```

- `WheelEvent(String type, {Window? view, num deltaX, num deltaY, num deltaZ, int deltaMode, int detail, int screenX, int screenY, int clientX, int clientY, int button, bool canBubble, bool cancelable, bool ctrlKey, bool altKey, bool shiftKey, bool metaKey, EventTarget? relatedTarget})`
- static `int DOM_DELTA_LINE`
- static `int DOM_DELTA_PAGE`
- static `int DOM_DELTA_PIXEL`
- `int get deltaMode`
- `num get deltaX`:
  The amount that is expected to scroll horizontally, in units determined by
  [deltaMode].
- `num get deltaY`:
  The amount that is expected to scroll vertically, in units determined by
  [deltaMode].
- `num? get deltaZ`

## Class: Window

Top-level container for the current browser tab or window.

```dart
class Window
    extends EventTarget
    implements GlobalEventHandlers, WindowBase64, WindowEventHandlers, _WindowTimers, WindowBase { … }
```

- static `int PERSISTENT`:
  Indicates that file system data cannot be cleared unless given user
  permission.
- static `int TEMPORARY`:
  Indicates that file system data can be cleared at any time.
- static `EventStreamProvider<AnimationEvent> animationEndEvent`:
  Static factory designed to expose `animationend` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<AnimationEvent> animationIterationEvent`:
  Static factory designed to expose `animationiteration` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<AnimationEvent> animationStartEvent`:
  Static factory designed to expose `animationstart` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<BeforeUnloadEvent> beforeUnloadEvent`:
  Static factory designed to expose `beforeunload` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> contentLoadedEvent`:
  Static factory designed to expose `contentloaded` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<DeviceMotionEvent> deviceMotionEvent`:
  Static factory designed to expose `devicemotion` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<DeviceOrientationEvent> deviceOrientationEvent`:
  Static factory designed to expose `deviceorientation` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> hashChangeEvent`:
  Static factory designed to expose `hashchange` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> loadStartEvent`
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> offlineEvent`:
  Static factory designed to expose `offline` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> onlineEvent`:
  Static factory designed to expose `online` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> pageHideEvent`:
  Static factory designed to expose `pagehide` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> pageShowEvent`:
  Static factory designed to expose `pageshow` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<PopStateEvent> popStateEvent`:
  Static factory designed to expose `popstate` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> progressEvent`
- static `EventStreamProvider<StorageEvent> storageEvent`:
  Static factory designed to expose `storage` events to event
  handlers that are not necessarily instances of [Window].
- static `EventStreamProvider<Event> unloadEvent`:
  Static factory designed to expose `unload` events to event
  handlers that are not necessarily instances of [Window].
- `Future<num> get animationFrame`:
  Returns a Future that completes just before the window is about to
  repaint so the user can draw an animation frame.
- `_Worklet? get animationWorklet`
- `ApplicationCache? get applicationCache`: The application cache for this window.
- `_Worklet? get audioWorklet`
- `CacheStorage? get caches`
- `bool? get closed`: Indicates whether this window has been closed.
- `Console get console`: The debugging console for this window.
- `CookieStore? get cookieStore`
- `Crypto? get crypto`: Entrypoint for the browser's cryptographic functions.
- `CustomElementRegistry? get customElements`
- `String? get defaultStatus`: *Deprecated*.
- `set defaultStatus=(String? value)`
- `String? get defaultstatus`: *Deprecated*.
- `set defaultstatus=(String? value)`
- `num get devicePixelRatio`:
  The ratio between physical pixels and logical CSS pixels.
- `Document get document`: The newest document in this window.
- `External? get external`
- `History get history`:
  The current session history for this window's newest document.
- `IdbFactory? get indexedDB`:
  Gets an instance of the Indexed DB factory to being using Indexed DB.
- `int? get innerHeight`: The height of the viewport including scrollbars.
- `int? get innerWidth`: The width of the viewport including scrollbars.
- `bool? get isSecureContext`
- `Storage get localStorage`:
  Storage for this window that persists across sessions.
- `set location=(LocationBase value)`:
  Sets the window's location, which causes the browser to navigate to the new
  location.
- `Location get location`: The current location of this window.
- `BarProp? get locationbar`: This window's location bar, which displays the URL.
- `BarProp? get menubar`: This window's menu bar, which displays menu commands.
- `String? get name`: The name of this window.
- `set name=(String? value)`
- `Navigator get navigator`: The user agent accessing this window.
- `bool? get offscreenBuffering`:
  Whether objects are drawn offscreen before being displayed.
- `Stream<Event> get onAbort`: Stream of `abort` events handled by this [Window].
- `Stream<AnimationEvent> get onAnimationEnd`:
  Stream of `animationend` events handled by this [Window].
- `Stream<AnimationEvent> get onAnimationIteration`:
  Stream of `animationiteration` events handled by this [Window].
- `Stream<AnimationEvent> get onAnimationStart`:
  Stream of `animationstart` events handled by this [Window].
- `Stream<Event> get onBeforeUnload`:
  Stream of `beforeunload` events handled by this [Window].
- `Stream<Event> get onBlur`: Stream of `blur` events handled by this [Window].
- `Stream<Event> get onCanPlay`
- `Stream<Event> get onCanPlayThrough`
- `Stream<Event> get onChange`:
  Stream of `change` events handled by this [Window].
- `Stream<MouseEvent> get onClick`:
  Stream of `click` events handled by this [Window].
- `Stream<Event> get onContentLoaded`:
  Stream of `contentloaded` events handled by this [Window].
- `Stream<MouseEvent> get onContextMenu`:
  Stream of `contextmenu` events handled by this [Window].
- `Stream<DeviceMotionEvent> get onDeviceMotion`:
  Stream of `devicemotion` events handled by this [Window].
- `Stream<DeviceOrientationEvent> get onDeviceOrientation`:
  Stream of `deviceorientation` events handled by this [Window].
- `Stream<Event> get onDoubleClick`:
  Stream of `doubleclick` events handled by this [Window].
- `Stream<MouseEvent> get onDrag`:
  Stream of `drag` events handled by this [Window].
- `Stream<MouseEvent> get onDragEnd`:
  Stream of `dragend` events handled by this [Window].
- `Stream<MouseEvent> get onDragEnter`:
  Stream of `dragenter` events handled by this [Window].
- `Stream<MouseEvent> get onDragLeave`:
  Stream of `dragleave` events handled by this [Window].
- `Stream<MouseEvent> get onDragOver`:
  Stream of `dragover` events handled by this [Window].
- `Stream<MouseEvent> get onDragStart`:
  Stream of `dragstart` events handled by this [Window].
- `Stream<MouseEvent> get onDrop`:
  Stream of `drop` events handled by this [Window].
- `Stream<Event> get onDurationChange`
- `Stream<Event> get onEmptied`
- `Stream<Event> get onEnded`
- `Stream<Event> get onError`: Stream of `error` events handled by this [Window].
- `Stream<Event> get onFocus`: Stream of `focus` events handled by this [Window].
- `Stream<Event> get onHashChange`:
  Stream of `hashchange` events handled by this [Window].
- `Stream<Event> get onInput`: Stream of `input` events handled by this [Window].
- `Stream<Event> get onInvalid`:
  Stream of `invalid` events handled by this [Window].
- `Stream<KeyboardEvent> get onKeyDown`:
  Stream of `keydown` events handled by this [Window].
- `Stream<KeyboardEvent> get onKeyPress`:
  Stream of `keypress` events handled by this [Window].
- `Stream<KeyboardEvent> get onKeyUp`:
  Stream of `keyup` events handled by this [Window].
- `Stream<Event> get onLoad`: Stream of `load` events handled by this [Window].
- `Stream<Event> get onLoadStart`
- `Stream<Event> get onLoadedData`
- `Stream<Event> get onLoadedMetadata`
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [Window].
- `Stream<MouseEvent> get onMouseDown`:
  Stream of `mousedown` events handled by this [Window].
- `Stream<MouseEvent> get onMouseEnter`:
  Stream of `mouseenter` events handled by this [Window].
- `Stream<MouseEvent> get onMouseLeave`:
  Stream of `mouseleave` events handled by this [Window].
- `Stream<MouseEvent> get onMouseMove`:
  Stream of `mousemove` events handled by this [Window].
- `Stream<MouseEvent> get onMouseOut`:
  Stream of `mouseout` events handled by this [Window].
- `Stream<MouseEvent> get onMouseOver`:
  Stream of `mouseover` events handled by this [Window].
- `Stream<MouseEvent> get onMouseUp`:
  Stream of `mouseup` events handled by this [Window].
- `Stream<WheelEvent> get onMouseWheel`:
  Stream of `mousewheel` events handled by this [Window].
- `Stream<Event> get onOffline`:
  Stream of `offline` events handled by this [Window].
- `Stream<Event> get onOnline`:
  Stream of `online` events handled by this [Window].
- `Stream<Event> get onPageHide`:
  Stream of `pagehide` events handled by this [Window].
- `Stream<Event> get onPageShow`:
  Stream of `pageshow` events handled by this [Window].
- `Stream<Event> get onPause`
- `Stream<Event> get onPlay`
- `Stream<Event> get onPlaying`
- `Stream<PopStateEvent> get onPopState`:
  Stream of `popstate` events handled by this [Window].
- `Stream<Event> get onProgress`
- `Stream<Event> get onRateChange`
- `Stream<Event> get onReset`: Stream of `reset` events handled by this [Window].
- `Stream<Event> get onResize`:
  Stream of `resize` events handled by this [Window].
- `Stream<Event> get onScroll`:
  Stream of `scroll` events handled by this [Window].
- `Stream<Event> get onSearch`:
  Stream of `search` events handled by this [Window].
- `Stream<Event> get onSeeked`
- `Stream<Event> get onSeeking`
- `Stream<Event> get onSelect`:
  Stream of `select` events handled by this [Window].
- `Stream<Event> get onStalled`
- `Stream<StorageEvent> get onStorage`:
  Stream of `storage` events handled by this [Window].
- `Stream<Event> get onSubmit`:
  Stream of `submit` events handled by this [Window].
- `Stream<Event> get onSuspend`
- `Stream<Event> get onTimeUpdate`
- `Stream<TouchEvent> get onTouchCancel`:
  Stream of `touchcancel` events handled by this [Window].
- `Stream<TouchEvent> get onTouchEnd`:
  Stream of `touchend` events handled by this [Window].
- `Stream<TouchEvent> get onTouchMove`:
  Stream of `touchmove` events handled by this [Window].
- `Stream<TouchEvent> get onTouchStart`:
  Stream of `touchstart` events handled by this [Window].
- `Stream<TransitionEvent> get onTransitionEnd`:
  Stream of `transitionend` events handled by this [Window].
- `Stream<Event> get onUnload`:
  Stream of `unload` events handled by this [Window].
- `Stream<Event> get onVolumeChange`
- `Stream<Event> get onWaiting`
- `Stream<WheelEvent> get onWheel`:
  Stream of `wheel` events handled by this [Window].
- `WindowBase? get opener`: A reference to the window that opened this one.
- `set opener=(WindowBase? value)`
- `int? get orientation`
- `String? get origin`
- `int get outerHeight`:
  The height of this window including all user interface elements.
- `int get outerWidth`:
  The width of the window including all user interface elements.
- `int get pageXOffset`
- `int get pageYOffset`
- `WindowBase? get parent`: A reference to the parent of this window.
- `Performance get performance`: Timing and navigation data for this window.
- `Screen? get screen`: Information about the screen displaying this window.
- `int? get screenLeft`:
  The distance from the left side of the screen to the left side of this
  window.
- `int? get screenTop`:
  The distance from the top of the screen to the top of this window.
- `int? get screenX`:
  The distance from the left side of the screen to the mouse pointer.
- `int? get screenY`:
  The distance from the top of the screen to the mouse pointer.
- `int get scrollX`: The distance this window has been scrolled horizontally.
- `int get scrollY`: The distance this window has been scrolled vertically.
- `BarProp? get scrollbars`: This window's scroll bars.
- `WindowBase? get self`: The current window.
- `Storage get sessionStorage`:
  Storage for this window that is cleared when this session ends.
- `SpeechSynthesis? get speechSynthesis`:
  Access to speech synthesis in the browser.
- `set status=(String? value)`
- `String? get status`: *Deprecated*.
- `BarProp? get statusbar`: This window's status bar.
- `StyleMedia? get styleMedia`: Access to CSS media queries.
- static `bool get supportsPointConversions`:
  convertPointFromNodeToPage and convertPointFromPageToNode are removed.
  see http://dev.w3.org/csswg/cssom-view/#geometry
- `BarProp? get toolbar`: This window's tool bar.
- `WindowBase? get top`:
  A reference to the topmost window in the window hierarchy.
- `VisualViewport? get visualViewport`
- `WindowBase? get window`: The current window.
- `void alert([String? message])`: Displays a modal alert to the user.
- `String atob(String atob)`
- `String btoa(String btoa)`
- `void cancelAnimationFrame(int id)`: Cancels an animation frame request.
- `void cancelIdleCallback(int handle)`
- `void close()`: Closes the window.
- `bool confirm([String? message])`:
  Displays a modal OK/Cancel prompt to the user.
- `Future<dynamic> fetch(dynamic input, [Map<dynamic, dynamic>? init])`
- `bool find(String? string, bool? caseSensitive, bool? backwards, bool? wrap, bool? wholeWord, bool? searchInFrames, bool? showDialog)`:
  Finds text in this window.
- `StylePropertyMapReadonly getComputedStyleMap(Element element, String? pseudoElement)`
- `List<CssRule> getMatchedCssRules(Element? element, String? pseudoElement)`:
  Returns all CSS rules that apply to the element's pseudo-element.
- `Selection? getSelection()`: Returns the currently selected text.
- `MediaQueryList matchMedia(String query)`:
  Returns a list of media queries for the given query string.
- `void moveBy(int x, int y)`: Moves this window.
- `void moveTo(Point<num> p)`: Moves this window to a specific position.
- `WindowBase open(String url, String name, [String? options])`:
  Opens a new window.
- `void postMessage(dynamic message, String targetOrigin, [List<Object>? transfer])`:
  Sends a cross-origin message.
- `void print()`: Opens the print dialog for this window.
- `int requestAnimationFrame(void Function(num) callback)`:
  Called to draw an animation frame and then request the window to repaint
  after [callback] has finished (creating the animation).
- `Future<FileSystem> requestFileSystem(int size, {bool persistent})`:
  Access a sandboxed file system of `size` bytes.
- `int requestIdleCallback(void Function(IdleDeadline) callback, [Map<dynamic, dynamic>? options])`
- `void resizeBy(int x, int y)`: Resizes this window by an offset.
- `void resizeTo(int x, int y)`:
  Resizes this window to a specific width and height.
- `Future<Entry> resolveLocalFileSystemUrl(String url)`:
  Asynchronously retrieves a local filesystem entry.
- `void scroll([dynamic options_OR_x, dynamic y, Map<dynamic, dynamic>? scrollOptions])`:
  Scrolls the page horizontally and vertically to a specific point.
- `void scrollBy([dynamic options_OR_x, dynamic y, Map<dynamic, dynamic>? scrollOptions])`:
  Scrolls the page horizontally and vertically by an offset.
- `void scrollTo([dynamic options_OR_x, dynamic y, Map<dynamic, dynamic>? scrollOptions])`:
  Scrolls the page horizontally and vertically to a specific point.
- `void stop()`: Stops the window from loading.

## Class: WindowBase

Top-level container for a browser tab or window.

```dart
abstract class WindowBase implements EventTarget { … }
```

- `bool? get closed`: Indicates whether this window has been closed.
- `HistoryBase get history`: The current session history for this window.
- `LocationBase get location`: The current location of this window.
- `WindowBase? get opener`: A reference to the window that opened this one.
- `WindowBase? get parent`: A reference to the parent of this window.
- `WindowBase? get top`:
  A reference to the topmost window in the window hierarchy.
- `void close()`: Closes the window.
- `void postMessage(dynamic message, String targetOrigin, [List<MessagePort>? messagePorts])`:
  Sends a cross-origin message.

## Class: WindowBase64

```dart
abstract class WindowBase64 extends JavaScriptObject { … }
```

- `String atob(String atob)`
- `String btoa(String btoa)`

## Class: WindowClient

```dart
class WindowClient extends Client { … }
```

- `bool? get focused`
- `String? get visibilityState`
- `Future<WindowClient> focus()`
- `Future<WindowClient> navigate(String url)`

## Class: WindowEventHandlers

```dart
abstract class WindowEventHandlers extends EventTarget { … }
```

- static `EventStreamProvider<Event> hashChangeEvent`
- static `EventStreamProvider<MessageEvent> messageEvent`
- static `EventStreamProvider<Event> offlineEvent`
- static `EventStreamProvider<Event> onlineEvent`
- static `EventStreamProvider<PopStateEvent> popStateEvent`
- static `EventStreamProvider<StorageEvent> storageEvent`
- static `EventStreamProvider<Event> unloadEvent`
- `Stream<Event> get onHashChange`
- `Stream<MessageEvent> get onMessage`
- `Stream<Event> get onOffline`
- `Stream<Event> get onOnline`
- `Stream<PopStateEvent> get onPopState`
- `Stream<StorageEvent> get onStorage`
- `Stream<Event> get onUnload`

## Class: Worker

```dart
class Worker extends EventTarget implements AbstractWorker { … }
```

- `Worker(String scriptUrl)`
- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [Worker].
- static `EventStreamProvider<MessageEvent> messageEvent`:
  Static factory designed to expose `message` events to event
  handlers that are not necessarily instances of [Worker].
- `Stream<Event> get onError`: Stream of `error` events handled by this [Worker].
- `Stream<MessageEvent> get onMessage`:
  Stream of `message` events handled by this [Worker].
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void postMessage(dynamic message, [List<Object>? transfer])`
- `void terminate()`

## Class: WorkerGlobalScope

```dart
class WorkerGlobalScope
    extends EventTarget
    implements WindowBase64, _WindowTimers { … }
```

- static `EventStreamProvider<Event> errorEvent`:
  Static factory designed to expose `error` events to event
  handlers that are not necessarily instances of [WorkerGlobalScope].
- `String? get addressSpace`
- `CacheStorage? get caches`
- `Crypto? get crypto`
- `IdbFactory? get indexedDB`
- static `WorkerGlobalScope get instance`
- `bool? get isSecureContext`
- `_WorkerLocation get location`
- `_WorkerNavigator get navigator`
- `Stream<Event> get onError`:
  Stream of `error` events handled by this [WorkerGlobalScope].
- `String? get origin`
- `WorkerPerformance? get performance`
- `WorkerGlobalScope get self`
- `String atob(String atob)`
- `String btoa(String btoa)`
- `Future<dynamic> fetch(dynamic input, [Map<dynamic, dynamic>? init])`
- `void importScripts(String urls)`

## Class: WorkerPerformance

```dart
class WorkerPerformance extends EventTarget { … }
```

- `MemoryInfo? get memory`
- `num? get timeOrigin`
- `void clearMarks(String? markName)`
- `void clearMeasures(String? measureName)`
- `void clearResourceTimings()`
- `List<PerformanceEntry> getEntries()`
- `List<PerformanceEntry> getEntriesByName(String name, String? entryType)`
- `List<PerformanceEntry> getEntriesByType(String entryType)`
- `void mark(String markName)`
- `void measure(String measureName, String? startMark, String? endMark)`
- `double now()`
- `void setResourceTimingBufferSize(int maxSize)`

## Class: WorkletAnimation

```dart
class WorkletAnimation extends JavaScriptObject { … }
```

- `WorkletAnimation(String animatorName, List<KeyframeEffectReadOnly> effects, List<Object> timelines, dynamic options)`
- `String? get playState`
- `void cancel()`
- `void play()`

## Class: WorkletGlobalScope

```dart
class WorkletGlobalScope extends JavaScriptObject { … }
```

## Class: XPathEvaluator

```dart
class XPathEvaluator extends JavaScriptObject { … }
```

- `XPathEvaluator()`
- `XPathExpression createExpression(String expression, XPathNSResolver? resolver)`
- `XPathNSResolver createNSResolver(Node nodeResolver)`
- `XPathResult evaluate(String expression, Node contextNode, XPathNSResolver? resolver, [int? type, Object? inResult])`

## Class: XPathExpression

```dart
class XPathExpression extends JavaScriptObject { … }
```

- `XPathResult evaluate(Node contextNode, [int? type, Object? inResult])`

## Class: XPathNSResolver

```dart
class XPathNSResolver extends JavaScriptObject { … }
```

- `String? lookupNamespaceUri(String? prefix)`

## Class: XPathResult

```dart
class XPathResult extends JavaScriptObject { … }
```

- static `int ANY_TYPE`
- static `int ANY_UNORDERED_NODE_TYPE`
- static `int BOOLEAN_TYPE`
- static `int FIRST_ORDERED_NODE_TYPE`
- static `int NUMBER_TYPE`
- static `int ORDERED_NODE_ITERATOR_TYPE`
- static `int ORDERED_NODE_SNAPSHOT_TYPE`
- static `int STRING_TYPE`
- static `int UNORDERED_NODE_ITERATOR_TYPE`
- static `int UNORDERED_NODE_SNAPSHOT_TYPE`
- `bool? get booleanValue`
- `bool? get invalidIteratorState`
- `num? get numberValue`
- `int? get resultType`
- `Node? get singleNodeValue`
- `int? get snapshotLength`
- `String? get stringValue`
- `Node? iterateNext()`
- `Node? snapshotItem(int index)`

## Class: XmlDocument

```dart
class XmlDocument extends Document { … }
```

## Class: XmlSerializer

```dart
class XmlSerializer extends JavaScriptObject { … }
```

- `XmlSerializer()`
- `String serializeToString(Node root)`

## Class: XsltProcessor

```dart
class XsltProcessor extends JavaScriptObject { … }
```

- `XsltProcessor()`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `void clearParameters()`
- `String? getParameter(String? namespaceURI, String localName)`
- `void importStylesheet(Node style)`
- `void removeParameter(String? namespaceURI, String localName)`
- `void reset()`
- `void setParameter(String? namespaceURI, String localName, String value)`
- `Document? transformToDocument(Node source)`
- `DocumentFragment? transformToFragment(Node source, Document output)`
