import 'package:markdown/markdown.dart';

// todo: sanitize html (see lib/src/render/documentation_renderer.dart from
//       dartdoc)
// todo: link resolver

String convertMarkdown(String markdown) {
  return markdownToHtml(
    markdown,
    extensionSet: ExtensionSet.gitHubWeb,
  );
}

Iterable<Element> markdownHeaders(String markdown) {
  // todo: where possible, share parsing with convertMarkdown
  var document = Document(extensionSet: ExtensionSet.gitHubWeb);

  var nodes = document.parse(markdown);

  return nodes
      .whereType<Element>()
      .where((element) => element.tag == 'h1' || element.tag == 'h2');
}
