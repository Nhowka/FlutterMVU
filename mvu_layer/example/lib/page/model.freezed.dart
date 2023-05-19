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
mixin _$AppPage {
  Object get state => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterState state) counter,
    required TResult Function(InputTextState state) inputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterState state)? counter,
    TResult? Function(InputTextState state)? inputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterState state)? counter,
    TResult Function(InputTextState state)? inputText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Counter value) counter,
    required TResult Function(InputText value) inputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Counter value)? counter,
    TResult? Function(InputText value)? inputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Counter value)? counter,
    TResult Function(InputText value)? inputText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPageCopyWith<$Res> {
  factory $AppPageCopyWith(AppPage value, $Res Function(AppPage) then) =
      _$AppPageCopyWithImpl<$Res, AppPage>;
}

/// @nodoc
class _$AppPageCopyWithImpl<$Res, $Val extends AppPage>
    implements $AppPageCopyWith<$Res> {
  _$AppPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CounterCopyWith<$Res> {
  factory _$$CounterCopyWith(_$Counter value, $Res Function(_$Counter) then) =
      __$$CounterCopyWithImpl<$Res>;
  @useResult
  $Res call({CounterState state});

  $CounterStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$CounterCopyWithImpl<$Res>
    extends _$AppPageCopyWithImpl<$Res, _$Counter>
    implements _$$CounterCopyWith<$Res> {
  __$$CounterCopyWithImpl(_$Counter _value, $Res Function(_$Counter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$Counter(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CounterState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CounterStateCopyWith<$Res> get state {
    return $CounterStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$Counter implements Counter {
  const _$Counter(this.state);

  @override
  final CounterState state;

  @override
  String toString() {
    return 'AppPage.counter(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Counter &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterCopyWith<_$Counter> get copyWith =>
      __$$CounterCopyWithImpl<_$Counter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterState state) counter,
    required TResult Function(InputTextState state) inputText,
  }) {
    return counter(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterState state)? counter,
    TResult? Function(InputTextState state)? inputText,
  }) {
    return counter?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterState state)? counter,
    TResult Function(InputTextState state)? inputText,
    required TResult orElse(),
  }) {
    if (counter != null) {
      return counter(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Counter value) counter,
    required TResult Function(InputText value) inputText,
  }) {
    return counter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Counter value)? counter,
    TResult? Function(InputText value)? inputText,
  }) {
    return counter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Counter value)? counter,
    TResult Function(InputText value)? inputText,
    required TResult orElse(),
  }) {
    if (counter != null) {
      return counter(this);
    }
    return orElse();
  }
}

abstract class Counter implements AppPage {
  const factory Counter(final CounterState state) = _$Counter;

  @override
  CounterState get state;
  @JsonKey(ignore: true)
  _$$CounterCopyWith<_$Counter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputTextCopyWith<$Res> {
  factory _$$InputTextCopyWith(
          _$InputText value, $Res Function(_$InputText) then) =
      __$$InputTextCopyWithImpl<$Res>;
  @useResult
  $Res call({InputTextState state});

  $InputTextStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$InputTextCopyWithImpl<$Res>
    extends _$AppPageCopyWithImpl<$Res, _$InputText>
    implements _$$InputTextCopyWith<$Res> {
  __$$InputTextCopyWithImpl(
      _$InputText _value, $Res Function(_$InputText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$InputText(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as InputTextState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $InputTextStateCopyWith<$Res> get state {
    return $InputTextStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$InputText implements InputText {
  const _$InputText(this.state);

  @override
  final InputTextState state;

  @override
  String toString() {
    return 'AppPage.inputText(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputText &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputTextCopyWith<_$InputText> get copyWith =>
      __$$InputTextCopyWithImpl<_$InputText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterState state) counter,
    required TResult Function(InputTextState state) inputText,
  }) {
    return inputText(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterState state)? counter,
    TResult? Function(InputTextState state)? inputText,
  }) {
    return inputText?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterState state)? counter,
    TResult Function(InputTextState state)? inputText,
    required TResult orElse(),
  }) {
    if (inputText != null) {
      return inputText(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Counter value) counter,
    required TResult Function(InputText value) inputText,
  }) {
    return inputText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Counter value)? counter,
    TResult? Function(InputText value)? inputText,
  }) {
    return inputText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Counter value)? counter,
    TResult Function(InputText value)? inputText,
    required TResult orElse(),
  }) {
    if (inputText != null) {
      return inputText(this);
    }
    return orElse();
  }
}

