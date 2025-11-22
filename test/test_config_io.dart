import 'dart:async';
import 'goldens_io.dart' as flutter_goldens;

Future<void> testExecutable(FutureOr<void> Function() testMain) {
  return flutter_goldens.testExecutable(testMain, namePrefix: 'api');
}
