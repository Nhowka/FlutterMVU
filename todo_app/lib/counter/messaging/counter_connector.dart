import 'package:flutter/widgets.dart';
import 'package:todoapp/counter/messaging/counter_messenger.dart';
import 'package:todoapp/counter/model/counter_model.dart';
import 'package:mvu_layer/mvu_layer.dart';

class CounterConnector
    extends MsgConnector<CounterMessenger, CounterModel, CounterMsg> {
  CounterConnector(
      {Key key, MsgWidgetBuilder<CounterModel, CounterMessenger> builder})
      : super(key: key, builder: builder);
}
