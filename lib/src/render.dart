// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/element/element.dart';

import 'api.dart';
import 'linked_builder.dart';
import 'utils.dart';
import 'workspace.dart';

abstract class Renderer {
  String render(GroupType type, Item item) {
    switch (type) {
      case GroupType.constructor:
        return handleConstructor(item);
      case GroupType.field:
        return handleField(item);
      case GroupType.accessor:
        return handleAccessor(item);
      case GroupType.method:
        return handleMethod(item);

      case GroupType.topLevelVariable:
        return handleTopLevelVariable(item);
      case GroupType.function:
        return handleFunction(item);
      case GroupType.functionTypeAlias:
        return handleFunctionTypeAlias(item);
      case GroupType.typeAlias:
        return handleTypeAlias(item);
      case GroupType.$enum:
        return handleEnum(item);
      case GroupType.$class:
        return handleClass(item);
      case GroupType.$extension:
        return handleExtension(item);

      default:
        return handleDefault(item);
    }
  }

  String handleConstructor(Item item) => handleDefault(item);
  String handleField(Item item) => handleDefault(item);
  String handleAccessor(Item item) => handleDefault(item);
  String handleMethod(Item item) => handleDefault(item);

  String handleTopLevelVariable(Item item) => handleDefault(item);
  String handleFunction(Item item) => handleDefault(item);
  String handleFunctionTypeAlias(Item item) => handleDefault(item);
  String handleTypeAlias(Item item) => handleDefault(item);
  String handleClass(Item item) => handleDefault(item);
  String handleEnum(Item item) => handleDefault(item);
  String handleExtension(Item item) => handleDefault(item);

  String handleDefault(Item item) => item.name;
}

class OutlineRenderer extends Renderer {
  @override
  String handleConstructor(Item item) {
    var element = item.asConstructor;
    var arity = element.parameters.isEmpty ? '' : '...';
    return '${element.displayName}($arity)';
  }

  @override
  String handleAccessor(Item item) {
    var prefix =
        (item.element as PropertyAccessorElement).isGetter ? 'get' : 'set';
    return '$prefix\u00A0${item.name}';
  }

  @override
  String handleMethod(Item item) {
    var element = item.asMethod;
    if (element.isOperator) {
      return item.name;
    } else {
      var arity = element.parameters.isEmpty ? '' : '...';
      return '${item.name}($arity)';
    }
  }

  @override
  String handleFunction(Item item) {
    var element = item.asFunction;
    var arity = element.parameters.isEmpty ? '' : '...';
    return '${item.name}($arity)';
  }
}

class CodeRepresentationRenderer extends Renderer {
  @override
  String handleDefault(Item item) {
    var element = item.element;

    var buf = StringBuffer();

    buf.write('${element.kind.name} ');
    buf.write(element.name);

    return htmlEscape(buf.toString());
  }

  @override
  String handleClass(Item item) {
    var element = item.asClass;

    var buf = StringBuffer();

    buf.write(element.getDisplayString(withNullability: true));

    var fmt = DartFormat.asClass(buf.toString());
    return htmlEscape('$fmt { ... }');
  }

  @override
  String handleEnum(Item item) {
    var element = item.asEnum;

    var buf = StringBuffer();

    buf.write(element.getDisplayString(withNullability: true));
    buf.writeln(' { ... }');

    // todo: dartfmt
    return htmlEscape(buf.toString());
  }

  @override
  String handleExtension(Item item) {
    var element = item.asExtension;

    var buf = StringBuffer();

    buf.write(element.getDisplayString(withNullability: true));
    buf.writeln(' { ... }');

    // todo: dartfmt
    return htmlEscape(buf.toString());
  }

  @override
  String handleField(Item item) {
    var element = item.asField;

    var buf = StringBuffer();
    // todo: have utility code to visit modifiers
    if (element.isLate) buf.write('late ');
    if (element.isConst) buf.write('const ');
    if (element.isFinal) buf.write('final ');
    if (element.isStatic) buf.write('static ');

    buf.write('${renderDartType(element.type)} ');

    buf.write(element.name);

    // todo: dartfmt
    return htmlEscape(buf.toString());
  }

