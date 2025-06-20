import 'dart:async';

typedef Dispatch<Msg> = void Function(Msg msg);
typedef Effect<Msg> = FutureOr<void> Function(Dispatch<Msg> dispatch);
typedef SubscriptionId = List<String>;
typedef Subscribe<Msg> = void Function() Function(Dispatch<Msg> dispatch);
typedef SubItem<Msg> = (SubscriptionId, Subscribe<Msg>);
typedef Subs<Msg> = List<SubItem<Msg>>;
typedef Subscription<Model, Msg> = Subs<Msg> Function(Model model);

extension MappedDispatch<Msg> on Dispatch<Msg> {
  /// This helper function can be used when going from a parent view to a child view.
  ///
  /// Takes a function that returns the parent message using the child message.
  Dispatch<InnerMsg> map<InnerMsg>(Msg Function(InnerMsg inner) mapper) =>
      (msg) => this(mapper(msg));

  /// This helper function can be used in different scenarios where you have a Cmd and
  /// need to process them using an available dispatch in the context.
  ///
  /// One of such scenarios could be integration tests to guarantee the messages
  /// being emitted or in subscriptions where you have a dispatch function that you might
  /// want to share a Cmd in response to an event.
  void consume(Cmd<Msg> cmd) {
    cmd.consumeWith(this);
  }
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

  /// This helper function can be used in different scenarios where you have a Cmd and
  /// need to process them using an available dispatch in the context.
  ///
  /// One of such scenarios could be integration tests to guarantee the messages
  /// being emitted or in subscriptions where you have a dispatch function that you might
  /// want to share an existing Cmd to be consumed in response to an event.
  void consumeWith(Dispatch<Msg> dispatch) =>
      _commands.forEach((effect) => effect(dispatch));

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

/// Detached MVU processor that can be used to dispatch messages from anywhere.
/// It can be created from functions or subclassed.
/// This is useful when you want to dispatch messages from outside the view.
/// The processor can also be used with dependency injection to create a singleton.
abstract class MVUProcessor<Model, Msg> {
  /// Creates an updated model and a list of commands from a message and the current model.
  (Model, Cmd<Msg>) update(Msg msg, Model model);

  /// Creates an initial model and a list of commands.
  (Model, Cmd<Msg>) init();

  /// Creates a list of subscriptions using the model.
  Subs<Msg> subscriptions(Model model) => [];

  /// Defines the function to use to compare models to prevent unnecessary updates.
  bool modelEquality(Model previousModel, Model nextModel) =>
      identical(previousModel, nextModel);

  /// Create a new MVUProcessor from functions instead of subclassing.
  factory MVUProcessor.fromFunctions(
          {required (Model, Cmd<Msg>) Function() init,
          required (Model, Cmd<Msg>) Function(Msg, Model) update,
          Subscription<Model, Msg>? subscriptions,
          bool Function(Model, Model)? modelEquality}) =>
      _DelegatingMVUProcessor(init, update, subscriptions, modelEquality);

  late final _MVUProcessor<Model, Msg> _processor;

  MVUProcessor() {
    _processor = _MVUProcessor(init, update, subscriptions, modelEquality);
  }

  /// Dispatch a message to the processor.
  void dispatch(Msg msg) {
    _processor.post(msg);
  }

  /// Stop listening for new messages and cancel all active subscriptions
  void dispose() {
    _processor.dispose();
  }

  /// Use the model, after all current messages are processed, and dispatch function.
  /// Can be used to return values and dispatch new messages depending on the current model.
  Future<T> useModel<T>(
          T Function(Model model, Dispatch<Msg> dispatch) handler) =>
      _processor._useModel(handler);

  /// Use the current model at the call instant and dispatch function.
  /// Can be used to return values and dispatch new messages depending on the model.
  /// If messages were dispatched right before calling this function,
  /// there is a good chance that the model will be outdated.
  T useModelSync<T>(T Function(Model model, Dispatch<Msg> dispatch) handler) =>
      handler(_processor.model, _processor.post);

  /// Subscribe to changes in the model. This can be used to update the UI.
  StreamSubscription<Model> subscribe(
          void Function(Model model, Dispatch<Msg> dispatch) handler) =>
      _processor.changes.stream
          .listen((model) => handler(model, _processor.post));
}

class _DelegatingMVUProcessor<Model, Msg> extends MVUProcessor<Model, Msg> {
  final (Model, Cmd<Msg>) Function() _init;
  final (Model, Cmd<Msg>) Function(Msg, Model) _update;
  final Subs<Msg> Function(Model) _subscriptions;
  final bool Function(Model, Model) _modelEquality;

  _DelegatingMVUProcessor(
      (Model, Cmd<Msg>) Function() init,
      (Model, Cmd<Msg>) Function(Msg, Model) update,
      Subscription<Model, Msg>? subscriptions,
      bool Function(Model, Model)? modelEquality)
      : _init = init,
        _update = update,
        _subscriptions = subscriptions ?? ((_) => []),
        _modelEquality = modelEquality ?? identical,
        super();

  @override
  (Model, Cmd<Msg>) init() => _init();

  @override
  (Model, Cmd<Msg>) update(Msg msg, Model model) => _update(msg, model);

  @override
  bool modelEquality(Model previousModel, Model nextModel) =>
      _modelEquality(previousModel, nextModel);

  @override
  Subs<Msg> subscriptions(Model model) => _subscriptions(model);
}

class Sub<Msg> {
  final Subs<Msg> _subs;

  const Sub(Subs<Msg> subs) : _subs = subs;

  /// Empty subscription.
  static Sub<Msg> none<Msg>() => const Sub([]);

  /// Concat a list of subscriptions into a single one.
  static Sub<Msg> batch<Msg>(List<Sub<Msg>> subs) =>
      Sub(subs.expand((element) => element._subs).toList());

