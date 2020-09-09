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