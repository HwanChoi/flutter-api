import 'dart:async';

import 'test_config_io.dart' if (dart.library.js_interop) 'test_config_web.dart' as test_config;

Future<void> testExecutable(FutureOr<void> Function() testMain) {
  return test_config.testExecutable(testMain);
}
