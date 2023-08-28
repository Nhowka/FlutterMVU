// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_messenger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoMsg {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoMsgCopyWith<$Res> {
  factory $TodoMsgCopyWith(TodoMsg value, $Res Function(TodoMsg) then) =
      _$TodoMsgCopyWithImpl<$Res, TodoMsg>;
}

/// @nodoc
class _$TodoMsgCopyWithImpl<$Res, $Val extends TodoMsg>
    implements $TodoMsgCopyWith<$Res> {
  _$TodoMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TIMsgCopyWith<$Res> {
  factory _$$TIMsgCopyWith(_$TIMsg value, $Res Function(_$TIMsg) then) =
      __$$TIMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoItemMsg msg});

  $TodoItemMsgCopyWith<$Res> get msg;
}

/// @nodoc
class __$$TIMsgCopyWithImpl<$Res> extends _$TodoMsgCopyWithImpl<$Res, _$TIMsg>
    implements _$$TIMsgCopyWith<$Res> {
  __$$TIMsgCopyWithImpl(_$TIMsg _value, $Res Function(_$TIMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$TIMsg(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as TodoItemMsg,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoItemMsgCopyWith<$Res> get msg {
    return $TodoItemMsgCopyWith<$Res>(_value.msg, (value) {
      return _then(_value.copyWith(msg: value));
    });
  }
}

/// @nodoc

class _$TIMsg implements TIMsg {
  const _$TIMsg(this.msg);

  @override
  final TodoItemMsg msg;

  @override
  String toString() {
    return 'TodoMsg.todoItemMsg(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TIMsg &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TIMsgCopyWith<_$TIMsg> get copyWith =>
      __$$TIMsgCopyWithImpl<_$TIMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return todoItemMsg(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return todoItemMsg?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (todoItemMsg != null) {
      return todoItemMsg(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return todoItemMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return todoItemMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (todoItemMsg != null) {
      return todoItemMsg(this);
    }
    return orElse();
  }
}

abstract class TIMsg implements TodoMsg {
  const factory TIMsg(final TodoItemMsg msg) = _$TIMsg;

  TodoItemMsg get msg;
  @JsonKey(ignore: true)
  _$$TIMsgCopyWith<_$TIMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadErrorCopyWith<$Res> {
  factory _$$DownloadErrorCopyWith(
          _$DownloadError value, $Res Function(_$DownloadError) then) =
      __$$DownloadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadErrorCopyWithImpl<$Res>
    extends _$TodoMsgCopyWithImpl<$Res, _$DownloadError>
    implements _$$DownloadErrorCopyWith<$Res> {
  __$$DownloadErrorCopyWithImpl(
      _$DownloadError _value, $Res Function(_$DownloadError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadError implements DownloadError {
  const _$DownloadError();

  @override
  String toString() {
    return 'TodoMsg.downloadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return downloadError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return downloadError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (downloadError != null) {
      return downloadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return downloadError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return downloadError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (downloadError != null) {
      return downloadError(this);
    }
    return orElse();
  }
}

abstract class DownloadError implements TodoMsg {
  const factory DownloadError() = _$DownloadError;
}

/// @nodoc
abstract class _$$LoadedItemsCopyWith<$Res> {
  factory _$$LoadedItemsCopyWith(
          _$LoadedItems value, $Res Function(_$LoadedItems) then) =
      __$$LoadedItemsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TodoItem> loadedItems});
}

/// @nodoc
class __$$LoadedItemsCopyWithImpl<$Res>
    extends _$TodoMsgCopyWithImpl<$Res, _$LoadedItems>
    implements _$$LoadedItemsCopyWith<$Res> {
  __$$LoadedItemsCopyWithImpl(
      _$LoadedItems _value, $Res Function(_$LoadedItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedItems = null,
  }) {
    return _then(_$LoadedItems(
      null == loadedItems
          ? _value._loadedItems
          : loadedItems // ignore: cast_nullable_to_non_nullable
              as List<TodoItem>,
    ));
  }
}

/// @nodoc

class _$LoadedItems implements LoadedItems {
  const _$LoadedItems(final List<TodoItem> loadedItems)
      : _loadedItems = loadedItems;

  final List<TodoItem> _loadedItems;
  @override
  List<TodoItem> get loadedItems {
    if (_loadedItems is EqualUnmodifiableListView) return _loadedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loadedItems);
  }

  @override
  String toString() {
    return 'TodoMsg.loadedItems(loadedItems: $loadedItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedItems &&
            const DeepCollectionEquality()
                .equals(other._loadedItems, _loadedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_loadedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedItemsCopyWith<_$LoadedItems> get copyWith =>
      __$$LoadedItemsCopyWithImpl<_$LoadedItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return loadedItems(this.loadedItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return loadedItems?.call(this.loadedItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (loadedItems != null) {
      return loadedItems(this.loadedItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return loadedItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return loadedItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (loadedItems != null) {
      return loadedItems(this);
    }
    return orElse();
  }
}

abstract class LoadedItems implements TodoMsg {
  const factory LoadedItems(final List<TodoItem> loadedItems) = _$LoadedItems;

  List<TodoItem> get loadedItems;
  @JsonKey(ignore: true)
  _$$LoadedItemsCopyWith<_$LoadedItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTodoCopyWith<$Res> {
  factory _$$AddTodoCopyWith(_$AddTodo value, $Res Function(_$AddTodo) then) =
      __$$AddTodoCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$AddTodoCopyWithImpl<$Res>
    extends _$TodoMsgCopyWithImpl<$Res, _$AddTodo>
    implements _$$AddTodoCopyWith<$Res> {
  __$$AddTodoCopyWithImpl(_$AddTodo _value, $Res Function(_$AddTodo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$AddTodo(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddTodo implements AddTodo {
  const _$AddTodo(this.content);

  @override
  final String content;

  @override
  String toString() {
    return 'TodoMsg.addTodo(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodo &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoCopyWith<_$AddTodo> get copyWith =>
      __$$AddTodoCopyWithImpl<_$AddTodo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return addTodo(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return addTodo?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return addTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return addTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(this);
    }
    return orElse();
  }
}

abstract class AddTodo implements TodoMsg {
  const factory AddTodo(final String content) = _$AddTodo;

  String get content;
  @JsonKey(ignore: true)
  _$$AddTodoCopyWith<_$AddTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetSearchCopyWith<$Res> {
  factory _$$SetSearchCopyWith(
          _$SetSearch value, $Res Function(_$SetSearch) then) =
      __$$SetSearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$SetSearchCopyWithImpl<$Res>
    extends _$TodoMsgCopyWithImpl<$Res, _$SetSearch>
    implements _$$SetSearchCopyWith<$Res> {
  __$$SetSearchCopyWithImpl(
      _$SetSearch _value, $Res Function(_$SetSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$SetSearch(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetSearch implements SetSearch {
  const _$SetSearch(this.content);

  @override
  final String content;

  @override
  String toString() {
    return 'TodoMsg.setSearch(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetSearch &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetSearchCopyWith<_$SetSearch> get copyWith =>
      __$$SetSearchCopyWithImpl<_$SetSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return setSearch(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return setSearch?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (setSearch != null) {
      return setSearch(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return setSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return setSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (setSearch != null) {
      return setSearch(this);
    }
    return orElse();
  }
}

abstract class SetSearch implements TodoMsg {
  const factory SetSearch(final String content) = _$SetSearch;

  String get content;
  @JsonKey(ignore: true)
  _$$SetSearchCopyWith<_$SetSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetFilterCopyWith<$Res> {
  factory _$$SetFilterCopyWith(
          _$SetFilter value, $Res Function(_$SetFilter) then) =
      __$$SetFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$SetFilterCopyWithImpl<$Res>
    extends _$TodoMsgCopyWithImpl<$Res, _$SetFilter>
    implements _$$SetFilterCopyWith<$Res> {
  __$$SetFilterCopyWithImpl(
      _$SetFilter _value, $Res Function(_$SetFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$SetFilter(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$SetFilter implements SetFilter {
  const _$SetFilter(this.filter);

  @override
  final Filter filter;

  @override
  String toString() {
    return 'TodoMsg.setFilter(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetFilter &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetFilterCopyWith<_$SetFilter> get copyWith =>
      __$$SetFilterCopyWithImpl<_$SetFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return setFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return setFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (setFilter != null) {
      return setFilter(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return setFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return setFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (setFilter != null) {
      return setFilter(this);
    }
    return orElse();
  }
}

abstract class SetFilter implements TodoMsg {
  const factory SetFilter(final Filter filter) = _$SetFilter;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$SetFilterCopyWith<_$SetFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearByFilterCopyWith<$Res> {
  factory _$$ClearByFilterCopyWith(
          _$ClearByFilter value, $Res Function(_$ClearByFilter) then) =
      __$$ClearByFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$ClearByFilterCopyWithImpl<$Res>
    extends _$TodoMsgCopyWithImpl<$Res, _$ClearByFilter>
    implements _$$ClearByFilterCopyWith<$Res> {
  __$$ClearByFilterCopyWithImpl(
      _$ClearByFilter _value, $Res Function(_$ClearByFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$ClearByFilter(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$ClearByFilter implements ClearByFilter {
  const _$ClearByFilter(this.filter);

  @override
  final Filter filter;

  @override
  String toString() {
    return 'TodoMsg.clearByFilter(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearByFilter &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearByFilterCopyWith<_$ClearByFilter> get copyWith =>
      __$$ClearByFilterCopyWithImpl<_$ClearByFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemMsg msg) todoItemMsg,
    required TResult Function() downloadError,
    required TResult Function(List<TodoItem> loadedItems) loadedItems,
    required TResult Function(String content) addTodo,
    required TResult Function(String content) setSearch,
    required TResult Function(Filter filter) setFilter,
    required TResult Function(Filter filter) clearByFilter,
  }) {
    return clearByFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TodoItemMsg msg)? todoItemMsg,
    TResult? Function()? downloadError,
    TResult? Function(List<TodoItem> loadedItems)? loadedItems,
    TResult? Function(String content)? addTodo,
    TResult? Function(String content)? setSearch,
    TResult? Function(Filter filter)? setFilter,
    TResult? Function(Filter filter)? clearByFilter,
  }) {
    return clearByFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemMsg msg)? todoItemMsg,
    TResult Function()? downloadError,
    TResult Function(List<TodoItem> loadedItems)? loadedItems,
    TResult Function(String content)? addTodo,
    TResult Function(String content)? setSearch,
    TResult Function(Filter filter)? setFilter,
    TResult Function(Filter filter)? clearByFilter,
    required TResult orElse(),
  }) {
    if (clearByFilter != null) {
      return clearByFilter(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TIMsg value) todoItemMsg,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(LoadedItems value) loadedItems,
    required TResult Function(AddTodo value) addTodo,
    required TResult Function(SetSearch value) setSearch,
    required TResult Function(SetFilter value) setFilter,
    required TResult Function(ClearByFilter value) clearByFilter,
  }) {
    return clearByFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TIMsg value)? todoItemMsg,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(LoadedItems value)? loadedItems,
    TResult? Function(AddTodo value)? addTodo,
    TResult? Function(SetSearch value)? setSearch,
    TResult? Function(SetFilter value)? setFilter,
    TResult? Function(ClearByFilter value)? clearByFilter,
  }) {
    return clearByFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TIMsg value)? todoItemMsg,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(LoadedItems value)? loadedItems,
    TResult Function(AddTodo value)? addTodo,
    TResult Function(SetSearch value)? setSearch,
    TResult Function(SetFilter value)? setFilter,
    TResult Function(ClearByFilter value)? clearByFilter,
    required TResult orElse(),
  }) {
    if (clearByFilter != null) {
      return clearByFilter(this);
    }
    return orElse();
  }
}

abstract class ClearByFilter implements TodoMsg {
  const factory ClearByFilter(final Filter filter) = _$ClearByFilter;

  Filter get filter;
  @JsonKey(ignore: true)
  _$$ClearByFilterCopyWith<_$ClearByFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
