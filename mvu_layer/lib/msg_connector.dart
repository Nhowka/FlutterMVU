part of 'mvu_layer.dart';

class MsgConnector<Connector extends Messenger<Model, Msg>, Model,
    Msg extends BehaviorMsg<Model, Msg>> extends StatefulWidget {
  const MsgConnector({
    Key key,
    @required this.builder,
    this.onInit,
    this.onDispose,
  })  : assert(builder != null),
        super(key: key);

  final MsgWidgetBuilder<Model, Connector> builder;
  final VoidCallback onInit;
  final VoidCallback onDispose;

  Connector getMessenger(BuildContext context) =>
      MsgProvider.of<Model, Msg>(context);

  Widget build(BuildContext context) => MsgBuilder<Connector, Model, Msg>(
      messenger: getMessenger(context), builder: builder);

  @override
  _MsgConnectorState createState() =>
      _MsgConnectorState<Connector, Model, Msg>();
}

class _MsgConnectorState<Connector extends Messenger<Model, Msg>, Model,
        Msg extends BehaviorMsg<Model, Msg>>
    extends State<MsgConnector<Connector, Model, Msg>> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
