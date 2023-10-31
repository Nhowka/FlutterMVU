part of 'mvu_builder.dart';

class _InheritedMVUProvider<Model, Msg> extends InheritedWidget {
  final MVUProcessor<Model, Msg> processor;

  _InheritedMVUProvider(this.processor, child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

/// Adds the required [MVUProcessor] to the widget tree to be later used in [MVUContext].
class MVUProvider<Model, Msg> extends StatefulWidget {
  /// Creates a [MVUProvider] with the given [init], [update] functions.
  ///  * [init] is called once to return the initial model and commands.
  ///  * [update] is called when a message is received to update the model and return new commands.
  ///  * [subscriptions] is called to return subscriptions to be executed if enabled by the model.
  ///  * [modelEquality] is used to compare the model and avoid unnecessary rebuilds.
  ///  * [child] is the widget to be rendered.
  ///  * [onInit] is called when the widget is initialized.
  ///  * [onDispose] is called when the widget is disposed.
  MVUProvider(
      {required (Model, Cmd<Msg>) Function() init,
      required (Model, Cmd<Msg>) Function(Msg, Model) update,
      Subscription<Model, Msg>? subscriptions,
      bool Function(Model, Model)? modelEquality,
      this.child = const SizedBox.shrink(),
      this.onInit,
      this.onDispose,
      super.key})
      : processor = MVUProcessor.fromFunctions(
            init: init,
            update: update,
            subscriptions: subscriptions,
            modelEquality: modelEquality);

  /// Creates a [MVUProvider] with the given [processor].
  /// * [processor] is the processor to be used.
  /// * [child] is the widget to be rendered.
  /// * [onInit] is called when the widget is initialized.
  /// * [onDispose] is called when the widget is disposed.
  MVUProvider.fromProcessor(
      {required this.processor,
      this.child = const SizedBox.shrink(),
      this.onInit,
      this.onDispose,
      super.key});

  MVUProvider<Model, Msg> _copyWith({required Widget child}) =>
      MVUProvider.fromProcessor(
        processor: processor,
        child: child,
        onInit: onInit,
        key: key,
      );

  /// Recover the processor from the context.
  static MVUProcessor<Model, Msg>? of<Model, Msg>(
          BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<
              _InheritedMVUProvider<Model, Msg>>()
          ?.processor;

  final MVUProcessor<Model, Msg> processor;
  final Widget child;
  final Effect<Msg>? onInit;
  final Effect<Msg>? onDispose;

  @override
  _MVUProviderDisposer<Model, Msg> createState() =>
      _MVUProviderDisposer<Model, Msg>();
}

class _MVUProviderDisposer<Model, Msg> extends State<MVUProvider<Model, Msg>> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call(widget.processor.dispatch);
  }

  @override
  void dispose() {
    widget.onDispose?.call(widget.processor.dispatch);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedMVUProvider<Model, Msg>(widget.processor, widget.child);
  }
}

/// Widget that builds the view from the model and dispatches messages, getting the [MVUProcessor] from the context.
class MVUContext<Model, Msg> extends StatelessWidget {
  final MsgWidgetBuilderWithTickerProvider<Model, Msg> _view;
  final Widget onContextMissing;

  /// Creates a new MVUContext widget recovering the [MVUProcessor] from the context.
  MVUContext(
      {required MsgWidgetBuilder<Model, Msg> view,
      this.onContextMissing = const SizedBox.shrink(),
      super.key})
      : _view = ((BuildContext context, TickerProvider _, Model model,
                Dispatch<Msg> dispatcher) =>
            view(context, model, dispatcher));

  /// Creates a new MVUContext widget recovering the [MVUProcessor] from the context. Access to the [TickerProvider] is provided.
  MVUContext.withTicker(
      {required MsgWidgetBuilderWithTickerProvider<Model, Msg> view,
      this.onContextMissing = const SizedBox.shrink(),
      super.key})
      : _view = view;

  Widget build(BuildContext context) {
    if (MVUProvider.of<Model, Msg>(context)
        case MVUProcessor<Model, Msg> processor) {
      return MVUBuilder.ofProcessorAndTickerProvider(
          processor: processor, view: _view);
    }
    return onContextMissing;
  }
}

/// Creates a tree with all providers
class MVUProviderTree extends StatelessWidget {
  /// Creates a new MVUProviderTree widget.
  /// * [providers] is the list of providers to be added to the tree.
  /// * [child] is the widget to be rendered.
  const MVUProviderTree({
    Key? key,
    required this.providers,
    required this.child,
  }) : super(key: key);

  final List<MVUProvider> providers;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    for (MVUProvider provider in providers.reversed) {
      child = provider._copyWith(child: child);
    }
    return child;
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

  Subs<Msg> subscriptions(Model model) => [];

  bool modelEquality(Model previousModel, Model nextModel) =>
      identical(previousModel, nextModel);
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

  Subs<Msg> subscriptions(Model model) => [];

  bool modelEquality(Model previousModel, Model nextModel) =>
      identical(previousModel, nextModel);
}

class _MVUWidgetElement<Model, Msg> extends ComponentElement {
  _MVUWidgetElement(MVUWidget<Model, Msg> super.widget);

  @override
  Widget build() {
    final builder = widget as MVUWidget<Model, Msg>;
    return MVUBuilder(
        init: builder.init,
        update: builder.update,
        view: builder.build,
        subscriptions: builder.subscriptions,
        modelEquality: builder.modelEquality);
  }
}

class _MVUWidgetElementWithTicker<Model, Msg> extends ComponentElement {
  _MVUWidgetElementWithTicker(MVUWidgetWithTicker<Model, Msg> super.widget);

  @override
  Widget build() {
    final builder = widget as MVUWidgetWithTicker<Model, Msg>;
    return MVUBuilder.withTickerProvider(
        init: builder.init,
        update: builder.update,
        view: builder.build,
        subscriptions: builder.subscriptions,
        modelEquality: builder.modelEquality);
  }
}

class _MVUWidgetElementProvider<Model, Msg> extends ComponentElement {
  _MVUWidgetElementProvider(MVUProviderWidget<Model, Msg> super.widget);

  @override
  Widget build() {
    final builder = widget as MVUProviderWidget<Model, Msg>;
    return MVUProvider<Model, Msg>(
        init: builder.init,
        update: builder.update,
        subscriptions: builder.subscriptions,
        modelEquality: builder.modelEquality,
        child: builder.child,
        onInit: builder.onInit,
        onDispose: builder.onDispose);
  }
}

/// Widget that provides the [MVUProcessor] to the widget tree for subclassing.
abstract class MVUProviderWidget<Model, Msg> extends Widget {
  final Widget child;
  final Effect<Msg>? onInit;
  final Effect<Msg>? onDispose;

  (Model, Cmd<Msg>) update(Msg msg, Model model);

  (Model, Cmd<Msg>) init();

  Subs<Msg> subscriptions(Model model) => [];

  bool modelEquality(Model previousModel, Model nextModel) =>
      identical(previousModel, nextModel);

  const MVUProviderWidget(
      {required this.child, this.onInit, this.onDispose, super.key});

  @override
  Element createElement() => _MVUWidgetElementProvider<Model, Msg>(this);
}
