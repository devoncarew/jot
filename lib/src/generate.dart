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
    var api = workspace.api!;
    var linkedCodeRenderer = LinkedCodeRenderer(api.resolver, thisFile);

    var buf = StringBuffer();

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
      // todo: also support resolution for class contexts
      // todo: also support resolution for method contexts
      // todo: also support compound references - Class.field, Class.method

      // todo: see CommentReferenceResolver
      // todo: and:
      //   https://github.com/dart-lang/dartdoc/blob/master/lib/src/comment_references/parser.dart

      // // SomeParsedLibraryResult, ParsedLibraryResult
      // var sdsdf =
      //     library.element.session.getParsedLibraryByElement(library.element);
      // parseString(content: 'String');

      buf.writeln(convertMarkdown(library.docs!,
          linkResolver: library.markdownLinkResolver(api.resolver)));
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
            buf.writeln(convertMarkdown(firstSentence(item.docs!),
                linkResolver: item.markdownLinkResolver(api.resolver)));
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
          buf.write(CodeRepresentationRenderer.writeAnnotations(item));
          buf.writeln(linkedCodeRenderer.render(group.type, item));
          if (item.docs != null) {
            buf.writeln(convertMarkdown(item.docs!,
                linkResolver: item.markdownLinkResolver(api.resolver)));
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
    var api = workspace.api!;

    // todo: replace some uses of codeRenderer with linkedCodeRenderer

    // var codeRenderer = CodeRepresentationRenderer();
    var linkedCodeRenderer = LinkedCodeRenderer(api.resolver, thisFile);

    var buf = StringBuffer();
    buf.writeln('<h1>${classItems.name}</h1>');
    buf.write(CodeRepresentationRenderer.writeAnnotations(classItems));
    buf.writeln(linkedCodeRenderer.render(classItems.type, classItems));
    writeAncestors(buf);
    writeChildRelationships(
        buf, classItems.relationships, thisFile, workspace.api!);
    if (classItems.docs != null) {
      buf.writeln(convertMarkdown(classItems.docs!,
          linkResolver: classItems.markdownLinkResolver(api.resolver)));
    }

    var pageItemRenderer = OutlineRenderer();

    for (var group in classItems.groups.values) {
      buf.writeln('<h2 id="${group.anchorId}">${group.name}</h2>');

      if (group.type == GroupType.enumValue) {
        // For enums, add a 'values' table.
        buf.writeln('<table>');

        // todo: also include information about the enum's value

        for (var item in group.items) {
          buf.write('<tr>');
          buf.writeln('<td id="${item.anchorId}">${item.name}</td>');
          buf.write('<td class="item-docs">');
          if (item.docs != null) {
            buf.writeln(convertMarkdown(item.docs!,
                linkResolver: item.markdownLinkResolver(api.resolver)));
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
          buf.write(CodeRepresentationRenderer.writeAnnotations(item));
          buf.writeln(linkedCodeRenderer.render(group.type, item));
          if (item.docs != null) {
            buf.writeln(convertMarkdown(item.docs!,
                linkResolver: item.markdownLinkResolver(api.resolver)));
          }
        }
      }
    }

    var outline = Outline();
    var outlineRenderer = OutlineRenderer();

    for (var group in classItems.groups.values) {
      outline.add(Heading(group.name, id: group.anchorId, level: 2));

      if (group.type != GroupType.enumValue) {
        for (var item in group.items) {
          outline.add(Heading(outlineRenderer.render(group.type, item),
              id: item.anchorId, level: 3));
        }
      }
    }

    return GenerationResults(buf.toString(), outline);
  }

  void writeAncestors(StringBuffer out) {
    var buf = StringBuffer();
    final api = workspace.api!;

    var element = classItems.element;
    var superElement = element.supertype?.element;
    if (superElement != null) {
      buf.writeln('<tr><td class="item-title">Extends</td>');
      buf.write('<td class="item-docs">');
      var ref = api.hrefOrSpan(superElement.name, superElement, from: thisFile);
      buf.write('<code>$ref</code></td></tr>');
    }

    if (element.interfaces.isNotEmpty) {
      buf.writeln('<tr><td class="item-title">Implements</td>');
      buf.write('<td class="item-docs">');
      buf.write(element.interfaces
          .map((i) => api.hrefOrSpan(i.element.name, i.element, from: thisFile))
          .map((s) => '<code>$s</code>')
          .join(', '));
      buf.write('</td></tr>');
    }

    if (element.mixins.isNotEmpty) {
      buf.writeln('<tr><td class="item-title">Mixins</td>');
      buf.write('<td class="item-docs">');
      buf.write(element.mixins
          .map((m) => api.hrefOrSpan(m.element.name, m.element, from: thisFile))
          .map((s) => '<code>$s</code>')
          .join(', '));
      buf.write('</td></tr>');
    }

    if (buf.isNotEmpty) {
      out.writeln('<table>');
      out.write(buf.toString());
      out.writeln('</table>');
    }
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
    var api = workspace.api!;

    var linkedCodeRenderer = LinkedCodeRenderer(api.resolver, thisFile);

    var buf = StringBuffer();
    buf.writeln('<h1>${extensionItems.name}</h1>');
    buf.write(CodeRepresentationRenderer.writeAnnotations(extensionItems));
    buf.writeln(linkedCodeRenderer.render(extensionItems.type, extensionItems));
    writeAncestors(buf);
    writeChildRelationships(
        buf, extensionItems.relationships, thisFile, workspace.api!);
    if (extensionItems.docs != null) {
      buf.writeln(convertMarkdown(extensionItems.docs!,
          linkResolver: extensionItems.markdownLinkResolver(api.resolver)));
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
        buf.write(CodeRepresentationRenderer.writeAnnotations(item));
        buf.writeln(linkedCodeRenderer.render(group.type, item));
        if (item.docs != null) {
          buf.writeln(convertMarkdown(item.docs!,
              linkResolver: item.markdownLinkResolver(api.resolver)));
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

  void writeAncestors(StringBuffer out) {
    var buf = StringBuffer();
    final api = workspace.api!;

    var element = extensionItems.asExtension;
    var extendedElement = element.extendedType.element;
    if (extendedElement != null && extendedElement.name != null) {
      buf.writeln('<tr><td class="item-title">Extension on</td>');
      buf.write('<td class="item-docs">');
      var ref = api.hrefOrSpan(extendedElement.name!, extendedElement,
          from: thisFile);
      buf.write('<code>$ref</code></td></tr>');
    }

    if (buf.isNotEmpty) {
      out.writeln('<table>');
      out.write(buf.toString());
      out.writeln('</table>');
    }
  }
}

void writeChildRelationships(StringBuffer buf, RelationshipMap relationships,
    DocFile thisFile, Api api) {
  if (relationships.isEmpty) return;

  buf.writeln('<table>');

  for (var kind in relationships.keys) {
    buf.write('<tr>');
    buf.write('<td class="item-title">${kind.title}</td>');

    buf.write('<td class="item-docs">');
    var items = relationships[kind]!;
    items.sort((a, b) => adjustedLexicalCompare(a.name, b.name));
    buf.write(items.map((item) {
      var ref = api.hrefOrSpan(item.name, item.element, from: thisFile);
      return '<code>$ref</code>';
    }).join(', '));
    buf.writeln('</td></tr>');
  }

  buf.writeln('</table>');
}