abstract class InputText implements AppPage {
  const factory InputText(final InputTextState state) = _$InputText;

  @override
  InputTextState get state;
  @JsonKey(ignore: true)
  _$$InputTextCopyWith<_$InputText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Msg {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsgType counterMsg) counterMsg,
    required TResult Function(InputTextMsgType inputTextMsg) inputTextMsg,
    required TResult Function() switchToCounter,
    required TResult Function() switchToInputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsgType counterMsg)? counterMsg,
    TResult? Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult? Function()? switchToCounter,
    TResult? Function()? switchToInputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsgType counterMsg)? counterMsg,
    TResult Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult Function()? switchToCounter,
    TResult Function()? switchToInputText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterMsg value) counterMsg,
    required TResult Function(InputTextMsg value) inputTextMsg,
    required TResult Function(SwitchToCounter value) switchToCounter,
    required TResult Function(SwitchToInputText value) switchToInputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg value)? counterMsg,
    TResult? Function(InputTextMsg value)? inputTextMsg,
    TResult? Function(SwitchToCounter value)? switchToCounter,
    TResult? Function(SwitchToInputText value)? switchToInputText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterMsg value)? counterMsg,
    TResult Function(InputTextMsg value)? inputTextMsg,
    TResult Function(SwitchToCounter value)? switchToCounter,
    TResult Function(SwitchToInputText value)? switchToInputText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MsgCopyWith<$Res> {
  factory $MsgCopyWith(Msg value, $Res Function(Msg) then) =
      _$MsgCopyWithImpl<$Res, Msg>;
}

/// @nodoc
class _$MsgCopyWithImpl<$Res, $Val extends Msg> implements $MsgCopyWith<$Res> {
  _$MsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CounterMsgCopyWith<$Res> {
  factory _$$CounterMsgCopyWith(
          _$CounterMsg value, $Res Function(_$CounterMsg) then) =
      __$$CounterMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({CounterMsgType counterMsg});

  $CounterMsgTypeCopyWith<$Res> get counterMsg;
}

/// @nodoc
class __$$CounterMsgCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$CounterMsg>
    implements _$$CounterMsgCopyWith<$Res> {
  __$$CounterMsgCopyWithImpl(
      _$CounterMsg _value, $Res Function(_$CounterMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterMsg = null,
  }) {
    return _then(_$CounterMsg(
      null == counterMsg
          ? _value.counterMsg
          : counterMsg // ignore: cast_nullable_to_non_nullable
              as CounterMsgType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CounterMsgTypeCopyWith<$Res> get counterMsg {
    return $CounterMsgTypeCopyWith<$Res>(_value.counterMsg, (value) {
      return _then(_value.copyWith(counterMsg: value));
    });
  }
}

/// @nodoc

class _$CounterMsg implements CounterMsg {
  const _$CounterMsg(this.counterMsg);

  @override
  final CounterMsgType counterMsg;

  @override
  String toString() {
    return 'Msg.counterMsg(counterMsg: $counterMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterMsg &&
            (identical(other.counterMsg, counterMsg) ||
                other.counterMsg == counterMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counterMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterMsgCopyWith<_$CounterMsg> get copyWith =>
      __$$CounterMsgCopyWithImpl<_$CounterMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsgType counterMsg) counterMsg,
    required TResult Function(InputTextMsgType inputTextMsg) inputTextMsg,
    required TResult Function() switchToCounter,
    required TResult Function() switchToInputText,
  }) {
    return counterMsg(this.counterMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsgType counterMsg)? counterMsg,
    TResult? Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult? Function()? switchToCounter,
    TResult? Function()? switchToInputText,
  }) {
    return counterMsg?.call(this.counterMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsgType counterMsg)? counterMsg,
    TResult Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult Function()? switchToCounter,
    TResult Function()? switchToInputText,
    required TResult orElse(),
  }) {
    if (counterMsg != null) {
      return counterMsg(this.counterMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterMsg value) counterMsg,
    required TResult Function(InputTextMsg value) inputTextMsg,
    required TResult Function(SwitchToCounter value) switchToCounter,
    required TResult Function(SwitchToInputText value) switchToInputText,
  }) {
    return counterMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg value)? counterMsg,
    TResult? Function(InputTextMsg value)? inputTextMsg,
    TResult? Function(SwitchToCounter value)? switchToCounter,
    TResult? Function(SwitchToInputText value)? switchToInputText,
  }) {
    return counterMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterMsg value)? counterMsg,
    TResult Function(InputTextMsg value)? inputTextMsg,
    TResult Function(SwitchToCounter value)? switchToCounter,
    TResult Function(SwitchToInputText value)? switchToInputText,
    required TResult orElse(),
  }) {
    if (counterMsg != null) {
      return counterMsg(this);
    }
    return orElse();
  }
}

