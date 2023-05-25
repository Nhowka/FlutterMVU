import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_widget.dart';
import 'package:todoapp/todo/todo_widget.dart';

class AllWidget {
  static Widget builder(context, AllModel all, Dispatch<AllMsg> dispatch) =>
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: switch (all.page) {
                    Pages.COUNTER => CounterWidget.builder(
                        context, all.counter, dispatch.map(CMsg.new)),
                    Pages.TODO => TodoWidget.builder(
                        context, all.todos, dispatch.map(TMsg.new))
                  },
                ),
                DropdownButton<Pages>(
                  key: ValueKey('DropdownButton'),
                  value: all.page,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (page) => dispatch(ChangePage(page)),
                  items: Pages.values
                      .map((e) => DropdownMenuItem(
                            key: ValueKey(e),
                            value: e,
                            child: Text(_pageNames[e]!),
                          ))
                      .toList(),
                )
              ],
            )),
      );
}



Map<Pages, String> _pageNames = {Pages.COUNTER: 'Counter', Pages.TODO: 'Todo'};
