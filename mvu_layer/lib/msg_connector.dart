part of 'mvu_layer.dart';

/// Use a [Messenger] from a [MsgProvider] up the widget tree
class MsgConnector<Connector extends Messenger<Model>, Model>
    extends StatelessWidget {
  const MsgConnector({
    Key? key,
    required this.builder,
    this.onInit,
  }) : super(key: key);

  final MsgWidgetBuilder<Model, Connector> builder;
  final MessengerInitializer<Connector, Model>? onInit;

  Widget build(BuildContext context) {
    final messenger = MsgProvider.of<Connector, Model>(context)!;
    return MsgBuilder<Connector, Model>(
        messenger: messenger,
        onInit: (context) => onInit?.call(messenger),
        builder: builder);
  }
}
