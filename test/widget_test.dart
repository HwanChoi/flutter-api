import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_api_samples/main.dart';

void main() {
  testWidgets('Example list smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ExampleListApp());

    // Verify that the app bar title is correct.
    expect(find.text('Flutter API Examples'), findsOneWidget);

    // Verify that the list of examples is displayed.
    expect(find.byType(ListTile), findsWidgets);
  });
}
