# Library: workspace.dart

Used to model the desired generation output.

See [Workspace].

## Members

- function `Future<GenerationResults> Function(Workspace, WorkspaceFile) createMarkdownGenerator(File markdownFile)`
- function `Future<GenerationResults> emptyContentGenerator(Workspace workspace, WorkspaceFile thisFile)`
- type alias `typedef FileContentGenerator = Future<GenerationResults> Function(Workspace, WorkspaceFile)`

## Enum: FileType

```dart
enum FileType { … }
```

- `dart`
- `markdown`

## Class: GenerationResults

```dart
class GenerationResults { … }
```

- `GenerationResults(String contents, [Outline? outline])`
- `String contents`
- `Outline? outline`

## Class: Workspace

A model of the generation output.

```dart
class Workspace extends WorkspaceDirectory { … }
```

- `Workspace(String name, {bool isPackage, required HtmlTemplate htmlTemplate})`
- static `Workspace fromPackage(HtmlTemplate htmlTemplate, Directory dir)`
- `Api api`
- `String? footer`
- `HtmlTemplate htmlTemplate`
- `List<WorkspaceFile> navFiles`
- `Workspace get workspace`
- `String generateNavData()`
- `Future<String> generateWorkspacePage(WorkspaceFile file, GenerationResults page)`
- `WorkspaceFile? getForPath(String path)`
- `String pathTo(WorkspaceFile target, {WorkspaceFile? from})`
- `String toString()`: A string representation of this object.

## Class: WorkspaceDirectory

```dart
class WorkspaceDirectory extends WorkspaceEntity { … }
```

- `WorkspaceDirectory(WorkspaceEntity? parent, String name, {bool isGroup, bool isPackage})`
- `List<WorkspaceEntity> children`
- `String? description`
- `bool isGroup`
- `bool isPackage`
- `WorkspaceFile? mainFile`
- `String? version`
- `int get itemCount`
- `WorkspaceDirectory? get parentPackage`
- `T addChild<T extends WorkspaceEntity>(T entity)`
- `WorkspaceEntity? getChild(String name)`
- `bool hasChild(WorkspaceFile page)`
- `String toString()`: A string representation of this object.

## Class: WorkspaceEntity

```dart
abstract class WorkspaceEntity { … }
```

- `WorkspaceEntity(WorkspaceEntity? parent, String name)`
- `String name`
- `WorkspaceEntity? parent`
- `Iterable<WorkspaceEntity> get breadcrumbs`
- `WorkspaceFile? get mainFile`
- `WorkspaceDirectory? get parentPackage`
- `Workspace get workspace`
- `String toString()`: A string representation of this object.

## Class: WorkspaceFile

```dart
class WorkspaceFile extends WorkspaceEntity { … }
```

- `WorkspaceFile(WorkspaceEntity? parent, String name, String path, Future<GenerationResults> Function(Workspace, WorkspaceFile) contentGenerator, [FileType fileType])`
- `Future<GenerationResults> Function(Workspace, WorkspaceFile) contentGenerator`
- `FileType fileType`
- `String? importScript`: If set, the script to specify in an import.
- `String path`
- `bool get isMarkdown`
- `WorkspaceFile? get mainFile`
- `Future<GenerationResults> generatePageContents()`
- `String toString()`: A string representation of this object.

## Class: WorkspaceSeparator

```dart
class WorkspaceSeparator extends WorkspaceEntity { … }
```

- `WorkspaceSeparator(WorkspaceEntity? parent, String name)`
- `WorkspaceFile? get mainFile`
