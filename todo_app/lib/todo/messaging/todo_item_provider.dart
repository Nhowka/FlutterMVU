import 'package:flutter/widgets.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/messaging/todos_messenger.dart';
import 'package:todoapp/todo/model/todo_item_model.dart';

class TodoItemProvider extends MsgProvider<TodoItem> {
  TodoItemProvider({TodoMessenger messenger, id, child, key})
      : super(
            messenger: messenger.itemMessenger(id),
            child: child,
            key: ValueKey<int>(id));
}
