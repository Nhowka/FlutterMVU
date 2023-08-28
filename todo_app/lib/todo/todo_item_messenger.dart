import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:async/async.dart';
import 'package:todoapp/todo/todo_item_model.dart';

part 'todo_item_messenger.freezed.dart';

@freezed
sealed class TodoItemMsg with _$TodoItemMsg {
  const factory TodoItemMsg.queueDelete(int id) = QueueDelete;
  const factory TodoItemMsg.delete(int id) = Delete;
  const factory TodoItemMsg.undoDelete(int id) = UndoDelete;
  const factory TodoItemMsg.toggleComplete(int id) = ToggleComplete;
  const factory TodoItemMsg.startEdit(int id) = StartEdit;
  const factory TodoItemMsg.setContent(int id, String content) = SetContent;
  const factory TodoItemMsg.setCancellation(int id, void Function() cancel) =
      _SetCancellation;
  const factory TodoItemMsg.cancel(int id) = _Cancel;
}


class TodoItemMessenger {
  static (TodoItem, Cmd<TodoItemMsg>) init(int id, String content) => (
        TodoItem(id: id, content: content),
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
              final r = await cancellable.valueOrCancellation(_Cancel(id));
              if (r != null) {
                dispatch(r);
              }
            })
          ),
        _Cancel() => (
            item.copyWith(isDeleted: null),
            Cmd.none()
          ),
        _SetCancellation(:var cancel) => (
            item.copyWith(isDeleted: cancel),
            Cmd.none()
          ),
        UndoDelete() => (
            item,
            Cmd.ofEffect((_) => item.isDeleted?.call())
          ),
        ToggleComplete() => (
            item.copyWith(completed: item.completed != true),
            Cmd.none()
          ),
        StartEdit() => (item.copyWith(isEditing: true), Cmd.none()),
        SetContent(:var content) => (
            item.copyWith(
              isEditing: false,
              content: content),
            Cmd.none()
          ),
        Delete() =>
          // Captured on the parent
          (item, Cmd.none())
      };
}
