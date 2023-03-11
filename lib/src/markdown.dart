import 'package:markdown/markdown.dart';

import 'utils.dart';

// todo: sanitize html (see lib/src/render/documentation_renderer.dart from
//       dartdoc)
// todo: link resolver

class MarkdownResults {
  final String html;
  final Outline outline;

  MarkdownResults(this.html, this.outline);
}

String convertMarkdown(String markdown) {
  return markdownToHtml(
    markdown,
    extensionSet: ExtensionSet.gitHubWeb,
    enableTagfilter: true,
  );
}

MarkdownResults convertMarkdownWithOutline(String markdown) {
  final document = Document(extensionSet: ExtensionSet.gitHubWeb);

  final nodes = document.parse(markdown);

  var contents = '${renderToHtml(nodes, enableTagfilter: true)}\n';
  var elements = nodes
      .whereType<Element>()
      .where((element) => element.tag == 'h2' || element.tag == 'h3');

  return MarkdownResults(contents, _toOutline(elements));
}

Outline _toOutline(Iterable<Element> elements) {
  var outline = Outline();
  for (var element in elements) {
    var level = int.parse(element.tag.substring(1));
    outline.add(
        Heading(element.textContent, level: level, id: element.generatedId));
  }
  return outline;
}

// Iterable<Element> markdownHeaders(String markdown) {
//   // todo: where possible, share parsing with convertMarkdown
//   var document = Document(extensionSet: ExtensionSet.gitHubWeb);
//   var nodes = document.parse(markdown);
//   return nodes
//       .whereType<Element>()
//       .where((element) => element.tag == 'h1' || element.tag == 'h2');
// }
