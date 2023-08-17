import 'package:flutter/material.dart';
import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:mvu_layer/mvu.dart';

import 'all/all_model.dart';
import 'all/all_widget.dart';

void main() => runApp(TodoApp(service: LoadTodoService()));

class TodoApp extends StatelessWidget {
  final LoadTodoService _service;

  TodoApp({required LoadTodoService service}) : _service = service;




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
            body: MVUBuilder.withArg(_service, init: AllMessenger.init, update: AllMessenger.update, view: AllWidget.builder)
            ));
  }
}
