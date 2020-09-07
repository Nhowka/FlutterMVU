import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todoapp/todo/todo_item_model.dart';

class LoadTodoService {
  Future<BuiltList<TodoItem>> loadTodos() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users/1/todos');
    final jsonBody = response.body;
    final parsed = jsonDecode(jsonBody);
    return BuiltList<TodoItem>(
      parsed.map((e) => TodoItem.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
