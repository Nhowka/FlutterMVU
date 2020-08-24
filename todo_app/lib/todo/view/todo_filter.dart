import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/todo/messaging/todos_connector.dart';
import 'package:todoapp/todo/messaging/todos_messenger.dart';
import 'package:todoapp/todo/model/todo_model.dart';

class TodoFilter extends StatelessWidget {
  static final Map<Filter, String> filterNames = {
    Filter.COMPLETED: "Completed",
    Filter.NOT_COMPLETED: "Not completed",
    Filter.ALL: "All"
  };

  final ValueSetter<Filter> Function(TodoMessenger) filterAction;
  final String label;
  final bool hasHighlight;

  TodoFilter({this.label, this.filterAction, this.hasHighlight = false, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TodoConnector(
        builder: (context, messenger, model) => Padding(
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
                    onPressed: () => filterAction(messenger)(e),
                  )),
            ],
          ),
        ),
      );
}
