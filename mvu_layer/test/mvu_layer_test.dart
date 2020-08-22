import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mvu_layer/mvu_layer.dart';

abstract class TestMsg extends BehaviorMsg<int, TestMsg> {}

class Increment extends TestMsg {
  @override
  Update<int, TestMsg> runNext(int model) {
    return Update(model + 1);
  }
}

class TestMessenger extends Messenger<int, TestMsg> {
  TestMessenger() : super(Update(0));

  void increment() => dispatcher(Increment());
}

const ButtonKey = ValueKey("Button");

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WidgetsApp(
      color: Colors.black,
      builder: (_, __) => MsgProvider<int, TestMsg>(
          messenger: TestMessenger(),
          child: MsgConnector<TestMessenger, int, TestMsg>(
              builder: (ctx, msg, model) => Column(children: [
                    Text("$model"),
                    FlatButton(
                        key: ButtonKey,
                        child: Text("Increment"),
                        onPressed: () => msg.increment())
                  ]))));
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
