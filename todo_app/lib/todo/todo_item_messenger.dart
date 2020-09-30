import 'package:optional/optional_internal.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/todos_messenger.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_model.dart';

class TodoItemMessenger extends MappedMessenger<TodoModel, TodoItem> {
  TodoItemMessenger(TodoMessenger original, int id)
      : super(original, mapToChild(id), merge(id));

  static ToChild<TodoModel, TodoItem> mapToChild(id) =>
      (model) => model.items.firstWhere((e) => e.id == id);

  static Merger<TodoModel, TodoItem> merge(int id) =>
      (model, item) => model.rebuild((t) {
            if (item == null) {
              t.items.removeWhere((i) => i.id == id);
            } else {
              t.items.map((original) => original.id == id ? item : original);
            }
          });

  // Implements the message with behaviour to queue a delete items by id
  void queueDelete() => dispatcher((TodoItem model) => Update(model,
      commands: Cmd.ofCancelableModelMsg(
          (cancel) => (TodoItem model) =>
              model.rebuild((b) => b.isDeleted = Optional.of(cancel)),
          Future.delayed(Duration(seconds: 4), () => (TodoItem model) => null),
          (TodoItem model) =>
              model.rebuild((ib) => ib.isDeleted = Optional.empty()))));

  // Implements the message with behaviour to cancel an item deletion
  void undoDelete() => doWithModel((TodoItem model) =>
      model.isDeleted.ifPresent((c) => c()));

  // Implements the message with behaviour to change the completion state of the item
  void toggleComplete() => modelDispatcher(
      (model) => model.rebuild((ib) => ib.completed = !ib.completed));

  // Implements the message with behaviour to start editing an item
  void startEdit() =>
      modelDispatcher((model) => model.rebuild((ib) => ib.isEditing = true));

  // Implements the message with behaviour to finish editing and setting the item's content
  void setContent(String content) =>
      modelDispatcher((TodoItem model) => model.rebuild((ib) => ib
        ..isEditing = false
        ..content = content));

  @override
  void reset() {}
}
