import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';
import 'package:todoapp/counter/counter_messenger.dart';
import 'package:todoapp/counter/counter_model.dart';

class CounterWidget {
  static Widget builder (context, CounterModel model, Dispatch<CounterMsg> dispatch) => Column(
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
      TextButton(child: Text('Increment'), onPressed: () => dispatch(Increment()),),
      TextButton(child: Text('Increment delayed'), onPressed: () => dispatch(IncrementDelayed()),),
      TextButton(child: Text('Decrement'), onPressed: () => dispatch(Decrement()),),
      TextButton(child: Text('Reset'), onPressed: () => dispatch(Reset()),),
      Spacer(flex: 2),
    ],
  );
}