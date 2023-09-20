import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({required int count, required bool timer}) =
      _CounterState;
}

@freezed
sealed class CounterMsgType with _$CounterMsgType {
  const factory CounterMsgType.increment() = Increment;
  const factory CounterMsgType.incrementDelayed() = IncrementDelayed;
  const factory CounterMsgType.decrement() = Decrement;
  const factory CounterMsgType.toggleTimer() = ToggleTimer;
}
