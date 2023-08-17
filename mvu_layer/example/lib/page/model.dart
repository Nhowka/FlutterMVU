import 'package:freezed_annotation/freezed_annotation.dart';

import 'counter/model.dart';
import 'input_text/model.dart';

part 'model.freezed.dart';

@freezed
sealed class AppPage with _$AppPage{
  const factory AppPage.counter(CounterState state) = Counter;
  const factory AppPage.inputText(InputTextState state) = InputText;
}

@freezed
sealed class Msg with _$Msg {
  const factory Msg.counterMsg(CounterMsgType counterMsg) = CounterMsg;
  const factory Msg.inputTextMsg(InputTextMsgType inputTextMsg) = InputTextMsg;
  const factory Msg.switchToCounter() = SwitchToCounter;
  const factory Msg.switchToInputText() = SwitchToInputText;
}

