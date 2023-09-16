import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
sealed class AppPage with _$AppPage{
  const factory AppPage.counter() = Counter;
  const factory AppPage.inputText() = InputText;
}

@freezed
sealed class Msg with _$Msg {
  const factory Msg.switchToCounter() = SwitchToCounter;
  const factory Msg.switchToInputText() = SwitchToInputText;
}

