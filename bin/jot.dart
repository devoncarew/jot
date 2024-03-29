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
    printUsage(parser, e);
    exit(64);
  }

  var help = results['help'] as bool;
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
    outDir = Directory(results['output'] as String);
  } else {
    outDir = Directory(p.join(inDir.path, results['output'] as String));
  }

  int? servePort;
  if (results.wasParsed('serve')) {
    servePort = int.tryParse(results['serve'] as String);
  }

  final signature = results['signature'] as bool;

  var jot = Jot(inDir: inDir, outDir: outDir, signature: signature);

  if (servePort == null) {
    await jot.generate();
  } else {
    await jot.serve(servePort);
  }
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
    )
    ..addFlag(
      'signature',
      aliases: ['sig'],
      negatable: false,
      help: 'Write the package API in markdown format to doc/sig.',
    )
    ..addOption(
      'serve',
      valueHelp: 'port',
      help: 'Serve live docs from the documented package.\nThis serves on '
          'localhost and is useful for previewing docs while working on them.',
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
