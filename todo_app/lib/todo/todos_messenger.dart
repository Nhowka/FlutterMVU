import 'package:built_collection/built_collection.dart';
import 'package:async/async.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/todo/todo_item_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_model.dart';

sealed class TodoMsg {}

class TIMsg implements TodoMsg {
  final TodoItemMsg msg;

  TIMsg(this.msg);
}

class DownloadError implements TodoMsg {}

class LoadedItems implements TodoMsg {
  final BuiltList<TodoItem> loadedItems;

  LoadedItems(this.loadedItems);
}

class AddTodo implements TodoMsg {
  final String content;

  AddTodo(this.content);
}

class SetSearch implements TodoMsg {
  final String content;

  SetSearch(this.content);
}

class SetFilter implements TodoMsg {
  final Filter filter;

  SetFilter(this.filter);
}

class ClearByFilter implements TodoMsg {
  final Filter filter;

  ClearByFilter(this.filter);
}

class TodoMessenger {

  static (TodoModel, Cmd<TodoMsg>) init(LoadTodoService service) => (
        TodoModel((b) => b.loadingExternal = true),
        Cmd.ofFunc(service.loadTodos,
            onSuccess: LoadedItems.new, onException: (_) => DownloadError()),
      );

  static (TodoModel, Cmd<TodoMsg>) update(TodoMsg msg, TodoModel model) =>
      switch (msg) {
        TIMsg(msg: Delete(:var id)) => (
            model.rebuild((p0) => p0.items.removeWhere((p0) => p0.id == id)),
            Cmd.none()
          ),
        TIMsg(:var msg) => (){
          final  m =
            model.items.map((item) => item.id == msg.id?
            TodoItemMessenger.update(msg, item):
            (item, Cmd.none<TodoItemMsg>()));

          return (model.rebuild((p0) => p0.items = m.map((e) => e.$1).toBuiltList().toBuilder()),
                    Cmd.map(Cmd.batch(m.map((e) => e.$2)), TIMsg.new));

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
                .where((item) => item.isDeleted.isEmpty)
                .map((e) => Cmd.ofMsg(TIMsg(QueueDelete(e.id)))))
          ),
        SetFilter(:var filter) => (
            model.rebuild((b) => b.filter = filter),
            Cmd.none()
          ),
        SetSearch(:var content) => (
            model.rebuild((b) => b.search = content),
            Cmd.none()
          ),
        AddTodo(:var content) => (
            content.trim().length == 0 || model.loadingExternal
                ? model
                : model.rebuild((b) => b
                  ..nextId = model.nextId + 1
                  ..items.insert(
                      0,
                      TodoItem((i) => i
                        ..content = content
                        ..id = model.nextId))),
            Cmd.none()
          ),
        DownloadError() => (
            model.rebuild((b) => b.loadingExternal = false),
            Cmd.none()
          ),
        LoadedItems(:var loadedItems) => (
            model.rebuild((b) => b
              ..items.addAll(loadedItems)
              ..nextId = loadedItems.last.id + 1
              ..loadingExternal = false),
            Cmd.none()
          )
      };

}
