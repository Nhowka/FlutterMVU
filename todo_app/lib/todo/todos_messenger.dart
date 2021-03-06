import 'package:built_collection/built_collection.dart';
import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/todo_item_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_model.dart';

class TodoMessenger extends MappedMessenger<AllMessenger, AllModel, TodoModel> {
  final LoadTodoService _service;

  TodoMessenger(this._service, AllMessenger parent)
      : super(parent, mapToChild, merge);

  static TodoModel mapToChild(AllModel m) => m.todos;

  static AllModel merge(AllModel m, TodoModel cm) =>
      m.rebuild((b) => b.todos = cm.toBuilder());

  static Update<TodoModel> init(LoadTodoService service) => Update(
        TodoModel((b) => b.loadingExternal = true),
        commands: Cmd.ofFunc(service.loadTodos,
            onSuccessModel: (model, BuiltList<TodoItem> loadedItems) {
              final maxId = loadedItems.last.id;
              return model.rebuild((b) => b
                ..items.addAll(loadedItems)
                ..nextId = maxId + 1
                ..loadingExternal = false);
            },
            onErrorModel: (model, ex) =>
                model.rebuild((b) => b.loadingExternal = false)),
      );

  // Implements the message with behaviour to add a new to do item
  void addTodo(String content) => modelDispatcher(
      (model) => content.trim().length == 0 || model.loadingExternal
          ? model
          : model.rebuild((b) => b
            ..nextId = model.nextId + 1
            ..items.insert(
                0,
                TodoItem((i) => i
                  ..content = content
                  ..id = model.nextId))));

  // Implements the message with behaviour to set a text filter
  void setSearch(String content) =>
      modelDispatcher((model) => model.rebuild((b) => b.search = content));

  // Implements the message with behaviour to set a filter
  void setFilter(Filter filter) =>
      modelDispatcher((model) => model.rebuild((b) => b.filter = filter));

  // Implements the message with behaviour to delete items by the filter
  void clearByFilter(Filter filter) {
    doWithModel((model) {
      model.items
          .where((item) {
            if (filter == Filter.COMPLETED)
              return item.completed;
            else if (filter == Filter.NOT_COMPLETED)
              return !item.completed;
            else
              return true;
          })
          .where((item) => item.isDeleted.isEmpty)
          .forEach(
              (element) => TodoItemMessenger(this, element.id).queueDelete());
    });
  }

  TodoItemMessenger itemMessenger(int id) => TodoItemMessenger(this, id);

  @override
  void reset() {
    dispatcher((_) => init(_service));
  }
}
