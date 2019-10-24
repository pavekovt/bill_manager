import 'package:flutter/cupertino.dart';
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Domain/Todo.dart';
import 'package:flutter_native/Reducers/AppState.dart';
import 'package:flutter_native/Widgets/TodoListWidget.dart';
import 'package:flutter_native/Widgets/TodoWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Center(
          child: StoreConnector<AppState, _ViewModel>(
            converter: (store) => _ViewModel(
                todos: store.state.todos,
                toggle: (id) => store.dispatch(ToggleTodoAction(todoId: id))
            ),
              builder: (context, vm) => TodoListWidget(
                todos: vm.todos,
                toggle: vm.toggle
              )
          ));
}

class _ViewModel {
  List<Todo> todos;
  ToggleTodoFunction toggle;

  _ViewModel({this.todos, this.toggle});
}
