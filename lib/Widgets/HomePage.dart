import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/Containers/TodoEditorContainer.dart';
import 'package:flutter_native/Containers/TodoListContainer.dart';
import 'package:flutter_native/Domain/Pages.dart';
import 'package:flutter_native/Reducers/AppState.dart';
import 'package:flutter_native/Widgets/TodoEditorWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  final Pages currentPage;
  final ChangePageFunction changePage;

  HomePage({Key key, this.currentPage, this.changePage}) : super(key: key);

  Widget getCurrentPage() {
    if (currentPage == Pages.Home) {
      return TodoListContainer();
    } else {
      return TodoEditorContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
          child: getCurrentPage()
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Pages.values.indexOf(currentPage),
        onTap: (index) => changePage(Pages.values[index]),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text("test")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.title),
              title: Text("test2")
          )
        ],
      ),
    );
  }
}