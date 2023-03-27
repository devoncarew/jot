import '../jot.dart';
import 'markdown.dart';
import 'render.dart';
import 'utils.dart';

class Generator {
  final DocWorkspace workspace;
  final Api api;

  Generator({required this.workspace, required this.api});
}

FileContentGenerator libraryGenerator(LibraryItemContainer library) {
  return (DocWorkspace workspace, DocFile thisFile) async {
    return LibraryGenerator(
      library: library,
      workspace: workspace,
      thisFile: thisFile,
    ).generate();
  };
}

class LibraryGenerator {
  final LibraryItemContainer library;
  final DocWorkspace workspace;
  final DocFile thisFile;

  LibraryGenerator({
    required this.library,
    required this.workspace,
    required this.thisFile,
  });

  GenerationResults generate() {
    var codeRenderer = CodeRepresentationRenderer();

    var buf = StringBuffer();

    var api = workspace.api!;

    if (thisFile.importScript != null) {
      buf.writeln('<h1>${thisFile.name}</h1>');
      buf.writeln(
        "<pre class=\"declaration\">"
        "<code>import '${thisFile.importScript}';</code>"
        "</pre>",
      );
    } else {
      buf.writeln('<h1>${thisFile.name}</h1>');
    }

    if (library.docs != null) {
      buf.writeln(convertMarkdown(library.docs!));
    }

    var pageItemRenderer = OutlineRenderer();

    for (var group in library.groups.values) {
      buf.writeln('<h2 id="${group.anchorId}">${group.name}</h2>');

      if (group.containerType) {
        buf.writeln('<table>');

        for (var item in group.items) {
          buf.write('<tr><td>');
          buf.writeln(api.hrefOrSpan(
            pageItemRenderer.render(group.type, item),
            item.element,
            from: thisFile,
          ));
          buf.write('</td>');
          buf.write('<td class="item-docs">');
          if (item.docs != null) {
            buf.writeln(convertMarkdown(firstSentence(item.docs!)));
          }
          buf.write('</td></tr>');
        }

        buf.writeln('</table>');
      } else {
        for (var item in group.items) {
          buf.writeln(
            '<h3 id="${item.anchorId}">${pageItemRenderer.render(group.type, item)}'
            '<span class="symbol-type">${item.element.kind.displayName}</span>'
            '</h3>',
          );
          buf.write(codeRenderer.writeAnnotations(item));
          buf.writeln(
            '<pre class="declaration"><code>'
            '${codeRenderer.render(group.type, item)}'
            '</code></pre>',
          );
          if (item.docs != null) {
            buf.writeln(convertMarkdown(item.docs!));
          }
        }
      }
    }

    var outline = Outline();
    var outlineRenderer = OutlineRenderer();

    for (var group in library.groups.values) {
      outline.add(Heading(group.name, id: group.anchorId, level: 2));

      if (!group.containerType) {
        for (var item in group.items) {
          outline.add(Heading(outlineRenderer.render(group.type, item),
              id: item.anchorId, level: 3));
        }
      }
    }

    return GenerationResults(buf.toString(), outline);
  }
}

FileContentGenerator interfaceElementGenerator(
    InterfaceElementItems interfaceElementItems) {
  return (DocWorkspace workspace, DocFile thisFile) async {
    return InterfaceElementGenerator(
      classItems: interfaceElementItems,
      workspace: workspace,
      thisFile: thisFile,
    ).generate();
  };
}

class InterfaceElementGenerator {
  final InterfaceElementItems classItems;
  final DocWorkspace workspace;
  final DocFile thisFile;

  InterfaceElementGenerator({
    required this.classItems,
    required this.workspace,
    required this.thisFile,
  });

  GenerationResults generate() {
    var codeRenderer = CodeRepresentationRenderer();

    var buf = StringBuffer();
    buf.writeln('<h1>${classItems.name}</h1>');
    buf.write(codeRenderer.writeAnnotations(classItems));
    buf.writeln(
      '<pre class="declaration"><code>'
      '${codeRenderer.render(classItems.type, classItems)}'
      '</code></pre>',
    );

    if (classItems.docs != null) {
      buf.writeln(convertMarkdown(classItems.docs!));
    }

    var pageItemRenderer = OutlineRenderer();

    for (var group in classItems.groups.values) {
      buf.writeln('<h2 id="${group.anchorId}">${group.name}</h2>');

      for (var item in group.items) {
        buf.writeln(
          '<h3 id="${item.anchorId}">${pageItemRenderer.render(group.type, item)}'
          '<span class="symbol-type">${item.element.kind.displayName}</span>'
          '</h3>',
        );
        buf.write(codeRenderer.writeAnnotations(item));
        buf.writeln(
          '<pre class="declaration"><code>'
          '${codeRenderer.render(group.type, item)}'
          '</code></pre>',
        );
        if (item.docs != null) {
          buf.writeln(convertMarkdown(item.docs!));
        }
      }
    }

    var outline = Outline();
    var outlineRenderer = OutlineRenderer();

    for (var group in classItems.groups.values) {
      outline.add(Heading(group.name, id: group.anchorId, level: 2));

      for (var item in group.items) {
        outline.add(Heading(outlineRenderer.render(group.type, item),
            id: item.anchorId, level: 3));
      }
    }

    return GenerationResults(buf.toString(), outline);
  }
}

FileContentGenerator extensionElementGenerator(
    ExtensionElementItems extensionItems) {
  return (DocWorkspace workspace, DocFile thisFile) async {
    return ExtentionElementGenerator(
      extensionItems: extensionItems,
      workspace: workspace,
      thisFile: thisFile,
    ).generate();
  };
}

class ExtentionElementGenerator {
  final ExtensionElementItems extensionItems;
  final DocWorkspace workspace;
  final DocFile thisFile;

  ExtentionElementGenerator({
    required this.extensionItems,
    required this.workspace,
    required this.thisFile,
  });

  GenerationResults generate() {
    // todo: customize for extensions

    var codeRenderer = CodeRepresentationRenderer();

    var buf = StringBuffer();
    buf.writeln('<h1>${extensionItems.name}</h1>');
    buf.write(codeRenderer.writeAnnotations(extensionItems));
    buf.writeln(
      '<pre class="declaration"><code>'
      '${codeRenderer.render(extensionItems.type, extensionItems)}'
      '</code></pre>',
    );

    if (extensionItems.docs != null) {
      buf.writeln(convertMarkdown(extensionItems.docs!));
    }

    var pageItemRenderer = OutlineRenderer();

    for (var group in extensionItems.groups.values) {
      buf.writeln('<h2 id="${group.anchorId}">${group.name}</h2>');

      for (var item in group.items) {
        buf.writeln(
          '<h3 id="${item.anchorId}">${pageItemRenderer.render(group.type, item)}'
          '<span class="symbol-type">${item.element.kind.displayName}</span>'
          '</h3>',
        );
        buf.write(codeRenderer.writeAnnotations(item));
        buf.writeln(
          '<pre class="declaration"><code>'
          '${codeRenderer.render(group.type, item)}'
          '</code></pre>',
        );
        if (item.docs != null) {
          buf.writeln(convertMarkdown(item.docs!));
        }
      }
    }

    var outline = Outline();
    var outlineRenderer = OutlineRenderer();

    for (var group in extensionItems.groups.values) {
      outline.add(Heading(group.name, id: group.anchorId, level: 2));

      for (var item in group.items) {
        outline.add(Heading(outlineRenderer.render(group.type, item),
            id: item.anchorId, level: 3));
      }
    }

    return GenerationResults(buf.toString(), outline);
  }
}
