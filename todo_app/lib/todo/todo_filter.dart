import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/todo/todo_model.dart';

class TodoFilter {
  static final Map<Filter, String> filterNames = {
    Filter.COMPLETED: "Completed",
    Filter.NOT_COMPLETED: "Not completed",
    Filter.ALL: "All"
  };

  static Widget builder(context, TodoModel model, label, ValueSetter<Filter> filterAction, bool hasHighlight ) => Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(label),
            ...Filter.values.map((e) => FlatButton(
                  child: Text(
                    filterNames[e],
                    style: TextStyle(
                        color: hasHighlight && model.filter == e
                            ? Colors.blue
                            : Colors.black),
                  ),
                  onPressed: () => filterAction(e),
                )),
          ],
        ),
      );
}
