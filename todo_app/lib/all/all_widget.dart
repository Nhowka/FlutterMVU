import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/all/all_messenger.dart';
import 'package:todoapp/all/all_model.dart';
import 'package:todoapp/counter/counter_messenger.dart';
import 'package:todoapp/counter/counter_widget.dart';
import 'package:todoapp/todo/service/load_todos_service.dart';
import 'package:todoapp/todo/todo_widget.dart';
import 'package:todoapp/todo/todos_messenger.dart';

class AllWidget extends MVUWidget<AllModel, AllMsg> {
  final LoadTodoService _service;

  const AllWidget(this._service);

  @override
  Widget build(context, AllModel all, Dispatch<AllMsg> dispatch) => Container(
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

  @override
  (AllModel, Cmd<AllMsg>) init() {
    final (counterInit, counterCmds) = CounterMessenger.init;
    final (todoInit, todoCmds) = TodoMessenger.init(_service);
    return (
      AllModel(counter: counterInit, todos: todoInit),
      Cmd.batch([
        Cmd.map(counterCmds, CMsg.new),
        Cmd.map(todoCmds, TMsg.new),
      ])
    );
  }

  @override
  (AllModel, Cmd<AllMsg>) update(AllMsg msg, AllModel model) => switch (msg) {
        ChangePage(:var page) => (
            page != null ? model.copyWith(page: page) : model,
            Cmd.none()
          ),
        TMsg(:var msg) => TodoMessenger.update(msg, model.todos).map(
            (innerModel) =>
                model.copyWith(todos: innerModel),
            TMsg.new),
        CMsg(:var msg) => CounterMessenger.update(msg, model.counter).map(
            (innerModel) =>
                model.copyWith(counter: innerModel),
            CMsg.new),
      };
}

Map<Pages, String> _pageNames = {Pages.COUNTER: 'Counter', Pages.TODO: 'Todo'};
