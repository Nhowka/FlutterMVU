import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todoapp/todo/todo_item_model.dart';

class LoadTodoService {
  Future<List<TodoItem>> loadTodos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.cypress.io/users/1/todos'));
    final jsonBody = response.body;
    final parsed = jsonDecode(jsonBody);
    if (parsed is List) {
      return parsed
          .map((e) => TodoItem.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}