  @override
  String handleAccessor(Item item) {
    var element = item.asAccessor;

    var buf = StringBuffer();

    if (element.isStatic) buf.write('static ');

    if (element.isGetter) {
      // type get name
      buf.write('${renderDartType(element.returnType)} ');
      buf.writeln('get ${element.name}');
    } else {
      // set name(type value)
      buf.write('set ${element.name}(');
      buf.write('${renderDartType(element.returnType)} ');
      buf.writeln(' value)');
    }

    // todo: dartfmt
    return htmlEscape(buf.toString());
  }

  @override
  String handleConstructor(Item item) {
    var element = item.asConstructor;

    var buf = StringBuffer();
    // todo: have utility code to visit modifiers

    var isConst = false;

    if (element.isFactory) {
      buf.write('factory ');
    } else if (element.isConst) {
      buf.write('const ');
      isConst = true;
    }

    buf.write('${element.displayName}(');
    buf.write(describeMethodParameters(element));
    buf.writeln(')');

    return htmlEscape(DartFormat.asConstructor(
      buf.toString(),
      className: element.enclosingElement.name,
      isConst: isConst,
    ));
  }

  @override
  String handleMethod(Item item) {
    var element = item.asMethod;

    var buf = StringBuffer();
    // todo: have utility code to visit modifiers
    // if (element.isLate) buf.write('late ');
    // if (element.isConst) buf.write('const ');
    // if (element.isFinal) buf.write('final ');
    if (element.isStatic) buf.write('static ');

    buf.write('${renderDartType(element.returnType)} ');

    if (element.isOperator) buf.write('operator ');
    buf.write('${element.displayName}(');
    buf.write(describeMethodParameters(element));
    buf.writeln(')');

    return htmlEscape(DartFormat.asMethod(buf.toString()));
  }

  @override
  String handleFunction(Item item) {
    var element = item.asFunction;

    var buf = StringBuffer();
    // todo: have utility code to visit modifiers
    // if (element.isLate) buf.write('late ');
    // if (element.isConst) buf.write('const ');
    // if (element.isFinal) buf.write('final ');
    // if (element.isStatic) buf.write('static ');

    buf.write('${renderDartType(element.returnType)} ');

    buf.write('${element.name}(');
    buf.write(describeMethodParameters(element));
    buf.writeln(')');

    return htmlEscape(DartFormat.asFunction(buf.toString()));
  }

  @override
  String handleFunctionTypeAlias(Item item) {
    var element = item.asTypeAlias;

    // typedef name = void Function(String msg);
    var buf = StringBuffer('typedef ');
    buf.write('${element.name} = ');
    buf.writeln(renderDartType(element.aliasedType));

    return htmlEscape(DartFormat.asTypeAlias(buf.toString()));
  }

  @override
  String handleTypeAlias(Item item) {
    var element = item.asTypeAlias;

    // typedef IntList = List<int>;
    var buf = StringBuffer('typedef ');
    buf.write('${element.name} = ');
    buf.writeln(renderDartType(element.aliasedType));

    return htmlEscape(DartFormat.asTypeAlias(buf.toString()));
  }

  String renderDartType(DartType type) {
    return type.getDisplayString(withNullability: true);
  }

  static String writeAnnotations(Item item) {
    var element = item.element;
    if (element.metadata.isEmpty) return '';

    var buf = StringBuffer('<p class="annotations-container">\n');
    if (element.metadata.isNotEmpty) {
      for (var annotation in element.metadata) {
        var meta = annotation.element;
        if (meta == null) continue;

        var text = annotation.toSource();
        buf.writeln('<span class="badge badge--secondary">'
            '${htmlEscape(text)}</span>');
        // buf.writeln('<code class="annotation">@$name</code>');
      }
    }

    buf.writeln('</p>');
    return buf.toString();
  }

