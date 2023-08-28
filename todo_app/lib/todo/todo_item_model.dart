import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_model.freezed.dart';
part 'todo_item_model.g.dart';

// Describes the model of the to do items
@freezed
class TodoItem with _$TodoItem {
  const TodoItem._();
  const factory TodoItem({
    @Default(false) bool completed,
    @JsonKey(name: 'title') required String content,
    @Default(0) int id,
    @Default(false) bool isEditing,
    @JsonKey(includeFromJson: false)
    void Function()? isDeleted,
}) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) => _$TodoItemFromJson(json);

}