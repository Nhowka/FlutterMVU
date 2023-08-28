import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_messenger.dart';
import 'package:todoapp/todo/todos_messenger.dart';

part 'all_messenger.freezed.dart';

@freezed
sealed class AllMsg with _$AllMsg {
  const factory AllMsg.counterMsg(CounterMsg msg) = CMsg;
  const factory AllMsg.todoMsg(TodoMsg msg) = TMsg;
  const factory AllMsg.changePage(Pages? page) = ChangePage;
}
