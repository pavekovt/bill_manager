
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Reducers/AppState.dart';

final addTodoReducer = (AppState state, AddTodoAction action) =>
    AppState(todos: state.todos..add(action.payload));

final removeTodoReducer = (AppState state, RemoveTodoAction action) =>
    AppState(todos: state.todos.where((todo) => todo.id != action.todoId).toList());