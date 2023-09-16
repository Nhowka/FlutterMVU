import 'package:mvu_layer/mvu.dart';

import 'model.dart';

(AppPage, Cmd<Msg>) init() => (const AppPage.counter(),Cmd.none());

(AppPage, Cmd<Msg>) update(Msg msg, AppPage currentPage) =>
    switch ((msg, currentPage)) {
      (SwitchToCounter(), _) => (const AppPage.counter(),Cmd.none()),
      (SwitchToInputText(), _) => (const AppPage.inputText(),Cmd.none())
    };