abstract class CounterMsg implements Msg {
  const factory CounterMsg(final CounterMsgType counterMsg) = _$CounterMsg;

  CounterMsgType get counterMsg;
  @JsonKey(ignore: true)
  _$$CounterMsgCopyWith<_$CounterMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputTextMsgCopyWith<$Res> {
  factory _$$InputTextMsgCopyWith(
          _$InputTextMsg value, $Res Function(_$InputTextMsg) then) =
      __$$InputTextMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({InputTextMsgType inputTextMsg});

  $InputTextMsgTypeCopyWith<$Res> get inputTextMsg;
}

/// @nodoc
class __$$InputTextMsgCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$InputTextMsg>
    implements _$$InputTextMsgCopyWith<$Res> {
  __$$InputTextMsgCopyWithImpl(
      _$InputTextMsg _value, $Res Function(_$InputTextMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTextMsg = null,
  }) {
    return _then(_$InputTextMsg(
      null == inputTextMsg
          ? _value.inputTextMsg
          : inputTextMsg // ignore: cast_nullable_to_non_nullable
              as InputTextMsgType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $InputTextMsgTypeCopyWith<$Res> get inputTextMsg {
    return $InputTextMsgTypeCopyWith<$Res>(_value.inputTextMsg, (value) {
      return _then(_value.copyWith(inputTextMsg: value));
    });
  }
}

/// @nodoc

class _$InputTextMsg implements InputTextMsg {
  const _$InputTextMsg(this.inputTextMsg);

  @override
  final InputTextMsgType inputTextMsg;

  @override
  String toString() {
    return 'Msg.inputTextMsg(inputTextMsg: $inputTextMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputTextMsg &&
            (identical(other.inputTextMsg, inputTextMsg) ||
                other.inputTextMsg == inputTextMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inputTextMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputTextMsgCopyWith<_$InputTextMsg> get copyWith =>
      __$$InputTextMsgCopyWithImpl<_$InputTextMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsgType counterMsg) counterMsg,
    required TResult Function(InputTextMsgType inputTextMsg) inputTextMsg,
    required TResult Function() switchToCounter,
    required TResult Function() switchToInputText,
  }) {
    return inputTextMsg(this.inputTextMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsgType counterMsg)? counterMsg,
    TResult? Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult? Function()? switchToCounter,
    TResult? Function()? switchToInputText,
  }) {
    return inputTextMsg?.call(this.inputTextMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsgType counterMsg)? counterMsg,
    TResult Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult Function()? switchToCounter,
    TResult Function()? switchToInputText,
    required TResult orElse(),
  }) {
    if (inputTextMsg != null) {
      return inputTextMsg(this.inputTextMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterMsg value) counterMsg,
    required TResult Function(InputTextMsg value) inputTextMsg,
    required TResult Function(SwitchToCounter value) switchToCounter,
    required TResult Function(SwitchToInputText value) switchToInputText,
  }) {
    return inputTextMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg value)? counterMsg,
    TResult? Function(InputTextMsg value)? inputTextMsg,
    TResult? Function(SwitchToCounter value)? switchToCounter,
    TResult? Function(SwitchToInputText value)? switchToInputText,
  }) {
    return inputTextMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterMsg value)? counterMsg,
    TResult Function(InputTextMsg value)? inputTextMsg,
    TResult Function(SwitchToCounter value)? switchToCounter,
    TResult Function(SwitchToInputText value)? switchToInputText,
    required TResult orElse(),
  }) {
    if (inputTextMsg != null) {
      return inputTextMsg(this);
    }
    return orElse();
  }
}

abstract class InputTextMsg implements Msg {
  const factory InputTextMsg(final InputTextMsgType inputTextMsg) =
      _$InputTextMsg;

