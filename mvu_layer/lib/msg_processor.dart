part of 'mvu_layer.dart';

// Defines the behavior of the messages, taking a model and outputting a new
// model and optionally extra commands to send future messages
typedef BehaviorMsg<Model> = FutureOr<Update<Model>> Function(Model);
FutureOr<BehaviorMsg<Model>> fromModelMsg<Model>(Model fn(Model model)) =>
    (model) => Update(fn(model));

// Alias for a function that takes a message and returns void
typedef Dispatch<Model> = void Function(BehaviorMsg<Model>);
// Alias for a function that takes a dispatcher and returns void
typedef Sub<Model> = void Function(Dispatch<Model> dispatch);

// Class that implements some helpers when creating commands.
// Commands are a list of Sub
class Cmd<Model> {
  final List<Sub<Model>> _commands;

  const Cmd(List<Sub<Model>> base) : this._commands = base;
  // Creates a new Cmd from a function returning Update
  Cmd.ofFunctionUpdate(BehaviorMsg<Model> msg)
      : this([(Dispatch<Model> dispatch) => dispatch(msg)]);
  // Creates a new Cmd from a function returning Model
  Cmd.ofFunctionModel(Model msg(Model model))
      : this([(Dispatch<Model> dispatch) => dispatch(fromModelMsg(msg))]);

  // Creates a new Cmd from a Sub
  Cmd.ofSub(Sub<Model> sub) : this([sub]);
  // Creates an empty Cmd
  const Cmd.none() : this(const []);

  // Takes a mapping function from the root model to the inner model,
  // a merge function to update the root model and a list of inner commands,
  // transforming the inner commands to compatible commands
  static Cmd<Model> fmap<TModel, Model>(TModel innerModel(Model model),
      Model merge(Model model, TModel innerModel), Cmd<TModel> cmd) {
    final List<Sub<Model>> mapped = cmd._commands.map((Sub<TModel> sub) {
      final dispatcherMapper =
          (Dispatch<Model> dispatch) => (BehaviorMsg<TModel> innerUpdate) {
                dispatch((Model model) async {
                  final inner = innerModel(model);
                  final update = await innerUpdate(inner);
                  return Update(merge(model, update.model),
                      doRebuild: update.doRebuild,
                      commands: Cmd.fmap(innerModel, merge, update.commands));
                });
              };
      return (Dispatch<Model> d) => sub(dispatcherMapper(d));
    }).toList();
    return new Cmd(mapped);
  }

  // Do some action. Optionally dispatch a message if the action was successful
  // and dispatch a message on case of Exception
  static Cmd<Model> ofAction<Model>(
    FutureOr<void> action(), {
    FutureOr<Update<Model>> onSuccessUpdate(Model model),
    FutureOr<Model> onSuccessModel(Model model),
    FutureOr<Update<Model>> onErrorUpdate(Model model, Exception e),
    FutureOr<Model> onErrorModel(Model model, Exception e),
  }) {
    return Cmd.ofSub((Dispatch<Model> dispatch) async {
      try {
        await action();
        if (onSuccessUpdate != null) {
          dispatch(onSuccessUpdate);
        } else if (onSuccessModel != null) {
          dispatch(await fromModelMsg(onSuccessModel));
        }
      } on Exception catch (e) {
        if (onErrorUpdate != null) {
          dispatch((model) => onErrorUpdate(model, e));
        } else if (onErrorModel != null) {
          dispatch(await fromModelMsg((model) => onErrorModel(model, e)));
        }
      }
    });
  }

  // Do some async action. Optionally dispatch a message if the action was successful
  // and dispatch a message on case of Exception
  static Cmd<Model> ofAsyncValue<Model>(
    Future action, {
    FutureOr<Update<Model>> onSuccessUpdate(Model model),
    FutureOr<Model> onSuccessModel(Model model),
    FutureOr<Update<Model>> onErrorUpdate(Model model, Exception e),
    FutureOr<Model> onErrorModel(Model model, Exception e),
  }) {
    return Cmd.ofSub((dispatch) async {
      try {
        final _ = await action;
        if (onSuccessUpdate != null) {
          dispatch(onSuccessUpdate);
        } else if (onSuccessModel != null) {
          dispatch(await fromModelMsg(onSuccessModel));
        }
      } on Exception catch (e) {
        if (onErrorUpdate != null) {
          dispatch((model) => onErrorUpdate(model, e));
        } else if (onErrorModel != null) {
          dispatch(await fromModelMsg((model) => onErrorModel(model, e)));
        }
      }
    });
  }

