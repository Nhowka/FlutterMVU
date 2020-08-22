import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todoapp/todo/model/todo_item_model.dart';

class LoadTodoService {
  Future<BuiltList<TodoItem>> loadTodos() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/users/1/todos');
    var jsonBody = response.body;
    var parsed = jsonDecode(jsonBody);
    return BuiltList<TodoItem>(
      parsed.map((e) => TodoItem.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
