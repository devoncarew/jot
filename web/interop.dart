import 'dart:js_interop';

import 'package:js/js.dart' as js;

@JS('Response')
@js.staticInterop
class FetchResponse {}

extension FetchResponseExtension on FetchResponse {
  external int get status;

  // JSPromise<String>
  external JSPromise text();
}
