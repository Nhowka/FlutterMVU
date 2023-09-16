import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';

import 'counter/view.dart' as counter;
import 'counter/model.dart' as counter_m;
import 'input_text/view.dart' as input_text;
import 'model.dart';

Widget view(BuildContext context, AppPage currentPage, Dispatch<Msg> dispatch) =>
    switch (currentPage) {
      Counter() => Column(
          children: [
            TextButton(
                onPressed: () => dispatch(const SwitchToInputText()),
                child: const Text('Show text input')),
            const Divider(),
            MVUContext<counter_m.CounterState, counter_m.CounterMsgType>(view: counter.view)
          ],
        ),
      InputText() => Column(
          children: [
            TextButton(
                onPressed: () => dispatch(const SwitchToCounter()),
                child: const Text('Show counter')),
            const Divider(),
           MVUContext(view: input_text.view)
          ],
        ),
    };
