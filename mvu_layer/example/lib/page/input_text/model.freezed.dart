// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InputTextState {
  String get inputText => throw _privateConstructorUsedError;
  bool get isUpperCase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputTextStateCopyWith<InputTextState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputTextStateCopyWith<$Res> {
  factory $InputTextStateCopyWith(
          InputTextState value, $Res Function(InputTextState) then) =
      _$InputTextStateCopyWithImpl<$Res, InputTextState>;
  @useResult
  $Res call({String inputText, bool isUpperCase});
}

/// @nodoc
class _$InputTextStateCopyWithImpl<$Res, $Val extends InputTextState>
    implements $InputTextStateCopyWith<$Res> {
  _$InputTextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputText = null,
    Object? isUpperCase = null,
  }) {
    return _then(_value.copyWith(
      inputText: null == inputText
          ? _value.inputText
          : inputText // ignore: cast_nullable_to_non_nullable
              as String,
      isUpperCase: null == isUpperCase
          ? _value.isUpperCase
          : isUpperCase // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InputTextStateCopyWith<$Res>
    implements $InputTextStateCopyWith<$Res> {
  factory _$$_InputTextStateCopyWith(
          _$_InputTextState value, $Res Function(_$_InputTextState) then) =
      __$$_InputTextStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String inputText, bool isUpperCase});
}

/// @nodoc
class __$$_InputTextStateCopyWithImpl<$Res>
    extends _$InputTextStateCopyWithImpl<$Res, _$_InputTextState>
    implements _$$_InputTextStateCopyWith<$Res> {
  __$$_InputTextStateCopyWithImpl(
      _$_InputTextState _value, $Res Function(_$_InputTextState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputText = null,
    Object? isUpperCase = null,
  }) {
    return _then(_$_InputTextState(
      null == inputText
          ? _value.inputText
          : inputText // ignore: cast_nullable_to_non_nullable
              as String,
      null == isUpperCase
          ? _value.isUpperCase
          : isUpperCase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InputTextState implements _InputTextState {
  const _$_InputTextState(this.inputText, this.isUpperCase);

  @override
  final String inputText;
  @override
  final bool isUpperCase;

  @override
  String toString() {
    return 'InputTextState(inputText: $inputText, isUpperCase: $isUpperCase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InputTextState &&
            (identical(other.inputText, inputText) ||
                other.inputText == inputText) &&
            (identical(other.isUpperCase, isUpperCase) ||
                other.isUpperCase == isUpperCase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inputText, isUpperCase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InputTextStateCopyWith<_$_InputTextState> get copyWith =>
      __$$_InputTextStateCopyWithImpl<_$_InputTextState>(this, _$identity);
}

abstract class _InputTextState implements InputTextState {
  const factory _InputTextState(
      final String inputText, final bool isUpperCase) = _$_InputTextState;

  @override
  String get inputText;
  @override
  bool get isUpperCase;
  @override
  @JsonKey(ignore: true)
  _$$_InputTextStateCopyWith<_$_InputTextState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InputTextMsgType {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) inputTextChanged,
    required TResult Function(bool value) uppercaseToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? inputTextChanged,
    TResult? Function(bool value)? uppercaseToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? inputTextChanged,
    TResult Function(bool value)? uppercaseToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputTextChanged value) inputTextChanged,
    required TResult Function(UppercaseToggled value) uppercaseToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputTextChanged value)? inputTextChanged,
    TResult? Function(UppercaseToggled value)? uppercaseToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputTextChanged value)? inputTextChanged,
    TResult Function(UppercaseToggled value)? uppercaseToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputTextMsgTypeCopyWith<$Res> {
  factory $InputTextMsgTypeCopyWith(
          InputTextMsgType value, $Res Function(InputTextMsgType) then) =
      _$InputTextMsgTypeCopyWithImpl<$Res, InputTextMsgType>;
}

/// @nodoc
class _$InputTextMsgTypeCopyWithImpl<$Res, $Val extends InputTextMsgType>
    implements $InputTextMsgTypeCopyWith<$Res> {
  _$InputTextMsgTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InputTextChangedCopyWith<$Res> {
  factory _$$InputTextChangedCopyWith(
          _$InputTextChanged value, $Res Function(_$InputTextChanged) then) =
      __$$InputTextChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$InputTextChangedCopyWithImpl<$Res>
    extends _$InputTextMsgTypeCopyWithImpl<$Res, _$InputTextChanged>
    implements _$$InputTextChangedCopyWith<$Res> {
  __$$InputTextChangedCopyWithImpl(
      _$InputTextChanged _value, $Res Function(_$InputTextChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$InputTextChanged(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InputTextChanged implements InputTextChanged {
  const _$InputTextChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'InputTextMsgType.inputTextChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputTextChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputTextChangedCopyWith<_$InputTextChanged> get copyWith =>
      __$$InputTextChangedCopyWithImpl<_$InputTextChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) inputTextChanged,
    required TResult Function(bool value) uppercaseToggled,
  }) {
    return inputTextChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? inputTextChanged,
    TResult? Function(bool value)? uppercaseToggled,
  }) {
    return inputTextChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? inputTextChanged,
    TResult Function(bool value)? uppercaseToggled,
    required TResult orElse(),
  }) {
    if (inputTextChanged != null) {
      return inputTextChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputTextChanged value) inputTextChanged,
    required TResult Function(UppercaseToggled value) uppercaseToggled,
  }) {
    return inputTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputTextChanged value)? inputTextChanged,
    TResult? Function(UppercaseToggled value)? uppercaseToggled,
  }) {
    return inputTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputTextChanged value)? inputTextChanged,
    TResult Function(UppercaseToggled value)? uppercaseToggled,
    required TResult orElse(),
  }) {
    if (inputTextChanged != null) {
      return inputTextChanged(this);
    }
    return orElse();
  }
}

abstract class InputTextChanged implements InputTextMsgType {
  const factory InputTextChanged(final String value) = _$InputTextChanged;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$InputTextChangedCopyWith<_$InputTextChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UppercaseToggledCopyWith<$Res> {
  factory _$$UppercaseToggledCopyWith(
          _$UppercaseToggled value, $Res Function(_$UppercaseToggled) then) =
      __$$UppercaseToggledCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$UppercaseToggledCopyWithImpl<$Res>
    extends _$InputTextMsgTypeCopyWithImpl<$Res, _$UppercaseToggled>
    implements _$$UppercaseToggledCopyWith<$Res> {
  __$$UppercaseToggledCopyWithImpl(
      _$UppercaseToggled _value, $Res Function(_$UppercaseToggled) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UppercaseToggled(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UppercaseToggled implements UppercaseToggled {
  const _$UppercaseToggled(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'InputTextMsgType.uppercaseToggled(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UppercaseToggled &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UppercaseToggledCopyWith<_$UppercaseToggled> get copyWith =>
      __$$UppercaseToggledCopyWithImpl<_$UppercaseToggled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) inputTextChanged,
    required TResult Function(bool value) uppercaseToggled,
  }) {
    return uppercaseToggled(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? inputTextChanged,
    TResult? Function(bool value)? uppercaseToggled,
  }) {
    return uppercaseToggled?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? inputTextChanged,
    TResult Function(bool value)? uppercaseToggled,
    required TResult orElse(),
  }) {
    if (uppercaseToggled != null) {
      return uppercaseToggled(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InputTextChanged value) inputTextChanged,
    required TResult Function(UppercaseToggled value) uppercaseToggled,
  }) {
    return uppercaseToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InputTextChanged value)? inputTextChanged,
    TResult? Function(UppercaseToggled value)? uppercaseToggled,
  }) {
    return uppercaseToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InputTextChanged value)? inputTextChanged,
    TResult Function(UppercaseToggled value)? uppercaseToggled,
    required TResult orElse(),
  }) {
    if (uppercaseToggled != null) {
      return uppercaseToggled(this);
    }
    return orElse();
  }
}

abstract class UppercaseToggled implements InputTextMsgType {
  const factory UppercaseToggled(final bool value) = _$UppercaseToggled;

  @override
  bool get value;
  @JsonKey(ignore: true)
  _$$UppercaseToggledCopyWith<_$UppercaseToggled> get copyWith =>
      throw _privateConstructorUsedError;
}
