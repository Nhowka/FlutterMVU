part of 'mvu_layer.dart';

// Defines the behavior of the messages, taking a model and outputting a new
// model and optionally extra commands to send future messages
abstract class BehaviorMsg<Model, Msg extends BehaviorMsg<Model, Msg>> {
  Update<Model, Msg> runNext(Model model);
}

class ResetMsg<Model, Msg extends BehaviorMsg<Model, Msg>>
    extends BehaviorMsg<Model, Msg> {
  final Update<Model, Msg> init;

  ResetMsg(this.init);

  @override
  Update<Model, Msg> runNext(_) => init;
}

// Alias for a function that takes a message and returns void
typedef Dispatch<Model, Msg extends BehaviorMsg<Model, Msg>> = void Function(
    Msg msg);
// Alias for a function that takes a dispatcher and returns void
typedef Sub<Model, Msg extends BehaviorMsg<Model, Msg>> = void Function(
    Dispatch<Model, Msg> dispatch);

// Class that implements some helpers when creating commands.
// Commands are a list of Sub
class Cmd<Model, Msg extends BehaviorMsg<Model, Msg>>
    extends DelegatingList<Sub<Model, BehaviorMsg<Model, Msg>>> {
  const Cmd(base) : super(base);
  // Creates a new Cmd from a Msg
  Cmd.ofMsg(msg) : super([(dispatch) => dispatch(msg)]);
  // Creates a new Cmd from a Sub
  Cmd.ofSub(sub) : super([sub]);
  // Creates an empty Cmd
  const Cmd.none() : super(const []);

  // Takes a mapping function from T to Msg and a list of commands yielding T,
  // transforming the inner commands to compatible commands
  static Cmd<Model, BehaviorMsg<Model, Msg>> fmap<
          TModel,
          TMsg extends BehaviorMsg<TModel, TMsg>,
          Model,
          Msg extends BehaviorMsg<Model, Msg>>(
      BehaviorMsg<Model, Msg> f(BehaviorMsg<TModel, TMsg> t),
      Cmd<TModel, BehaviorMsg<TModel, TMsg>> cmd) {
    var mapped = cmd.map((dispatcher) {
      var dispatcherMapper = (dispatch) => (x) => dispatch(f(x));
      return (d) => dispatcher(dispatcherMapper(d));
    }).toList();
    return Cmd(mapped);
  }

  // Do some action. Optionally dispatch a message if the action was successful
  // and dispatch a message on case of Exception
  static Cmd<Model, BehaviorMsg<Model, Msg>>
      ofAction<Model, Msg extends BehaviorMsg<Model, Msg>>(void action(),
          {Msg onSuccess(), Msg onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        action();
        if (onSuccess != null) {
          dispatch(onSuccess());
        }
      } on Exception catch (e) {
        if (onError != null) {
          dispatch(onError(e));
        }
      }
    });
  }

  // Do some async action. Optionally dispatch a message if the action was successful
  // and dispatch a message on case of Exception
  static Cmd<Model, Msg>
      ofAsyncAction<Model, Msg extends BehaviorMsg<Model, Msg>>(Future action(),
          {Msg onSuccess(), Msg onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        await action();
        if (onSuccess != null) {
          dispatch(onSuccess());
        }
      } on Exception catch (e) {
        if (onError != null) {
          dispatch(onError(e));
        }
      }
    });
  }

  // Do some async action. Optionally dispatch a message if the action was successful
  // and dispatch a message on case of Exception
  static Cmd<Model, Msg>
      ofAsyncValue<Model, Msg extends BehaviorMsg<Model, Msg>>(Future action,
          {Msg onSuccess(), Msg onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        final _ = await action;
        if (onSuccess != null) {
          dispatch(onSuccess());
        }
      } on Exception catch (e) {
        if (onError != null) {
          dispatch(onError(e));
        }
      }
    });
  }

  // Perform a function. Takes a mapping function to map the result to a Msg.
  // Optionally takes a function to dispatch a message on Exception.
  static Cmd<Model, Msg>
      ofFunc<Result, Model, Msg extends BehaviorMsg<Model, Msg>>(Result func(),
          {@required Msg onSuccess(Result r), Msg onError(Exception e)}) {
    return Cmd.ofSub((dispatch) {
      try {
        var result = func();
        dispatch(onSuccess(result));
      } on Exception catch (ex) {
        if (onError != null) {
          dispatch(onError(ex));
        }
      }
    });
  }

  // Creates a cancelable message from a future message that
  // can send a different message when cancelled
  static Cmd<Model, Msg>
      ofCancelableMsg<Model, Msg extends BehaviorMsg<Model, Msg>>(
          Msg cancellableMsg(void cancel()),
          Future<Msg> onComplete,
          Msg onCancel) {
    return Cmd.ofSub((dispatch) async {
      final cancellation = CancelableOperation<Msg>.fromFuture(onComplete);
      dispatch(cancellableMsg(cancellation.cancel));
      final result = await cancellation.valueOrCancellation(onCancel);
      dispatch(result);
    });
  }

  // Takes an async Msg. Optionally takes a function to
  // dispatch a message if awaiting the Msg fails
  static Cmd<Model, Msg> ofAsyncMsg<Model, Msg extends BehaviorMsg<Model, Msg>>(
      Future<Msg> asyncMsg,
      {Msg onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        var result = await asyncMsg;
        dispatch(result);
      } on Exception catch (ex) {
        if (onError != null) {
          dispatch(onError(ex));
        }
      }
    });
  }

  // Perform an async function. Takes a mapping function to map the result to
  // a Msg. Optionally takes a function to dispatch a message on Exception.
  static Cmd<Model, Msg>
      ofAsyncFunc<Result, Model, Msg extends BehaviorMsg<Model, Msg>>(
          Future<Result> func(),
          {@required Msg onSuccess(Result r),
          Msg onError(Exception e)}) {
    return Cmd.ofSub((dispatch) async {
      try {
        var result = await func();
        dispatch(onSuccess(result));
      } on Exception catch (ex) {
        if (onError != null) {
          dispatch(onError(ex));
        }
      }
    });
  }

  // Takes a list of Cmds and flat them to a single Cmd
  static Cmd<Model, TMsg> batch<Model, TMsg extends BehaviorMsg<Model, TMsg>>(
          List<Cmd<Model, TMsg>> cmds) =>
      Cmd(cmds.expand((x) => x).toList());
}

