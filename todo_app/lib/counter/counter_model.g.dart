// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CounterModel> _$counterModelSerializer =
    new _$CounterModelSerializer();

class _$CounterModelSerializer implements StructuredSerializer<CounterModel> {
  @override
  final Iterable<Type> types = const [CounterModel, _$CounterModel];
  @override
  final String wireName = 'CounterModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CounterModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'valueFuture',
      serializers.serialize(object.valueFuture,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  CounterModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CounterModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'valueFuture':
          result.valueFuture = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CounterModel extends CounterModel {
  @override
  final int value;
  @override
  final int valueFuture;

  factory _$CounterModel([void Function(CounterModelBuilder)? updates]) =>
      (new CounterModelBuilder()..update(updates))._build();

  _$CounterModel._({required this.value, required this.valueFuture})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'CounterModel', 'value');
    BuiltValueNullFieldError.checkNotNull(
        valueFuture, r'CounterModel', 'valueFuture');
  }

  @override
  CounterModel rebuild(void Function(CounterModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CounterModelBuilder toBuilder() => new CounterModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CounterModel &&
        value == other.value &&
        valueFuture == other.valueFuture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, valueFuture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CounterModel')
          ..add('value', value)
          ..add('valueFuture', valueFuture))
        .toString();
  }
}

class CounterModelBuilder
    implements Builder<CounterModel, CounterModelBuilder> {
  _$CounterModel? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  int? _valueFuture;
  int? get valueFuture => _$this._valueFuture;
  set valueFuture(int? valueFuture) => _$this._valueFuture = valueFuture;

  CounterModelBuilder() {
    CounterModel._initializeBuilder(this);
  }

  CounterModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _valueFuture = $v.valueFuture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CounterModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CounterModel;
  }

  @override
  void update(void Function(CounterModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CounterModel build() => _build();

  _$CounterModel _build() {
    final _$result = _$v ??
        new _$CounterModel._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'CounterModel', 'value'),
            valueFuture: BuiltValueNullFieldError.checkNotNull(
                valueFuture, r'CounterModel', 'valueFuture'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
