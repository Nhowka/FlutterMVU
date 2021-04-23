part of 'mvu_layer.dart';

typedef MsgWidgetBuilder<Model, MsgConnector> = Widget Function(
    BuildContext, MsgConnector, Model);

typedef MsgWidgetBuilderWithTickerProvider<Model, MsgConnector> = Widget
    Function(BuildContext, MsgConnector, Model, TickerProvider);

/// Stateful widget that uses the messenger state to render the view and the
/// messenger dispatcher to change it
class MsgBuilder<T extends Messenger<Model>, Model> extends StatefulWidget {
  final T _messenger;
  final MsgWidgetBuilder<Model, T> _builder;
  final ValueChanged<BuildContext>? _onInit;

  const MsgBuilder(
      {required T messenger,
      required MsgWidgetBuilder<Model, T> builder,
      ValueChanged<BuildContext>? onInit})
      : _builder = builder,
        _messenger = messenger,
        _onInit = onInit;

  @override
  _MsgBuilderState<T, Model> createState() => _MsgBuilderState(_messenger);
}

class _MsgBuilderState<T extends Messenger<Model>, Model>
    extends State<MsgBuilder<T, Model>> {
  late final StreamSubscription<Model> _changesSub;
  final T _messenger;
  late Model _latestModel;

  _MsgBuilderState(this._messenger) {
    _latestModel = _messenger.firstModel;
    _changesSub = _messenger.changes.listen((model) {
      if (mounted)
        setState(() {
          _latestModel = model;
        });
    });
  }

  @override
  void initState() {
    super.initState();
    widget._onInit?.call(context);
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

/// Stateful widget that uses the messenger state to render the view and the
/// messenger dispatcher to change it with an extra [TickerProvider]
class MsgBuilderWithTickerProvider<T extends Messenger<Model>, Model>
    extends StatefulWidget {
  final T _messenger;
  final MsgWidgetBuilderWithTickerProvider<Model, T> _builder;
  final ValueChanged<BuildContext>? _onInit;

  const MsgBuilderWithTickerProvider(
      {required T messenger,
      required MsgWidgetBuilderWithTickerProvider<Model, T> builder,
      ValueChanged<BuildContext>? onInit})
      : _builder = builder,
        _messenger = messenger,
        _onInit = onInit;

  @override
  _MsgBuilderWithTickerProviderState<T, Model> createState() =>
      _MsgBuilderWithTickerProviderState(_messenger);
}

class _MsgBuilderWithTickerProviderState<T extends Messenger<Model>, Model>
    extends State<MsgBuilderWithTickerProvider<T, Model>>
    with SingleTickerProviderStateMixin {
  late final StreamSubscription<Model> _changesSub;
  final T _messenger;
  late Model _latestModel;

  _MsgBuilderWithTickerProviderState(this._messenger) {
    _latestModel = _messenger.firstModel;
    _changesSub = _messenger.changes.listen((model) {
      if (mounted)
        setState(() {
          _latestModel = model;
        });
    });
  }

  @override
  void initState() {
    super.initState();
    widget._onInit?.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget._builder(context, _messenger, _latestModel, this);
  }

  @override
  void dispose() {
    _changesSub.cancel();
    super.dispose();
  }
}