  InputTextMsgType get inputTextMsg;
  @JsonKey(ignore: true)
  _$$InputTextMsgCopyWith<_$InputTextMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwitchToCounterCopyWith<$Res> {
  factory _$$SwitchToCounterCopyWith(
          _$SwitchToCounter value, $Res Function(_$SwitchToCounter) then) =
      __$$SwitchToCounterCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchToCounterCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$SwitchToCounter>
    implements _$$SwitchToCounterCopyWith<$Res> {
  __$$SwitchToCounterCopyWithImpl(
      _$SwitchToCounter _value, $Res Function(_$SwitchToCounter) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchToCounter implements SwitchToCounter {
  const _$SwitchToCounter();

  @override
  String toString() {
    return 'Msg.switchToCounter()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchToCounter);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsgType counterMsg) counterMsg,
    required TResult Function(InputTextMsgType inputTextMsg) inputTextMsg,
    required TResult Function() switchToCounter,
    required TResult Function() switchToInputText,
  }) {
    return switchToCounter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsgType counterMsg)? counterMsg,
    TResult? Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult? Function()? switchToCounter,
    TResult? Function()? switchToInputText,
  }) {
    return switchToCounter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsgType counterMsg)? counterMsg,
    TResult Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult Function()? switchToCounter,
    TResult Function()? switchToInputText,
    required TResult orElse(),
  }) {
    if (switchToCounter != null) {
      return switchToCounter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterMsg value) counterMsg,
    required TResult Function(InputTextMsg value) inputTextMsg,
    required TResult Function(SwitchToCounter value) switchToCounter,
    required TResult Function(SwitchToInputText value) switchToInputText,
  }) {
    return switchToCounter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg value)? counterMsg,
    TResult? Function(InputTextMsg value)? inputTextMsg,
    TResult? Function(SwitchToCounter value)? switchToCounter,
    TResult? Function(SwitchToInputText value)? switchToInputText,
  }) {
    return switchToCounter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterMsg value)? counterMsg,
    TResult Function(InputTextMsg value)? inputTextMsg,
    TResult Function(SwitchToCounter value)? switchToCounter,
    TResult Function(SwitchToInputText value)? switchToInputText,
    required TResult orElse(),
  }) {
    if (switchToCounter != null) {
      return switchToCounter(this);
    }
    return orElse();
  }
}

abstract class SwitchToCounter implements Msg {
  const factory SwitchToCounter() = _$SwitchToCounter;
}

/// @nodoc
abstract class _$$SwitchToInputTextCopyWith<$Res> {
  factory _$$SwitchToInputTextCopyWith(
          _$SwitchToInputText value, $Res Function(_$SwitchToInputText) then) =
      __$$SwitchToInputTextCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchToInputTextCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$SwitchToInputText>
    implements _$$SwitchToInputTextCopyWith<$Res> {
  __$$SwitchToInputTextCopyWithImpl(
      _$SwitchToInputText _value, $Res Function(_$SwitchToInputText) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchToInputText implements SwitchToInputText {
  const _$SwitchToInputText();

  @override
  String toString() {
    return 'Msg.switchToInputText()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchToInputText);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsgType counterMsg) counterMsg,
    required TResult Function(InputTextMsgType inputTextMsg) inputTextMsg,
    required TResult Function() switchToCounter,
    required TResult Function() switchToInputText,
  }) {
    return switchToInputText();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsgType counterMsg)? counterMsg,
    TResult? Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult? Function()? switchToCounter,
    TResult? Function()? switchToInputText,
  }) {
    return switchToInputText?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsgType counterMsg)? counterMsg,
    TResult Function(InputTextMsgType inputTextMsg)? inputTextMsg,
    TResult Function()? switchToCounter,
    TResult Function()? switchToInputText,
    required TResult orElse(),
  }) {
    if (switchToInputText != null) {
      return switchToInputText();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterMsg value) counterMsg,
    required TResult Function(InputTextMsg value) inputTextMsg,
    required TResult Function(SwitchToCounter value) switchToCounter,
    required TResult Function(SwitchToInputText value) switchToInputText,
  }) {
    return switchToInputText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg value)? counterMsg,
    TResult? Function(InputTextMsg value)? inputTextMsg,
    TResult? Function(SwitchToCounter value)? switchToCounter,
    TResult? Function(SwitchToInputText value)? switchToInputText,
  }) {
    return switchToInputText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterMsg value)? counterMsg,
    TResult Function(InputTextMsg value)? inputTextMsg,
    TResult Function(SwitchToCounter value)? switchToCounter,
    TResult Function(SwitchToInputText value)? switchToInputText,
    required TResult orElse(),
  }) {
    if (switchToInputText != null) {
      return switchToInputText(this);
    }
    return orElse();
  }
}

abstract class SwitchToInputText implements Msg {
  const factory SwitchToInputText() = _$SwitchToInputText;
}
