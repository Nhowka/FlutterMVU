import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:optional/optional.dart';
import 'package:todoapp/todo/model/serializers.dart';

part 'todo_item_model.g.dart';

// Describes the model of the to do items
abstract class TodoItem implements Built<TodoItem, TodoItemBuilder> {
  static Serializer<TodoItem> get serializer => _$todoItemSerializer;

  static void _initializeBuilder(TodoItemBuilder builder) => builder
    ..completed = false
    ..id = 0
    ..isEditing = false
    ..isDeleted = Optional<void Function()>.empty()
  ;

  bool get completed;
  @BuiltValueField(wireName:'title')
  String get content;
  int get id;
  bool get isEditing;
  @BuiltValueField(serialize: false)
  Optional<void Function()> get isDeleted;

  static TodoItem fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TodoItem.serializer, json);
  }

  TodoItem._();
  factory TodoItem([void Function(TodoItemBuilder) updates]) = _$TodoItem;
}