  /// Map a subscription from a message to a new subscription with another message.
  static Sub<Msg> map<Inner, Msg>(
          String idPrefix, Sub<Inner> sub, Msg Function(Inner) f) =>
      Sub(sub._subs.map((inner) {
        final (subId, subscribe) = inner;
        return (
          [idPrefix, ...subId],
          (dispatch) => subscribe((innerDispatch) => dispatch(f(innerDispatch)))
        );
      }).toList());

  /// Creates a subscription from a stream, transforming the stream objects to messages.
  static SubItem<Msg> fromStream<Msg, S>(SubscriptionId id, Stream<S> stream,
          Msg? Function(S) streamObjectToMsg) =>
      (
        id,
        (dispatch) => stream.listen((s) {
              if (streamObjectToMsg(s) case Msg msg) {
                dispatch(msg);
              }
            }).cancel
      );

  /// Creates a subscription from a stream, using the stream objects as messages.
  static SubItem<Msg> fromMsgStream<Msg>(
          SubscriptionId id, Stream<Msg?> stream) =>
      fromStream<Msg, Msg?>(id, stream, (msg) => msg);

  /// Creates a subscription from a future, transforming the future object to a message.
  static SubItem<Msg> fromFuture<Msg, S>(SubscriptionId id, Future<S> future,
          Msg? Function(S) futureObjectToMsg) =>
      fromStream(id, future.asStream(), futureObjectToMsg);
}

class _SubscriptionController<Model, Msg> {
  final Dispatch<Msg> _dispatch;
  final Subscription<Model, Msg> _subscription;
  final List<(SubscriptionId, void Function())> _activeSubs = [];

  _SubscriptionController(this._dispatch, this._subscription);

  void calculate(Model nextModel) {
    final calculatedSubs = _subscription(nextModel);
    final dupes = [];
    final newKeys = <String>{};

    final newSubs = [];
    for (final (subId, subscribe) in calculatedSubs) {
      final key = subId.join('.');
      if (newKeys.contains(key)) {
        dupes.add(key);
      } else {
        newKeys.add(key);
        newSubs.add((subId, subscribe));
      }
    }
    if (dupes.isNotEmpty) {
      throw Exception('Duplicate subscription ids: $dupes');
    }
    final oldKeys = _activeSubs.map((e) => e.$1.join('.')).toSet();

    _activeSubs.removeWhere((element) {
      final (keyList, disposer) = element;
      final key = keyList.join('.');
      if (newKeys.contains(key)) {
        return false;
      } else {
        disposer();
        return true;
      }
    });
    for (final (id, subscribe) in newSubs) {
      if (!oldKeys.contains(id.join('.'))) {
        _activeSubs.add((id, subscribe(_dispatch)));
      }
    }
  }

  void cancel() {
    _activeSubs.removeWhere((element) {
      final (keyList, disposer) = element;
      disposer();
      return true;
    });
  }
}

sealed class _MVUControlMsg<Model, Msg> {}

class _MVUMsg<Model, Msg> implements _MVUControlMsg<Model, Msg> {
  final Msg msg;

  _MVUMsg(this.msg);
}

class _MVUHandleModel<Model, Msg> implements _MVUControlMsg<Model, Msg> {
  final void Function(Model model) handler;

  _MVUHandleModel(this.handler);
}

class _MVUProcessor<Model, Msg> {
  late Model _currentModel;
  final StreamController<_MVUControlMsg<Model, Msg>> _mainLoop =
      StreamController();
  final StreamController<Model> changes = StreamController.broadcast();
  late final StreamSubscription<_MVUControlMsg<Model, Msg>> _appLoopSub;
  late final _SubscriptionController<Model, Msg> _subscriptionController;
  final bool Function(Model, Model) _modelEquality;

  void post(Msg msg) {
    if (!_mainLoop.isClosed) {
      _mainLoop.add(_MVUMsg(msg));
    }
  }

  Future<T> _useModel<T>(
      T Function(Model model, Dispatch<Msg> dispatch) handler) {
    Completer<T> completer = Completer();
    if (!_mainLoop.isClosed) {
      _mainLoop.add(_MVUHandleModel(
          (Model model) => completer.complete(handler(model, post))));
    } else {
      completer.completeError(StateError('Loop is closed'));
    }
    return completer.future;
  }

  Model get model => _currentModel;

  _MVUProcessor(
      (Model, Cmd<Msg>) Function() init,
      (Model, Cmd<Msg>) Function(Msg, Model) update,
      Subscription<Model, Msg>? subscriptions,
      [bool Function(Model, Model) modelEquality = identical])
      : _modelEquality = modelEquality {
    _subscriptionController =
        _SubscriptionController(post, subscriptions ?? (_) => []);
    var (newModel, commands) = init();

    _currentModel = newModel;

    changes.add(newModel);
    _subscriptionController.calculate(newModel);

    _appLoopSub =
        _mainLoop.stream.listen((_MVUControlMsg<Model, Msg> controlMsg) {
      switch (controlMsg) {
        case _MVUMsg(:final msg):
          final (nextModel, nextcommands) = update(msg, newModel);

          /// Publish the changes in the state if the model is considered changed.
          if (!_modelEquality(newModel, nextModel)) {
            changes.add(nextModel);
          }
          newModel = nextModel;
          _currentModel = newModel;

          _subscriptionController.calculate(newModel);
          nextcommands.consumeWith(post);
          break;
        case _MVUHandleModel(:final handler):
          handler(newModel);
          break;
      }
    });

    commands._commands.forEach((cmd) => cmd(this.post));
  }

  void dispose() {
    _appLoopSub.cancel();
    changes.close();
    _mainLoop.close();
    _subscriptionController.cancel();
  }
}
