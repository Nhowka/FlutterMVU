import 'package:flutter/widgets.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/messaging/todo_item_messenger.dart';
import 'package:todoapp/todo/model/todo_item_model.dart';

class TodoItemConnector
    extends MsgConnector<TodoItemMessenger, TodoItem, TodoItemMsg> {
  TodoItemConnector(
      {Key key, MsgWidgetBuilder<TodoItem, TodoItemMessenger> builder})
      : super(key: key, builder: builder);
}
