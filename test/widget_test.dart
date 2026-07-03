import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Todo app adds and deletes an item', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Breakfast'), findsOneWidget);
    expect(find.text('Read'), findsNothing);

    await tester.enterText(find.byType(EditableText), 'Read');
    await tester.tap(find.text('Add Todo'));
    await tester.pump();

    expect(find.text('Read'), findsOneWidget);

    await tester.tap(find.widgetWithIcon(IconButton, Icons.delete).last);
    await tester.pump();

    expect(find.text('Read'), findsNothing);
  });
}
