import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/main.dart';

import 'mock_todo_service.dart';

void main() {
  Future initApp(WidgetTester tester) async {
    await tester.pumpWidget(TodoApp(
      service: MockTodoService(),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('You can add some items to do', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await initApp(tester);
    await tester.tap(find.byKey(ValueKey('DropdownButton')));
    await tester.pump();
    await tester.tap(find.byKey(ValueKey(Pages.TODO)).first);
    await tester.pumpAndSettle();
    expect(
      find.byKey(ValueKey<int>(2)),
      findsNothing,
    );
    await tester.enterText(find.byKey(ValueKey<String>("Input")), 'sample todo');
    await tester.pumpAndSettle();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(
      find.byKey(ValueKey<int>(2)),
      findsOneWidget,
    );
  });
}
