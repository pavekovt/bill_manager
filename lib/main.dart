import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/Reducers/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'Domain/Todo.dart';
import 'Containers/TodoListContainer.dart';

void main() {
  final store = new Store<AppState>(appReducer, initialState: AppState(todos: [
    Todo(id: "1", title: "Buy toilet paper", completed: false),
    Todo(id: "2", title: "Get drunk", description: "With a lot of friends", completed: false)
  ]));

  runApp(TodoApp(title: "YA!", store: store,));
}

class TodoApp extends StatelessWidget {

  final Store<AppState> store;
  final String title;

  TodoApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: Center(
            child: TodoListContainer()
          ),
        ),
      ),
    );
  }
}