part of 'mvu_layer.dart';

/// Use a [Messenger] from a [MsgProvider] up the widget tree
class MsgConnector<Connector extends Messenger<Model>, Model>
    extends StatefulWidget {
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
      MsgProvider.of<Model>(context);

  Widget build(BuildContext context) => MsgBuilder<Connector, Model>(
      messenger: getMessenger(context), builder: builder);

  @override
  _MsgConnectorState createState() => _MsgConnectorState<Connector, Model>();
}

class _MsgConnectorState<Connector extends Messenger<Model>, Model>
    extends State<MsgConnector<Connector, Model>> {
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
