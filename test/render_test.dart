import 'package:analyzer/dart/element/element.dart';
import 'package:jot/api.dart';
import 'package:jot/src/render.dart';
import 'package:test/test.dart';

import 'support.dart';

// TODO: test the other methods for LinkedCodeRenderer

void main() {
  group('LinkedCodeRenderer', () {
    testWithSource('handleConstructor', '''
class A {
  A();
}
''', (TestProject project) {
      final interfaceItem = project.firstClassItem;
      final item = interfaceItem.allChildren
          .firstWhere((item) => item.element is ConstructorElement);

      final renderer = LinkedCodeRenderer(
          project.resolver, project.resolver.fileFor(interfaceItem.element)!);
      final result = renderer.render(GroupType.constructor, item);

      expect(result, '<pre class="declaration"><code>A()</code></pre>');
    });

    testWithSource('handleField', '''
class A {
  final String foo = 'bar';
}
''', (TestProject project) {
      final interfaceItem = project.firstClassItem;
      final item = interfaceItem.allChildren
          .firstWhere((item) => item.element is FieldElement);

      final renderer = LinkedCodeRenderer(
          project.resolver, project.resolver.fileFor(interfaceItem.element)!);
      final result = renderer.render(GroupType.field, item);

      expect(result, '<pre class="declaration"><code>String foo</code></pre>');
    });

    testWithSource('handleAccessor', '''
String get foo => 'bar';
''', (TestProject project) {
      final library = project.firstLibrary;
      final item = library.allChildren
          .firstWhere((item) => item.element is PropertyAccessorElement);

      final renderer = LinkedCodeRenderer(
          project.resolver, project.resolver.fileFor(library.element)!);
      final result = renderer.render(GroupType.accessor, item);

      expect(
          result, '<pre class="declaration"><code>String get foo</code></pre>');
    });
  });
}
