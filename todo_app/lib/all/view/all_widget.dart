import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/all/messaging/all_connector.dart';
import 'package:todoapp/all/model/all_model.dart';
import 'package:todoapp/counter/view/counter_widget.dart';
import 'package:todoapp/todo/view/todo_widget.dart';

class AllWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AllConnector(
      builder: (context, messenger, AllModel all) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: _implementations[all.page],
                    ),
                    DropdownButton<Pages>(
                      key: ValueKey('DropdownButton'),
                      value: all.page,
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: messenger.changePage,
                      items: Pages.values.map((e) => DropdownMenuItem(
                            key: ValueKey(e),
                            value: e,
                            child: Text(_pageNames[e]),
                          )).toList(),
                    )
                  ],
                )),
          ));
}

Map<Pages, Widget> _implementations = {
  Pages.COUNTER: CounterWidget(),
  Pages.TODO: TodoWidget()
};

Map<Pages, String> _pageNames = {Pages.COUNTER: 'Counter', Pages.TODO: 'Todo'};
