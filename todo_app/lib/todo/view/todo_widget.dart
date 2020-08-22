import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoapp/todo/messaging/todo_item_provider.dart';
import 'package:todoapp/todo/view/todo_filter.dart';
import 'package:todoapp/todo/messaging/todos_connector.dart';
import 'package:todoapp/todo/view/todo_item_widget.dart';

// Implements the view that dispatches TodoMsgs and uses the TodoModel
class TodoWidget extends StatefulWidget {
  const TodoWidget({Key key}) : super(key: key);
  _TodoStateWidget createState() => _TodoStateWidget();
}

class _TodoStateWidget extends State<TodoWidget> {
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final search = TextEditingController();
    return TodoConnector(
      builder: (context, messenger, model) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: model.loadingExternal
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[CircularProgressIndicator()],
              )
            :  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        key: ValueKey<String>("Input"),
                        controller: controller,
                        onFieldSubmitted: (content) {
                          controller.clear();
                          messenger.addTodo(content);
                        },
                        decoration:
                            InputDecoration(hintText: "Add something to do"),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            ...(model.filtered.map((item) => TodoItemProvider(
                                  messenger: messenger,
                                  id: item.id,
                                  child: TodoItemWidget(),
                                )))
                          ],
                        ),
                      ),
                      Text("${model.notCompleted.length} remaining"),
                      TextFormField(
                        controller: search,
                        onChanged: messenger.setSearch,
                        decoration: InputDecoration(hintText: "Search items"),
                      ),
                      TodoFilter(
                        filterAction: (m) => m.setFilter,
                        label: "Filter:",
                        hasHighlight: true,
                      ),
                      TodoFilter(
                        filterAction: (m) => m.clearByFilter,
                        label: "Clear:",
                      ),
                    ]),

      ),
    );
  }
}
