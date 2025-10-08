# Library: jot.dart

To create a new [Workspace], see [Workspace.fromPackage].

## Members

## Class: DocServer

```dart
class DocServer { … }
```

- `DocServer({required Jot jot, required Workspace workspace})`
- `Jot jot`
- `Workspace workspace`
- `Logger get logger`
- `int get port`
- `Future<void> dispose()`
- `Future<void> start(int port)`

## Class: Jot

```dart
class Jot { … }
```

- `Jot({required Directory inDir, required Directory outDir, bool summary, bool signature, Logger? logger})`
- `Analyzer analyzer`
- `HtmlTemplate htmlTemplate`
- `Directory inDir`
- `Logger logger`
- `Directory outDir`
- `bool signature`: Create a API signature files in doc/sig.
- `bool summary`:
  Create an LLM-friendly markdown summary of the API in doc/summary.
- `Future<void> generate()`
- `Future<DocServer> serve(int port)`
