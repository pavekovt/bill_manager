
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Domain/Todo.dart';
import 'package:flutter_native/Reducers/TodoReducer.dart';
import 'package:redux/redux.dart';

class AppState {
  final List<Todo> todos;

  AppState({this.todos});
}

final appReducer = combineReducers<AppState>([
    TypedReducer<AppState, AddTodoAction>(addTodoReducer),
    TypedReducer<AppState, RemoveTodoAction>(removeTodoReducer),
    TypedReducer<AppState, ToggleTodoAction>(toggleTodoReducer),
]);