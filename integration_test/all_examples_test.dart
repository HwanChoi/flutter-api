import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_api_samples/main.dart';
import 'package:flutter_api_samples/examples.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-end test', () {
    testWidgets('Verify all examples load without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(const ExampleListApp());
      await tester.pumpAndSettle();

      // Find all ListTile widgets, which represent the examples.
      final Finder listTileFinder = find.byType(ListTile);
      final int numberOfExamples = tester.widgetList(listTileFinder).length;

      expect(numberOfExamples, greaterThan(0)); // Ensure there's at least one example

      // Iterate through each example and tap it.
      for (int i = 0; i < numberOfExamples; i++) {
        // Scroll to the item if it's not visible
        await tester.ensureVisible(listTileFinder.at(i));
        await tester.pumpAndSettle();

        // Get the title of the example to print for debugging
        final ListTile listTile = tester.widget(listTileFinder.at(i));
        final Text titleWidget = listTile.title! as Text;
        final String examplePath = titleWidget.data!;

        print('Testing example: $examplePath');

        // Tap the example
        await tester.tap(listTileFinder.at(i));
        await tester.pumpAndSettle(); // Wait for the example to load

        // Verify that the example screen is loaded (e.g., by checking its AppBar title)
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.text(examplePath), findsOneWidget);

        // Go back to the list
        await tester.pageBack();
        await tester.pumpAndSettle(); // Wait for the list to reload

        // Verify we are back on the example list screen
        expect(find.text('Flutter API Examples'), findsOneWidget);
      }
    });
  });
}
