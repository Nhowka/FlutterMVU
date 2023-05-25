import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_model.dart';
import 'package:mvu_layer/mvu.dart';

sealed class CounterMsg {}
class Increment implements CounterMsg {}
class IncrementDelayed implements CounterMsg {}
class Decrement implements CounterMsg {}
class _IncrementDelayed implements CounterMsg {}
class Reset implements CounterMsg {}

class CounterMessenger {

  static (CounterModel, Cmd<CounterMsg>) get init => (CounterModel(), Cmd.none());

  static (CounterModel, Cmd<CounterMsg>) update(CounterMsg msg, CounterModel model) =>
        switch (msg) {
    Increment() => (model.rebuild((b) => b.value = model.value + 1), Cmd.none()),
    IncrementDelayed() => (model.rebuild((b) => b.valueFuture = model.valueFuture + 1), Cmd.ofFunc(()=> Future.delayed(Duration(seconds: 5)), onMissing: _IncrementDelayed())),
    Decrement() => (model.rebuild((b) => b.value = model.value - 1), Cmd.none()),
    Reset() => init,
    _IncrementDelayed() => (model.rebuild((b) => b.valueFuture == 0
        ? b
        : (b
      ..valueFuture = model.valueFuture - 1
      ..value = model.value + 1)), Cmd.none())
        };
}
