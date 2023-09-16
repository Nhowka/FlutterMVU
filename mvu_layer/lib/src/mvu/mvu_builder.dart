import 'dart:async';

import 'package:flutter/widgets.dart';
import 'mvu_processor.dart';

part 'mvu_widgets.dart';

typedef MsgWidgetBuilder<Model, Msg> = Widget Function(
    BuildContext, Model, Dispatch<Msg>);

typedef MsgWidgetBuilderWithTickerProvider<Model, Msg> = Widget Function(
    BuildContext, TickerProvider, Model, Dispatch<Msg>);

/// Stateful widget that uses MVU to render the view and the
/// dispatcher for sending messages to change it.
class MVUBuilder<Model, Msg> extends StatefulWidget {
  final MsgWidgetBuilderWithTickerProvider<Model, Msg> _view;
  final MVUProcessor<Model, Msg> _processor;

  MVUBuilder._(this._processor, this._view);

  /// Creates a [MVUBuilder] with the given [processor] and [view] functions.
  MVUBuilder.ofProcessor(
      {required MVUProcessor<Model, Msg> processor,
      required MsgWidgetBuilder<Model, Msg> view})
      : this._(
            processor,
            ((BuildContext context, TickerProvider _, Model model,
                    Dispatch<Msg> dispatcher) =>
                view(context, model, dispatcher)));

  /// Creates a [MVUBuilder] with the given [processor] and [view] functions for views that need a [TickerProvider].
  MVUBuilder.ofProcessorAndTickerProvider(
      {required MVUProcessor<Model, Msg> processor,
      required MsgWidgetBuilderWithTickerProvider<Model, Msg> view})
      : this._(processor, view);

  /// Creates a [MVUBuilder] with the given [init], [update] and [view] functions.
  ///   * [init] is called once to return the initial model and commands.
  ///   * [update] is called when a message is received to update the model and return new commands.
  ///   * [view] is called to render the view and dispatch new messages.
  MVUBuilder(
      {required (Model, Cmd<Msg>) Function() init,
      required (Model, Cmd<Msg>) Function(Msg, Model) update,
      required MsgWidgetBuilder<Model, Msg> view,
      Subscription<Model, Msg>? subscriptions})
      : this._(
            MVUProcessor.fromFunctions(
                init: init, update: update, subscriptions: subscriptions),
            ((BuildContext context, TickerProvider _, Model model,
                    Dispatch<Msg> dispatcher) =>
                view(context, model, dispatcher)));

  /// Creates a [MVUBuilder] with the given [init], [update] and [view] functions.
  ///  * [init] is called once to return the initial model and commands.
  ///  * [update] is called when a message is received to update the model and return new commands.
  ///  * [view] is called to render the view and dispatch new messages.
  ///  * [tickerProvider] is used to create a [Ticker] for animations.
  MVUBuilder.withTickerProvider(
      {required (Model, Cmd<Msg>) Function() init,
      required (Model, Cmd<Msg>) Function(Msg, Model) update,
      required MsgWidgetBuilderWithTickerProvider<Model, Msg> view,
      Subscription<Model, Msg>? subscriptions})
      : this._(
            MVUProcessor.fromFunctions(
                init: init, update: update, subscriptions: subscriptions),
            view);

  /// Creates a [MVUBuilder] with the given [init], [update] and [view] functions.
  /// * [init] is called once with the given [argument] to return the initial model and commands.
  /// * [update] is called when a message is received to update the model and return new commands.
  /// * [view] is called to render the view and dispatch new messages.
  /// * [tickerProvider] is used to create a [Ticker] for animations.
  static MVUBuilder<Model, Msg> withArgAndTickerProvider<Model, Msg, Arg>(
    Arg a, {
    required (Model, Cmd<Msg>) Function(Arg) init,
    required (Model, Cmd<Msg>) Function(Msg, Model) update,
    required MsgWidgetBuilderWithTickerProvider<Model, Msg> view,
    Subscription<Model, Msg>? subscriptions,
  }) =>
      MVUBuilder._(
          MVUProcessor.fromFunctions(
              init: () => init(a),
              update: update,
              subscriptions: subscriptions),
          view);

  /// Creates a [MVUBuilder] with the given [init], [update] and [view] functions.
  /// * [init] is called once with the given [argument] to return the initial model and commands.
  /// * [update] is called when a message is received to update the model and return new commands.
  /// * [view] is called to render the view and dispatch new messages.
  static MVUBuilder<Model, Msg> withArg<Model, Msg, Arg>(
    Arg a, {
    required (Model, Cmd<Msg>) Function(Arg) init,
    required (Model, Cmd<Msg>) Function(Msg, Model) update,
    required MsgWidgetBuilder<Model, Msg> view,
    Subscription<Model, Msg>? subscriptions,
  }) =>
      MVUBuilder._(
          MVUProcessor.fromFunctions(
              init: () => init(a),
              update: update,
              subscriptions: subscriptions),
          (BuildContext context, TickerProvider _, Model model,
                  Dispatch<Msg> dispatcher) =>
              view(context, model, dispatcher));

  @override
  State<MVUBuilder<Model, Msg>> createState() => _MVUBuilderState(_processor);
}

/// State for [MVUBuilder].
class _MVUBuilderState<Model, Msg> extends State<MVUBuilder<Model, Msg>>
    with TickerProviderStateMixin {
  late final StreamSubscription<Model> _changesSub;
  final MVUProcessor<Model, Msg> _processor;

  late Model _latestModel;

  _MVUBuilderState(this._processor) {
    _latestModel = _processor.useModel((model, dispatch) => model);
    _changesSub = _processor.subscribe((model, dispatch) {
      if (mounted)
        setState(() {
          _latestModel = model;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._view(context, this, _latestModel, _processor.dispatch);
  }

  @override
  void dispose() {
    _changesSub.cancel();
    super.dispose();
  }
}
