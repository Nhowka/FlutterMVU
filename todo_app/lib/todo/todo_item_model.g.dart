// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodoItem> _$todoItemSerializer = new _$TodoItemSerializer();

class _$TodoItemSerializer implements StructuredSerializer<TodoItem> {
  @override
  final Iterable<Type> types = const [TodoItem, _$TodoItem];
  @override
  final String wireName = 'TodoItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodoItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'completed',
      serializers.serialize(object.completed,
          specifiedType: const FullType(bool)),
      'title',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'isEditing',
      serializers.serialize(object.isEditing,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TodoItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'title':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'isEditing':
          result.isEditing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TodoItem extends TodoItem {
  @override
  final bool completed;
  @override
  final String content;
  @override
  final int id;
  @override
  final bool isEditing;
  @override
  final Optional<void Function()> isDeleted;

  factory _$TodoItem([void Function(TodoItemBuilder)? updates]) =>
      (new TodoItemBuilder()..update(updates)).build();

  _$TodoItem._(
      {required this.completed,
      required this.content,
      required this.id,
      required this.isEditing,
      required this.isDeleted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(completed, 'TodoItem', 'completed');
    BuiltValueNullFieldError.checkNotNull(content, 'TodoItem', 'content');
    BuiltValueNullFieldError.checkNotNull(id, 'TodoItem', 'id');
    BuiltValueNullFieldError.checkNotNull(isEditing, 'TodoItem', 'isEditing');
    BuiltValueNullFieldError.checkNotNull(isDeleted, 'TodoItem', 'isDeleted');
  }

  @override
  TodoItem rebuild(void Function(TodoItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoItemBuilder toBuilder() => new TodoItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is TodoItem &&
        completed == other.completed &&
        content == other.content &&
        id == other.id &&
        isEditing == other.isEditing &&
        isDeleted == _$dynamicOther.isDeleted;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, completed.hashCode), content.hashCode), id.hashCode),
            isEditing.hashCode),
        isDeleted.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoItem')
          ..add('completed', completed)
          ..add('content', content)
          ..add('id', id)
          ..add('isEditing', isEditing)
          ..add('isDeleted', isDeleted))
        .toString();
  }
}

class TodoItemBuilder implements Builder<TodoItem, TodoItemBuilder> {
  _$TodoItem? _$v;

  bool? _completed;
  bool? get completed => _$this._completed;
  set completed(bool? completed) => _$this._completed = completed;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _isEditing;
  bool? get isEditing => _$this._isEditing;
  set isEditing(bool? isEditing) => _$this._isEditing = isEditing;

  Optional<void Function()>? _isDeleted;
  Optional<void Function()>? get isDeleted => _$this._isDeleted;
  set isDeleted(Optional<void Function()>? isDeleted) =>
      _$this._isDeleted = isDeleted;

  TodoItemBuilder() {
    TodoItem._initializeBuilder(this);
  }

  TodoItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _completed = $v.completed;
      _content = $v.content;
      _id = $v.id;
      _isEditing = $v.isEditing;
      _isDeleted = $v.isDeleted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoItem;
  }

  @override
  void update(void Function(TodoItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoItem build() {
    final _$result = _$v ??
        new _$TodoItem._(
            completed: BuiltValueNullFieldError.checkNotNull(
                completed, 'TodoItem', 'completed'),
            content: BuiltValueNullFieldError.checkNotNull(
                content, 'TodoItem', 'content'),
            id: BuiltValueNullFieldError.checkNotNull(id, 'TodoItem', 'id'),
            isEditing: BuiltValueNullFieldError.checkNotNull(
                isEditing, 'TodoItem', 'isEditing'),
            isDeleted: BuiltValueNullFieldError.checkNotNull(
                isDeleted, 'TodoItem', 'isDeleted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
