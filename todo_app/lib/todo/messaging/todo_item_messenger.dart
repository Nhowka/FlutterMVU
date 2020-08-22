import 'package:optional/optional_internal.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/messaging/todos_messenger.dart';
import 'package:todoapp/todo/model/todo_item_model.dart';
import 'package:todoapp/todo/model/todo_model.dart';

class TodoItemMessenger
    extends MappedMessenger<TodoModel, TodoMsg, TodoItem, TodoItemMsg> {
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
  void queueDelete() => dispatcher(QueueDeleteItem());

  // Implements the message with behaviour to cancel an item deletion
  void undoDelete() => dispatcher(UndoDeleteItem());

  // Implements the message with behaviour to change the completion state of the item
  void toggleComplete() => dispatcher(ToggleComplete());

  // Implements the message with behaviour to start editing an item
  void startEdit() => dispatcher(StartEdit());

  // Implements the message with behaviour to finish editing and setting the item's content
  void setContent(String content) => dispatcher(SetContent(content));

  @override
  void reset() {}
}

abstract class TodoItemMsg extends BehaviorMsg<TodoItem, TodoItemMsg> {}

class SetSearch extends TodoMsg {
  final String content;

  SetSearch(this.content);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) =>
      Update(model.rebuild((b) => b.search = content));
}

class QueueDeleteItem extends TodoItemMsg {
  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) => Update(model,
      commands: Cmd.ofCancelableMsg(
          (cancel) => _AddCancellation(cancel),
          Future.delayed(Duration(seconds: 4), () => _DeleteItem()),
          _CancelledDeleteItem()));
}

class _AddCancellation extends TodoItemMsg {
  final void Function() cancel;

  _AddCancellation(this.cancel);

  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) =>
      Update(model.rebuild((b) => b.isDeleted = Optional.of(cancel)));
}

class UndoDeleteItem extends TodoItemMsg {
  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) => Update(model,
      commands: Cmd.ofAction(() => model.isDeleted.ifPresent((c) => c())));
}

class _CancelledDeleteItem extends TodoItemMsg {
  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) =>
      Update(model.rebuild((ib) => ib.isDeleted = Optional.empty()));
}

class _DeleteItem extends TodoItemMsg {
  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) => Update(null);
}

class StartEdit extends TodoItemMsg {
  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) =>
      Update(model.rebuild((ib) => ib.isEditing = true));
}

class ToggleComplete extends TodoItemMsg {
  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) =>
      Update(model.rebuild((ib) => ib.completed = !ib.completed));
}

class SetContent extends TodoItemMsg {
  final String content;

  SetContent(this.content);

  @override
  Update<TodoItem, TodoItemMsg> runNext(TodoItem model) =>
      Update(model.rebuild((ib) => ib
        ..isEditing = false
        ..content = content));
}
