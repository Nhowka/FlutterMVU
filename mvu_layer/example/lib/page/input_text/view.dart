import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';

import 'model.dart';

Widget view(BuildContext context, InputTextState state,
    Dispatch<InputTextMsgType> dispatch) =>
    Column(children: [
      TextFormField(
        initialValue: state.inputText,
        onChanged: dispatch.map(InputTextChanged.new),
      ),
      const Divider(),
      CheckboxListTile(
          title: const Text('Uppercase'),
          value: state.isUpperCase,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged:
          dispatch.map((bool? value) => UppercaseToggled(value ?? false))),
      Text(state.isUpperCase ? state.inputText.toUpperCase() : state.inputText),
    ]);