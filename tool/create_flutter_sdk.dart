import 'dart:io';

import 'package:args/args.dart';
import 'package:cli_util/cli_logging.dart';
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
  var sdkDir = rest.isEmpty ? detectSdk : Directory(rest.first);
  if (!sdkDir.existsSync()) {
    stderr.writeln("error: '${sdkDir.path}' does not exist.");
    exit(1);
  }

  validateFlutterSdk(sdkDir);

  var outDir = Directory(results['output'] as String);

  await generate(sdkDir, outDir);
}

Directory get detectSdk {
  final vm = Platform.resolvedExecutable;
  // <dart-sdk>/bin/dart
  return Directory(p.dirname(p.dirname(vm)));
}

void printUsage(ArgParser parser, [Object? error]) {
  if (error != null) {
    print(error);
  } else {
    print('Generate API documentation for the Flutter SDK.');
  }

  print('');

  print('usage: dart tool/create_flutter_sdk.dart <options> [<sdk directory>]');
  print('');
  print(parser.usage);
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
      defaultsTo: 'doc/sdk',
      help: 'Configure the output directory.',
    );
}

void validateFlutterSdk(Directory sdk) {
  // bin/
  // packages/
  // packages/flutter/pubspec.yaml

  // todo: also validate whether pub get has been run for the packages

  var binDir = Directory(p.join(sdk.path, 'bin'));
  if (!binDir.existsSync()) {
    stderr.writeln('Invalid SDK (${sdk.path}) - missing bin/ directory');
    exit(1);
  }

  var packagesDir = File(p.join(sdk.path, 'packages'));
  if (!packagesDir.existsSync()) {
    stderr.writeln('Invalid SDK (${sdk.path}) - missing packages/ directory');
    exit(1);
  }

  var flutterPubspec =
      File(p.join(sdk.path, 'packages', 'flutter', 'pubspec.yaml]'));
  if (!flutterPubspec.existsSync()) {
    stderr.writeln(
        'Invalid SDK (${sdk.path}) - missing packages/flutter/pubspec.yaml file');
    exit(1);
  }
}

Future<void> generate(Directory sdkDir, Directory outDir) async {
  var log = Logger.standard();

  if (!outDir.existsSync()) outDir.createSync(recursive: true);

  log.write('todo: generate docs for the flutter SDK');
}
