import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:todoapp/counter/model/counter_model.dart';
import 'package:todoapp/todo/model/todo_model.dart';

part 'all_model.g.dart';

enum Pages { COUNTER, TODO }

abstract class AllModel implements Built<AllModel, AllModelBuilder> {
  static Serializer<AllModel> get serializer => _$allModelSerializer;

  static void _initializeBuilder(AllModelBuilder builder) => builder
    ..counter = CounterModel().toBuilder()
    ..todos = TodoModel().toBuilder()
    ..page = Pages.COUNTER;
  Pages get page;
  TodoModel get todos;
  CounterModel get counter;

  AllModel._();
  factory AllModel([void Function(AllModelBuilder) updates]) = _$AllModel;
}
