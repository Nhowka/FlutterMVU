import 'package:todoapp/all/messaging/all_messenger.dart';
import 'package:todoapp/all/model/all_model.dart';
import 'package:mvu_layer/mvu_layer.dart';

class AllProvider extends MsgProvider<AllModel> {
  AllProvider({service, child})
      : super(messenger: AllMessenger(service), child: child);
}
