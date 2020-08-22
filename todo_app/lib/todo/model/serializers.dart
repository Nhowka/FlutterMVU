import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:todoapp/todo/model/todo_item_model.dart';
import 'package:todoapp/todo/model/todo_model.dart';


part 'serializers.g.dart';

@SerializersFor(<Type>[
  TodoModel,
  TodoItem,
])

// serializers used by the app
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
