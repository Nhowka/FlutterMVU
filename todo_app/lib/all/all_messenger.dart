import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_messenger.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/todos_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';

class AllMessenger extends Messenger<AllModel> {
  final LoadTodoService _todoService;
  AllMessenger(this._todoService) : super(init(_todoService));

  static Update<AllModel> init(LoadTodoService service) {
    final counterInit = CounterMessenger.init;
    final todoInit = TodoMessenger.init(service);
    return Update(
        AllModel((b) => b
          ..counter = counterInit.model.toBuilder()
          ..todos = todoInit.model.toBuilder()),
        commands: Cmd.batch([
          Cmd.fmap(CounterMessenger.mapToChild, CounterMessenger.merge,
              counterInit.commands),
          Cmd.fmap(
              TodoMessenger.mapToChild, TodoMessenger.merge, todoInit.commands)
        ]));
  }

  CounterMessenger get counterMessenger => new CounterMessenger(this);
  TodoMessenger get todoMessenger => new TodoMessenger(_todoService, this);
  void changePage(Pages? page) =>
      modelDispatcher((model) => model.rebuild((b) => b.page = page));
}