// Defines the return of the new model with optional commands
class Update<Model, Msg extends BehaviorMsg<Model, Msg>> {
  const Update(this.model,
      {this.commands = const Cmd.none(), this.doRebuild = true});
  final Cmd<Model, BehaviorMsg<Model, Msg>> commands;
  final bool doRebuild;
  final Model model;
}

class MsgProcessor<Model, Msg extends BehaviorMsg<Model, Msg>> {
  Model _currentModel;
  final StreamController<BehaviorMsg<Model, Msg>> _mainLoop =
      StreamController();
  final StreamController<Model> changes = StreamController.broadcast();
  StreamSubscription<Update<Model, BehaviorMsg<Model, Msg>>> _appLoopSub;

  Update<Model, BehaviorMsg<Model, Msg>> init;
  void post(BehaviorMsg<Model, Msg> msg) {
    if (!_mainLoop.isClosed) {
      _mainLoop.add(msg);
    }
  }

  void reInit() {
    post(ResetMsg(init));
  }

  Model get model => _currentModel;

  MsgProcessor(this.init) {
    var newModel = init.model;
    // Filters only valid message and model pairs to the stream
    final mainLoopStream = _mainLoop.stream
        .map((msg) => (msg != null && _currentModel != null)
            ? msg.runNext(newModel)
            : null)
        .where((x) => x != null);
    _currentModel = newModel;

    _appLoopSub = mainLoopStream.listen((updates) {
      // Sets the state again on each new message
      newModel = updates.model;
      if (updates.doRebuild && !changes.isClosed) {
        changes.add(newModel);
      }
      _currentModel = newModel;
      updates.commands.forEach((cmd) => cmd(this.post));
    });

    init.commands.forEach((cmd) => cmd(this.post));
  }
  void dispose() {
    _appLoopSub?.cancel();
    changes.close();
    _mainLoop.close();
  }
}
