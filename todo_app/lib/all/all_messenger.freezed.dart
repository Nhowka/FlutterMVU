// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_messenger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllMsg {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsg msg) counterMsg,
    required TResult Function(TodoMsg msg) todoMsg,
    required TResult Function(Pages? page) changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg msg)? counterMsg,
    TResult? Function(TodoMsg msg)? todoMsg,
    TResult? Function(Pages? page)? changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsg msg)? counterMsg,
    TResult Function(TodoMsg msg)? todoMsg,
    TResult Function(Pages? page)? changePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CMsg value) counterMsg,
    required TResult Function(TMsg value) todoMsg,
    required TResult Function(ChangePage value) changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CMsg value)? counterMsg,
    TResult? Function(TMsg value)? todoMsg,
    TResult? Function(ChangePage value)? changePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CMsg value)? counterMsg,
    TResult Function(TMsg value)? todoMsg,
    TResult Function(ChangePage value)? changePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllMsgCopyWith<$Res> {
  factory $AllMsgCopyWith(AllMsg value, $Res Function(AllMsg) then) =
      _$AllMsgCopyWithImpl<$Res, AllMsg>;
}

/// @nodoc
class _$AllMsgCopyWithImpl<$Res, $Val extends AllMsg>
    implements $AllMsgCopyWith<$Res> {
  _$AllMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CMsgCopyWith<$Res> {
  factory _$$CMsgCopyWith(_$CMsg value, $Res Function(_$CMsg) then) =
      __$$CMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({CounterMsg msg});

  $CounterMsgCopyWith<$Res> get msg;
}

/// @nodoc
class __$$CMsgCopyWithImpl<$Res> extends _$AllMsgCopyWithImpl<$Res, _$CMsg>
    implements _$$CMsgCopyWith<$Res> {
  __$$CMsgCopyWithImpl(_$CMsg _value, $Res Function(_$CMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$CMsg(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as CounterMsg,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CounterMsgCopyWith<$Res> get msg {
    return $CounterMsgCopyWith<$Res>(_value.msg, (value) {
      return _then(_value.copyWith(msg: value));
    });
  }
}

/// @nodoc

class _$CMsg implements CMsg {
  const _$CMsg(this.msg);

  @override
  final CounterMsg msg;

  @override
  String toString() {
    return 'AllMsg.counterMsg(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CMsg &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CMsgCopyWith<_$CMsg> get copyWith =>
      __$$CMsgCopyWithImpl<_$CMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsg msg) counterMsg,
    required TResult Function(TodoMsg msg) todoMsg,
    required TResult Function(Pages? page) changePage,
  }) {
    return counterMsg(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg msg)? counterMsg,
    TResult? Function(TodoMsg msg)? todoMsg,
    TResult? Function(Pages? page)? changePage,
  }) {
    return counterMsg?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsg msg)? counterMsg,
    TResult Function(TodoMsg msg)? todoMsg,
    TResult Function(Pages? page)? changePage,
    required TResult orElse(),
  }) {
    if (counterMsg != null) {
      return counterMsg(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CMsg value) counterMsg,
    required TResult Function(TMsg value) todoMsg,
    required TResult Function(ChangePage value) changePage,
  }) {
    return counterMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CMsg value)? counterMsg,
    TResult? Function(TMsg value)? todoMsg,
    TResult? Function(ChangePage value)? changePage,
  }) {
    return counterMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CMsg value)? counterMsg,
    TResult Function(TMsg value)? todoMsg,
    TResult Function(ChangePage value)? changePage,
    required TResult orElse(),
  }) {
    if (counterMsg != null) {
      return counterMsg(this);
    }
    return orElse();
  }
}

abstract class CMsg implements AllMsg {
  const factory CMsg(final CounterMsg msg) = _$CMsg;

  CounterMsg get msg;
  @JsonKey(ignore: true)
  _$$CMsgCopyWith<_$CMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TMsgCopyWith<$Res> {
  factory _$$TMsgCopyWith(_$TMsg value, $Res Function(_$TMsg) then) =
      __$$TMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoMsg msg});

  $TodoMsgCopyWith<$Res> get msg;
}

