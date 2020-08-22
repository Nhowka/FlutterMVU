part of 'mvu_layer.dart';

typedef MsgWidgetBuilder<Model, MsgConnector> = Widget Function(
    BuildContext, MsgConnector, Model);

class MsgBuilder<T extends Messenger<Model, Msg>, Model,
    Msg extends BehaviorMsg<Model, Msg>> extends StatefulWidget {
  final Messenger<Model, Msg> _messenger;
  final MsgWidgetBuilder<Model, T> _builder;

  const MsgBuilder({messenger, builder})
      : _builder = builder,
        _messenger = messenger;

  @override
  _MsgBuilderState<T, Model, Msg> createState() => _MsgBuilderState(_messenger);
}

class _MsgBuilderState<T extends Messenger<Model, Msg>, Model,
        Msg extends BehaviorMsg<Model, Msg>>
    extends State<MsgBuilder<T, Model, Msg>> {
  StreamSubscription<Model> _changesSub;
  Messenger<Model, Msg> _messenger;
  Model _latestModel;

  _MsgBuilderState(this._messenger) {
    _latestModel = _messenger.firstModel;
    _changesSub = _messenger.changes.listen((model) {
      setState(() {
        _latestModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._builder(context, _messenger, _latestModel);
  }

  @override
  void dispose() {
    _changesSub.cancel();
    super.dispose();
  }
}
