import 'package:flutter/material.dart';
import 'package:todoapp/counter/messaging/counter_provider.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/messaging/todos_provider.dart';
import 'package:mvu_layer/mvu_layer.dart';

import 'all/messaging/all_provider.dart';
import 'all/view/all_widget.dart';

void main() => runApp(TodoApp(service: LoadTodoService()));

class TodoApp extends StatelessWidget {
  final LoadTodoService _service;

  TodoApp({service}) : _service = service;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar:
                AppBar(backgroundColor: Colors.lightGreen, title: Text("=)")),
            body: MsgProviderTree(
              providers: () {
                final all = AllProvider(service: _service);
                final todo = TodoProvider(messenger: all.messenger);
                final counter = CounterProvider(messenger: all.messenger);
                return <MsgProvider>[all, todo, counter];
              }(),
              child: AllWidget(),
            )));
  }
}
