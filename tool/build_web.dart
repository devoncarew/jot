import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:crypto/crypto.dart';

void main(List<String> args) async {
  var argsParser = ArgParser()
    ..addFlag(
      'verify',
      negatable: false,
      help:
          'Verify the compilation signature against lib/resources/script.sig.',
    );

  var argsResult = argsParser.parse(args);

  final shouldVerify = argsResult['verify'] as bool;
  if (shouldVerify) {
    await verify();
  } else {
    await build();
  }
}

Future<void> build() async {
  // dart compile js -o lib/resources/script.js
  var params = [
    'compile',
    'js',
    '-O2',
    '-o',
    'lib/resources/script.js',
    'web/main.dart',
  ];
  print('dart ${params.join(' ')}');
  var result = await Process.run(Platform.resolvedExecutable, params);
  if ((result.stdout as String).trim().isNotEmpty) {
    stdout.write(result.stdout as String);
  }
  if ((result.stderr as String).trim().isNotEmpty) {
    stderr.write(result.stderr as String);
  }
  if (result.exitCode != 0) {
    exit(result.exitCode);
  }

  final sigFile = File('lib/resources/script.sig');
  var sig = await calcSig();
  sigFile.writeAsStringSync('$sig\n');
}

Future<void> verify() async {
  var sig = await calcSig();

  var existing = File('lib/resources/script.sig').readAsStringSync().trim();
  if (existing != sig) {
    stderr.writeln('Compilation artifacts not up-to-date; '
        "re-run 'dart tool/build_web.dart'.");
    exit(1);
  } else {
    print('Compilation artifacts up-to-date.');
  }
}

Future<String> calcSig() async {
  final digest =
      await _fileLines().transform(utf8.encoder).transform(md5).single;

  return digest.bytes
      .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
      .join();
}

Stream<String> _fileLines() async* {
  // Collect lib/ Dart files.
  final files = Directory('web')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .toList()
    ..sort((a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()));

  for (var file in files) {
    for (var line in file.readAsLinesSync()) {
      yield line;
    }
  }
}
