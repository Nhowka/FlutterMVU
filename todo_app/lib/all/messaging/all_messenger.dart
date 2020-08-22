import 'package:todoapp/all/model/all_model.dart';
import 'package:todoapp/counter/messaging/counter_messenger.dart';
import 'package:todoapp/counter/model/counter_model.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/messaging/todos_messenger.dart';
import 'package:todoapp/todo/model/todo_model.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';

// Defines the message input and outputs
abstract class AllMsg extends BehaviorMsg<AllModel, AllMsg> {
  static WrapperAllMsg<TodoModel, TodoMsg> fromTodo(
      BehaviorMsg<TodoModel, TodoMsg> msg) =>
      WrapperAllMsg(TodoMessenger.mapToChild, TodoMessenger.merge, msg);
  static WrapperAllMsg<CounterModel, CounterMsg> fromCounter(
      BehaviorMsg<CounterModel, CounterMsg> msg) =>
      WrapperAllMsg(CounterMessenger.mapToChild, CounterMessenger.merge, msg);
}

class WrapperAllMsg<ChildModel,
        ChildMsg extends BehaviorMsg<ChildModel, ChildMsg>>
    extends MappedMsg<AllModel, AllMsg, ChildModel, ChildMsg> {
  WrapperAllMsg(mapToChild, merge, ChildMsg msg)
      : super(mapToChild, merge, msg);

}

class AllMessenger extends Messenger<AllModel, AllMsg> {
  final LoadTodoService _todoService;
  AllMessenger(this._todoService) : super(init(_todoService));

  static Update<AllModel, AllMsg> init(LoadTodoService service) {
    final counterInit = CounterMessenger.init;
    final todoInit = TodoMessenger.init(service);
    return Update(
        AllModel((b) => b
          ..counter = counterInit.model.toBuilder()
          ..todos = todoInit.model.toBuilder()),
        commands: Cmd.batch([
          Cmd.fmap(AllMsg.fromCounter, counterInit.commands),
          Cmd.fmap(AllMsg.fromTodo, todoInit.commands)
        ]));
  }

  CounterMessenger get counterMessenger => new CounterMessenger(this);
  TodoMessenger get todoMessenger => new TodoMessenger(_todoService, this);
  void changePage(Pages page) => dispatcher(ChangePage(page));
}

class ChangePage extends AllMsg {
  final Pages page;

  ChangePage(this.page);

  @override
  Update<AllModel, AllMsg> runNext(AllModel model) =>
      Update(model.rebuild((b) => b.page = page));
}
