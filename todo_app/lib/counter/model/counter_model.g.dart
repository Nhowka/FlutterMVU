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
  Iterable<Object> serialize(Serializers serializers, CounterModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
      'valueFuture',
      serializers.serialize(object.valueFuture,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  CounterModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CounterModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'valueFuture':
          result.valueFuture = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

  factory _$CounterModel([void Function(CounterModelBuilder) updates]) =>
      (new CounterModelBuilder()..update(updates)).build();

  _$CounterModel._({this.value, this.valueFuture}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('CounterModel', 'value');
    }
    if (valueFuture == null) {
      throw new BuiltValueNullFieldError('CounterModel', 'valueFuture');
    }
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
    return $jf($jc($jc(0, value.hashCode), valueFuture.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CounterModel')
          ..add('value', value)
          ..add('valueFuture', valueFuture))
        .toString();
  }
}

class CounterModelBuilder
    implements Builder<CounterModel, CounterModelBuilder> {
  _$CounterModel _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  int _valueFuture;
  int get valueFuture => _$this._valueFuture;
  set valueFuture(int valueFuture) => _$this._valueFuture = valueFuture;

  CounterModelBuilder() {
    CounterModel._initializeBuilder(this);
  }

  CounterModelBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _valueFuture = _$v.valueFuture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CounterModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CounterModel;
  }

  @override
  void update(void Function(CounterModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CounterModel build() {
    final _$result =
        _$v ?? new _$CounterModel._(value: value, valueFuture: valueFuture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
