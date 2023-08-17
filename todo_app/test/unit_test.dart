import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/todo/todos_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_model.dart';

import 'mock_todo_service.dart';

main() {
  LoadTodoService _service;
  late AllMessenger _amsg;
  late TodoMessenger _msg;

  late TodoModel _latestModel = TodoModel();

  setUp(() async {
    _service = MockTodoService();
    final completer = Completer();
    _amsg = AllMessenger(_service);
    //_msg = _amsg.todoMessenger
   //   ..changes.listen((model) {
    //    _latestModel = model;
   //     if (model.loadingExternal == false && !completer.isCompleted) {
   //       completer.complete(null);
  //      }
  //    });
    final _ = await completer.future;
  });

  group('Todo messenger Test', () {
    test(
      'Initial State',
      () async {
        expect(
          _latestModel,
          TodoModel((b) => b
            ..items.addAll(
              List.generate(
                2,
                (index) => TodoItem(
                  (b) {
                    b
                      ..isEditing = false
                      ..id = index
                      ..content = 'Title $index'
                      ..completed = false;
                  },
                ),
              ),
            )
            ..nextId = 2),
        );
      },
    );

    test(
      'Add Todo',
      () async {
        final statesExpected = [];
        // sets loading

        statesExpected.add(_latestModel.rebuild((b) => b
          ..items.insert(
              0,
              TodoItem((b) => b
                ..content = 'Tested Item'
                ..id = 2))
          ..nextId = 3));

        //expectLater(_msg.changes, emitsInAnyOrder(statesExpected));

        // add action
       // _msg.addTodo('Tested Item');
      },
    );
  });
}
