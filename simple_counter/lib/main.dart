import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu_layer.dart';

void main() {
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
      home: MsgBuilder<HomeMessenger, HomeModel>(
          messenger: HomeMessenger('Flutter MVU Demo Home Page'),
          builder: homeBuilder),
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

class HomeMessenger extends Messenger<HomeModel> {
  HomeMessenger(title) : super.model(HomeModel(title: title, counter: 0));

  void increment() =>
      modelDispatcher((model) => model.copyWith(counter: model.counter + 1));
}

Widget homeBuilder(
    BuildContext context, HomeMessenger messenger, HomeModel model) {
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
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: messenger.increment,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
  );
}
