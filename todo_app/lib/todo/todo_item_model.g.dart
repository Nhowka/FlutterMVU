// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItem _$$_TodoItemFromJson(Map<String, dynamic> json) => _$_TodoItem(
      completed: json['completed'] as bool? ?? false,
      content: json['title'] as String,
      id: json['id'] as int? ?? 0,
      isEditing: json['isEditing'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoItemToJson(_$_TodoItem instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'title': instance.content,
      'id': instance.id,
      'isEditing': instance.isEditing,
    };
