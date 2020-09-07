import 'package:built_collection/built_collection.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_item_model.dart';

class MockTodoService implements LoadTodoService {
  @override
  Future<BuiltList<TodoItem>> loadTodos() async => BuiltList.from(
        List.generate(
          2,
          (index) => TodoItem(
            (b) {
              b
                ..isEditing = false
                ..id = index
                ..content = 'Title $index'
                ..completed = false;
            },
          ),
        ),
      );
}
