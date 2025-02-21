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
mixin _$CounterState {
  int get count => throw _privateConstructorUsedError;
  bool get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterStateCopyWith<CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStateCopyWith<$Res> {
  factory $CounterStateCopyWith(
          CounterState value, $Res Function(CounterState) then) =
      _$CounterStateCopyWithImpl<$Res, CounterState>;
  @useResult
  $Res call({int count, bool timer});
}

/// @nodoc
class _$CounterStateCopyWithImpl<$Res, $Val extends CounterState>
    implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? timer = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CounterStateCopyWith<$Res>
    implements $CounterStateCopyWith<$Res> {
  factory _$$_CounterStateCopyWith(
          _$_CounterState value, $Res Function(_$_CounterState) then) =
      __$$_CounterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, bool timer});
}

/// @nodoc
class __$$_CounterStateCopyWithImpl<$Res>
    extends _$CounterStateCopyWithImpl<$Res, _$_CounterState>
    implements _$$_CounterStateCopyWith<$Res> {
  __$$_CounterStateCopyWithImpl(
      _$_CounterState _value, $Res Function(_$_CounterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? timer = null,
  }) {
    return _then(_$_CounterState(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CounterState implements _CounterState {
  const _$_CounterState({required this.count, required this.timer});

  @override
  final int count;
  @override
  final bool timer;

  @override
  String toString() {
    return 'CounterState(count: $count, timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CounterState &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count, timer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CounterStateCopyWith<_$_CounterState> get copyWith =>
      __$$_CounterStateCopyWithImpl<_$_CounterState>(this, _$identity);
}

abstract class _CounterState implements CounterState {
  const factory _CounterState(
      {required final int count, required final bool timer}) = _$_CounterState;

  @override
  int get count;
  @override
  bool get timer;
  @override
  @JsonKey(ignore: true)
  _$$_CounterStateCopyWith<_$_CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CounterMsgType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() toggleTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? toggleTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? toggleTimer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(ToggleTimer value) toggleTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(ToggleTimer value)? toggleTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(ToggleTimer value)? toggleTimer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterMsgTypeCopyWith<$Res> {
  factory $CounterMsgTypeCopyWith(
          CounterMsgType value, $Res Function(CounterMsgType) then) =
      _$CounterMsgTypeCopyWithImpl<$Res, CounterMsgType>;
}

/// @nodoc
class _$CounterMsgTypeCopyWithImpl<$Res, $Val extends CounterMsgType>
    implements $CounterMsgTypeCopyWith<$Res> {
  _$CounterMsgTypeCopyWithImpl(this._value, this._then);

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
    extends _$CounterMsgTypeCopyWithImpl<$Res, _$Increment>
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
    return 'CounterMsgType.increment()';
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
    required TResult Function() toggleTimer,
  }) {
    return increment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? toggleTimer,
  }) {
    return increment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? toggleTimer,
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
    required TResult Function(ToggleTimer value) toggleTimer,
  }) {
    return increment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(ToggleTimer value)? toggleTimer,
  }) {
    return increment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(ToggleTimer value)? toggleTimer,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(this);
    }
    return orElse();
  }
}

abstract class Increment implements CounterMsgType {
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
    extends _$CounterMsgTypeCopyWithImpl<$Res, _$IncrementDelayed>
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
    return 'CounterMsgType.incrementDelayed()';
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
    required TResult Function() toggleTimer,
  }) {
    return incrementDelayed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? toggleTimer,
  }) {
    return incrementDelayed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? toggleTimer,
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
    required TResult Function(ToggleTimer value) toggleTimer,
  }) {
    return incrementDelayed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(ToggleTimer value)? toggleTimer,
  }) {
    return incrementDelayed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(ToggleTimer value)? toggleTimer,
    required TResult orElse(),
  }) {
    if (incrementDelayed != null) {
      return incrementDelayed(this);
    }
    return orElse();
  }
}

abstract class IncrementDelayed implements CounterMsgType {
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
    extends _$CounterMsgTypeCopyWithImpl<$Res, _$Decrement>
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
    return 'CounterMsgType.decrement()';
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
    required TResult Function() toggleTimer,
  }) {
    return decrement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? toggleTimer,
  }) {
    return decrement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? toggleTimer,
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
    required TResult Function(ToggleTimer value) toggleTimer,
  }) {
    return decrement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(ToggleTimer value)? toggleTimer,
  }) {
    return decrement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(ToggleTimer value)? toggleTimer,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement(this);
    }
    return orElse();
  }
}

abstract class Decrement implements CounterMsgType {
  const factory Decrement() = _$Decrement;
}

/// @nodoc
abstract class _$$ToggleTimerCopyWith<$Res> {
  factory _$$ToggleTimerCopyWith(
          _$ToggleTimer value, $Res Function(_$ToggleTimer) then) =
      __$$ToggleTimerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleTimerCopyWithImpl<$Res>
    extends _$CounterMsgTypeCopyWithImpl<$Res, _$ToggleTimer>
    implements _$$ToggleTimerCopyWith<$Res> {
  __$$ToggleTimerCopyWithImpl(
      _$ToggleTimer _value, $Res Function(_$ToggleTimer) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleTimer implements ToggleTimer {
  const _$ToggleTimer();

  @override
  String toString() {
    return 'CounterMsgType.toggleTimer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleTimer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() increment,
    required TResult Function() incrementDelayed,
    required TResult Function() decrement,
    required TResult Function() toggleTimer,
  }) {
    return toggleTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? increment,
    TResult? Function()? incrementDelayed,
    TResult? Function()? decrement,
    TResult? Function()? toggleTimer,
  }) {
    return toggleTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? increment,
    TResult Function()? incrementDelayed,
    TResult Function()? decrement,
    TResult Function()? toggleTimer,
    required TResult orElse(),
  }) {
    if (toggleTimer != null) {
      return toggleTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Increment value) increment,
    required TResult Function(IncrementDelayed value) incrementDelayed,
    required TResult Function(Decrement value) decrement,
    required TResult Function(ToggleTimer value) toggleTimer,
  }) {
    return toggleTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Increment value)? increment,
    TResult? Function(IncrementDelayed value)? incrementDelayed,
    TResult? Function(Decrement value)? decrement,
    TResult? Function(ToggleTimer value)? toggleTimer,
  }) {
    return toggleTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Increment value)? increment,
    TResult Function(IncrementDelayed value)? incrementDelayed,
    TResult Function(Decrement value)? decrement,
    TResult Function(ToggleTimer value)? toggleTimer,
    required TResult orElse(),
  }) {
    if (toggleTimer != null) {
      return toggleTimer(this);
    }
    return orElse();
  }
}

abstract class ToggleTimer implements CounterMsgType {
  const factory ToggleTimer() = _$ToggleTimer;
}
