import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'counter_model.g.dart';



abstract class CounterModel implements Built<CounterModel, CounterModelBuilder> {
  static Serializer<CounterModel> get serializer => _$counterModelSerializer;

  static void _initializeBuilder(CounterModelBuilder builder) => builder
    ..value = 0
    ..valueFuture = 0;


  int get value;
  int get valueFuture;


  CounterModel._();
  factory CounterModel([void Function(CounterModelBuilder) updates]) = _$CounterModel;
}
