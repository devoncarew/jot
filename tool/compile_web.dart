import 'dart:io';

void main(List<String> args) async {
  // todo: support a --verify flag

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
  exit(result.exitCode);
}
