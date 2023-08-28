// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllModel {
  Pages get page => throw _privateConstructorUsedError;
  TodoModel get todos => throw _privateConstructorUsedError;
  CounterModel get counter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllModelCopyWith<AllModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllModelCopyWith<$Res> {
  factory $AllModelCopyWith(AllModel value, $Res Function(AllModel) then) =
      _$AllModelCopyWithImpl<$Res, AllModel>;
  @useResult
  $Res call({Pages page, TodoModel todos, CounterModel counter});

  $TodoModelCopyWith<$Res> get todos;
  $CounterModelCopyWith<$Res> get counter;
}

/// @nodoc
class _$AllModelCopyWithImpl<$Res, $Val extends AllModel>
    implements $AllModelCopyWith<$Res> {
  _$AllModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? todos = null,
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Pages,
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as TodoModel,
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as CounterModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<$Res> get todos {
    return $TodoModelCopyWith<$Res>(_value.todos, (value) {
      return _then(_value.copyWith(todos: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CounterModelCopyWith<$Res> get counter {
    return $CounterModelCopyWith<$Res>(_value.counter, (value) {
      return _then(_value.copyWith(counter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllModelCopyWith<$Res> implements $AllModelCopyWith<$Res> {
  factory _$$_AllModelCopyWith(
          _$_AllModel value, $Res Function(_$_AllModel) then) =
      __$$_AllModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pages page, TodoModel todos, CounterModel counter});

  @override
  $TodoModelCopyWith<$Res> get todos;
  @override
  $CounterModelCopyWith<$Res> get counter;
}

/// @nodoc
class __$$_AllModelCopyWithImpl<$Res>
    extends _$AllModelCopyWithImpl<$Res, _$_AllModel>
    implements _$$_AllModelCopyWith<$Res> {
  __$$_AllModelCopyWithImpl(
      _$_AllModel _value, $Res Function(_$_AllModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? todos = null,
    Object? counter = null,
  }) {
    return _then(_$_AllModel(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Pages,
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as TodoModel,
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as CounterModel,
    ));
  }
}

/// @nodoc

class _$_AllModel extends _AllModel {
  const _$_AllModel(
      {this.page = Pages.COUNTER,
      this.todos = const TodoModel(),
      this.counter = const CounterModel()})
      : super._();

  @override
  @JsonKey()
  final Pages page;
  @override
  @JsonKey()
  final TodoModel todos;
  @override
  @JsonKey()
  final CounterModel counter;

  @override
  String toString() {
    return 'AllModel(page: $page, todos: $todos, counter: $counter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllModel &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.todos, todos) || other.todos == todos) &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, todos, counter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllModelCopyWith<_$_AllModel> get copyWith =>
      __$$_AllModelCopyWithImpl<_$_AllModel>(this, _$identity);
}

abstract class _AllModel extends AllModel {
  const factory _AllModel(
      {final Pages page,
      final TodoModel todos,
      final CounterModel counter}) = _$_AllModel;
  const _AllModel._() : super._();

  @override
  Pages get page;
  @override
  TodoModel get todos;
  @override
  CounterModel get counter;
  @override
  @JsonKey(ignore: true)
  _$$_AllModelCopyWith<_$_AllModel> get copyWith =>
      throw _privateConstructorUsedError;
}
