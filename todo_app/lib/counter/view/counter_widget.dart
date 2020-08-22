import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/counter/messaging/counter_connector.dart';
import 'package:todoapp/counter/messaging/counter_messenger.dart';
import 'package:todoapp/counter/model/counter_model.dart';

class CounterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => CounterConnector(
    builder: (context, CounterMessenger messenger, CounterModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(flex: 2,),
        Text('Counter value:', style: TextStyle(fontSize: 20),),
        Text('${model.value}', style: TextStyle(fontSize: 28),),
        if(model.valueFuture > 0)
          ...[
            Spacer(),
            Text('Value to be incremented: ${model.valueFuture}'),
        ],
        Spacer(flex: 3),
        FlatButton(child: Text('Increment'), onPressed: messenger.increment,),
        FlatButton(child: Text('Increment delayed'), onPressed: messenger.incrementDelayed,),
        FlatButton(child: Text('Decrement'), onPressed: messenger.decrement,),
        FlatButton(child: Text('Reset'), onPressed: messenger.reset,),
        Spacer(flex: 2),
      ],
    ),
  );
}