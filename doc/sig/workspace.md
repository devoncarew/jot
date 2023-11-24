# library workspace.dart

## Members

- function `Future<GenerationResults> Function(Workspace, WorkspaceFile) createMarkdownGenerator(File markdownFile)`
- function `Future<GenerationResults> emptyContentGenerator(Workspace workspace, WorkspaceFile thisFile)`
- type alias `typedef FileContentGenerator = Future<GenerationResults> Function(Workspace, WorkspaceFile)`

## Enums

### enum FileType

```
enum FileType { … }
```

- enum value `dart`
- enum value `markdown`

## Classes

### class GenerationResults

```
class GenerationResults { … }
```

- constructor `GenerationResults(String contents, [Outline? outline])`
- field `String contents`
- field `Outline? outline`

### class Workspace

```
class Workspace extends WorkspaceDirectory { … }
```

- constructor `Workspace(String name, {bool isPackage, required HtmlTemplate htmlTemplate})`
- static method `Workspace fromPackage(HtmlTemplate htmlTemplate, Directory dir)`
- field `Api api`
- field `String? footer`
- field `HtmlTemplate htmlTemplate`
- field `List<WorkspaceFile> navFiles`
- accessor `Workspace get workspace`
- method `String generateNavData()`
- method `Future<String> generateWorkspacePage(WorkspaceFile file, GenerationResults page)`
- method `WorkspaceFile? getForPath(String path)`
- method `String pathTo(WorkspaceFile target, {WorkspaceFile? from})`
- method `String toString()`

### class WorkspaceDirectory

```
class WorkspaceDirectory extends WorkspaceEntity { … }
```

- constructor `WorkspaceDirectory(WorkspaceEntity? parent, String name, {bool isGroup, bool isPackage})`
- field `List<WorkspaceEntity> children`
- field `String? description`
- field `bool isGroup`
- field `bool isPackage`
- field `WorkspaceFile? mainFile`
- field `String? version`
- accessor `int get itemCount`
- accessor `WorkspaceDirectory? get parentPackage`
- method `T addChild<T extends WorkspaceEntity>(T entity)`
- method `WorkspaceEntity? getChild(String name)`
- method `bool hasChild(WorkspaceFile page)`
- method `String toString()`

### class WorkspaceEntity

```
abstract class WorkspaceEntity { … }
```

- constructor `WorkspaceEntity(WorkspaceEntity? parent, String name)`
- field `String name`
- field `WorkspaceEntity? parent`
- accessor `Iterable<WorkspaceEntity> get breadcrumbs`
- accessor `WorkspaceFile? get mainFile`
- accessor `WorkspaceDirectory? get parentPackage`
- accessor `Workspace get workspace`
- method `String toString()`

### class WorkspaceFile

```
class WorkspaceFile extends WorkspaceEntity { … }
```

- constructor `WorkspaceFile(WorkspaceEntity? parent, String name, String path, Future<GenerationResults> Function(Workspace, WorkspaceFile) contentGenerator, [FileType fileType])`
- field `Future<GenerationResults> Function(Workspace, WorkspaceFile) contentGenerator`
- field `FileType fileType`
- field `String? importScript`
- field `String path`
- accessor `bool get isMarkdown`
- accessor `WorkspaceFile? get mainFile`
- method `Future<GenerationResults> generatePageContents()`
- method `String toString()`

### class WorkspaceSeparator

```
class WorkspaceSeparator extends WorkspaceEntity { … }
```

- constructor `WorkspaceSeparator(WorkspaceEntity? parent, String name)`
- accessor `WorkspaceFile? get mainFile`
