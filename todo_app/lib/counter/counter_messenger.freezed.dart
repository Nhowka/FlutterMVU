// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_messenger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterMsg {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() reset,
    required TResult Function() incrementedDelayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? reset,
    TResult? Function()? incrementedDelayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? reset,
    TResult Function()? incrementedDelayed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
    required TResult Function(_IncrementDelayed value) incrementedDelayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
    TResult? Function(_IncrementDelayed value)? incrementedDelayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    TResult Function(_IncrementDelayed value)? incrementedDelayed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterMsgCopyWith<$Res> {
  factory $CounterMsgCopyWith(
          CounterMsg value, $Res Function(CounterMsg) then) =
      _$CounterMsgCopyWithImpl<$Res, CounterMsg>;
}

/// @nodoc
class _$CounterMsgCopyWithImpl<$Res, $Val extends CounterMsg>
    implements $CounterMsgCopyWith<$Res> {
  _$CounterMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncrementCopyWith<$Res> {
  factory _$$IncrementCopyWith(
          _$Increment value, $Res Function(_$Increment) then) =
      __$$IncrementCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncrementCopyWithImpl<$Res>
    extends _$CounterMsgCopyWithImpl<$Res, _$Increment>
    implements _$$IncrementCopyWith<$Res> {
  __$$IncrementCopyWithImpl(
      _$Increment _value, $Res Function(_$Increment) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Increment implements Increment {
  const _$Increment();

  @override
  String toString() {
    return 'CounterMsg.increment()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Increment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() reset,
    required TResult Function() incrementedDelayed,
  }) {
    return increment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? reset,
    TResult? Function()? incrementedDelayed,
  }) {
    return increment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? reset,
    TResult Function()? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
    required TResult Function(_IncrementDelayed value) incrementedDelayed,
  }) {
    return increment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
    TResult? Function(_IncrementDelayed value)? incrementedDelayed,
  }) {
    return increment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    TResult Function(_IncrementDelayed value)? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(this);
    }
    return orElse();
  }
}

abstract class Increment implements CounterMsg {
  const factory Increment() = _$Increment;
}

/// @nodoc
abstract class _$$IncrementDelayedCopyWith<$Res> {
  factory _$$IncrementDelayedCopyWith(
          _$IncrementDelayed value, $Res Function(_$IncrementDelayed) then) =
      __$$IncrementDelayedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncrementDelayedCopyWithImpl<$Res>
    extends _$CounterMsgCopyWithImpl<$Res, _$IncrementDelayed>
    implements _$$IncrementDelayedCopyWith<$Res> {
  __$$IncrementDelayedCopyWithImpl(
      _$IncrementDelayed _value, $Res Function(_$IncrementDelayed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IncrementDelayed implements IncrementDelayed {
  const _$IncrementDelayed();

  @override
  String toString() {
    return 'CounterMsg.incrementDelayed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IncrementDelayed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() reset,
    required TResult Function() incrementedDelayed,
  }) {
    return incrementDelayed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? reset,
    TResult? Function()? incrementedDelayed,
  }) {
    return incrementDelayed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? reset,
    TResult Function()? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (incrementDelayed != null) {
      return incrementDelayed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
    required TResult Function(_IncrementDelayed value) incrementedDelayed,
  }) {
    return incrementDelayed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
    TResult? Function(_IncrementDelayed value)? incrementedDelayed,
  }) {
    return incrementDelayed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    TResult Function(_IncrementDelayed value)? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (incrementDelayed != null) {
      return incrementDelayed(this);
    }
    return orElse();
  }
}

abstract class IncrementDelayed implements CounterMsg {
  const factory IncrementDelayed() = _$IncrementDelayed;
}

/// @nodoc
abstract class _$$DecrementCopyWith<$Res> {
  factory _$$DecrementCopyWith(
          _$Decrement value, $Res Function(_$Decrement) then) =
      __$$DecrementCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecrementCopyWithImpl<$Res>
    extends _$CounterMsgCopyWithImpl<$Res, _$Decrement>
    implements _$$DecrementCopyWith<$Res> {
  __$$DecrementCopyWithImpl(
      _$Decrement _value, $Res Function(_$Decrement) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Decrement implements Decrement {
  const _$Decrement();

  @override
  String toString() {
    return 'CounterMsg.decrement()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Decrement);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() reset,
    required TResult Function() incrementedDelayed,
  }) {
    return decrement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? reset,
    TResult? Function()? incrementedDelayed,
  }) {
    return decrement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? reset,
    TResult Function()? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
    required TResult Function(_IncrementDelayed value) incrementedDelayed,
  }) {
    return decrement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
    TResult? Function(_IncrementDelayed value)? incrementedDelayed,
  }) {
    return decrement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    TResult Function(_IncrementDelayed value)? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement(this);
    }
    return orElse();
  }
}

abstract class Decrement implements CounterMsg {
  const factory Decrement() = _$Decrement;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$CounterMsgCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'CounterMsg.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() reset,
    required TResult Function() incrementedDelayed,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? reset,
    TResult? Function()? incrementedDelayed,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? reset,
    TResult Function()? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
    required TResult Function(_IncrementDelayed value) incrementedDelayed,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
    TResult? Function(_IncrementDelayed value)? incrementedDelayed,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    TResult Function(_IncrementDelayed value)? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class Reset implements CounterMsg {
  const factory Reset() = _$Reset;
}

/// @nodoc
abstract class _$$_IncrementDelayedCopyWith<$Res> {
  factory _$$_IncrementDelayedCopyWith(
          _$_IncrementDelayed value, $Res Function(_$_IncrementDelayed) then) =
      __$$_IncrementDelayedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IncrementDelayedCopyWithImpl<$Res>
    extends _$CounterMsgCopyWithImpl<$Res, _$_IncrementDelayed>
    implements _$$_IncrementDelayedCopyWith<$Res> {
  __$$_IncrementDelayedCopyWithImpl(
      _$_IncrementDelayed _value, $Res Function(_$_IncrementDelayed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_IncrementDelayed implements _IncrementDelayed {
  const _$_IncrementDelayed();

  @override
  String toString() {
    return 'CounterMsg.incrementedDelayed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_IncrementDelayed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() reset,
    required TResult Function() incrementedDelayed,
  }) {
    return incrementedDelayed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? reset,
    TResult? Function()? incrementedDelayed,
  }) {
    return incrementedDelayed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? reset,
    TResult Function()? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (incrementedDelayed != null) {
      return incrementedDelayed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(Reset value) reset,
    required TResult Function(_IncrementDelayed value) incrementedDelayed,
  }) {
    return incrementedDelayed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(Reset value)? reset,
    TResult? Function(_IncrementDelayed value)? incrementedDelayed,
  }) {
    return incrementedDelayed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(Reset value)? reset,
    TResult Function(_IncrementDelayed value)? incrementedDelayed,
    required TResult orElse(),
  }) {
    if (incrementedDelayed != null) {
      return incrementedDelayed(this);
    }
    return orElse();
  }
}

abstract class _IncrementDelayed implements CounterMsg {
  const factory _IncrementDelayed() = _$_IncrementDelayed;
}
