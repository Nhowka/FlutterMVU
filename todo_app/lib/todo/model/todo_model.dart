import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:todoapp/todo/model/todo_item_model.dart';

part 'todo_model.g.dart';

enum Filter { COMPLETED, NOT_COMPLETED, ALL }

// Describes the model, with some helpers getters

abstract class TodoModel implements Built<TodoModel, TodoModelBuilder> {
  static Serializer<TodoModel> get serializer => _$todoModelSerializer;

  static void _initializeBuilder(TodoModelBuilder builder) => builder
    ..loadingExternal = false
    ..search = ''
    ..nextId = 0
    ..filter = Filter.ALL;

  BuiltList<TodoItem> get items;
  bool get loadingExternal;
  int get nextId;
  Filter get filter;
  String get search;

  Iterable<TodoItem> get completed =>
      this.items.where((todo) => todo.completed);
  Iterable<TodoItem> get notCompleted =>
      this.items.where((todo) => !todo.completed);
  BuiltList<TodoItem> get filtered => (this.filter == Filter.ALL
          ? items
          : (this.filter == Filter.COMPLETED ? completed : notCompleted))
      .where((todo) =>
          todo.content.toLowerCase().contains(search?.toLowerCase() ?? ''))
      .toBuiltList();

  TodoModel._();
  factory TodoModel([void Function(TodoModelBuilder) updates]) = _$TodoModel;
}
