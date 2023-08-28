import 'package:built_collection/built_collection.dart';
import 'package:async/async.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/todo/todo_item_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_model.dart';

part 'todos_messenger.freezed.dart';

@freezed
sealed class TodoMsg with _$TodoMsg {
  const factory TodoMsg.todoItemMsg(TodoItemMsg msg) = TIMsg;

  const factory TodoMsg.downloadError() = DownloadError;

  const factory TodoMsg.loadedItems(List<TodoItem> loadedItems) = LoadedItems;

  const factory TodoMsg.addTodo(String content) = AddTodo;

  const factory TodoMsg.setSearch(String content) = SetSearch;

  const factory TodoMsg.setFilter(Filter filter) = SetFilter;

  const factory TodoMsg.clearByFilter(Filter filter) = ClearByFilter;
}

class TodoMessenger {
  static (TodoModel, Cmd<TodoMsg>) init(LoadTodoService service) => (
        TodoModel(loadingExternal: true),
        Cmd.ofFunc(service.loadTodos,
            onSuccess: LoadedItems.new, onException: (_) => DownloadError()),
      );

  static (TodoModel, Cmd<TodoMsg>) update(TodoMsg msg, TodoModel model) =>
      switch (msg) {
        TIMsg(msg: Delete(:var id)) => (
            model.copyWith(
                items: model.items.where((p0) => p0.id != id).toList()),
            Cmd.none()
          ),
        TIMsg(:var msg) => () {
            final m = model.items.map((item) => item.id == msg.id
                ? TodoItemMessenger.update(msg, item)
                : (item, Cmd.none<TodoItemMsg>()));

            return (
              model.copyWith(items: m.map((e) => e.$1).toList()),
              Cmd.map(Cmd.batch(m.map((e) => e.$2)), TIMsg.new)
            );
          }(),
        ClearByFilter(:var filter) => (
            model,
            Cmd.batch(model.items
                .where((item) {
                  if (filter == Filter.COMPLETED)
                    return item.completed;
                  else if (filter == Filter.NOT_COMPLETED)
                    return !item.completed;
                  else
                    return true;
                })
                .where((item) => item.isDeleted == null)
                .map((e) => Cmd.ofMsg(TIMsg(QueueDelete(e.id)))))
          ),
        SetFilter(:var filter) => (model.copyWith(filter: filter), Cmd.none()),
        SetSearch(:var content) => (
            model.copyWith(search: content),
            Cmd.none()
          ),
        AddTodo(:var content) => (
            content.trim().length == 0 || model.loadingExternal
                ? model
                : model.copyWith(nextId: model.nextId + 1, items: [
                    TodoItem(content: content, id: model.nextId),
                    ...model.items
                  ]),
            Cmd.none()
          ),
        DownloadError() => (model.copyWith(loadingExternal: false), Cmd.none()),
        LoadedItems(:var loadedItems) => (
            model.copyWith(
                items: [...model.items, ...loadedItems],
                nextId: loadedItems.last.id + 1,
                loadingExternal: false),
            Cmd.none()
          )
      };
}
