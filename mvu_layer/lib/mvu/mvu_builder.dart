part of '../mvu.dart';

typedef MsgWidgetBuilder<Model, Msg> = Widget Function(
    BuildContext, Model, Dispatch<Msg>);

typedef MsgWidgetBuilderWithTickerProvider<Model, Msg> = Widget Function(
    BuildContext, TickerProvider, Model, Dispatch<Msg>);

/// Stateful widget that uses MVU to render the view and the
/// dispatcher for sending messages to change it
class MVUBuilderWithType<Model, Msg, Arg> extends StatefulWidget {
  final MsgWidgetBuilder<Model, Msg> _view;
  final MVUProcessor<Model, Msg, Arg> _processor;

  MVUBuilderWithType(
    Arg arg, {
    required (Model, Cmd<Msg>) Function(Arg) init,
    required (Model, Cmd<Msg>) Function(Msg, Model) update,
    required MsgWidgetBuilder<Model, Msg> view,
  })  : _view = view,
        _processor = MVUProcessor(init, update, arg);

  @override
  State<MVUBuilderWithType<Model, Msg, Arg>> createState() =>
      _MVUBuilderState(_processor);
}

class MVUBuilder<Model, Msg> extends MVUBuilderWithType<Model, Msg, void> {
  MVUBuilder({required (Model, Cmd<Msg>) Function() init, required super.update, required super.view}) : super((), init: (void _) => init()) ;

  static MVUBuilderWithType<Model, Msg, Arg> withArg<Model, Msg, Arg>(Arg a,{
required (Model, Cmd<Msg>) Function(Arg) init,
required (Model, Cmd<Msg>) Function(Msg, Model) update,
required MsgWidgetBuilder<Model, Msg> view,
} ) => MVUBuilderWithType(a, init: init, update: update, view: view,);

}

class _MVUBuilderState<Model, Msg, Arg>
    extends State<MVUBuilderWithType<Model, Msg, Arg>> {
  late final StreamSubscription<Model> _changesSub;
  final MVUProcessor<Model, Msg, Arg> _processor;

  late Model _latestModel;

  _MVUBuilderState(this._processor) {
    _latestModel = _processor.model;
    _changesSub = _processor.changes.stream.listen((model) {
      if (mounted)
        setState(() {
          _latestModel = model;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._view(context, _latestModel, _processor.post);
  }

  @override
  void dispose() {
    _changesSub.cancel();
    super.dispose();
  }
}

/// Stateful widget that uses MVU to render the view and the
/// dispatcher for sending messages to change it with an extra [TickerProvider]
class MVUBuilderWithTickerProvider<Model, Msg, Arg> extends StatefulWidget {
  final MsgWidgetBuilderWithTickerProvider<Model, Msg> _view;
  final MVUProcessor<Model, Msg, Arg> _processor;

  MVUBuilderWithTickerProvider(
    Arg arg, {
    required (Model, Cmd<Msg>) Function(Arg) init,
    required (Model, Cmd<Msg>) Function(Msg, Model) update,
    required MsgWidgetBuilderWithTickerProvider<Model, Msg> view,
  })  : _view = view,
        _processor = MVUProcessor(init, update, arg);

  @override
  State<MVUBuilderWithTickerProvider<Model, Msg, Arg>> createState() =>
      _MVUBuilderWithTickerProviderState(_processor);
}

class _MVUBuilderWithTickerProviderState<Model, Msg, Arg>
    extends State<MVUBuilderWithTickerProvider<Model, Msg, Arg>>
    with SingleTickerProviderStateMixin {
  late final StreamSubscription<Model> _changesSub;
  final MVUProcessor<Model, Msg, Arg> _processor;
  late Model _latestModel;

  _MVUBuilderWithTickerProviderState(this._processor) {
    _latestModel = _processor.model;
    _changesSub = _processor.changes.stream.listen((model) {
      if (mounted)
        setState(() {
          _latestModel = model;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._view(context, this, _latestModel, _processor.post);
  }

  @override
  void dispose() {
    _changesSub.cancel();
    super.dispose();
  }
}
