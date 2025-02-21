import 'package:built_collection/built_collection.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_item_model.dart';

class MockTodoService implements LoadTodoService {
  @override
  Future<List<TodoItem>> loadTodos() async => List.generate(
        2,
        (index) => TodoItem(
            isEditing: false,
            id: index,
            content: 'Title $index',
            completed: false),
      );
}
