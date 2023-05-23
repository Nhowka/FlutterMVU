part of 'mvu_builder.dart';

typedef Dispatch<Msg> = void Function(Msg msg);
typedef Effect<Msg> = FutureOr<void> Function(Dispatch<Msg> dispatch);

extension MappedDispatch<Msg> on Dispatch<Msg> {
  /// This helper function can be used when going from a parent view to a child view.
  ///
  /// Takes a function that returns the parent message using the child message.
  Dispatch<InnerMsg> map<InnerMsg>(Msg Function(InnerMsg inner) mapper) =>
      (msg) => this(mapper(msg));
}

extension MappedUpdate<InnerModel, InnerMsg> on (InnerModel, Cmd<InnerMsg>) {
  /// This helper function can be used when going from a child update to a parent update.
  ///
  /// Takes a function that returns the parent model from the child model, and
  /// a function that returns the parent message from the child message.
  (Model, Cmd<Msg>) map<Model, Msg>(
      Model Function(InnerModel innerModel) mapperModel,
      Msg Function(InnerMsg inner) mapperMsg) {
    final (innerModel, innerCmd) = this;
    return (mapperModel(innerModel), Cmd.map(innerCmd, mapperMsg));
  }
}

class Cmd<Msg> {
  final List<Effect<Msg>> _commands;

  const Cmd(List<Effect<Msg>> base) : this._commands = base;

  /// The empty case when no messages are needed.
  static Cmd<Msg> none<Msg>() => const Cmd([]);

  /// Chain a new message after processing the previous message.
  static Cmd<Msg> ofMsg<Msg>(Msg msg) =>
      Cmd([(Dispatch<Msg> dispatch) => dispatch(msg)]);

  /// Map a child [Cmd] to a parent [Cmd].
  static Cmd<Msg> map<Msg, inner>(Cmd<inner> innerCmd, Msg Function(inner) f) =>
      Cmd(innerCmd._commands
          .map((Effect<inner> innerEffect) => (Dispatch<Msg> dispatch) =>
              innerEffect((inner x) => dispatch(f(x))))
          .toList());

  /// Return multiple [Cmd]s.
  static Cmd<Msg> batch<Msg>(Iterable<Cmd<Msg>> cmds) =>
      Cmd(cmds.expand((element) => element._commands).toList());

  /// Gets a reference to the dispatch function. The function that uses it can add
  /// between none and any number of messages.
  static Cmd<Msg> ofEffect<Msg>(Effect<Msg> effect) => Cmd([effect]);

  /// Call a function that after returning a result, can be used to create and dispatch
  /// a new message.
  ///
  /// [task]:
  ///   Function that returns a result that might be turned into a message.
  /// [onSuccess]:
  ///   Function that returns a message when the function terminated successfully using the returned non-null result from the task.
  /// [onMissing]:
  ///   Message used when the function terminated successfully and returned a null value.
  /// [onException]:
  ///   Function that returns a message when the function raised an [Exception], using the exception as input.
  /// [onError]:
  ///   Function that returns a message when the function raised an [Error], using the error as input.
  static Cmd<Msg> ofFunc<Msg, Result>(FutureOr<Result?> Function() task,
          {Msg Function(Result)? onSuccess,
          Msg? onMissing,
          Msg Function(Exception)? onException,
          Msg Function(Error)? onError}) =>
      ofArgFunc((_) => task(), (),
          onMissing: onMissing,
          onError: onError,
          onException: onException,
          onSuccess: onSuccess);

  /// Call a function that after returning a result, can be used to create and dispatch
  /// a new message.
  ///
  /// [task]:
  ///   Function that takes an input and returns a result that might be turned into a message.
  /// [arg]:
  ///   Argument to be used when calling the function.
  /// [onSuccess]:
  ///   Function that returns a message when the function terminated successfully using the returned non-null result from the task.
  /// [onMissing]:
  ///   Message used when the function terminated successfully and returned a null value.
  /// [onException]:
  ///   Function that returns a message when the function raised an [Exception], using the exception as input.
  /// [onError]:
  ///   Function that returns a message when the function raised an [Error], using the error as input.

  static Cmd<Msg> ofArgFunc<Msg, Result, Arg>(
      FutureOr<Result?> Function(Arg) task, Arg arg,
      {Msg Function(Result)? onSuccess,
      Msg? onMissing,
      Msg Function(Exception)? onException,
      Msg Function(Error)? onError}) {
    void bind(Dispatch<Msg> dispatch) async {
      try {
        final result = await task(arg);
        if (result != null) {
          if (onSuccess != null) {
            dispatch(onSuccess(result));
          }
        } else {
          if (onMissing != null) {
            dispatch(onMissing);
          }
        }
      } on Exception catch (ex) {
        if (onException != null) {
          dispatch(onException(ex));
        }
      } on Error catch (err) {
        if (onError != null) {
          dispatch(onError(err));
        }
      }
    }

    return Cmd([bind]);
  }
}

class _MVUProcessor<Model, Msg> {
  late Model _currentModel;
  final StreamController<Msg> _mainLoop = StreamController();
  final StreamController<Model> changes = StreamController.broadcast();
  late final StreamSubscription<Msg> _appLoopSub;

  void post(Msg msg) {
    if (!_mainLoop.isClosed) {
      _mainLoop.add(msg);
    }
  }

  Model get model => _currentModel;

  _MVUProcessor((Model, Cmd<Msg>) Function() init,
      (Model, Cmd<Msg>) Function(Msg, Model) update) {
    var (newModel, commands) = init();

    _currentModel = newModel;

    changes.add(newModel);

    _appLoopSub = _mainLoop.stream.listen((Msg msg) {
      final (nextModel, nextcommands) = update(msg, newModel);

      /// Sets the state again on each new message
      newModel = nextModel;
      changes.add(newModel);
      _currentModel = newModel;
      nextcommands._commands.forEach((cmd) => cmd(this.post));
    });

    commands._commands.forEach((cmd) => cmd(this.post));
  }

  void dispose() {
    _appLoopSub.cancel();
    changes.close();
    _mainLoop.close();
  }
}
