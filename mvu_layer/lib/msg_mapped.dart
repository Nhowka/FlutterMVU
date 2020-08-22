part of 'mvu_layer.dart';

typedef ToChild<Model, ChildModel> = ChildModel Function(Model);
typedef Merger<Model, ChildModel> = Model Function(Model, ChildModel);
typedef Wrapper<Model, Msg extends BehaviorMsg<Model, Msg>> = Msg Function(
    BehaviorMsg<Model, Msg>);

// Helper class to create mapped messages that can be used to create
// sub-messages from a parent model to a child one, supporting a
// fractal modelling where all parts look the same
class MappedMsg<Model, Msg extends BehaviorMsg<Model, Msg>, ChildModel,
        ChildMsg extends BehaviorMsg<ChildModel, ChildMsg>>
    extends BehaviorMsg<Model, Msg> {
  final ToChild<Model, ChildModel> mapToChild;
  final Merger<Model, ChildModel> merge;
  final ChildMsg msg;
  MappedMsg(this.mapToChild, this.merge, this.msg);

  Update<Model, Msg> runNext(Model model) {
    ChildModel childModel = mapToChild(model);
    Update<ChildModel, ChildMsg> childUpdate = msg.runNext(childModel);
    return Update(merge(model, childUpdate.model),
        doRebuild: childUpdate.doRebuild,
        commands: Cmd.fmap(
            (BehaviorMsg<ChildModel, ChildMsg> cmsg) =>
                MappedMsg<Model, Msg, ChildModel, ChildMsg>(
                    mapToChild, merge, cmsg),
            childUpdate.commands));
  }
}

// Helper messenger to create child-messengers. They operate on a
// subset of the original model, so you can do simpler messages
// that represent the transitions of a single widget.
abstract class MappedMessenger<Model, Msg extends BehaviorMsg<Model, Msg>,
        ChildModel, ChildMsg extends BehaviorMsg<ChildModel, ChildMsg>>
    implements Messenger<ChildModel, ChildMsg> {
  final Messenger<Model, Msg> original;
  StreamController<ChildModel> _childStream;
  StreamSubscription<Model> _childSubscription;
  Dispatch<ChildModel, BehaviorMsg<ChildModel, ChildMsg>> _dispatch;
  ChildModel _firstModel;

  MappedMessenger(this.original, ToChild<Model, ChildModel> mapToChild,
      Merger<Model, ChildModel> merge) {
    _childStream = StreamController.broadcast();
    final _safeMapToChild = (Model m) {
      try {
        return mapToChild(m);
      } catch (_) {
        return null;
      }
    };
    _firstModel = _safeMapToChild(original.firstModel);
    _childSubscription = original.changes.listen((model) {
      final _nextChild = _safeMapToChild(model);
      if (_nextChild == null) {
        dispose();
      } else {
        _firstModel = _nextChild;
        if (!_childStream.isClosed) {
          _childStream.add(_nextChild);
        }
      }
    });

    _dispatch = (BehaviorMsg<ChildModel, ChildMsg> childMsg) {
      Dispatch<Model, BehaviorMsg<Model, Msg>> dispatch = original.dispatcher;
      dispatch(MappedMsg(_safeMapToChild, merge, childMsg));
    };
  }

  @override
  void addDependent(Messenger dependent) {
    original.addDependent(dependent);
  }

  @override
  void dispose() {
    _childSubscription?.cancel();
    _childStream?.close();
  }

  @override
  Stream<ChildModel> get changes => _childStream.stream;

  @override
  Dispatch<ChildModel, BehaviorMsg<ChildModel, ChildMsg>> get dispatcher =>
      _dispatch;

  @override
  ChildModel get firstModel => _firstModel;
}
