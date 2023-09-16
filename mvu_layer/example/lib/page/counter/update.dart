import 'dart:async';

import 'package:mvu_layer/mvu.dart';

import 'model.dart';

class CounterProvider extends MVUProviderWidget<CounterState, CounterMsgType> {
  const CounterProvider({super.key, required super.child});

  @override
  Subs<CounterMsgType> subscriptions(CounterState model) => [
        if (model.timer)
          (
            ["timer-100"],
            (dispatch) {
              return Timer.periodic(const Duration(milliseconds: 100), (timer) {
                dispatch(const Increment());
              }).cancel;
            }
          )
      ];

  @override
  (CounterState, Cmd<CounterMsgType>) init() =>
      (const CounterState(count: 0, timer: false), Cmd.none());

  @override
  (CounterState, Cmd<CounterMsgType>) update(
          CounterMsgType msg, CounterState model) =>
      switch (msg) {
        ToggleTimer() => (model.copyWith(timer: !model.timer), Cmd.none()),
        Increment() => (model.copyWith(count: model.count + 1), Cmd.none()),
        Decrement() => (model.copyWith(count: model.count - 1), Cmd.none()),
        IncrementDelayed() => (
            model,
            Cmd.batch([
              Cmd.ofEffect((dispatch) => dispatch(const Decrement())),
              Cmd.ofEffect((dispatch) async {
                await Future.delayed(const Duration(milliseconds: 700));
                dispatch(const Increment());
              }),
              Cmd.ofFunc(
                  () => Future.delayed(const Duration(milliseconds: 500)),
                  onMissing: const Increment())
            ])
          )
      };
}
