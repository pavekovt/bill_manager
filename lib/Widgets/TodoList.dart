import 'package:flutter/cupertino.dart';
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Domain/Todo.dart';
import 'package:flutter_native/Reducers/AppState.dart';
import 'package:flutter_native/Widgets/TodoWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Center(
          child: StoreConnector<AppState, List<Todo>>(
            converter: (store) => store.state.todos,
            builder: (context, todos) =>
                Column(
                    children: todos
                        .map((todo) =>
                        TodoWidget(
                          todo: todo,
                          complete: () { StoreConnector<AppState, VoidCallback>(
                            converter: (store) => () => store.dispatch(CompleteTodoAction(todoId: todo.id)),
                            builder: (context, VoidCallback) {

                            },
                          )},
                        ))
                        .toList()),
          ));
}
