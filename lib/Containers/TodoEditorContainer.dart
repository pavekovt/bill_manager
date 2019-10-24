
import 'package:flutter/cupertino.dart';
import 'package:flutter_native/Actions/TodoActions.dart';
import 'package:flutter_native/Reducers/AppState.dart';
import 'package:flutter_native/Widgets/HomePage.dart';
import 'package:flutter_native/Widgets/TodoEditorWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoEditorContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(
          createTodoFunction: (todo) => store.dispatch(AddTodoAction(payload: todo))
      ),
      builder: (context, vm) => TodoEditorWidget(createTodo: vm.createTodoFunction),
    );
  }
}

class _ViewModel {
  CreateTodoFunction createTodoFunction;

  _ViewModel({this.createTodoFunction});

}