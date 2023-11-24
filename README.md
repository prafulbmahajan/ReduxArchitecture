# ReduxArchitecture

Redux architecture is meant to protect changes in an application’s state. It forces you to define clearly what state should be set when a specific action is dispatched.

It defines 5 simple components which communicate in one direction (this is called unidirectional flow) as presented on the diagram below.

Redux is very lightweight, so we can easily implement all components without using any 3rd party libraries. The whole implementation is below 60 lines.

![144755460-382b2653-7ed3-41e4-92d2-d6e466226d87](https://github.com/prafulbmahajan/ReduxArchitecture/assets/50682584/d1c25c25-057b-4df0-8efd-c3be76ce93a3)

# Redux rules

###### There is a single global state kept in store.
###### State is immutable.
###### New state can be set only by dispatching an action to store.
###### New state can be calculated only by reducer which is a pure function (always returns the same result for the same inputs).
###### Store notifies subscribers by broadcasting new state.

# Redux pros and cons
### Pros
###### Redux is very lightweight, you can use it without any 3rd party libraries. Implementation takes 60 lines of code.
###### You can define the whole application, interactions, and states up-front without even touching UI. It makes adding new features very pleasant.
###### Side-effects are separated from business logic. You don’t have to mock anything to test business logic. It is calculated by pure function using just a simple state and an action.
###### Reducers are pure functions which makes them extremely testable. You will see that a lot of reducers won’t even require tests because they are very clearly defined without dependencies and asynchronous code.
###### Scalability – to add a new feature you just add a new package of substates, reducers, actions, middlewares, and views. You can even easily close each feature within a separate framework. You can also split any of your states into smaller substates.
###### Clear definition of your application/module in a single place. It makes the state much more predictable and manageable. You can just read reducer and you will instantly see what can happen to view and how its state changes.
###### When everything is relying only on the state, you can easily restore an application to a specific state. Which gives amazing possibilities for development, testing, and bug tracking.
###### Thanks to middlewares you can easily add features for the whole application like Firebase events, logging, or some other things without even touching specific features.
###### Because of the nice separation of responsibilities, you can easily debug all transitions within the application.

### Cons
###### Redux is meant for declarative UI. It’s good for SwiftUI, but might be problematic for UIKit.
###### Navigation sometimes might be tricky.
###### Every time you call an action, the whole state is recreated which may lead to performance issues when it gets too big. However, Swift provides built-in optimizations like copy-on-write for structs, therefore you may never experience this problem.
###### Too many middlewares may sometimes lead to unexpected behavior when for example two of them will send opposite actions. Some actions may also lead to an infinite loop.
###### If you decide to use Redux in your project, there is no way back. This architecture is too specific to revert it to MVVM or something like that.
###### Entry threshold – most mobile developers don’t know/use this architecture. Therefore you will have to teach new people in your team how to work with it.
###### You must pay attention to your state structure to avoid duplication of data.
###### You must be aware that some actions may flood the store and trigger a lot of state changes. For example, keeping text field content in the state. Or the most extreme case: keeping scroll position in the state. You can also minimize the problem by implementing a specific middleware to debounce some actions.
###### The state will become a mix of UI information and domain data which may not look good. However, if it’s getting bigger, you may simply decompose a state into domain and UI.
###### Applying Redux will require turning your programming experience upside-down, but once you get used to it, you’re going to love it

### Just to Remember
1. Create Models if any 
2. Create Actions
3. Create States
4. Create Reduces
5. Create Middleware
6.  Create Store
