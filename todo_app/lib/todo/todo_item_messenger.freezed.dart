// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item_messenger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoItemMsg {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoItemMsgCopyWith<TodoItemMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemMsgCopyWith<$Res> {
  factory $TodoItemMsgCopyWith(
          TodoItemMsg value, $Res Function(TodoItemMsg) then) =
      _$TodoItemMsgCopyWithImpl<$Res, TodoItemMsg>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$TodoItemMsgCopyWithImpl<$Res, $Val extends TodoItemMsg>
    implements $TodoItemMsgCopyWith<$Res> {
  _$TodoItemMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueueDeleteCopyWith<$Res>
    implements $TodoItemMsgCopyWith<$Res> {
  factory _$$QueueDeleteCopyWith(
          _$QueueDelete value, $Res Function(_$QueueDelete) then) =
      __$$QueueDeleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$QueueDeleteCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$QueueDelete>
    implements _$$QueueDeleteCopyWith<$Res> {
  __$$QueueDeleteCopyWithImpl(
      _$QueueDelete _value, $Res Function(_$QueueDelete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$QueueDelete(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QueueDelete implements QueueDelete {
  const _$QueueDelete(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TodoItemMsg.queueDelete(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueDelete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueDeleteCopyWith<_$QueueDelete> get copyWith =>
      __$$QueueDeleteCopyWithImpl<_$QueueDelete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return queueDelete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return queueDelete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (queueDelete != null) {
      return queueDelete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return queueDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return queueDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (queueDelete != null) {
      return queueDelete(this);
    }
    return orElse();
  }
}

abstract class QueueDelete implements TodoItemMsg {
  const factory QueueDelete(final int id) = _$QueueDelete;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$QueueDeleteCopyWith<_$QueueDelete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCopyWith<$Res> implements $TodoItemMsgCopyWith<$Res> {
  factory _$$DeleteCopyWith(_$Delete value, $Res Function(_$Delete) then) =
      __$$DeleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$Delete>
    implements _$$DeleteCopyWith<$Res> {
  __$$DeleteCopyWithImpl(_$Delete _value, $Res Function(_$Delete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$Delete(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Delete implements Delete {
  const _$Delete(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TodoItemMsg.delete(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Delete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCopyWith<_$Delete> get copyWith =>
      __$$DeleteCopyWithImpl<_$Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete implements TodoItemMsg {
  const factory Delete(final int id) = _$Delete;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$DeleteCopyWith<_$Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndoDeleteCopyWith<$Res>
    implements $TodoItemMsgCopyWith<$Res> {
  factory _$$UndoDeleteCopyWith(
          _$UndoDelete value, $Res Function(_$UndoDelete) then) =
      __$$UndoDeleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UndoDeleteCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$UndoDelete>
    implements _$$UndoDeleteCopyWith<$Res> {
  __$$UndoDeleteCopyWithImpl(
      _$UndoDelete _value, $Res Function(_$UndoDelete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UndoDelete(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UndoDelete implements UndoDelete {
  const _$UndoDelete(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TodoItemMsg.undoDelete(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndoDelete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UndoDeleteCopyWith<_$UndoDelete> get copyWith =>
      __$$UndoDeleteCopyWithImpl<_$UndoDelete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return undoDelete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return undoDelete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (undoDelete != null) {
      return undoDelete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return undoDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return undoDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (undoDelete != null) {
      return undoDelete(this);
    }
    return orElse();
  }
}

abstract class UndoDelete implements TodoItemMsg {
  const factory UndoDelete(final int id) = _$UndoDelete;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$UndoDeleteCopyWith<_$UndoDelete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleCompleteCopyWith<$Res>
    implements $TodoItemMsgCopyWith<$Res> {
  factory _$$ToggleCompleteCopyWith(
          _$ToggleComplete value, $Res Function(_$ToggleComplete) then) =
      __$$ToggleCompleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ToggleCompleteCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$ToggleComplete>
    implements _$$ToggleCompleteCopyWith<$Res> {
  __$$ToggleCompleteCopyWithImpl(
      _$ToggleComplete _value, $Res Function(_$ToggleComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ToggleComplete(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ToggleComplete implements ToggleComplete {
  const _$ToggleComplete(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TodoItemMsg.toggleComplete(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleComplete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleCompleteCopyWith<_$ToggleComplete> get copyWith =>
      __$$ToggleCompleteCopyWithImpl<_$ToggleComplete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return toggleComplete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return toggleComplete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (toggleComplete != null) {
      return toggleComplete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return toggleComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return toggleComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (toggleComplete != null) {
      return toggleComplete(this);
    }
    return orElse();
  }
}

abstract class ToggleComplete implements TodoItemMsg {
  const factory ToggleComplete(final int id) = _$ToggleComplete;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$ToggleCompleteCopyWith<_$ToggleComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartEditCopyWith<$Res>
    implements $TodoItemMsgCopyWith<$Res> {
  factory _$$StartEditCopyWith(
          _$StartEdit value, $Res Function(_$StartEdit) then) =
      __$$StartEditCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$StartEditCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$StartEdit>
    implements _$$StartEditCopyWith<$Res> {
  __$$StartEditCopyWithImpl(
      _$StartEdit _value, $Res Function(_$StartEdit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$StartEdit(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StartEdit implements StartEdit {
  const _$StartEdit(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TodoItemMsg.startEdit(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartEdit &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartEditCopyWith<_$StartEdit> get copyWith =>
      __$$StartEditCopyWithImpl<_$StartEdit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return startEdit(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return startEdit?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (startEdit != null) {
      return startEdit(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return startEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return startEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (startEdit != null) {
      return startEdit(this);
    }
    return orElse();
  }
}

abstract class StartEdit implements TodoItemMsg {
  const factory StartEdit(final int id) = _$StartEdit;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$StartEditCopyWith<_$StartEdit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetContentCopyWith<$Res>
    implements $TodoItemMsgCopyWith<$Res> {
  factory _$$SetContentCopyWith(
          _$SetContent value, $Res Function(_$SetContent) then) =
      __$$SetContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String content});
}

/// @nodoc
class __$$SetContentCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$SetContent>
    implements _$$SetContentCopyWith<$Res> {
  __$$SetContentCopyWithImpl(
      _$SetContent _value, $Res Function(_$SetContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
  }) {
    return _then(_$SetContent(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetContent implements SetContent {
  const _$SetContent(this.id, this.content);

  @override
  final int id;
  @override
  final String content;

  @override
  String toString() {
    return 'TodoItemMsg.setContent(id: $id, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetContent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetContentCopyWith<_$SetContent> get copyWith =>
      __$$SetContentCopyWithImpl<_$SetContent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return setContent(id, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return setContent?.call(id, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (setContent != null) {
      return setContent(id, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return setContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return setContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (setContent != null) {
      return setContent(this);
    }
    return orElse();
  }
}

abstract class SetContent implements TodoItemMsg {
  const factory SetContent(final int id, final String content) = _$SetContent;

  @override
  int get id;
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$SetContentCopyWith<_$SetContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetCancellationCopyWith<$Res>
    implements $TodoItemMsgCopyWith<$Res> {
  factory _$$_SetCancellationCopyWith(
          _$_SetCancellation value, $Res Function(_$_SetCancellation) then) =
      __$$_SetCancellationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, void Function() cancel});
}

/// @nodoc
class __$$_SetCancellationCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$_SetCancellation>
    implements _$$_SetCancellationCopyWith<$Res> {
  __$$_SetCancellationCopyWithImpl(
      _$_SetCancellation _value, $Res Function(_$_SetCancellation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cancel = null,
  }) {
    return _then(_$_SetCancellation(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == cancel
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$_SetCancellation implements _SetCancellation {
  const _$_SetCancellation(this.id, this.cancel);

  @override
  final int id;
  @override
  final void Function() cancel;

  @override
  String toString() {
    return 'TodoItemMsg.setCancellation(id: $id, cancel: $cancel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetCancellation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cancel, cancel) || other.cancel == cancel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, cancel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCancellationCopyWith<_$_SetCancellation> get copyWith =>
      __$$_SetCancellationCopyWithImpl<_$_SetCancellation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return setCancellation(id, this.cancel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return setCancellation?.call(id, this.cancel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (setCancellation != null) {
      return setCancellation(id, this.cancel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return setCancellation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return setCancellation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (setCancellation != null) {
      return setCancellation(this);
    }
    return orElse();
  }
}

abstract class _SetCancellation implements TodoItemMsg {
  const factory _SetCancellation(final int id, final void Function() cancel) =
      _$_SetCancellation;

  @override
  int get id;
  void Function() get cancel;
  @override
  @JsonKey(ignore: true)
  _$$_SetCancellationCopyWith<_$_SetCancellation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CancelCopyWith<$Res> implements $TodoItemMsgCopyWith<$Res> {
  factory _$$_CancelCopyWith(_$_Cancel value, $Res Function(_$_Cancel) then) =
      __$$_CancelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_CancelCopyWithImpl<$Res>
    extends _$TodoItemMsgCopyWithImpl<$Res, _$_Cancel>
    implements _$$_CancelCopyWith<$Res> {
  __$$_CancelCopyWithImpl(_$_Cancel _value, $Res Function(_$_Cancel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Cancel(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Cancel implements _Cancel {
  const _$_Cancel(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TodoItemMsg.cancel(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cancel &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelCopyWith<_$_Cancel> get copyWith =>
      __$$_CancelCopyWithImpl<_$_Cancel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) queueDelete,
    required TResult Function(int id) delete,
    required TResult Function(int id) undoDelete,
    required TResult Function(int id) toggleComplete,
    required TResult Function(int id) startEdit,
    required TResult Function(int id, String content) setContent,
    required TResult Function(int id, void Function() cancel) setCancellation,
    required TResult Function(int id) cancel,
  }) {
    return cancel(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? queueDelete,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? undoDelete,
    TResult? Function(int id)? toggleComplete,
    TResult? Function(int id)? startEdit,
    TResult? Function(int id, String content)? setContent,
    TResult? Function(int id, void Function() cancel)? setCancellation,
    TResult? Function(int id)? cancel,
  }) {
    return cancel?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? queueDelete,
    TResult Function(int id)? delete,
    TResult Function(int id)? undoDelete,
    TResult Function(int id)? toggleComplete,
    TResult Function(int id)? startEdit,
    TResult Function(int id, String content)? setContent,
    TResult Function(int id, void Function() cancel)? setCancellation,
    TResult Function(int id)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueueDelete value) queueDelete,
    required TResult Function(Delete value) delete,
    required TResult Function(UndoDelete value) undoDelete,
    required TResult Function(ToggleComplete value) toggleComplete,
    required TResult Function(StartEdit value) startEdit,
    required TResult Function(SetContent value) setContent,
    required TResult Function(_SetCancellation value) setCancellation,
    required TResult Function(_Cancel value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueueDelete value)? queueDelete,
    TResult? Function(Delete value)? delete,
    TResult? Function(UndoDelete value)? undoDelete,
    TResult? Function(ToggleComplete value)? toggleComplete,
    TResult? Function(StartEdit value)? startEdit,
    TResult? Function(SetContent value)? setContent,
    TResult? Function(_SetCancellation value)? setCancellation,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueueDelete value)? queueDelete,
    TResult Function(Delete value)? delete,
    TResult Function(UndoDelete value)? undoDelete,
    TResult Function(ToggleComplete value)? toggleComplete,
    TResult Function(StartEdit value)? startEdit,
    TResult Function(SetContent value)? setContent,
    TResult Function(_SetCancellation value)? setCancellation,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel implements TodoItemMsg {
  const factory _Cancel(final int id) = _$_Cancel;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_CancelCopyWith<_$_Cancel> get copyWith =>
      throw _privateConstructorUsedError;
}
