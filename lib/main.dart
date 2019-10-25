import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/Actions/PageActions.dart';
import 'package:flutter_native/Reducers/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'Domain/Pages.dart';
import 'Widgets/HomePage.dart';

void main() {
  final store = new Store<AppState>(
      appReducer,
      initialState: AppState(
        todos: [],
        currentPage: Pages.Home
      )
  );

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
      child: CupertinoApp(
        title: 'Welcome to Flutter',
        home: StoreConnector<AppState, _ViewModel>(
          converter: (store) => _ViewModel(
            currentPage: store.state.currentPage,
            pageChange: (newPage) => store.dispatch(PageChangeAction(newPage: newPage))
          ),
          builder: (context, vm) =>
              HomePage(currentPage: vm.currentPage, changePage: vm.pageChange),
        )
      ),
    );
  }
}

typedef ChangePageFunction(Pages page);

@immutable
class _ViewModel {
  final Pages currentPage;
  final ChangePageFunction pageChange;

  _ViewModel({this.currentPage, this.pageChange});
}
