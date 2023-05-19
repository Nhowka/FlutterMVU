part of '../mvu_layer.dart';

typedef MessengerCreator<Model> = Messenger<Model> Function(
    MsgProcessor<Model>);

typedef MessengerInitializer<Connector extends Messenger<Model>, Model> = void
    Function(Connector);

typedef MessengerDisposer<Connector extends Messenger<Model>, Model> = void
    Function(Connector);

typedef ChildCreator<
        ChildMessenger extends Messenger<ChildModel>,
        ChildModel,
        ChildMsg extends BehaviorMsg<ChildModel>,
        ParentMessenger extends Messenger<Model>,
        Model,
        Msg extends BehaviorMsg<Model>>
    = ChildMessenger Function(ParentMessenger);

/// Class where the transitions are hold. Used with [MsgBuilder] do render
/// the current state
abstract class Messenger<Model> {
  /// Dispatch a message created using a function
  Dispatch<Model> get dispatcher => _dispatcher;
  late final Dispatch<Model> _dispatcher;
  late final Stream<Model> _changes;

  Stream<Model> get changes => _changes;

  Model get firstModel => _processor._currentModel;
  late final MsgProcessor<Model> _processor;
  List<Messenger> _dependents = [];

  void addDependent(Messenger dependent) {
    _dependents.add(dependent);
  }

  void reset() {
    for (final dependent in _dependents) {
      dependent.reset();
    }
    _processor.reInit();
  }

  /// Initial state of the Messenger
  Messenger(Update<Model> init) {
    _processor = MsgProcessor(init);
    _dispatcher = _processor.post;
    _changes = _processor.changes.stream;
  }

  /// Named initializer for simple model initialization
  Messenger.model(Model init) : this(Update(init));

  void dispose() {
    _processor.dispose();
  }

  /// Extract a future value mapped from the model
  Future<T> extract<T>(T Function(Model) extractFunction) {
    final Completer<T> completer = Completer<T>();
    doWithModel((model) => completer.complete(extractFunction(model)));
    return completer.future;
  }

  /// Recover the latest model in a async getter
  Future<Model> get model => extract((model) => model);

  /// Dispatch a message that just returns the new model from the old model
  void modelDispatcher(
    Model msg(Model model), {
    bool doRebuild = true,
  }) =>
      dispatcher(fromModelMsg(msg, doRebuild: doRebuild));

  /// Dispatch a command, reusing the same model
  void commandDispatcher(Cmd<Model> commands) =>
      dispatcher((Model model) => Update(model, commands: commands));

  /// Uses the latest model to do some computation
  void doWithModel(
    FutureOr<void> action(Model model), {
    Update<Model> onSuccessUpdate(Model model)?,
    Model onSuccessModel(Model model)?,
    Cmd<Model>? onSuccessCommands,
    Update<Model> onErrorUpdate(Model model, Exception e)?,
    Model onErrorModel(Model model, Exception e)?,
    Cmd<Model> onErrorCommands(Exception e)?,
    bool doRebuild = true,
  }) =>
      dispatcher((model) => Update(model,
          commands: Cmd.ofAction(() async => action(model),
              onSuccessUpdate: onSuccessUpdate,
              onSuccessModel: onSuccessModel,
              onSuccessCommands: onSuccessCommands,
              onErrorUpdate: onErrorUpdate,
              onErrorModel: onErrorModel,
              onErrorCommands: onErrorCommands,
              doRebuild: doRebuild)));
}

/// Creates a way to pass a [Messenger] along the widget tree to be consumed
/// by a child [MsgConnector]
class MsgProvider<Connector extends Messenger<Model>, Model>
    extends StatefulWidget {
  final Connector messenger;
  final List<Type> dependsOn;
  final Widget child;
  final MessengerInitializer<Connector, Model>? onInit;
  final MessengerDisposer<Connector, Model>? onDispose;

  static Connector? of<Connector extends Messenger<Model>, Model>(
          BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<
              _InheritedMsgProvider<Connector, Model>>()
          ?.messenger;

  MsgProvider(
      {required this.messenger,
      this.child = const SizedBox.shrink(),
      this.dependsOn = const [],
      this.onInit,
      this.onDispose,
      Key? key})
      : super(key: key);

  MsgProvider<Connector, Model> copyWith({required Widget child}) =>
      MsgProvider(
        messenger: messenger,
        child: child,
        dependsOn: dependsOn,
        onInit: onInit,
        key: key,
      );

  @override
  _MsgProviderDisposer createState() =>
      _MsgProviderDisposer<Connector, Model>();
}

class _MsgProviderDisposer<Connector extends Messenger<Model>, Model>
    extends State<MsgProvider<Connector, Model>> {
  @override
  Widget build(BuildContext context) =>
      _InheritedMsgProvider<Connector, Model>(widget.messenger, widget.child);

  @override
  void initState() {
    super.initState();
    widget.onInit?.call(widget.messenger);
  }

  @override
  void dispose() {
    widget.onDispose?.call(widget.messenger);
    super.dispose();
  }
}

class _InheritedMsgProvider<Connector extends Messenger<Model>, Model>
    extends InheritedWidget {
  final Connector messenger;

  _InheritedMsgProvider(this.messenger, child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

/// Creates a tree with all providers
class MsgProviderTree extends StatelessWidget {
  const MsgProviderTree({
    Key? key,
    required this.providers,
    required this.child,
  }) : super(key: key);

  final List<MsgProvider> providers;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Map<Type, List<Messenger>> dependencies = {};
    Widget child = this.child;
    for (MsgProvider provider in providers.reversed) {
      for (final type in provider.dependsOn) {
        dependencies[type] = (dependencies[type] ?? [])
          ..add(provider.messenger);
      }
      for (Messenger m in (dependencies[provider.runtimeType] ?? [])) {
        provider.messenger.addDependent(m);
      }
      child = provider.copyWith(child: child);
    }
    return child;
  }
}
