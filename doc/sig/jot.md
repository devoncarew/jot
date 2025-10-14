# library jot.dart

## Members

## Classes

### class DocServer

```
class DocServer { … }
```

- constructor `DocServer({required Jot jot, required Workspace workspace})`
- field `Jot jot`
- field `Workspace workspace`
- accessor `Logger get logger`
- accessor `int get port`
- method `Future<void> dispose()`
- method `Future<void> start(int port)`

### class Jot

```
class Jot { … }
```

- constructor `Jot({required Directory inDir, required Directory outDir, bool markdown, bool signature, Logger? logger})`
- field `Analyzer analyzer`
- field `HtmlTemplate htmlTemplate`
- field `Directory inDir`
- field `Logger logger`
- field `bool markdown`
- field `Directory outDir`
- field `bool signature`
- method `Future<void> generate()`
- method `Future<DocServer> serve(int port)`
