import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:todoapp/all/model/all_model.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/messaging/todo_item_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/model/todo_item_model.dart';
import 'package:todoapp/todo/model/todo_model.dart';

// Defines the message input and outputs
abstract class TodoMsg extends BehaviorMsg<TodoModel, TodoMsg> {}

class WrapperTodoItemMsg
    extends MappedMsg<TodoModel, TodoMsg, TodoItem, TodoItemMsg> {
  WrapperTodoItemMsg(int id, TodoItemMsg msg)
      : super(
            TodoItemMessenger.mapToChild(id), TodoItemMessenger.merge(id), msg);
}

class TodoMessenger
    extends MappedMessenger<AllModel, AllMsg, TodoModel, TodoMsg> {
  final LoadTodoService _service;

  TodoMessenger(this._service, AllMessenger parent)
      : super(parent, mapToChild, merge);

  static TodoModel mapToChild(AllModel m) => m.todos;

  static AllModel merge(AllModel m, TodoModel cm) =>
      m.rebuild((b) => b.todos = cm.toBuilder());

  static Update<TodoModel, TodoMsg> init(LoadTodoService service) =>
      Update(TodoModel(), commands: Cmd.ofMsg(LoadExternalTodos(service)));

  // Implements the message with behaviour to add a new to do item
  void addTodo(String content) => dispatcher(AddTodo(content));

  // Implements the message with behaviour to set a text filter
  void setSearch(String content) => dispatcher(SetSearch(content));

  // Implements the message with behaviour to set a filter
  void setFilter(Filter filter) => dispatcher(SetFilter(filter));

  // Implements the message with behaviour to delete items by the filter
  void clearByFilter(Filter filter) => dispatcher(ClearByFilter(filter));

  TodoItemMessenger itemMessenger(int id) => TodoItemMessenger(this, id);

  @override
  void reset() {
    dispatcher(ResetMsg(init(_service)));
  }
}

class SetSearch extends TodoMsg {
  final String content;

  SetSearch(this.content);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) =>
      Update(model.rebuild((b) => b.search = content));
}

class AddTodo extends TodoMsg {
  final String content;

  AddTodo(this.content);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) => Update(
      content == null || content.trim().length == 0 || model.loadingExternal
          ? model
          : model.rebuild((b) => b
            ..nextId = model.nextId + 1
            ..items.insert(
                0,
                TodoItem((i) => i
                  ..content = content
                  ..id = model.nextId))));
}

class SetFilter extends TodoMsg {
  final Filter filter;

  SetFilter(this.filter);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) =>
      Update(model.rebuild((b) => b.filter = filter));
}

class ClearByFilter extends TodoMsg {
  final Filter filter;

  ClearByFilter(this.filter);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) =>
      Update(model.rebuild((b) {
        switch (filter) {
          case Filter.ALL:
            b.items.clear();
            break;
          case Filter.COMPLETED:
            b.items.removeWhere((i) => i.completed);
            break;
          case Filter.NOT_COMPLETED:
            b.items.removeWhere((i) => !i.completed);
        }
      }));
}

// Implements the message that loads external todos
class LoadExternalTodos extends TodoMsg {
  final LoadTodoService service;

  LoadExternalTodos(this.service);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) => Update(
        model.rebuild((b) => b.loadingExternal = true),
        commands: Cmd.ofAsyncFunc(service.loadTodos,
            onSuccess: (items) => _LoadSuccess(items),
            onError: (ex) => _LoadFailed()),
      );
}

class _LoadSuccess extends TodoMsg {
  final Iterable<TodoItem> loadedItems;

  _LoadSuccess(this.loadedItems);

  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) {
    final maxId = loadedItems.last.id;
    return Update(model.rebuild((b) => b
      ..items.addAll(loadedItems)
      ..nextId = maxId + 1
      ..loadingExternal = false));
  }
}

class _LoadFailed extends TodoMsg {
  @override
  Update<TodoModel, TodoMsg> runNext(TodoModel model) =>
      Update(model.rebuild((b) => b.loadingExternal = false));
}
