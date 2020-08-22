// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllModel> _$allModelSerializer = new _$AllModelSerializer();

class _$AllModelSerializer implements StructuredSerializer<AllModel> {
  @override
  final Iterable<Type> types = const [AllModel, _$AllModel];
  @override
  final String wireName = 'AllModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AllModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(Pages)),
      'todos',
      serializers.serialize(object.todos,
          specifiedType: const FullType(TodoModel)),
      'counter',
      serializers.serialize(object.counter,
          specifiedType: const FullType(CounterModel)),
    ];

    return result;
  }

  @override
  AllModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(Pages)) as Pages;
          break;
        case 'todos':
          result.todos.replace(serializers.deserialize(value,
              specifiedType: const FullType(TodoModel)) as TodoModel);
          break;
        case 'counter':
          result.counter.replace(serializers.deserialize(value,
              specifiedType: const FullType(CounterModel)) as CounterModel);
          break;
      }
    }

    return result.build();
  }
}

class _$AllModel extends AllModel {
  @override
  final Pages page;
  @override
  final TodoModel todos;
  @override
  final CounterModel counter;

  factory _$AllModel([void Function(AllModelBuilder) updates]) =>
      (new AllModelBuilder()..update(updates)).build();

  _$AllModel._({this.page, this.todos, this.counter}) : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('AllModel', 'page');
    }
    if (todos == null) {
      throw new BuiltValueNullFieldError('AllModel', 'todos');
    }
    if (counter == null) {
      throw new BuiltValueNullFieldError('AllModel', 'counter');
    }
  }

  @override
  AllModel rebuild(void Function(AllModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllModelBuilder toBuilder() => new AllModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllModel &&
        page == other.page &&
        todos == other.todos &&
        counter == other.counter;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, page.hashCode), todos.hashCode), counter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllModel')
          ..add('page', page)
          ..add('todos', todos)
          ..add('counter', counter))
        .toString();
  }
}

class AllModelBuilder implements Builder<AllModel, AllModelBuilder> {
  _$AllModel _$v;

  Pages _page;
  Pages get page => _$this._page;
  set page(Pages page) => _$this._page = page;

  TodoModelBuilder _todos;
  TodoModelBuilder get todos => _$this._todos ??= new TodoModelBuilder();
  set todos(TodoModelBuilder todos) => _$this._todos = todos;

  CounterModelBuilder _counter;
  CounterModelBuilder get counter =>
      _$this._counter ??= new CounterModelBuilder();
  set counter(CounterModelBuilder counter) => _$this._counter = counter;

  AllModelBuilder() {
    AllModel._initializeBuilder(this);
  }

  AllModelBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _todos = _$v.todos?.toBuilder();
      _counter = _$v.counter?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllModel;
  }

  @override
  void update(void Function(AllModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllModel build() {
    _$AllModel _$result;
    try {
      _$result = _$v ??
          new _$AllModel._(
              page: page, todos: todos.build(), counter: counter.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'todos';
        todos.build();
        _$failedField = 'counter';
        counter.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AllModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
