// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoModel {
  List<TodoItem> get items => throw _privateConstructorUsedError;
  bool get loadingExternal => throw _privateConstructorUsedError;
  int get nextId => throw _privateConstructorUsedError;
  Filter get filter => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call(
      {List<TodoItem> items,
      bool loadingExternal,
      int nextId,
      Filter filter,
      String search});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? loadingExternal = null,
    Object? nextId = null,
    Object? filter = null,
    Object? search = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TodoItem>,
      loadingExternal: null == loadingExternal
          ? _value.loadingExternal
          : loadingExternal // ignore: cast_nullable_to_non_nullable
              as bool,
      nextId: null == nextId
          ? _value.nextId
          : nextId // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$$_TodoModelCopyWith(
          _$_TodoModel value, $Res Function(_$_TodoModel) then) =
      __$$_TodoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TodoItem> items,
      bool loadingExternal,
      int nextId,
      Filter filter,
      String search});
}

/// @nodoc
class __$$_TodoModelCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$_TodoModel>
    implements _$$_TodoModelCopyWith<$Res> {
  __$$_TodoModelCopyWithImpl(
      _$_TodoModel _value, $Res Function(_$_TodoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? loadingExternal = null,
    Object? nextId = null,
    Object? filter = null,
    Object? search = null,
  }) {
    return _then(_$_TodoModel(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TodoItem>,
      loadingExternal: null == loadingExternal
          ? _value.loadingExternal
          : loadingExternal // ignore: cast_nullable_to_non_nullable
              as bool,
      nextId: null == nextId
          ? _value.nextId
          : nextId // ignore: cast_nullable_to_non_nullable
              as int,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TodoModel extends _TodoModel {
  const _$_TodoModel(
      {final List<TodoItem> items = const [],
      this.loadingExternal = false,
      this.nextId = 0,
      this.filter = Filter.ALL,
      this.search = ''})
      : _items = items,
        super._();

  final List<TodoItem> _items;
  @override
  @JsonKey()
  List<TodoItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool loadingExternal;
  @override
  @JsonKey()
  final int nextId;
  @override
  @JsonKey()
  final Filter filter;
  @override
  @JsonKey()
  final String search;

  @override
  String toString() {
    return 'TodoModel(items: $items, loadingExternal: $loadingExternal, nextId: $nextId, filter: $filter, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoModel &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.loadingExternal, loadingExternal) ||
                other.loadingExternal == loadingExternal) &&
            (identical(other.nextId, nextId) || other.nextId == nextId) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      loadingExternal,
      nextId,
      filter,
      search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoModelCopyWith<_$_TodoModel> get copyWith =>
      __$$_TodoModelCopyWithImpl<_$_TodoModel>(this, _$identity);
}

abstract class _TodoModel extends TodoModel {
  const factory _TodoModel(
      {final List<TodoItem> items,
      final bool loadingExternal,
      final int nextId,
      final Filter filter,
      final String search}) = _$_TodoModel;
  const _TodoModel._() : super._();

  @override
  List<TodoItem> get items;
  @override
  bool get loadingExternal;
  @override
  int get nextId;
  @override
  Filter get filter;
  @override
  String get search;
  @override
  @JsonKey(ignore: true)
  _$$_TodoModelCopyWith<_$_TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
