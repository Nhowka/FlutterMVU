import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/todo/todo_item_model.dart';

part 'todo_model.freezed.dart';

enum Filter { COMPLETED, NOT_COMPLETED, ALL }

// Describes the model, with some helpers getters
@freezed
class TodoModel with _$TodoModel{
  const TodoModel._();
  const factory TodoModel({
    @Default([]) List<TodoItem> items,
    @Default(false) bool loadingExternal,
    @Default(0) int nextId,
    @Default(Filter.ALL) Filter filter,
    @Default('') String search,
  }) = _TodoModel;

  Iterable<TodoItem> get completed =>
      this.items.where((todo) => todo.completed);
  Iterable<TodoItem> get notCompleted =>
      this.items.where((todo) => !todo.completed);
  List<TodoItem> get filtered => (this.filter == Filter.ALL
      ? items
      : (this.filter == Filter.COMPLETED ? completed : notCompleted))
      .where((todo) =>
      todo.content.toLowerCase().contains(search.toLowerCase()))
      .toList();

}

