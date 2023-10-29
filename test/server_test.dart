import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:http/http.dart' as http;
import 'package:jot/jot.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  group('server', () {
    late final DocServer server;
    late final Directory tempDir;

    setUpAll(() async {
      final sourceDir = Directory(p.join('test', 'demo'));
      tempDir = Directory.systemTemp.createTempSync('jot');

      final jot = Jot(inDir: sourceDir, outDir: tempDir, logger: NullLogger());
      server = await jot.serve(0);
    });

    tearDownAll(() async {
      tempDir.deleteSync(recursive: true);
      await server.dispose();
    });

    test('index.html', () async {
      final response =
          await http.read(Uri.http('localhost:${server.port}', 'index.html'));
      expect(response, contains('<title>package:demo</title>'));
    });

    test('a.html', () async {
      var response =
          await http.read(Uri.http('localhost:${server.port}', 'a.html'));
      expect(response, contains('<h1>a.dart</h1>'));
      expect(response, contains('bar('));
      expect(response, contains('Classes'));

      response =
          await http.read(Uri.http('localhost:${server.port}', 'a/A.html'));
      expect(response, contains('<h1>A</h1>'));
      expect(response, contains('class A'));
      expect(response, contains('foo()'));
    });

    test('b.html', () async {
      final response =
          await http.read(Uri.http('localhost:${server.port}', 'b.html'));
      expect(response, contains('<h1>b.dart</h1>'));
      expect(response, contains('baz('));
      expect(response, isNot(contains('Classes')));
    });
  });
}

class NullLogger implements Logger {
  final Ansi _ansi = Ansi(false);

  @override
  Ansi get ansi => _ansi;

  @override
  void flush() {}

  @override
  bool get isVerbose => false;

  @override
  Progress progress(String message) => NullProgress(message);

  @override
  void stderr(String message) {}

  @override
  void stdout(String message) {}

  @override
  void trace(String message) {}

  @override
  void write(String message) {}

  @override
  void writeCharCode(int charCode) {}
}

class NullProgress implements Progress {
  @override
  final String message;

  final Stopwatch _timer = Stopwatch()..start();

  NullProgress(this.message);

  @override
  void cancel() {}

  @override
  Duration get elapsed => _timer.elapsed;

  @override
  void finish({String? message, bool showTiming = false}) {
    _timer.stop();
  }
}
