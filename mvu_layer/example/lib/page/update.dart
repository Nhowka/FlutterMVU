import 'package:mvu_layer/mvu.dart';

import 'counter/update.dart' as counter;
import 'input_text/update.dart' as input_text;
import 'model.dart';

(AppPage, Cmd<Msg>) init() =>
    counter.init().map(Counter.new, CounterMsg.new);




(AppPage, Cmd<Msg>) update(Msg msg, AppPage currentPage) =>
    switch ((msg, currentPage)) {
       (CounterMsg(:var counterMsg), Counter(:var state)) =>
        counter.update(counterMsg, state).map(Counter.new, CounterMsg.new),
      (InputTextMsg(:var inputTextMsg), InputText(:var state)) =>
          input_text.update(inputTextMsg, state).map(InputText.new, InputTextMsg.new),
      (SwitchToCounter(), _) =>
          counter.init().map(Counter.new, CounterMsg.new),
      (SwitchToInputText(), _) =>
        input_text.init().map(InputText.new, InputTextMsg.new),
      _ => (currentPage, Cmd.none())
    };
