import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TodoItemWidget {
  static Widget builder(context, messenger, item) => Row(
      key: ValueKey<int>(item.id),
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: item.isDeleted.isPresent
          ? [
              Expanded(
                  child: Text(
                "Item is being deleted...",
                style: TextStyle(color: Colors.grey),
              )),
              IconButton(
                icon: Icon(Icons.undo),
                onPressed: () => messenger.undoDelete(),
              ),
            ]
          : [
              Expanded(
                  child: item.isEditing
                      ? TextFormField(
                          initialValue: item.content,
                          onFieldSubmitted: (content) =>
                              messenger.setContent(content),
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
                    onPressed: () => messenger.startEdit(),
                  ),
                IconButton(
                  icon: Icon(item.completed ? Icons.undo : Icons.check),
                  onPressed: () => messenger.toggleComplete(),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => messenger.queueDelete(),
                ),
              ]),
            ]);
}
