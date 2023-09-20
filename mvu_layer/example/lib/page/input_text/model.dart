import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class InputTextState with _$InputTextState {
  const factory InputTextState(String inputText, bool isUpperCase) =
      _InputTextState;
}

@freezed
sealed class InputTextMsgType with _$InputTextMsgType {
  const factory InputTextMsgType.inputTextChanged(String value) =
      InputTextChanged;
  const factory InputTextMsgType.uppercaseToggled(bool value) =
      UppercaseToggled;
}
