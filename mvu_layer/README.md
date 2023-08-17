# mvu_layer

An Elm-inspired state management for intuitive programming.

## Why another state management?

Good question! To be honest before starting with Flutter, my main tool for creating frontend was Elmish, from the F# ecosystem.
I found [Dartea](https://pub.dev/packages/dartea) in the process, but my team disliked the idea of having different messages implementing a base message.

That was understandable. So I started a quest of having most of the benefits of [the Elm architecture](https://zaid-ajaj.github.io/the-elmish-book/#/chapters/elm/the-architecture) but still being Dart friendly.
That was the result!

## What is like Elmish?

### You still have an immutable state

Why is that a good thing? Is very easy to add bugs by unexpected mutating your state. But that is just a piece of the magic.

### You still have a pure view function

If your view function, or the thingy that returns a `Widget`, is pure (in the sense that it only depends on the arguments it's passed to it, like that immutable state) you
can have a lot of nice things, such as time travelling support or easy debugging and seeing changes happening.

Imagine you have to mock a new feature. You create the changes in the view expecting the new state and just pass that desired state to the view function.
Now you see what your user will see when they have the same state. No surprises!

## I was promised MVU! I see the M, I see the V. Where is the U?

It is on the new 0.3.0 version! The tuple support is finally here, named as records and the unions are too, with the help of sealed classes. You can skip the next couple lines if you are not migrating from 0.2.0 or have not used it befor.
When you import `package:mvu_layer/mvu.dart` instead of the `package:mvu_layer/mvu_layer.dart` you will have access to the new API.
The `Update` class is not used anymore, and you can use a real `update` function that returns a `(Model, Cmd<Msg>)` instead of a `Update<Model>`. The `Messenger` class is gone too, replaced with real `init`, `view` and `update` functions.

## How do I use it?

The library is streamlined to be as unobtrusive as possible. You can bring your own types to become the `Model` and the `Msg` (the message that will be sent to the `update` function). There is no need to subclass any class provided by the library.
But it strongly recommended to subclass your sealed base `Msg` class so the update function can use the new switch expression to handle the different messages. Even though it's written for the F# Elmish, [this book](https://zaid-ajaj.github.io/the-elmish-book/) can teach more about the concepts than I could ever try, but I'll try a little anyway.

### The `Model`

The `Model` is the state of your application. It can be anything, but it's recommended to be immutable. It can be a simple `int` or a complex class with a lot of fields. It's up to you.
It's also important that the model has everything you need to render the view. If you need to fetch data from the internet, you could have a `bool` that indicates if the data is loading or not.
As we will be changing the contents of the immutable model by creating a new one with the new values, we can use source generators to create the boilerplate code for us. The example uses [freezed](https://pub.dev/packages/freezed) for that, but you can use anything similar or not at all. We all have different threshold for pain.


### The `Msg`

The `Msg` is the message that will be sent to the `update` function. It can be anything, but it's recommended to be a sealed class. This messages will represent the different actions that can happen in your application. It can be a button click, a text change, a network response, etc.
You should have a message for each action that can happen in your application. If you have a button that can be clicked, you should have a message for that. If you have a text field that can be changed, you should have a message for that. If you have a network request that can fail, you should have a message for that.
You should also have fields in your message that can be used to update the model. The `update` function will receive the current model and the message, and it will return a new model and a command. The command will be executed and it can send a new message to the `update` function. This is how you can have side effects in your application.

### The `update` function

The `update` function is the heart of the MVU architecture. It will receive the current model and the message, and it will return a new model and a command. This command can be nothing, or it can start a new background task that will send any messages as it needs to the `update` function.
This way you can process a click, update the model and start a network request. When the network request finishes, it will send a message to the `update` function, and you can update the model again. You can define messages for the cases when the network request succeeds or fails, and you can update the model accordingly.
Only the `update` function can change the model, and it can only do it by returning a new model. This new model will then be rendered by the `view` function.

### The `view` function

The `view` function will receive the current model and a `dispatcher` function that will allow you to send messages to the `update` function. This `dispatcher` is a function that receives a message and returns nothing, while the view function returns a `Widget`.
This `Widget` will be rendered by Flutter, and it will be updated every time the `update` function returns a new model. This way you can have a reactive UI that will update itself as the model changes. You can dispatch the messages in response of `onClick` or `onTextChanged` events while the user interacts with the UI.

### The `init` function

The `init` function will be called when the application starts. It will return a record with the initial model and a command. This command is the same one that the `update` function returns, and it can be used to load initial data for the first render of the UI.

### The `Cmd` class (for the commands)

The `Cmd` class is a wrapper around a list of functions that will be executed when the command is executed. This function will receive a `dispatcher` function that will allow you to send messages to the `update` function. That is the main way to receive messages outside of the `view` function.
There is some helper functions for the most common cases, but you can use the `Cmd` to get a reference to the dispatcher and send messages to the `update` function. This way you can have listeners for connection status that send a message for the `update` function when the connection changes, but mostly will be used to send messages as functions returns with the data you need.

### The `MVUBuilder`

The `MVUBuilder` is the widget that glues all of it together. It will receive the `init`, `view` and `update` functions, and it will call them as needed. It will also receive the `Model` and `Msg` types so the compiler can guarantee the type-safety of our functions.

### Full example

```dart
/// The model
class CounterState {
  final int count;

  const CounterState(this.count);
}

/// The messages
sealed class CounterMsgType {}
class Increment extends CounterMsgType {}
class Decrement extends CounterMsgType {}

/// The init
(CounterState, Cmd<CounterMsgType>) init() => (const CounterState(0), Cmd.none());

/// The update
(CounterState, Cmd<CounterMsgType>) update(CounterMsgType msg, CounterState state) => switch(msg) {
  Increment() => (CounterState(state.count + 1), Cmd.none()),
  Decrement() => (CounterState(state.count - 1), Cmd.none())
};

/// The view
Widget view(BuildContext context, CounterState state, Dispatch<CounterMsgType> dispatch) =>
    Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextButton(
              key: const ValueKey('Increment'),
              onPressed: () => dispatch(Increment()),
              child: const Text('Increment')),
          TextButton(
              key: const ValueKey('Decrement'),
              onPressed: () => dispatch(Decrement()),
              child: const Text('Decrement')),
        ]),
        Text('${state.count}', key: const ValueKey('Counter'))
      ],
    );
/// The glue
Widget example = MVUBuilder(
  init: init,
  update: update,
  view: view,
);
```

There is also some different constructor for cases where you would need an argument for the `init` and a `TickerProvider` on the view. Keep tuned for better documentation on the future.

# 0.2.0 legacy readme
The following part is about the legacy 0.2.0 version of the library. It's still valid, and I'm keeping it here for historical reasons. The new version is much more Elmish and uses the Dart 3.0 features to make the knowledge transferable.

Well, now we are getting to the new area... The old `update` function that had the signature `msg -> model -> (model, Cmd msg)` has changed. It has been touched by the OOP dirty hands and got scarred!
But fear not! Our holy function is pure, and while it has learned from the enemy, it is still our friend! Sadly, the `msg` has fallen... We will honor your fall!

Turning back the dial on humor, the truth is that you can just think that your `update` as having the `msg` bit pre-applied. It would be turned into a `model -> (model, Cmd msg)` but our
new friend Dart doesn't have yet a good tuple support. Now each `msg` turns into a `model -> Update` function.

### That is that `Update`?

```dart
class Update<Model> {
  final Cmd<Model> commands;
  final bool doRebuild;
  final Model model;

  const Update(this.model,
      {this.commands = const Cmd.none(), this.doRebuild = true});
}
```

The `Update` is a simple class that holds the new state (the `model`), an option to render or not the widget with the new state (the `doRebuild`) and the effects
that can send or not new transitions on the model (the `commands`). It's more Elmish than Elm in this point, but I hope it's still understandable for newcomers.

## So, what the code is like? What else is different?

My main goal always was, **how can I still write predictable state changes with the least amount of effort possible?** I'm a lazy programmer.
I want to write little code and have it work fine without needing to fix bugs on the following day. I want my colleagues to understand easily what is happening
so they can add new features by themselves and I won't need to do any handholding. Did I achieved that? I don't know! Only time will tell, but I'm hopeful because
I defined the `Messenger` that should be very helpful in doing that!

> The messenger is the glue that holds the state and has the dispatcher for new state transitions.
> In the messenger, you can define new actions that your view might need, mimicking the dispatch of the `msg` to the `update`.
>
> That gives us two nice things! Code completion over the transitions that might happen from inside the messenger and every state transition is in the same class,
> just like they were on our `update` function!  

### Let's start simple!

How could we do anything MVU-like and not show a counter? Let's do a simple counter!

* Our model?

It's a counter, just use an `int`! It should be immutable enough!

* Our messenger?

Let's start it with `0`, no commands needed! The `modelDispatcher` is a special shortcut for when you only want to change the model without sending commands or
choosing to skipping a re-rendering. It's the same as `dispatcher((model) => Update(the_function_body(model)))`. I warned you that I was lazy!

```dart
class TestMessenger extends Messenger<int> {
  TestMessenger() : super(Update(0));

  void increment() => modelDispatcher((model) => model + 1);
}
```

* Our view?

For now, just for the sake of being complete (and just copying the minimal test widget) we will piggyback on the `WidgetsApp` for having a easier time, but the
real work is in the `MsgBuilder`. It takes the messenger in the `messenger` argument and a `Widget Function(BuildContext, Messenger, Model)` in the `builder` argument.
That `builder` should be a pure function to get all the benefits. Depending only on the model it renders the desired `Widget`:

```dart
class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WidgetsApp(
      color: Colors.black,
      builder: (_, __) => MsgBuilder<TestMessenger, int>(
          messenger: TestMessenger(),
          builder: (BuildContext ctx, TestMessenger msg, int model) => 
              Column(children: [
                    Text("$model"),
                    FlatButton(
                        key: ValueKey("Button"),
                        child: Text("Increment"),
                        onPressed: msg.increment)
                  ])));
}
```

* The result?

When you click the button, it will call the function in `onPressed`. The `msg.increment` will dispatch a transition so the `model` will turned into `model + 1`.
The new state will be passed to the view function and a new `Widget` will be generated. If you think of it as a state machine, having the transitions depending
only on the previous mode, you can still handle user input while something loads and just update with the result when it arrives.
The transitions can work out-of-order and still be predictable.

## OK, I tried and it's not that intuitive. Can you help me?

Sure! In the [repository](https://github.com/Nhowka/FlutterMVU) I have another example with more complex scenarios than what the Example tab is showing.
You can open issues with any question, I'll do my best to answer them or add support to scenarios that might not be covered by the current implementation.