  // Perform a function. Takes a mapping function to map the result to a Msg.
  // Optionally takes a function to dispatch a message on Exception.
  static Cmd<Model> ofFunc<Result, Model>(
    FutureOr<Result> func(), {
    FutureOr<Update<Model>> onSuccessUpdate(Model model, Result r),
    FutureOr<Model> onSuccessModel(Model model, Result r),
    FutureOr<Update<Model>> onErrorUpdate(Model model, Exception e),
    FutureOr<Model> onErrorModel(Model model, Exception e),
  }) {
    return Cmd.ofSub((dispatch) async {
      try {
        final result = await func();
        if (onSuccessUpdate != null) {
          dispatch((model) => onSuccessUpdate(model, result));
        } else if (onSuccessModel != null) {
          dispatch(await fromModelMsg((model) => onSuccessModel(model, result)));
        }
      } on Exception catch (e) {
        if (onErrorUpdate != null) {
          dispatch((model) => onErrorUpdate(model, e));
        } else if (onErrorModel != null) {
          dispatch(await fromModelMsg((model) => onErrorModel(model, e)));
        }
      }
    });
  }

  // Creates a cancelable message from a future message that
  // can send a different message when cancelled
  static Cmd<Model> ofCancelableMsg<Model>(
      FutureOr<BehaviorMsg<Model>> cancellableMsg(void cancel()),
      FutureOr<BehaviorMsg<Model>> onComplete,
      FutureOr<BehaviorMsg<Model>> onCancel) {
    return Cmd.ofSub((dispatch) async {
      final cancellation =
          CancelableOperation<BehaviorMsg<Model>>.fromFuture(onComplete);
      dispatch(cancellableMsg(cancellation.cancel));
      final result = await cancellation.valueOrCancellation(onCancel);
      dispatch(result);
    });
  }

  // Creates a cancelable message from a future message that
  // can send a different message when cancelled
  static Cmd<Model> ofCancelableModelMsg<Model>(
      FutureOr<Model> Function(Model) cancellableMsg(void cancel()),
      FutureOr<Model Function(Model)> onComplete,
      FutureOr<Model> Function(Model) onCancel) {
    return Cmd.ofSub((dispatch) async {
      final cancellation =
          CancelableOperation<Model Function(Model)>.fromFuture(onComplete);
      dispatch(await fromModelMsg(cancellableMsg(cancellation.cancel)));
      final result = await cancellation.valueOrCancellation(onCancel);
      dispatch(fromModelMsg(result));
    });
  }

  // Takes a Msg. Optionally takes a function to
  // dispatch a message if awaiting the Msg fails
  static Cmd<Model> ofMsg<Model>(FutureOr<BehaviorMsg<Model>> asyncMsg,
      {FutureOr<BehaviorMsg<Model>> onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        final result = await asyncMsg;
        dispatch(result);
      } on Exception catch (ex) {
        if (onError != null) {
          dispatch(onError(ex));
        }
      }
    });
  }

  // Takes an async model Msg. Optionally takes a function to
  // dispatch a message if awaiting the Msg fails
  static Cmd<Model> ofModelMsg<Model>(
      FutureOr<Model Function(Model)> asyncMsg,
      {FutureOr<BehaviorMsg<Model>> onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        final result = await asyncMsg;
        dispatch(fromModelMsg(result));
      } on Exception catch (ex) {
        if (onError != null) {
          dispatch(onError(ex));
        }
      }
    });
  }

  // Takes a list of Cmds and flat them to a single Cmd
  static Cmd<Model> batch<Model>(List<Cmd<Model>> cmds) =>
      Cmd(cmds.expand((x) => x._commands).toList());
}

// Defines the return of the new model with optional commands
class Update<Model> {
  const Update(this.model,
      {this.commands = const Cmd.none(), this.doRebuild = true});
  final Cmd<Model> commands;
  final bool doRebuild;
  final Model model;
}

class MsgProcessor<Model> {
  Model _currentModel;
  final StreamController<FutureOr<BehaviorMsg<Model>>> _mainLoop = StreamController();
  final StreamController<Model> changes = StreamController.broadcast();
  StreamSubscription<Future<Update<Model>>> _appLoopSub;

  Update<Model> init;
  void post(BehaviorMsg<Model> msg) {
    if (!_mainLoop.isClosed) {
      _mainLoop.add(msg);
    }
  }

  void reInit() {
    post((_) => init);
  }

  Model get model => _currentModel;

  MsgProcessor(this.init) {
    var newModel = init.model;
    // Filters only valid message and model pairs to the stream
    final mainLoopStream = _mainLoop.stream
        .map((FutureOr<BehaviorMsg<Model>> msg) async {
           final func = await msg;
           return (func != null && _currentModel != null) ? func(newModel) : null;
    })
        .where((x) => x != null);
    _currentModel = newModel;

    _appLoopSub = mainLoopStream.listen((update) async {
      final updates = await update;
      // Sets the state again on each new message
      newModel = updates.model;
      if (updates.doRebuild && !changes.isClosed) {
        changes.add(newModel);
      }
      _currentModel = newModel;
      updates.commands._commands.forEach((cmd) => cmd(this.post));
    });

    init.commands._commands.forEach((cmd) => cmd(this.post));
  }
  void dispose() {
    _appLoopSub?.cancel();
    changes.close();
    _mainLoop.close();
  }
}
