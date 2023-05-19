import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';

import 'counter/view.dart' as counter;
import 'input_text/view.dart' as input_text;
import 'model.dart';

Widget view(BuildContext context, AppPage currentPage, Dispatch<Msg> dispatch) =>
    switch (currentPage) {
      Counter(:var state) => Column(
          children: [
            TextButton(
                onPressed: () => dispatch(const SwitchToInputText()),
                child: const Text('Show text input')),
            const Divider(),
            counter.view(context, state, dispatch.map(CounterMsg.new)),
          ],
        ),
      InputText(:var state) => Column(
          children: [
            TextButton(
                onPressed: () => dispatch(const SwitchToCounter()),
                child: const Text('Show counter')),
            const Divider(),
            input_text.view(
                context, state, dispatch.map(InputTextMsg.new))
          ],
        ),
    };
