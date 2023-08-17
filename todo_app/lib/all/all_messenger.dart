import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_messenger.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/todo/todos_messenger.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';

sealed class AllMsg {}

class CMsg implements AllMsg {
  final CounterMsg msg;

  CMsg(this.msg);
}

class TMsg implements AllMsg {
  final TodoMsg msg;

  TMsg(this.msg);
}

class ChangePage implements AllMsg {
  final Pages? page;

  ChangePage(this.page);
}

class AllMessenger {
  final LoadTodoService _todoService;

  AllMessenger(this._todoService);

  static (AllModel, Cmd<AllMsg>) init(LoadTodoService service) {
    final (counterInit, counterCmds) = CounterMessenger.init;
    final (todoInit, todoCmds) = TodoMessenger.init(service);
    return (
      AllModel((b) => b
        ..counter = counterInit.toBuilder()
        ..todos = todoInit.toBuilder()),
      Cmd.batch([
        Cmd.map(counterCmds, CMsg.new),
        Cmd.map(todoCmds, TMsg.new),
      ])
    );
  }

  static (AllModel, Cmd<AllMsg>) update(AllMsg msg, AllModel model) =>
      switch (msg) {
    ChangePage(:var page) => (model.rebuild((b) => b.page = page), Cmd.none()),
        TMsg(:var msg) => TodoMessenger.update(msg, model.todos).map(
                (innerModel) =>
                model.rebuild((p0) => p0..todos = innerModel.toBuilder()),
            TMsg.new),
        CMsg(:var msg) => CounterMessenger.update(msg, model.counter).map(
            (innerModel) =>
                model.rebuild((p0) => p0..counter = innerModel.toBuilder()),
            CMsg.new),
      };

}
