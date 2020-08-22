import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:todoapp/all/model/all_model.dart';
import 'package:todoapp/counter/model/counter_model.dart';
import 'package:mvu_layer/mvu_layer.dart';

// Defines the message input and outputs
abstract class CounterMsg implements BehaviorMsg<CounterModel, CounterMsg> {}

class CounterMessenger
    extends MappedMessenger<AllModel, AllMsg, CounterModel, CounterMsg> {
  CounterMessenger(AllMessenger parent) : super(parent, mapToChild, merge);

  static Update<CounterModel, CounterMsg> get init => Update(CounterModel());

  static CounterModel mapToChild(AllModel m) => m.counter;

  static AllModel merge(AllModel m, CounterModel cm) =>
      m.rebuild((b) => b.counter = cm.toBuilder());

  void increment() => dispatcher(Increment());
  void incrementDelayed() => dispatcher(StartIncrementDelayed());
  void decrement() => dispatcher(Decrement());

  @override
  void reset() => dispatcher(ResetMsg(init));
}

class Increment implements CounterMsg {
  @override
  Update<CounterModel, CounterMsg> runNext(CounterModel model) =>
      Update(model.rebuild((b) => b.value += 1));
}

class StartIncrementDelayed implements CounterMsg {
  @override
  Update<CounterModel, CounterMsg> runNext(CounterModel model) =>
      Update(model.rebuild((b) => b.valueFuture += 1),
          commands: Cmd.ofAsyncMsg(
              Future.delayed(Duration(seconds: 5), () => _IncrementDelayed())));
}

class _IncrementDelayed implements CounterMsg {
  @override
  Update<CounterModel, CounterMsg> runNext(CounterModel model) =>
      Update(model.rebuild((b) => b.valueFuture == 0
          ? b
          : (b
            ..valueFuture -= 1
            ..value += 1)));
}

class Decrement implements CounterMsg {
  @override
  Update<CounterModel, CounterMsg> runNext(CounterModel model) =>
      Update(model.rebuild((b) => b.value -= 1));
}
