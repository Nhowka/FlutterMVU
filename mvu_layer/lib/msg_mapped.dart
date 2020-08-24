part of 'mvu_layer.dart';

typedef ToChild<Model, ChildModel> = ChildModel Function(Model);
typedef Merger<Model, ChildModel> = Model Function(Model, ChildModel);

// Helper messenger to create child-messengers. They operate on a
// subset of the original model, so you can do simpler messages
// that represent the transitions of a single widget.
abstract class MappedMessenger<Model, ChildModel>
    implements Messenger<ChildModel> {
  final Messenger<Model> original;
  StreamController<ChildModel> _childStream;
  StreamSubscription<Model> _childSubscription;
  Dispatch<ChildModel> _dispatch;
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

    _dispatch = (BehaviorMsg<ChildModel> childMsg) {
      Dispatch<Model> dispatch = original.dispatcher;
      dispatch((Model model) {
        ChildModel childModel = mapToChild(model);
        Update<ChildModel> childUpdate = childMsg(childModel);
        return Update<Model>(merge(model, childUpdate.model),
            doRebuild: childUpdate.doRebuild,
            commands: Cmd.fmap(mapToChild, merge, childUpdate.commands));
      });
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
  Dispatch<ChildModel> get dispatcher => _dispatch;

  @override
  ChildModel get firstModel => _firstModel;

  // Dispatch a message that just returns the new model from the old model
  void modelDispatcher(ChildModel Function(ChildModel) msg) =>
      dispatcher(fromModelMsg(msg));
}
