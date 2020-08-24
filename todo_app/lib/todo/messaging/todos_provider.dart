import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/model/todo_model.dart';

class TodoProvider extends MsgProvider<TodoModel> {
  TodoProvider({AllMessenger messenger, child})
      : super(messenger: messenger.todoMessenger, child: child);
}
