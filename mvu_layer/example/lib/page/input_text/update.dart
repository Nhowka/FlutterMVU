import 'package:mvu_layer/mvu.dart';

import 'model.dart';

(InputTextState, Cmd<InputTextMsgType>) init(String initial) => (InputTextState(initial, false), Cmd.none());

(InputTextState, Cmd<InputTextMsgType>) update(InputTextMsgType msg, InputTextState state) =>
    switch (msg) {
      InputTextChanged(:var value) => (state.copyWith(inputText: value), Cmd.none()),
      UppercaseToggled(:var value) => (state.copyWith(isUpperCase: value), Cmd.none())
    };
