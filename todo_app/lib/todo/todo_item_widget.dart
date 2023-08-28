import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/todo/todo_item_messenger.dart';
import 'package:todoapp/todo/todo_item_model.dart';

class TodoItemWidget {
  static Widget builder(context, TodoItem item, Dispatch<TodoItemMsg> dispatch) => Row(
      key: ValueKey<int>(item.id),
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: item.isDeleted != null
          ? [
              Expanded(
                  child: Text(
                "Item is being deleted...",
                style: TextStyle(color: Colors.grey),
              )),
              IconButton(
                icon: Icon(Icons.undo),
                onPressed: () => dispatch(UndoDelete(item.id)),
              ),
            ]
          : [
              Expanded(
                  child: item.isEditing
                      ? TextFormField(
                          initialValue: item.content,
                          onFieldSubmitted: (content) => dispatch(SetContent(item.id,content)),
                        )
                      : Text(
                          item.content,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: item.completed
                                  ? Colors.lightGreen
                                  : Colors.black,
                              fontStyle: item.completed
                                  ? FontStyle.italic
                                  : FontStyle.normal),
                        )),
              Row(children: [
                if (!item.isEditing)
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => dispatch(StartEdit(item.id)),
                  ),
                if (!item.isEditing)
                IconButton(
                  icon: Icon(item.completed ? Icons.undo : Icons.check),
                  onPressed: () => dispatch(ToggleComplete(item.id)),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => dispatch(QueueDelete(item.id)),
                ),
              ]),
            ]);
}