/// @nodoc
class __$$TMsgCopyWithImpl<$Res> extends _$AllMsgCopyWithImpl<$Res, _$TMsg>
    implements _$$TMsgCopyWith<$Res> {
  __$$TMsgCopyWithImpl(_$TMsg _value, $Res Function(_$TMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$TMsg(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as TodoMsg,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoMsgCopyWith<$Res> get msg {
    return $TodoMsgCopyWith<$Res>(_value.msg, (value) {
      return _then(_value.copyWith(msg: value));
    });
  }
}

/// @nodoc

class _$TMsg implements TMsg {
  const _$TMsg(this.msg);

  @override
  final TodoMsg msg;

  @override
  String toString() {
    return 'AllMsg.todoMsg(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TMsg &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TMsgCopyWith<_$TMsg> get copyWith =>
      __$$TMsgCopyWithImpl<_$TMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsg msg) counterMsg,
    required TResult Function(TodoMsg msg) todoMsg,
    required TResult Function(Pages? page) changePage,
  }) {
    return todoMsg(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg msg)? counterMsg,
    TResult? Function(TodoMsg msg)? todoMsg,
    TResult? Function(Pages? page)? changePage,
  }) {
    return todoMsg?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsg msg)? counterMsg,
    TResult Function(TodoMsg msg)? todoMsg,
    TResult Function(Pages? page)? changePage,
    required TResult orElse(),
  }) {
    if (todoMsg != null) {
      return todoMsg(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CMsg value) counterMsg,
    required TResult Function(TMsg value) todoMsg,
    required TResult Function(ChangePage value) changePage,
  }) {
    return todoMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CMsg value)? counterMsg,
    TResult? Function(TMsg value)? todoMsg,
    TResult? Function(ChangePage value)? changePage,
  }) {
    return todoMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CMsg value)? counterMsg,
    TResult Function(TMsg value)? todoMsg,
    TResult Function(ChangePage value)? changePage,
    required TResult orElse(),
  }) {
    if (todoMsg != null) {
      return todoMsg(this);
    }
    return orElse();
  }
}

abstract class TMsg implements AllMsg {
  const factory TMsg(final TodoMsg msg) = _$TMsg;

  TodoMsg get msg;
  @JsonKey(ignore: true)
  _$$TMsgCopyWith<_$TMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePageCopyWith<$Res> {
  factory _$$ChangePageCopyWith(
          _$ChangePage value, $Res Function(_$ChangePage) then) =
      __$$ChangePageCopyWithImpl<$Res>;
  @useResult
  $Res call({Pages? page});
}

/// @nodoc
class __$$ChangePageCopyWithImpl<$Res>
    extends _$AllMsgCopyWithImpl<$Res, _$ChangePage>
    implements _$$ChangePageCopyWith<$Res> {
  __$$ChangePageCopyWithImpl(
      _$ChangePage _value, $Res Function(_$ChangePage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$ChangePage(
      freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Pages?,
    ));
  }
}

/// @nodoc

class _$ChangePage implements ChangePage {
  const _$ChangePage(this.page);

  @override
  final Pages? page;

  @override
  String toString() {
    return 'AllMsg.changePage(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePage &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePageCopyWith<_$ChangePage> get copyWith =>
      __$$ChangePageCopyWithImpl<_$ChangePage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CounterMsg msg) counterMsg,
    required TResult Function(TodoMsg msg) todoMsg,
    required TResult Function(Pages? page) changePage,
  }) {
    return changePage(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CounterMsg msg)? counterMsg,
    TResult? Function(TodoMsg msg)? todoMsg,
    TResult? Function(Pages? page)? changePage,
  }) {
    return changePage?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CounterMsg msg)? counterMsg,
    TResult Function(TodoMsg msg)? todoMsg,
    TResult Function(Pages? page)? changePage,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CMsg value) counterMsg,
    required TResult Function(TMsg value) todoMsg,
    required TResult Function(ChangePage value) changePage,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CMsg value)? counterMsg,
    TResult? Function(TMsg value)? todoMsg,
    TResult? Function(ChangePage value)? changePage,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CMsg value)? counterMsg,
    TResult Function(TMsg value)? todoMsg,
    TResult Function(ChangePage value)? changePage,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class ChangePage implements AllMsg {
  const factory ChangePage(final Pages? page) = _$ChangePage;

  Pages? get page;
  @JsonKey(ignore: true)
  _$$ChangePageCopyWith<_$ChangePage> get copyWith =>
      throw _privateConstructorUsedError;
}
