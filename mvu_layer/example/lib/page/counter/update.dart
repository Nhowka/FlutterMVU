import 'package:mvu_layer/mvu.dart';

import 'model.dart';

(CounterState, Cmd<CounterMsgType>) init() =>
    (const CounterState(0), Cmd.none());

(CounterState, Cmd<CounterMsgType>) update(
        CounterMsgType msg, CounterState state) =>
    switch (msg) {
      Increment() => (CounterState(state.count + 1), Cmd.none()),
      Decrement() => (CounterState(state.count - 1), Cmd.none()),
      IncrementDelayed() => (
          state,
          Cmd.batch([
            Cmd.ofEffect((dispatch) => dispatch(const Decrement())),
            Cmd.ofEffect((dispatch) async {
              await Future.delayed(const Duration(milliseconds: 700));
              dispatch(const Increment());
            }),
            Cmd.ofFunc(() => Future.delayed(const Duration(milliseconds: 500)),
                onMissing: const Increment())
          ])
        )
    };
