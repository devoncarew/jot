import 'package:analyzer/dart/element/element.dart';
import 'package:jot/src/api.dart';

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
      case GroupType.$class:
        return handleClass(item);
      case GroupType.$enum:
        return handleEnum(item);
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
    var name = item.element.name!;
    var parent = item.element.enclosingElement!;
    name = name.isEmpty ? parent.name! : '${parent.name}.$name';
    return '$name()';
  }

  @override
  String handleAccessor(Item item) {
    var prefix =
        (item.element as PropertyAccessorElement).isGetter ? 'get' : 'set';
    return '$prefix\u00A0${item.name}';
  }

  @override
  String handleMethod(Item item) {
    if ((item.element as ExecutableElement).isOperator) {
      return item.name;
    } else {
      return '${item.name}()';
    }
  }
}
