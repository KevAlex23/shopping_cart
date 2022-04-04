import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kev_commerce/main.dart';


void main() {
  testWidgets("Given a button in HomeView appbar when it's pressed then navigate to CartView", (WidgetTester tester) async {
    // assemble
    await tester.pumpWidget(const MyApp());
    final iconButton = find.byType(AppBar);

    // act
    await tester.press(iconButton);
    await tester.tap(iconButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // assert
    final text = find.byKey(const ValueKey("My Cart View"));
    expect(text, findsOneWidget);
  });
}
