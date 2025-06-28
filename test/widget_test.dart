import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphyapp/main.dart' as app;

void main() {
  testWidgets('App initializes and shows a widget', (WidgetTester tester) async {
    // Start the app
    app.main();
    await tester.pumpAndSettle();

    // Example: verify the presence of a text
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
