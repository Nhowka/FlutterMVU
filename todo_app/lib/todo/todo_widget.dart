import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/todo/todo_filter.dart';
import 'package:todoapp/todo/todo_item_widget.dart';
import 'package:todoapp/todo/todo_model.dart';
import 'package:todoapp/todo/todos_messenger.dart';

// Implements the view that dispatches TodoMsgs and uses the TodoModel
class TodoWidget {
 static final controller = TextEditingController();
 static final search = TextEditingController();
  static Widget builder(context, TodoModel model, Dispatch<TodoMsg> dispatch) {
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
                      dispatch(AddTodo(content));
                    },
                    decoration:
                        InputDecoration(hintText: "Add something to do"),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ...(model.filtered.map((item) => TodoItemWidget.builder(
                            context, item, dispatch.map(TIMsg.new))))
                      ],
                    ),
                  ),
                  Text("${model.notCompleted.length} remaining"),
                  TextFormField(
                    controller: search,
                    onChanged: dispatch.map(SetSearch.new),
                    decoration: InputDecoration(hintText: "Search items"),
                  ),
                  TodoFilter.builder(
                    context,
                    model,
                    "Filter:",
                    dispatch.map(SetFilter.new),
                    true,
                  ),
                  TodoFilter.builder(context, model, "Clear:",dispatch.map(ClearByFilter.new), false),
                ]),
    );
  }
}
