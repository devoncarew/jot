import 'package:path/path.dart' as p;

const _mimeMap = {
  'css': 'text/css',
  'html': 'text/html',
  'js': 'text/javascript',
  'json': 'application/json',
  'png': 'image/png',
  'svg': 'image/svg+xml',
};

Map<String, Object> headersFor(String path) {
  var ext = p.extension(path).toLowerCase();
  var mime =
      (ext.startsWith('.') ? _mimeMap[ext.substring(1)] : null) ?? 'text/plain';
  return {'content-type': mime};
}
