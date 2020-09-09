import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mvu_layer/mvu_layer.dart';

class TestMessenger extends Messenger<int> {
  TestMessenger() : super(Update(0));

  void increment() => modelDispatcher((model) => model + 1);
}

const ButtonKey = ValueKey("Button");

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WidgetsApp(
      color: Colors.black,
      builder: (_, __) => MsgBuilder<TestMessenger, int>(
          messenger: TestMessenger(),
          builder: (ctx, msg, model) => Column(children: [
                Text("$model"),
                FlatButton(
                    key: ButtonKey,
                    child: Text("Increment"),
                    onPressed: msg.increment)
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

  test('Check if works in out of order', () async {
    final msg = TestMessenger();
    msg.dispatcher((_) => Update(42,
        commands: Cmd.ofFunc(
            () => Future.delayed(Duration(seconds: 8), () => 25),
            onSuccessModel: (_, r) => r)));

    await Future.delayed(Duration(seconds: 4));
    expect(42, msg.firstModel);
    msg.dispatcher((_) => Update(33));
    await Future.delayed(Duration(seconds: 2));
    expect(33, msg.firstModel);
    await Future.delayed(Duration(seconds: 6));
    expect(25, msg.firstModel);
  });
}
