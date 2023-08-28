import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_model.dart';
import 'package:mvu_layer/mvu.dart';

part 'counter_messenger.freezed.dart';

@freezed
sealed class CounterMsg with _$CounterMsg {
  const factory CounterMsg.increment() = Increment;
  const factory CounterMsg.incrementDelayed() = IncrementDelayed;
  const factory CounterMsg.decrement() = Decrement;
  const factory CounterMsg.reset() = Reset;
  const factory CounterMsg.incrementedDelayed() = _IncrementDelayed;

}

class CounterMessenger {

  static (CounterModel, Cmd<CounterMsg>) get init => (CounterModel(), Cmd.none());

  static (CounterModel, Cmd<CounterMsg>) update(CounterMsg msg, CounterModel model) =>
        switch (msg) {
    Increment() => (model.copyWith(value: model.value + 1), Cmd.none()),
    IncrementDelayed() => (model.copyWith(valueFuture: model.valueFuture + 1), Cmd.ofFunc(()=> Future.delayed(Duration(seconds: 5)), onMissing: _IncrementDelayed())),
    Decrement() => (model.copyWith(value: model.value - 1), Cmd.none()),
    Reset() => init,
    _IncrementDelayed() => (model.valueFuture == 0? model : model.copyWith(valueFuture: model.valueFuture - 1,
      value: model.value + 1), Cmd.none())
        };
}
