import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_model.dart';
import 'package:mvu_layer/mvu_layer.dart';

class CounterMessenger extends MappedMessenger<AllMessenger, AllModel, CounterModel> {
  CounterMessenger(AllMessenger parent) : super(parent, mapToChild, merge);

  static Update<CounterModel> get init => Update(CounterModel());

  static CounterModel mapToChild(AllModel m) => m.counter;

  static AllModel merge(AllModel m, CounterModel cm) =>
      m.rebuild((b) => b.counter = cm.toBuilder());

  void increment() => modelDispatcher(
      (CounterModel model) => model.rebuild((b) => b.value = model.value + 1));

  void incrementDelayed() => dispatcher((CounterModel model) => Update(
      model.rebuild((b) => b.valueFuture = model.valueFuture + 1),
      commands: Cmd.ofModelMsg(Future.delayed(
          Duration(seconds: 5),
          () => (CounterModel model) => model.rebuild((b) => b.valueFuture == 0
              ? b
              : (b
                ..valueFuture = model.valueFuture - 1
                ..value = model.value + 1))))));
  void decrement() => modelDispatcher(
      (CounterModel model) => model.rebuild((b) => b.value = model.value - 1));

  @override
  void reset() => dispatcher((_) => init);
}
