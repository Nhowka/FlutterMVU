import 'dart:async';

import 'package:flutter/widgets.dart';

part 'mvu_processor.dart';

typedef MsgWidgetBuilder<Model, Msg> = Widget Function(
    BuildContext, Model, Dispatch<Msg>);

typedef MsgWidgetBuilderWithTickerProvider<Model, Msg> = Widget Function(
    BuildContext, TickerProvider, Model, Dispatch<Msg>);

/// Stateful widget that uses MVU to render the view and the
/// dispatcher for sending messages to change it.

class MVUBuilder<Model, Msg> extends StatefulWidget {
  final MsgWidgetBuilderWithTickerProvider<Model, Msg> _view;
  final _MVUProcessor<Model, Msg> _processor;

  MVUBuilder._(this._processor, this._view);

  MVUBuilder(
      {required (Model, Cmd<Msg>) Function() init,
      required (Model, Cmd<Msg>) Function(Msg, Model) update,
      required MsgWidgetBuilder<Model, Msg> view})
      : this._(
            _MVUProcessor(init, update),
            ((BuildContext context, TickerProvider _, Model model,
                    Dispatch<Msg> dispatcher) =>
                view(context, model, dispatcher)));

  MVUBuilder.withTickerProvider(
      {required (Model, Cmd<Msg>) Function() init,
      required (Model, Cmd<Msg>) Function(Msg, Model) update,
      required MsgWidgetBuilderWithTickerProvider<Model, Msg> view})
      : this._(_MVUProcessor(init, update), view);

  static MVUBuilder<Model, Msg> withArgAndTickerProvider<Model, Msg, Arg>(
    Arg a, {
    required (Model, Cmd<Msg>) Function(Arg) init,
    required (Model, Cmd<Msg>) Function(Msg, Model) update,
    required MsgWidgetBuilderWithTickerProvider<Model, Msg> view,
  }) =>
      MVUBuilder._(_MVUProcessor(() => init(a), update), view);

  static MVUBuilder<Model, Msg> withArg<Model, Msg, Arg>(
    Arg a, {
    required (Model, Cmd<Msg>) Function(Arg) init,
    required (Model, Cmd<Msg>) Function(Msg, Model) update,
    required MsgWidgetBuilder<Model, Msg> view,
  }) =>
      MVUBuilder._(
          _MVUProcessor(() => init(a), update),
          (BuildContext context, TickerProvider _, Model model,
                  Dispatch<Msg> dispatcher) =>
              view(context, model, dispatcher));

  @override
  State<MVUBuilder<Model, Msg>> createState() => _MVUBuilderState(_processor);
}

class _MVUBuilderState<Model, Msg> extends State<MVUBuilder<Model, Msg>>
    with TickerProviderStateMixin {
  late final StreamSubscription<Model> _changesSub;
  final _MVUProcessor<Model, Msg> _processor;

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
    return widget._view(context, this, _latestModel, _processor.post);
  }

  @override
  void dispose() {
    _changesSub.cancel();
    super.dispose();
  }
}
