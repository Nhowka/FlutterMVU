import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu.dart';

void main() {
  test();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MVUBuilder.withArg('Flutter MVU Demo Home Page',
          init: init, update: update, view: view),
    );
  }
}

class HomeModel {
  final String title;
  final int counter;

  HomeModel({required this.title, required this.counter});

  HomeModel copyWith({title, counter}) =>
      HomeModel(title: title ?? this.title, counter: counter ?? this.counter);
}

void test(){
  print('In all cases');
  printToConsole('In redirected case');
  if (kDebugMode) {
    print('In debug case');
  }
}
void printToConsole(dynamic input) {
  if (kDebugMode) {
    print(input);
  }
}


sealed class HomeMsg {}

class Increment implements HomeMsg {}

(HomeModel, Cmd<HomeMsg>) init(String title) =>
    (HomeModel(title: title, counter: 0), Cmd.none());

(HomeModel, Cmd<HomeMsg>) update(HomeMsg msg, HomeModel model) => switch (msg) {
      Increment() => (model.copyWith(counter: model.counter + 1), Cmd.none())
    };

Widget view(BuildContext context, HomeModel model, Dispatch<HomeMsg> dispatch) {
  return Scaffold(
    appBar: AppBar(
      title: Text(model.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button as MVU this many times:',
          ),
          Text(
            '${model.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(Increment()),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
  );
}
