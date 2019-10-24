
import 'package:flutter/cupertino.dart';
import 'package:flutter_native/Actions/PageActions.dart';
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Domain/Pages.dart';
import 'package:flutter_native/Domain/Todo.dart';
import 'package:flutter_native/Reducers/PageReducer.dart';
import 'package:flutter_native/Reducers/TodoReducer.dart';
import 'package:redux/redux.dart';

@immutable
class AppState {
  final List<Todo> todos;
  final Pages currentPage;

  AppState({this.todos, this.currentPage = Pages.Home});
}

final appReducer = combineReducers<AppState>([
    TypedReducer<AppState, AddTodoAction>(addTodoReducer),
    TypedReducer<AppState, RemoveTodoAction>(removeTodoReducer),
    TypedReducer<AppState, ToggleTodoAction>(toggleTodoReducer),
    TypedReducer<AppState, PageChangeAction>(changePageReducer),
]);