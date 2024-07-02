import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temperature_conversion_app/main.dart';

void main() {
  testWidgets('Temperature conversion test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TemperatureConverterApp());

    // Verify that the initial state is correct.
    expect(find.text('Converted Value: --'), findsOneWidget);

    // Enter a temperature value.
    await tester.enterText(find.byType(TextField), '32');

    // Tap the 'Convert' button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the conversion result for Fahrenheit to Celsius.
    expect(find.text('Converted Value: 0.00'), findsOneWidget);

    // Change conversion type to Celsius to Fahrenheit.
    await tester.tap(find.text('C to F'));
    await tester.pump();

    // Enter a temperature value.
    await tester.enterText(find.byType(TextField), '0');

    // Tap the 'Convert' button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the conversion result for Celsius to Fahrenheit.
    expect(find.text('Converted Value: 32.00'), findsOneWidget);

    // Check the history.
    expect(find.text('F to C: 32.0 => 0.00'), findsOneWidget);
    expect(find.text('C to F: 0.0 => 32.00'), findsOneWidget);
  });
}
