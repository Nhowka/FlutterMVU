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

  /// Creates a [MVUBuilder] with the given [init], [update] and [view] functions.
  ///   * [init] is called once to return the initial model and commands.
  ///   * [update] is called when a message is received to update the model and return new commands.
  ///   * [view] is called to render the view and dispatch new messages.
  MVUBuilder(
      {required (Model, Cmd<Msg>) Function() init,
      required (Model, Cmd<Msg>) Function(Msg, Model) update,
      required MsgWidgetBuilder<Model, Msg> view})
      : this._(
            _MVUProcessor(init, update),
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
      required MsgWidgetBuilderWithTickerProvider<Model, Msg> view})
      : this._(_MVUProcessor(init, update), view);

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
  }) =>
      MVUBuilder._(_MVUProcessor(() => init(a), update), view);

  /// Creates a [MVUBuilder] with the given [init], [update] and [view] functions.
  /// * [init] is called once with the given [argument] to return the initial model and commands.
  /// * [update] is called when a message is received to update the model and return new commands.
  /// * [view] is called to render the view and dispatch new messages.
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

class _MVUWidgetElement<Model, Msg> extends ComponentElement {
  _MVUWidgetElement(MVUWidget<Model, Msg> super.widget);

  @override
  Widget build() {
    final builder = widget as MVUWidget<Model, Msg>;
    return MVUBuilder(
        init: builder.init, update: builder.update, view: builder.build);
  }
}

class _MVUWidgetElementWithTicker<Model, Msg> extends ComponentElement {
  _MVUWidgetElementWithTicker(MVUWidgetWithTicker<Model, Msg> super.widget);

  @override
  Widget build() {
    final builder = widget as MVUWidgetWithTicker<Model, Msg>;
    return MVUBuilder.withTickerProvider(
        init: builder.init, update: builder.update, view: builder.build);
  }
}

/// This widget exposes the MVU as base class for scenarios where
/// the MVUBuilder is not suitable. For example, when the widget
/// has local dependencies that are not part of the model. In this
/// case, the widget can extend this class and implement the
/// abstract methods.
abstract class MVUWidget<Model, Msg> extends Widget {
  const MVUWidget({super.key});

  @override
  Element createElement() => _MVUWidgetElement<Model, Msg>(this);

  Widget build(BuildContext context, Model model, Dispatch<Msg> dispatch);
  (Model, Cmd<Msg>) update(Msg msg, Model model);
  (Model, Cmd<Msg>) init();
}

/// Same as [MVUWidget] but with a [TickerProvider] for animations.
abstract class MVUWidgetWithTicker<Model, Msg> extends Widget {
  const MVUWidgetWithTicker({super.key});

  @override
  Element createElement() => _MVUWidgetElementWithTicker<Model, Msg>(this);

  Widget build(BuildContext context, TickerProvider tickerProvider, Model model,
      Dispatch<Msg> dispatch);
  (Model, Cmd<Msg>) update(Msg msg, Model model);
  (Model, Cmd<Msg>) init();
}

/// State for [MVUBuilder].
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
