import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/counter/counter_model.dart';
import 'package:todoapp/todo/todo_model.dart';

part 'all_model.freezed.dart';

enum Pages { COUNTER, TODO }

@freezed
class AllModel with _$AllModel {
  const AllModel._();

  const factory AllModel({
    @Default(Pages.COUNTER) Pages page,
    @Default(TodoModel()) TodoModel todos,
    @Default(CounterModel()) CounterModel counter,
  }) = _AllModel;
}
