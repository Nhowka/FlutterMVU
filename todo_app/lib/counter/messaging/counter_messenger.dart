import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:todoapp/all/model/all_model.dart';
import 'package:todoapp/counter/model/counter_model.dart';
import 'package:mvu_layer/mvu_layer.dart';

class CounterMessenger extends MappedMessenger<AllModel, CounterModel> {
  CounterMessenger(AllMessenger parent) : super(parent, mapToChild, merge);

  static Update<CounterModel> get init => Update(CounterModel());

  static CounterModel mapToChild(AllModel m) => m.counter;

  static AllModel merge(AllModel m, CounterModel cm) =>
      m.rebuild((b) => b.counter = cm.toBuilder());

  void increment() => modelDispatcher(
      (CounterModel model) => model.rebuild((b) => b.value += 1));

  void incrementDelayed() => dispatcher((CounterModel model) => Update(
      model.rebuild((b) => b.valueFuture += 1),
      commands: Cmd.ofAsyncModelMsg(Future.delayed(
          Duration(seconds: 5),
          () => (CounterModel model) => model.rebuild((b) => b.valueFuture == 0
              ? b
              : (b
                ..valueFuture -= 1
                ..value += 1))))));
  void decrement() => modelDispatcher(
      (CounterModel model) => model.rebuild((b) => b.value -= 1));

  @override
  void reset() => dispatcher((_) => init);
}
