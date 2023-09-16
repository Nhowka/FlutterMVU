import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';

import './page/counter/update.dart';
import './page/input_text/update.dart';

import './page/update.dart';
import './page/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Card(
        child: CounterProvider(
          child: MVUProvider.fromProcessor(
            processor: InputTextProcessor(),
            child: MVUBuilder(init: init, update: update, view: view),
          ),
        ),
      ),
    );
  }
}
