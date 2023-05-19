part of '../mvu.dart';

typedef Dispatch<Msg> = void Function(Msg);
typedef Effect<Msg> = void Function(Dispatch<Msg>);

extension MappedDispatch<Msg> on Dispatch<Msg> {
  ///
  Dispatch<InnerMsg> map<InnerMsg>(Msg Function(InnerMsg inner) mapper) =>
      (msg) => this(mapper(msg));
}

extension MappedUpdate<InnerModel, InnerMsg> on (InnerModel, Cmd<InnerMsg>) {
  (Model, Cmd<Msg>) map<Model, Msg>(Model Function(InnerModel innerModel) mapperModel,
      Msg Function(InnerMsg inner) mapperMsg) {
      final (innerModel, innerCmd) = this;
      return (mapperModel(innerModel), Cmd.map(innerCmd, mapperMsg));
  }
}

class Cmd<Msg> {
  final List<Effect<Msg>> _commands;

  const Cmd(List<Effect<Msg>> base) : this._commands = base;

  static Cmd<Msg> none<Msg>() => const Cmd([]);

  static Cmd<Msg> ofMsg<Msg>(Msg msg) =>
      Cmd([(Dispatch<Msg> dispatch) => dispatch(msg)]);

  static Cmd<Msg> map<Msg, inner>(Cmd<inner> innerCmd, Msg Function(inner) f) =>
      Cmd(innerCmd._commands
          .map((Effect<inner> innerEffect) => (Dispatch<Msg> dispatch) =>
              innerEffect((inner x) => dispatch(f(x))))
          .toList());

  static Cmd<Msg> batch<Msg>(Iterable<Cmd<Msg>> cmds) =>
      Cmd(cmds.expand((element) => element._commands).toList());

  static Cmd<Msg> ofEffect<Msg>(Effect<Msg> effect) => Cmd([effect]);

  static Cmd<Msg> ofFunc<Msg, Result, Arg>(
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

class MVUProcessor<Model, Msg, Arg> {
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

  MVUProcessor((Model, Cmd<Msg>) Function(Arg) init,
      (Model, Cmd<Msg>) Function(Msg, Model) update, Arg arg) {
    var (newModel, commands) = init(arg);

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
