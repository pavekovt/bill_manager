
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Reducers/AppState.dart';

typedef AppState Test(state, action);

final addTodoReducer = (AppState state, AddTodoAction action) =>
    AppState(todos: state.todos..add(action.payload));

final removeTodoReducer = (AppState state, RemoveTodoAction action) =>
    AppState(todos: state.todos.where((todo) => todo.id != action.todoId).toList());

final toggleTodoReducer = (AppState state, ToggleTodoAction action) =>
    AppState(
        todos:
          state.todos.fold([], (array, todo) {
            if (todo.id == action.todoId) todo.completed = !todo.completed;
            return array..add(todo);
          })
    );

