# 0.3.4

- Expose the `modelEquality` function on the `MVUProcessor` constructor. This can be used to avoid multiple renders when the model has no changes that affect the view. This is useful for performance and to avoid some bugs when using the `MVUProcessor` on the background.

# 0.3.3

- Bugfix: Processor was being lazily initialized, which was causing some issues like subscriptions not starting when using it from outside the view. Now it's initialized on the constructor.

# 0.3.2

- Expose the [MVUProcessor] to allow the processing of messages from outside the view. This is useful for testing and for processing messages on the background. Also can be used to add subclasses of the [MVUProcessor] into dependency injection solutions to pass the same processor instance across different locations on the app.
- Add functions [useModel] and [subscribe] into the [MVUProcessor] so you can access the model and subscribe to it from outside the view. This is useful for testing and for implementing CLI apps. You can import only the `package:mvu_layer/mvu_processor.dart` to avoid the `dart:ui` import.
- Add widgets [MVUProvider] and [MVUContext]. This is used to get the [MVUProcessor] through the widget tree, adding a view to the [MVUProcessor] only when needed.
- Add subscriptions like Elmish. These subscriptions are enabled on the background and can be used to dispatch messages to the update function. The subscriptions have an id and are recalculated on every model change. If a new id is returned, the subscription starts and if an old id is not returned, the subscription is cancelled. This is useful for implementing long running tasks like timers or listening on external events.


# 0.3.1

- Add widget classes [MVUWidget] and [MVUWidgetWithTicker] to simplify the implementation of MVU widgets that might need single init dependencies. These dependencies should be final fields and can be accessed from the init and update function without polluting the model or requiring a closure. 

# 0.3.0

- Almost a complete reimplementation of the elmish structure, but still dartish.
- If you want to use the new API, you can import `package:mvu_layer/mvu.dart` instead of `package:mvu_layer/mvu_layer.dart`
- If both are imported in the same file, the `Cmd` helper will clash. This is by design so we don't accidentally mix both. The new API is not backwards compatible and is fundamentally different.
- The new API is heavily dependent on the new Dart 3 features, like records and sealed classes. It's not possible to use it on Dart 2.
- The new API is not yet stable and might change in the future depending on the feedback.
- The new API documentation is not yet very helpful, but the example project is a good starting point.
- The [Elmish book](https://zaid-ajaj.github.io/the-elmish-book/) is a good reference for the new API, even if it's written for F#.
- The recent subscription API is not yet implemented in the new API, but it's planned.
- The new API is more restrictive and will not allow you to do some things that were possible before. This is by design, as dispatching any kind of model transition in any place was breaking the flow and reasoning of complex apps. The new API has an explicit update function that is the only place where you can change the model. This is similar to the Elm architecture, but it's not as restrictive as it's possible to use the `Cmd` helpers to dispatch actions from the update function.
- On the new API, use the new dispatch function on the view to dispatch messages to the update function. You can't set the model directly anymore from it. When testing you can still use the init function to set the initial model required for the test.
- The new API is more verbose, but it's also more explicit and easier to reason about. It's also more type safe and will help you to avoid some common mistakes. Remember to model your messages as sealed classes to get the full experience and the compiler help.
- The old API will only receive bug fixes and will not receive any new features. It's recommended to migrate to the new API if possible. The old API will be deprecated in the future.
- The new API is not yet fully tested and might have some bugs. Please report any issues you find.

# 0.3.0-dev.1

- Experimental real MVU using features from Dart 3.

# 0.2.4

- Fix broken disposer of `MsgProvider`. Offers an `onDispose` function instead.

# 0.2.3

- Accept `doRebuild` on most `Cmd` helpers so it's possible to skip the rendering between some commands

# 0.2.2

- New helper `ofModelAction` to use the latest model as argument of the action

# 0.2.1

- Fixes the `MsgProviderTree` by not requiring a child on `MsgProvider`

# 0.2.1-connector-preview

- Type the messenger on provider
- Change the connector to a stateless widget

# 0.2.0

- Null safety soundness

# 0.1.13

- Simplify `MsgConnector` code

# 0.1.12

- Support continuations on `doWithModel`

# 0.1.11

- Extra `MsgBuilder` with `TickerProvider` support

# 0.1.10

- Helpers for command only continuations

# 0.1.9

- Helpers for command only dispatching

# 0.1.8

- New name constructor `model` initialize the `Messenger` with simple model

# 0.1.7

- New helper `ofModelFunc` to use the latest model as argument of the function

# 0.1.6

- New helper `doWithModel` to create actions using the latest model

# 0.1.5

- Support `onInit` function for using the `BuildContext` when initialising

# 0.1.4

- Only call `setState` when `mounted`

# 0.1.3

- Downgrade `async` to better compatibility

# 0.1.2

- Use sync dispatching for preventing race conditions or dead-locks

# 0.1.1

- Follow dartfmt conventions and better package description.

# 0.1.0 

- Initial release
- Small but probably sufficient API surface.
