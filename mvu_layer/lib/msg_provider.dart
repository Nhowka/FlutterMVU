part of 'mvu_layer.dart';

typedef MessengerCreator<Model, Msg extends BehaviorMsg<Model, Msg>>
    = Messenger<Model, Msg> Function(MsgProcessor<Model, Msg>);

typedef ChildCreator<
        ChildMessenger extends Messenger<ChildModel, ChildMsg>,
        ChildModel,
        ChildMsg extends BehaviorMsg<ChildModel, ChildMsg>,
        ParentMessenger extends Messenger<Model, Msg>,
        Model,
        Msg extends BehaviorMsg<Model, Msg>>
    = ChildMessenger Function(ParentMessenger);

abstract class Messenger<Model, Msg extends BehaviorMsg<Model, Msg>> {
  Dispatch<Model, BehaviorMsg<Model, Msg>> get dispatcher => _dispatcher;
  Dispatch<Model, BehaviorMsg<Model, Msg>> _dispatcher;
  Stream<Model> _changes;
  Stream<Model> get changes => _changes;
  Model get firstModel => _processor._currentModel;
  MsgProcessor<Model, Msg> _processor;
  List<Messenger> _dependents = [];

  void addDependent(Messenger dependent) {
    if (dependent != null) _dependents.add(dependent);
  }

  void reset() {
    for (var dependent in _dependents) {
      dependent.reset();
    }
    _processor.reInit();
  }

  Messenger(Update<Model, Msg> init) {
    _processor = MsgProcessor(init);
    _dispatcher = _processor.post;
    _changes = _processor.changes.stream;
  }

  void dispose() {
    _processor.dispose();
  }
}


class MsgProvider<Model, Msg extends BehaviorMsg<Model, Msg>>
    extends StatefulWidget {
  final Messenger<Model, Msg> messenger;
  final List<Type> dependsOn;
  final Widget child;

  static Messenger<Model, Msg> of<Model, Msg extends BehaviorMsg<Model, Msg>>(
          BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<
              _InheritedMsgProvider<Model, Msg>>()
          .messenger;

  MsgProvider({this.messenger, this.child, this.dependsOn = const [], Key key})
      : super(key: key);
  MsgProvider<Model, Msg> copyWith({Widget child}) => MsgProvider(
        messenger: messenger,
        child: child ?? this.child,
        dependsOn: dependsOn,
        key: key,
      );

  @override
  _MsgProviderDisposer createState() => _MsgProviderDisposer<Model, Msg>();
}

class _MsgProviderDisposer<Model, Msg extends BehaviorMsg<Model, Msg>>
    extends State<MsgProvider<Model, Msg>> {
  @override
  Widget build(BuildContext context) =>
      _InheritedMsgProvider<Model, Msg>(widget.messenger, widget.child);

  @override
  void dispose() {
    widget?.messenger?.dispose();
    super.dispose();
  }
}

class _InheritedMsgProvider<Model, Msg extends BehaviorMsg<Model, Msg>>
    extends InheritedWidget {
  final Messenger<Model, Msg> messenger;

  _InheritedMsgProvider(this.messenger, child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

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
      for (var type in provider.dependsOn) {
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
