import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/todo/todo_filter.dart';
import 'package:todoapp/todo/todo_item_messenger.dart';
import 'package:todoapp/todo/todo_item_model.dart';
import 'package:todoapp/todo/todo_item_widget.dart';
import 'package:todoapp/todo/todo_model.dart';
import 'package:todoapp/todo/todos_messenger.dart';

// Implements the view that dispatches TodoMsgs and uses the TodoModel
class TodoWidget {
 static final controller = TextEditingController();
 static final search = TextEditingController();
  static Widget builder(context, TodoMessenger messenger, TodoModel model) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: model.loadingExternal
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            )
          : Column(
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
                        ...(model.filtered.map((item) => TodoItemWidget.builder(
                            context, messenger.itemMessenger(item.id), item)))
                      ],
                    ),
                  ),
                  Text("${model.notCompleted.length} remaining"),
                  TextFormField(
                    controller: search,
                    onChanged: messenger.setSearch,
                    decoration: InputDecoration(hintText: "Search items"),
                  ),
                  TodoFilter.builder(
                    context,
                    model,
                    "Filter:",
                    messenger.setFilter,
                    true,
                  ),
                  TodoFilter.builder(context, model, "Clear:",
                      messenger.clearByFilter, false),
                ]),
    );
  }
}
