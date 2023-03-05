

// void generate(LibraryElement library, File destFile) {
//   var referencePath = p.relative(library.source.fullName, from: libDir.path);

//   final buf = StringBuffer();
//   buf.writeln('# $referencePath');
//   buf.writeln();
//   var comment = library.documentationComment;
//   if (comment != null) {
//     buf.writeln(processMarkdown(stripDartdoc(comment)));
//     buf.writeln();
//   }

//   var exportNamespace = library.exportNamespace;
//   var elements =
//       exportNamespace.definedNames.values.where((element) => isPublic(element));

//   for (var element in elements) {
//     if (element is! ExecutableElement) continue;
//     emitExecutableElement(element, buf);
//   }

//   for (var element in elements) {
//     if (element is! ClassElement) continue;
//     emitInterfaceElement(element, buf);
//   }

//   for (var element in elements) {
//     if (element is! EnumElement) continue;
//     emitInterfaceElement(element, buf);
//   }

//   destFile.parent.createSync(recursive: true);
//   destFile.writeAsStringSync('${buf.toString().trimRight()}\n');
// }

// void emitInterfaceElement(InterfaceElement element, StringBuffer buf) {
//   var title = element is EnumElement ? 'Enum' : 'Class';
//   var kind = element is EnumElement ? 'enum' : 'class';
//   var modifiers = '';
//   if (element is ClassElement) {
//     modifiers = element.isAbstract ? 'abstract ' : '';
//   }
//   buf.writeln('## $title ${element.name}');
//   buf.writeln();
//   buf.writeln('```dart');
//   buf.writeln('$modifiers$kind ${element.name}');
//   buf.writeln('```');
//   buf.writeln();
//   var comment = element.documentationComment;
//   if (comment != null) {
//     buf.writeln(processMarkdown(stripDartdoc(comment)));
//     buf.writeln();
//   }

//   // fields
//   for (var field in element.fields) {
//     if (!isPublic(field)) continue;
//     if (field.isSynthetic) continue;

//     var desc = element is EnumElement ? 'value ' : '';
//     var fieldTypeDesc = field.type.getDisplayString(withNullability: true);
//     var modifiers = field.isFinal ? 'final ' : '';
//     buf.writeln('### $desc${field.name}');
//     buf.writeln();
//     buf.writeln('```dart');
//     buf.writeln(dartFormat('$modifiers$fieldTypeDesc ${field.name}', ';'));
//     buf.writeln('```');
//     buf.writeln();
//     var comment = field.documentationComment;
//     if (comment != null) {
//       buf.writeln(processMarkdown(stripDartdoc(comment)));
//       buf.writeln();
//     }
//   }

//   // constructors
//   for (var ctor in element.constructors) {
//     if (!isPublic(ctor)) continue;

//     var typeDesc = ctor.returnType.getDisplayString(withNullability: true);
//     var paramDesc = describeMethodParameters(ctor.parameters);
//     var name = ctor.isGenerative ? element.name : ctor.name;
//     buf.writeln('### $name()');
//     buf.writeln();
//     buf.writeln('```dart');
//     buf.writeln(dartFormat('$typeDesc ${ctor.name}($paramDesc)', '{}'));
//     buf.writeln('```');
//     buf.writeln();
//     var comment = ctor.documentationComment;
//     if (comment != null) {
//       buf.writeln(processMarkdown(stripDartdoc(comment)));
//       buf.writeln();
//     }
//   }

//   // getters and setters
//   for (var accessor in element.accessors) {
//     if (!isPublic(accessor)) continue;
//     if (accessor.isSynthetic) continue;

//     buf.writeln('### ${accessor.isGetter ? 'get' : 'set'} ${accessor.name}');
//     buf.writeln();
//     buf.writeln('```dart');
//     if (accessor.isGetter) {
//       var typeDesc =
//           accessor.returnType.getDisplayString(withNullability: true);
//       buf.writeln(dartFormat('$typeDesc get ${accessor.name}', '=> null;'));
//     } else {
//       var paramDesc = describeMethodParameters(accessor.parameters);
//       buf.writeln(dartFormat('set ${accessor.name}($paramDesc)', ';'));
//     }
//     buf.writeln('```');
//     buf.writeln();
//     var comment = accessor.documentationComment;
//     if (comment != null) {
//       buf.writeln(processMarkdown(stripDartdoc(comment)));
//       buf.writeln();
//     }
//   }

//   // methods
//   for (var method in element.methods) {
//     if (!isPublic(method)) continue;

//     var typeDesc = method.returnType.getDisplayString(withNullability: true);
//     var paramDesc = describeMethodParameters(method.parameters);
//     var modifiers = method.isStatic ? 'static ' : '';
//     buf.writeln('### ${method.name}()');
//     buf.writeln();
//     buf.writeln('```dart');
//     buf.writeln(
//         modifiers + dartFormat('$typeDesc ${method.name}($paramDesc)', '{}'));
//     buf.writeln('```');
//     buf.writeln();
//     var comment = method.documentationComment;
//     if (comment != null) {
//       buf.writeln(processMarkdown(stripDartdoc(comment)));
//       buf.writeln();
//     }
//   }
// }

// void emitExecutableElement(ExecutableElement element, StringBuffer buf) {
//   var typeDesc = element.returnType.getDisplayString(withNullability: true);
//   var paramDesc = describeMethodParameters(element.parameters);
//   buf.writeln('## ${element.name}()');
//   buf.writeln();
//   buf.writeln('```dart');
//   buf.writeln(dartFormat('$typeDesc ${element.name}($paramDesc)', '{}'));
//   buf.writeln('```');
//   buf.writeln();
//   var comment = element.documentationComment;
//   if (comment != null) {
//     buf.writeln(processMarkdown(stripDartdoc(comment)));
//     buf.writeln();
//   }
// }

// String describeMethodParameters(List<ParameterElement> parameters) {
//   var buf = StringBuffer();

//   var inNamed = false;
//   var inPositional = false;

//   for (var param in parameters) {
//     if (buf.isNotEmpty) buf.write(', ');

//     if (!inNamed && !inPositional) {
//       if (param.isNamed) {
//         inNamed = true;
//         buf.write('{ ');
//       } else if (param.isOptionalPositional) {
//         inPositional = true;
//         buf.write('[] ');
//       }
//     }

//     param.appendToWithoutDelimiters(buf, withNullability: true);
//   }

//   if (buf.length >= 68) {
//     buf.write(',');
//   }

//   if (inNamed) {
//     buf.write(' }');
//   } else if (inPositional) {
//     buf.write(' ]');
//   }

//   return buf.toString();
// }
