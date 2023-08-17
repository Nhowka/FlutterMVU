import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mvu_layer/mvu.dart';

const ButtonKey = ValueKey("Button");

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WidgetsApp(
      color: Colors.black,
      builder: (_, __) => MVUBuilder<int, bool>(
          init: () => (0, Cmd.none()),
          update: (bool increase, int model) =>
              (increase ? model + 1 : model, Cmd.none()),
          view: (ctx, model, dispatcher) => Column(children: [
                Text("$model"),
                TextButton(
                    key: ButtonKey,
                    child: Text("Increment"),
                    onPressed: () => dispatcher(true))
              ])));
}

void main() {
  testWidgets('Incrementing works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TestWidget());
    await tester.pumpAndSettle();
    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);
    await tester.tap(find.byKey(ButtonKey));
    await tester.pumpAndSettle();
    expect(find.text("0"), findsNothing);
    expect(find.text("1"), findsOneWidget);
  });
}
