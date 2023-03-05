import 'dart:io';

import 'package:args/args.dart';
import 'package:jot/jot.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  var parser = createArgsParser();
  ArgResults results;

  try {
    results = parser.parse(args);
  } catch (e) {
    // todo:
    printUsage(parser, e);
    exit(64);
  }

  bool help = results['help'];
  if (help) {
    printUsage(parser);
    exit(0);
  }

  var rest = results.rest;
  var inDir = rest.isEmpty ? Directory.current : Directory(rest.first);
  if (!inDir.existsSync()) {
    stderr.writeln("error: '${inDir.path}' does not exist.");
    exit(1);
  }

  Directory outDir;
  if (results.wasParsed('output')) {
    outDir = Directory(results['output']);
  } else {
    outDir = Directory(p.join(inDir.path, results['output']));
  }

  var jot = Jot(inDir: inDir, outDir: outDir);
  await jot.generate();
}

ArgParser createArgsParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this command help.',
    )
    ..addOption(
      'output',
      abbr: 'o',
      defaultsTo: 'doc/api',
      help: 'Configure the output directory.',
    );
}

void printUsage(ArgParser parser, [Object? error]) {
  if (error != null) {
    print(error);
  } else {
    print('Generate API documentation for Dart projects.');
  }

  print('');

  print('usage: dart bin/jot.dart <options> [<directory>]');
  print('');
  print(parser.usage);
}
