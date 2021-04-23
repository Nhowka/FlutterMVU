import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/counter/counter_messenger.dart';
import 'package:todoapp/counter/counter_model.dart';

class CounterWidget {
  static Widget builder (context, CounterMessenger messenger, CounterModel model) => Column(
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
      TextButton(child: Text('Increment'), onPressed: messenger.increment,),
      TextButton(child: Text('Increment delayed'), onPressed: messenger.incrementDelayed,),
      TextButton(child: Text('Decrement'), onPressed: messenger.decrement,),
      TextButton(child: Text('Reset'), onPressed: messenger.reset,),
      Spacer(flex: 2),
    ],
  );
}