// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodoModel> _$todoModelSerializer = new _$TodoModelSerializer();

class _$TodoModelSerializer implements StructuredSerializer<TodoModel> {
  @override
  final Iterable<Type> types = const [TodoModel, _$TodoModel];
  @override
  final String wireName = 'TodoModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodoModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TodoItem)])),
      'loadingExternal',
      serializers.serialize(object.loadingExternal,
          specifiedType: const FullType(bool)),
      'nextId',
      serializers.serialize(object.nextId, specifiedType: const FullType(int)),
      'filter',
      serializers.serialize(object.filter,
          specifiedType: const FullType(Filter)),
      'search',
      serializers.serialize(object.search,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TodoModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TodoItem)]))!
              as BuiltList<Object>);
          break;
        case 'loadingExternal':
          result.loadingExternal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'nextId':
          result.nextId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'filter':
          result.filter = serializers.deserialize(value,
              specifiedType: const FullType(Filter)) as Filter;
          break;
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TodoModel extends TodoModel {
  @override
  final BuiltList<TodoItem> items;
  @override
  final bool loadingExternal;
  @override
  final int nextId;
  @override
  final Filter filter;
  @override
  final String search;

  factory _$TodoModel([void Function(TodoModelBuilder)? updates]) =>
      (new TodoModelBuilder()..update(updates)).build();

  _$TodoModel._(
      {required this.items,
      required this.loadingExternal,
      required this.nextId,
      required this.filter,
      required this.search})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(items, 'TodoModel', 'items');
    BuiltValueNullFieldError.checkNotNull(
        loadingExternal, 'TodoModel', 'loadingExternal');
    BuiltValueNullFieldError.checkNotNull(nextId, 'TodoModel', 'nextId');
    BuiltValueNullFieldError.checkNotNull(filter, 'TodoModel', 'filter');
    BuiltValueNullFieldError.checkNotNull(search, 'TodoModel', 'search');
  }

  @override
  TodoModel rebuild(void Function(TodoModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoModelBuilder toBuilder() => new TodoModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoModel &&
        items == other.items &&
        loadingExternal == other.loadingExternal &&
        nextId == other.nextId &&
        filter == other.filter &&
        search == other.search;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, items.hashCode), loadingExternal.hashCode),
                nextId.hashCode),
            filter.hashCode),
        search.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoModel')
          ..add('items', items)
          ..add('loadingExternal', loadingExternal)
          ..add('nextId', nextId)
          ..add('filter', filter)
          ..add('search', search))
        .toString();
  }
}

class TodoModelBuilder implements Builder<TodoModel, TodoModelBuilder> {
  _$TodoModel? _$v;

  ListBuilder<TodoItem>? _items;
  ListBuilder<TodoItem> get items =>
      _$this._items ??= new ListBuilder<TodoItem>();
  set items(ListBuilder<TodoItem>? items) => _$this._items = items;

  bool? _loadingExternal;
  bool? get loadingExternal => _$this._loadingExternal;
  set loadingExternal(bool? loadingExternal) =>
      _$this._loadingExternal = loadingExternal;

  int? _nextId;
  int? get nextId => _$this._nextId;
  set nextId(int? nextId) => _$this._nextId = nextId;

  Filter? _filter;
  Filter? get filter => _$this._filter;
  set filter(Filter? filter) => _$this._filter = filter;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  TodoModelBuilder() {
    TodoModel._initializeBuilder(this);
  }

  TodoModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _loadingExternal = $v.loadingExternal;
      _nextId = $v.nextId;
      _filter = $v.filter;
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoModel;
  }

  @override
  void update(void Function(TodoModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoModel build() {
    _$TodoModel _$result;
    try {
      _$result = _$v ??
          new _$TodoModel._(
              items: items.build(),
              loadingExternal: BuiltValueNullFieldError.checkNotNull(
                  loadingExternal, 'TodoModel', 'loadingExternal'),
              nextId: BuiltValueNullFieldError.checkNotNull(
                  nextId, 'TodoModel', 'nextId'),
              filter: BuiltValueNullFieldError.checkNotNull(
                  filter, 'TodoModel', 'filter'),
              search: BuiltValueNullFieldError.checkNotNull(
                  search, 'TodoModel', 'search'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TodoModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
