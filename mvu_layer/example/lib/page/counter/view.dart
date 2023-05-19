import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';

import 'model.dart';

Widget view(BuildContext context, CounterState state,
        Dispatch<CounterMsgType> dispatch) =>
    Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextButton(
              key: const ValueKey('Increment'),
              onPressed: () => dispatch(const Increment()),
              child: const Text('Increment')),
          TextButton(
              key: const ValueKey('IncrementD'),
              onPressed: () => dispatch(const IncrementDelayed()),
              child: const Text('Increment delayed')),
          TextButton(
              key: const ValueKey('Decrement'),
              onPressed: () => dispatch(const Decrement()),
              child: const Text('Decrement')),
        ]),
        Text('${state.count}', key: const ValueKey('Counter'))
      ],
    );
