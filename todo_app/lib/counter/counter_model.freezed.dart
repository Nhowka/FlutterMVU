// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterModel {
  int get value => throw _privateConstructorUsedError;
  int get valueFuture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterModelCopyWith<CounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterModelCopyWith<$Res> {
  factory $CounterModelCopyWith(
          CounterModel value, $Res Function(CounterModel) then) =
      _$CounterModelCopyWithImpl<$Res, CounterModel>;
  @useResult
  $Res call({int value, int valueFuture});
}

/// @nodoc
class _$CounterModelCopyWithImpl<$Res, $Val extends CounterModel>
    implements $CounterModelCopyWith<$Res> {
  _$CounterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? valueFuture = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueFuture: null == valueFuture
          ? _value.valueFuture
          : valueFuture // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CounterModelCopyWith<$Res>
    implements $CounterModelCopyWith<$Res> {
  factory _$$_CounterModelCopyWith(
          _$_CounterModel value, $Res Function(_$_CounterModel) then) =
      __$$_CounterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, int valueFuture});
}

/// @nodoc
class __$$_CounterModelCopyWithImpl<$Res>
    extends _$CounterModelCopyWithImpl<$Res, _$_CounterModel>
    implements _$$_CounterModelCopyWith<$Res> {
  __$$_CounterModelCopyWithImpl(
      _$_CounterModel _value, $Res Function(_$_CounterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? valueFuture = null,
  }) {
    return _then(_$_CounterModel(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueFuture: null == valueFuture
          ? _value.valueFuture
          : valueFuture // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CounterModel extends _CounterModel {
  const _$_CounterModel({this.value = 0, this.valueFuture = 0}) : super._();

  @override
  @JsonKey()
  final int value;
  @override
  @JsonKey()
  final int valueFuture;

  @override
  String toString() {
    return 'CounterModel(value: $value, valueFuture: $valueFuture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CounterModel &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueFuture, valueFuture) ||
                other.valueFuture == valueFuture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, valueFuture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CounterModelCopyWith<_$_CounterModel> get copyWith =>
      __$$_CounterModelCopyWithImpl<_$_CounterModel>(this, _$identity);
}

abstract class _CounterModel extends CounterModel {
  const factory _CounterModel({final int value, final int valueFuture}) =
      _$_CounterModel;
  const _CounterModel._() : super._();

  @override
  int get value;
  @override
  int get valueFuture;
  @override
  @JsonKey(ignore: true)
  _$$_CounterModelCopyWith<_$_CounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
