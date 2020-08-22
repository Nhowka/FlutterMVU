import 'package:flutter/widgets.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:todoapp/all/model/all_model.dart';

class AllConnector extends MsgConnector<AllMessenger, AllModel, AllMsg> {
  AllConnector({Key key, MsgWidgetBuilder<AllModel, AllMessenger> builder})
      : super(key: key, builder: builder);
}
