import 'dart:async';
import 'goldens_web.dart' as flutter_goldens;

Future<void> testExecutable(FutureOr<void> Function() testMain) {
  return flutter_goldens.testExecutable(testMain);
}
