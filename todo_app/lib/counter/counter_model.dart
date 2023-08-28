import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_model.freezed.dart';

@freezed

class CounterModel with _$CounterModel {
  const CounterModel._();
  const factory CounterModel({
    @Default(0) int value,
    @Default(0) int valueFuture,
  }) = _CounterModel;
}
