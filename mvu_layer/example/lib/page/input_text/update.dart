import 'package:mvu_layer/mvu.dart';

import 'model.dart';

class InputTextProcessor
    extends MVUProcessor<InputTextState, InputTextMsgType> {
  @override
  (InputTextState, Cmd<InputTextMsgType>) init() =>
      (const InputTextState('', false), Cmd.none());

  @override
  (InputTextState, Cmd<InputTextMsgType>) update(
          InputTextMsgType msg, InputTextState model) =>
      switch (msg) {
        InputTextChanged(:var value) => (
            model.copyWith(inputText: value),
            Cmd.none()
          ),
        UppercaseToggled(:var value) => (
            model.copyWith(isUpperCase: value),
            Cmd.none()
          )
      };
}
