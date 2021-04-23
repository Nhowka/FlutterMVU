part of 'mvu_layer.dart';

typedef ToChild<Model, ChildModel> = ChildModel Function(Model);
typedef Merger<Model, ChildModel> = Model Function(Model, ChildModel);

/// Helper messenger to create child-messengers. They operate on a
/// subset of the original model, so you can do simpler messages
/// that represent the transitions of a single widget.
abstract class MappedMessenger<T extends Messenger<Model>, Model, ChildModel>
    implements Messenger<ChildModel> {
  final T original;
  final StreamController<ChildModel> _childStream =
      StreamController.broadcast();
  late final StreamSubscription<Model> _childSubscription;
  late final Dispatch<ChildModel> _dispatch;
  late ChildModel _firstModel;

  MappedMessenger(this.original, ToChild<Model, ChildModel> mapToChild,
      Merger<Model, ChildModel> merge) {
    _firstModel = mapToChild(original.firstModel);
    _childSubscription = original.changes.listen((model) {
      final _nextChild = mapToChild(model);
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
    _childSubscription.cancel();
    _childStream.close();
  }

  @override
  Stream<ChildModel> get changes => _childStream.stream;

  @override

  /// Dispatch a message created using a function
  Dispatch<ChildModel> get dispatcher => _dispatch;

  @override
  ChildModel get firstModel => _firstModel;

  /// Dispatch a message that just returns the new model from the old model
  void modelDispatcher(ChildModel msg(ChildModel model)) =>
      dispatcher(fromModelMsg(msg));

  /// Dispatch a command, reusing the same model
  void commandDispatcher(Cmd<ChildModel> commands) =>
      dispatcher((ChildModel model) => Update(model, commands: commands));

  /// Uses the latest model to do some computation
  void doWithModel(
    FutureOr<void> action(ChildModel model), {
    Update<ChildModel> onSuccessUpdate(ChildModel model)?,
    ChildModel onSuccessModel(ChildModel model)?,
    Cmd<ChildModel>? onSuccessCommands,
    Update<ChildModel> onErrorUpdate(ChildModel model, Exception e)?,
    ChildModel onErrorModel(ChildModel model, Exception e)?,
    Cmd<ChildModel> onErrorCommands(Exception e)?,
  }) =>
      dispatcher((model) => Update(model,
          commands: Cmd.ofAction(() async => action(model),
              onSuccessUpdate: onSuccessUpdate,
              onSuccessModel: onSuccessModel,
              onSuccessCommands: onSuccessCommands,
              onErrorUpdate: onErrorUpdate,
              onErrorModel: onErrorModel,
              onErrorCommands: onErrorCommands)));
}
