import 'package:optional/optional_internal.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:async/async.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_model.dart';

sealed class TodoItemMsg {
  final int id;

  TodoItemMsg(this.id);
}

class QueueDelete implements TodoItemMsg {
  final int id;

  QueueDelete(this.id);
}

class Delete implements TodoItemMsg {
  final int id;

  Delete(this.id);
}

class UndoDelete implements TodoItemMsg {
  final int id;

  UndoDelete(this.id);
}

class ToggleComplete implements TodoItemMsg {
  final int id;

  ToggleComplete(this.id);
}

class StartEdit implements TodoItemMsg {
  final int id;

  StartEdit(this.id);
}

class SetContent implements TodoItemMsg {
  final int id;
  final String content;

  SetContent(this.id, this.content);
}

class _SetCancellation implements TodoItemMsg {
  final int id;
  final void Function() cancel;

  _SetCancellation(this.id, this.cancel);
}

class _Cancell implements TodoItemMsg {
  final int id;

  _Cancell(this.id);
}

class TodoItemMessenger {
  static (TodoItem, Cmd<TodoItemMsg>) init(int id, String content) => (
        TodoItem((b) => b
          ..id = id
          ..content = content),
        Cmd.none()
      );

  static (TodoItem, Cmd<TodoItemMsg>) update(TodoItemMsg msg, TodoItem item) =>
      switch (msg) {
        QueueDelete(:var id) => (
            item,
            Cmd.ofEffect((dispatch) async {
              final cancellable = CancelableOperation<TodoItemMsg>.fromFuture(
                  Future.delayed(Duration(seconds: 4), () => Delete(id)));
              dispatch(_SetCancellation(id, cancellable.cancel));
              final r = await cancellable.valueOrCancellation(_Cancell(id));
              if (r != null) {
                dispatch(r);
              }
            })
          ),
        _Cancell() => (
            item.rebuild((p0) => p0.isDeleted = Optional.empty()),
            Cmd.none()
          ),
        _SetCancellation(:var cancel) => (
            item.rebuild((p0) => p0.isDeleted = Optional.of(cancel)),
            Cmd.none()
          ),
        UndoDelete() => (
            item,
            Cmd.ofEffect((_) => item.isDeleted.ifPresent((c) => c()))
          ),
        ToggleComplete() => (
            item.rebuild((ib) => ib.completed = ib.completed != true),
            Cmd.none()
          ),
        StartEdit() => (item.rebuild((ib) => ib.isEditing = true), Cmd.none()),
        SetContent(:var content) => (
            item.rebuild((ib) => ib
              ..isEditing = false
              ..content = content),
            Cmd.none()
          ),
        Delete() =>
          // Captured on the parent
          (item, Cmd.none())
      };
}
