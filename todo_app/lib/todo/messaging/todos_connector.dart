import 'package:flutter/widgets.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/messaging/todos_messenger.dart';
import 'package:todoapp/todo/model/todo_model.dart';

class TodoConnector extends MsgConnector<TodoMessenger, TodoModel> {
  TodoConnector({Key key, MsgWidgetBuilder<TodoModel, TodoMessenger> builder})
      : super(key: key, builder: builder);
}
