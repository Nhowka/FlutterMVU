// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:example/page/counter/view.dart';
import 'package:example/page/counter/update.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(WidgetsApp(
      color: const Color(-1),
      builder: (_, __) => CounterProvider(child: MVUContext(view: view)),
    ));
    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);
    await tester.tap(find.byKey(const ValueKey('Increment')));
    await tester.pumpAndSettle();
    expect(find.text("0"), findsNothing);
    expect(find.text("1"), findsOneWidget);
  });
}
