import 'package:flutter/material.dart';
import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:mvu_layer/mvu_layer.dart';

import 'all/all_model.dart';
import 'all/all_widget.dart';

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
            body: MsgProvider<AllMessenger, AllModel>(
              messenger: AllMessenger(_service),
              child: MsgConnector<AllMessenger, AllModel>(
                  builder: AllWidget.builder),
            )));
  }
}