  String describeMethodParameters(ExecutableElement element) {
    var parameters = element.parameters;

    var buf = StringBuffer();

    var inNamed = false;
    var inPositional = false;

    for (var param in parameters) {
      if (buf.isNotEmpty) buf.write(', ');

      if (!inNamed && !inPositional) {
        if (param.isNamed) {
          inNamed = true;
          buf.write('{');
        } else if (param.isOptionalPositional) {
          inPositional = true;
          buf.write('[');
        }
      }

      param.appendToWithoutDelimiters(buf, withNullability: true);
    }

    if (buf.length >= 58) {
      buf.write(',');
    }

    if (inNamed) {
      buf.write(' }');
    } else if (inPositional) {
      buf.write(' ]');
    }

    return buf.toString();
  }
}

class LinkedCodeRenderer extends Renderer {
  final Resolver resolver;
  final DocFile fromFile;

  LinkedCodeRenderer(this.resolver, this.fromFile);

  @override
  String handleConstructor(Item item) {
    var element = item.asConstructor;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeConstructorElement(element);
    return text.emitHtml((text) => DartFormat.asConstructor(text,
        className: element.enclosingElement.name,
        isConst: !element.isFactory && element.isConst));
  }

  @override
  String handleField(Item item) {
    var element = item.asField;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeVariableElement(element);
    return text.emitHtml((text) => DartFormat.asField(text));
  }

  @override
  String handleAccessor(Item item) {
    var element = item.asAccessor;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeExecutableElement(element, element.displayName);
    return text.emitHtml((text) => DartFormat.asMethod(text));
  }

  @override
  String handleMethod(Item item) {
    var element = item.asMethod;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeExecutableElement(
        element, element.isOperator ? element.displayName : element.name);
    return text.emitHtml((text) => DartFormat.asMethod(text));
  }

  @override
  String handleFunction(Item item) {
    var element = item.asFunction;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeExecutableElement(element, element.name);
    return text.emitHtml((text) => DartFormat.asFunction(text));
  }

  @override
  String handleFunctionTypeAlias(Item item) {
    var element = item.asTypeAlias;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeTypeAliasElement(element as TypeAliasElementImpl);
    return text.emitHtml((text) => DartFormat.asTypeAlias(text));
  }

  // // todo:
  // @override
  // String handleTypeAlias(Item item) {
  //   var element = item.asTypeAlias;

  //   var text = LinkedText(resolver, fromFile);
  //   var builder = LinkedElementDisplayBuilder(text);
  //   builder.writeTypeAliasElement(element as TypeAliasElementImpl);
  //   return text.emitHtml((text) => DartFormat.asTypeAlias(text));
  // }

  @override
  String handleClass(Item item) {
    var element = item.asClass;

    var text = LinkedText(resolver, fromFile);

    var builder = LinkedElementDisplayBuilder(text);

    builder.writeClassElement(element as ClassElementImpl);

    // // todo: replicate this but call out to LinkedText
    // //text.write(element.getDisplayString(withNullability: true));
    // // "class DocWorkspace extends DocContainer"
    // text.write('class ');
    // // todo: note that we don't need to link to ourself
    // text.writeElement(element.name, element);
    // var $super = element.supertype?.element;
    // if ($super != null) {
    //   text.write(' extends ');
    //   text.writeElement($super.name, $super);
    // }

    return text.emitHtml(
        (unformatted) => DartFormat.asClass(unformatted), ' { ... }');
  }

  @override
  String handleEnum(Item item) {
    var element = item.asEnum;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeEnumElement(element);
    return text.emitHtml((text) => DartFormat.asEnum(text), ' { ... }');
  }

  @override
  String handleExtension(Item item) {
    var element = item.asExtension;

    var text = LinkedText(resolver, fromFile);
    var builder = LinkedElementDisplayBuilder(text);
    builder.writeExtensionElement(element);
    return text.emitHtml((text) => DartFormat.asClass(text), ' { ... }');
  }
}
