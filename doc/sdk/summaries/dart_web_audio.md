# Library: dart:web_audio

High-fidelity audio programming in the browser.

> [!Note]
> This core library is deprecated, and scheduled for removal in late 2025.
> It has been replaced by [package:web](https://pub.dev/packages/web).
> The [migration guide](https://dart.dev/go/package-web) has more details.

{@category Web (Legacy)}

## Members

## Class: AnalyserNode

```dart
class AnalyserNode extends AudioNode { … }
```

- `AnalyserNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `int? get fftSize`
- `set fftSize=(int? value)`
- `int? get frequencyBinCount`
- `num? get maxDecibels`
- `set maxDecibels=(num? value)`
- `num? get minDecibels`
- `set minDecibels=(num? value)`
- `num? get smoothingTimeConstant`
- `set smoothingTimeConstant=(num? value)`
- `void getByteFrequencyData(Uint8List array)`
- `void getByteTimeDomainData(Uint8List array)`
- `void getFloatFrequencyData(Float32List array)`
- `void getFloatTimeDomainData(Float32List array)`

## Class: AudioBuffer

```dart
class AudioBuffer extends JavaScriptObject { … }
```

- `AudioBuffer(Map<dynamic, dynamic> options)`
- `num? get duration`
- `int? get length`
- `int? get numberOfChannels`
- `num? get sampleRate`
- `void copyFromChannel(Float32List destination, int channelNumber, [int? startInChannel])`
- `void copyToChannel(Float32List source, int channelNumber, [int? startInChannel])`
- `Float32List getChannelData(int channelIndex)`

## Class: AudioBufferSourceNode

```dart
class AudioBufferSourceNode extends AudioScheduledSourceNode { … }
```

- `AudioBufferSourceNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioBuffer? get buffer`
- `set buffer=(AudioBuffer? value)`
- `AudioParam? get detune`
- `bool? get loop`
- `set loop=(bool? value)`
- `num? get loopEnd`
- `set loopEnd=(num? value)`
- `num? get loopStart`
- `set loopStart=(num? value)`
- `AudioParam? get playbackRate`
- `void start([num? when, num? grainOffset, num? grainDuration])`

## Class: AudioContext

```dart
class AudioContext extends BaseAudioContext { … }
```

- `AudioContext()`
- `num? get baseLatency`
- static `bool get supported`:
  Checks if this type is supported on the current platform.
- `Future<dynamic> close()`
- `GainNode createGain()`
- `ScriptProcessorNode createScriptProcessor([int? bufferSize, int? numberOfInputChannels, int? numberOfOutputChannels])`
- `Future<AudioBuffer> decodeAudioData(ByteBuffer audioData, [void Function(AudioBuffer)? successCallback, void Function(DomException)? errorCallback])`
- `Map<dynamic, dynamic> getOutputTimestamp()`
- `Future<dynamic> suspend()`

## Class: AudioDestinationNode

```dart
class AudioDestinationNode extends AudioNode { … }
```

- `int? get maxChannelCount`

## Class: AudioListener

```dart
class AudioListener extends JavaScriptObject { … }
```

- `AudioParam? get forwardX`
- `AudioParam? get forwardY`
- `AudioParam? get forwardZ`
- `AudioParam? get positionX`
- `AudioParam? get positionY`
- `AudioParam? get positionZ`
- `AudioParam? get upX`
- `AudioParam? get upY`
- `AudioParam? get upZ`
- `void setOrientation(num x, num y, num z, num xUp, num yUp, num zUp)`
- `void setPosition(num x, num y, num z)`

## Class: AudioNode

```dart
class AudioNode extends EventTarget { … }
```

- `int? get channelCount`
- `set channelCount=(int? value)`
- `String? get channelCountMode`
- `set channelCountMode=(String? value)`
- `String? get channelInterpretation`
- `set channelInterpretation=(String? value)`
- `BaseAudioContext? get context`
- `int? get numberOfInputs`
- `int? get numberOfOutputs`
- `void connectNode(AudioNode destination, [int output, int input])`
- `void connectParam(AudioParam destination, [int output])`
- `void disconnect([dynamic destination_OR_output, int? output, int? input])`

## Class: AudioParam

```dart
class AudioParam extends JavaScriptObject { … }
```

- `num? get defaultValue`
- `num? get maxValue`
- `num? get minValue`
- `num? get value`
- `set value=(num? value)`
- `AudioParam cancelAndHoldAtTime(num startTime)`
- `AudioParam cancelScheduledValues(num startTime)`
- `AudioParam exponentialRampToValueAtTime(num value, num time)`
- `AudioParam linearRampToValueAtTime(num value, num time)`
- `AudioParam setTargetAtTime(num target, num time, num timeConstant)`
- `AudioParam setValueAtTime(num value, num time)`
- `AudioParam setValueCurveAtTime(List<num> values, num time, num duration)`

## Class: AudioParamMap

```dart
class AudioParamMap extends JavaScriptObject with MapBase<String, dynamic> { … }
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

## Class: AudioProcessingEvent

```dart
class AudioProcessingEvent extends Event { … }
```

- `AudioProcessingEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `AudioBuffer? get inputBuffer`
- `AudioBuffer? get outputBuffer`
- `num? get playbackTime`

## Class: AudioScheduledSourceNode

```dart
class AudioScheduledSourceNode extends AudioNode { … }
```

- static `EventStreamProvider<Event> endedEvent`
- `Stream<Event> get onEnded`
- `void start2([num? when])`
- `void stop([num? when])`

## Class: AudioTrack

```dart
class AudioTrack extends JavaScriptObject { … }
```

- `bool? get enabled`
- `set enabled=(bool? value)`
- `String? get id`
- `String? get kind`
- `String? get label`
- `String? get language`
- `SourceBuffer? get sourceBuffer`

## Class: AudioTrackList

```dart
class AudioTrackList extends EventTarget { … }
```

- static `EventStreamProvider<Event> changeEvent`
- `int? get length`
- `Stream<Event> get onChange`
- `AudioTrack? getTrackById(String id)`

## Class: AudioWorkletGlobalScope

```dart
class AudioWorkletGlobalScope extends WorkletGlobalScope { … }
```

- `num? get currentTime`
- `num? get sampleRate`
- `void registerProcessor(String name, Object processorConstructor)`

## Class: AudioWorkletNode

```dart
class AudioWorkletNode extends AudioNode { … }
```

- `AudioWorkletNode(BaseAudioContext context, String name, [Map<dynamic, dynamic>? options])`
- `AudioParamMap? get parameters`

## Class: AudioWorkletProcessor

```dart
class AudioWorkletProcessor extends JavaScriptObject { … }
```

## Class: BaseAudioContext

```dart
class BaseAudioContext extends EventTarget { … }
```

- `num? get currentTime`
- `AudioDestinationNode? get destination`
- `AudioListener? get listener`
- `num? get sampleRate`
- `String? get state`
- `AnalyserNode createAnalyser()`
- `BiquadFilterNode createBiquadFilter()`
- `AudioBuffer createBuffer(int numberOfChannels, int numberOfFrames, num sampleRate)`
- `AudioBufferSourceNode createBufferSource()`
- `ChannelMergerNode createChannelMerger([int? numberOfInputs])`
- `ChannelSplitterNode createChannelSplitter([int? numberOfOutputs])`
- `ConstantSourceNode createConstantSource()`
- `ConvolverNode createConvolver()`
- `DelayNode createDelay([num? maxDelayTime])`
- `DynamicsCompressorNode createDynamicsCompressor()`
- `GainNode createGain()`
- `IirFilterNode createIirFilter(List<num> feedForward, List<num> feedBack)`
- `MediaElementAudioSourceNode createMediaElementSource(MediaElement mediaElement)`
- `MediaStreamAudioDestinationNode createMediaStreamDestination()`
- `MediaStreamAudioSourceNode createMediaStreamSource(MediaStream mediaStream)`
- `OscillatorNode createOscillator()`
- `PannerNode createPanner()`
- `PeriodicWave createPeriodicWave(List<num> real, List<num> imag, [Map<dynamic, dynamic>? options])`
- `ScriptProcessorNode createScriptProcessor([int? bufferSize, int? numberOfInputChannels, int? numberOfOutputChannels])`
- `StereoPannerNode createStereoPanner()`
- `WaveShaperNode createWaveShaper()`
- `Future<AudioBuffer> decodeAudioData(ByteBuffer audioData, [void Function(AudioBuffer)? successCallback, void Function(DomException)? errorCallback])`
- `Future<dynamic> resume()`

## Class: BiquadFilterNode

```dart
class BiquadFilterNode extends AudioNode { … }
```

- `BiquadFilterNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get Q`
- `AudioParam? get detune`
- `AudioParam? get frequency`
- `AudioParam? get gain`
- `String? get type`
- `set type=(String? value)`
- `void getFrequencyResponse(Float32List frequencyHz, Float32List magResponse, Float32List phaseResponse)`

## Class: ChannelMergerNode

```dart
class ChannelMergerNode extends AudioNode { … }
```

- `ChannelMergerNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`

## Class: ChannelSplitterNode

```dart
class ChannelSplitterNode extends AudioNode { … }
```

- `ChannelSplitterNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`

## Class: ConstantSourceNode

```dart
class ConstantSourceNode extends AudioScheduledSourceNode { … }
```

- `ConstantSourceNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get offset`

## Class: ConvolverNode

```dart
class ConvolverNode extends AudioNode { … }
```

- `ConvolverNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioBuffer? get buffer`
- `set buffer=(AudioBuffer? value)`
- `bool? get normalize`
- `set normalize=(bool? value)`

## Class: DelayNode

```dart
class DelayNode extends AudioNode { … }
```

- `DelayNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get delayTime`

## Class: DynamicsCompressorNode

```dart
class DynamicsCompressorNode extends AudioNode { … }
```

- `DynamicsCompressorNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get attack`
- `AudioParam? get knee`
- `AudioParam? get ratio`
- `num? get reduction`
- `AudioParam? get release`
- `AudioParam? get threshold`

## Class: GainNode

```dart
class GainNode extends AudioNode { … }
```

- `GainNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get gain`

## Class: IirFilterNode

```dart
class IirFilterNode extends AudioNode { … }
```

- `IirFilterNode(BaseAudioContext context, Map<dynamic, dynamic> options)`
- `void getFrequencyResponse(Float32List frequencyHz, Float32List magResponse, Float32List phaseResponse)`

## Class: MediaElementAudioSourceNode

```dart
class MediaElementAudioSourceNode extends AudioNode { … }
```

- `MediaElementAudioSourceNode(BaseAudioContext context, Map<dynamic, dynamic> options)`
- `MediaElement? get mediaElement`

## Class: MediaStreamAudioDestinationNode

```dart
class MediaStreamAudioDestinationNode extends AudioNode { … }
```

- `MediaStreamAudioDestinationNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `MediaStream? get stream`

## Class: MediaStreamAudioSourceNode

```dart
class MediaStreamAudioSourceNode extends AudioNode { … }
```

- `MediaStreamAudioSourceNode(BaseAudioContext context, Map<dynamic, dynamic> options)`
- `MediaStream? get mediaStream`

## Class: OfflineAudioCompletionEvent

```dart
class OfflineAudioCompletionEvent extends Event { … }
```

- `OfflineAudioCompletionEvent(String type, Map<dynamic, dynamic> eventInitDict)`
- `AudioBuffer? get renderedBuffer`

## Class: OfflineAudioContext

```dart
class OfflineAudioContext extends BaseAudioContext { … }
```

- `OfflineAudioContext(dynamic numberOfChannels_OR_options, [int? numberOfFrames, num? sampleRate])`
- `int? get length`
- `Future<AudioBuffer> startRendering()`
- `Future<dynamic> suspendFor(num suspendTime)`

## Class: OscillatorNode

```dart
class OscillatorNode extends AudioScheduledSourceNode { … }
```

- `OscillatorNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get detune`
- `AudioParam? get frequency`
- `String? get type`
- `set type=(String? value)`
- `void setPeriodicWave(PeriodicWave periodicWave)`

## Class: PannerNode

```dart
class PannerNode extends AudioNode { … }
```

- `PannerNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `num? get coneInnerAngle`
- `set coneInnerAngle=(num? value)`
- `num? get coneOuterAngle`
- `set coneOuterAngle=(num? value)`
- `num? get coneOuterGain`
- `set coneOuterGain=(num? value)`
- `String? get distanceModel`
- `set distanceModel=(String? value)`
- `num? get maxDistance`
- `set maxDistance=(num? value)`
- `AudioParam? get orientationX`
- `AudioParam? get orientationY`
- `AudioParam? get orientationZ`
- `String? get panningModel`
- `set panningModel=(String? value)`
- `AudioParam? get positionX`
- `AudioParam? get positionY`
- `AudioParam? get positionZ`
- `num? get refDistance`
- `set refDistance=(num? value)`
- `num? get rolloffFactor`
- `set rolloffFactor=(num? value)`
- `void setOrientation(num x, num y, num z)`
- `void setPosition(num x, num y, num z)`

## Class: PeriodicWave

```dart
class PeriodicWave extends JavaScriptObject { … }
```

- `PeriodicWave(BaseAudioContext context, [Map<dynamic, dynamic>? options])`

## Class: ScriptProcessorNode

```dart
class ScriptProcessorNode extends AudioNode { … }
```

- static `EventStreamProvider<AudioProcessingEvent> audioProcessEvent`:
  Static factory designed to expose `audioprocess` events to event
  handlers that are not necessarily instances of [ScriptProcessorNode].
- `int? get bufferSize`
- `Stream<AudioProcessingEvent> get onAudioProcess`:
  Get a Stream that fires events when AudioProcessingEvents occur.
  This particular stream is special in that it only allows one listener to a
  given stream. Converting the returned [Stream.asBroadcastStream] will
  likely ruin the soft-real-time properties which these events are
  fired and can be processed.
- `void setEventListener(dynamic Function(Event) eventListener)`

## Class: StereoPannerNode

```dart
class StereoPannerNode extends AudioNode { … }
```

- `StereoPannerNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `AudioParam? get pan`

## Class: WaveShaperNode

```dart
class WaveShaperNode extends AudioNode { … }
```

- `WaveShaperNode(BaseAudioContext context, [Map<dynamic, dynamic>? options])`
- `Float32List? get curve`
- `set curve=(Float32List? value)`
- `String? get oversample`
- `set oversample=(String? value)`
