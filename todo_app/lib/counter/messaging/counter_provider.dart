import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:todoapp/counter/model/counter_model.dart';
import 'package:mvu_layer/mvu_layer.dart';

class CounterProvider extends MsgProvider<CounterModel> {
  CounterProvider({AllMessenger messenger, child})
      : super(messenger: messenger.counterMessenger, child: child);
}

