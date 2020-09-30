part of 'mvu_layer.dart';

typedef MessengerCreator<Model> = Messenger<Model> Function(
    MsgProcessor<Model>);

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
  Dispatch<Model> _dispatcher;
  Stream<Model> _changes;
  Stream<Model> get changes => _changes;
  Model get firstModel => _processor._currentModel;
  MsgProcessor<Model> _processor;
  List<Messenger> _dependents = [];

  void addDependent(Messenger dependent) {
    if (dependent != null) _dependents.add(dependent);
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

  void dispose() {
    _processor.dispose();
  }

  /// Dispatch a message that just returns the new model from the old model
  void modelDispatcher(Model msg(Model model)) => dispatcher(fromModelMsg(msg));

  /// Uses the latest model to do some computation
  void doWithModel(FutureOr<void> action(Model model)) => dispatcher((model) =>
      Update(model, commands: Cmd.ofAction(() async => action(model))));
}

/// Creates a way to pass a [Messenger] along the widget tree to be consumed
/// by a child [MsgConnector]
class MsgProvider<Model> extends StatefulWidget {
  final Messenger<Model> messenger;
  final List<Type> dependsOn;
  final Widget child;

  static Messenger<Model> of<Model>(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_InheritedMsgProvider<Model>>()
      .messenger;

  MsgProvider({this.messenger, this.child, this.dependsOn = const [], Key key})
      : super(key: key);
  MsgProvider<Model> copyWith({Widget child}) => MsgProvider(
        messenger: messenger,
        child: child ?? this.child,
        dependsOn: dependsOn,
        key: key,
      );

  @override
  _MsgProviderDisposer createState() => _MsgProviderDisposer<Model>();
}

class _MsgProviderDisposer<Model> extends State<MsgProvider<Model>> {
  @override
  Widget build(BuildContext context) =>
      _InheritedMsgProvider<Model>(widget.messenger, widget.child);

  @override
  void dispose() {
    widget?.messenger?.dispose();
    super.dispose();
  }
}

class _InheritedMsgProvider<Model> extends InheritedWidget {
  final Messenger<Model> messenger;

  _InheritedMsgProvider(this.messenger, child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

/// Creates a tree with all providers
class MsgProviderTree extends StatelessWidget {
  const MsgProviderTree({
    Key key,
    @required this.providers,
    @required this.child,
  })  : assert(providers != null),
        assert(child != null),
        super(key: key);

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
