import 'package:flutter/cupertino.dart';
import 'package:flutter_native/Domain/Todo.dart';
import 'package:flutter_native/Widgets/TodoWidget.dart';

class TodoListWidget extends StatelessWidget {
  final List<Todo> todos;
  final ToggleTodoFunction toggle;

  const TodoListWidget({Key key, @required this.toggle, @required this.todos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Todos"),
        ),
        child: ListView(
          children: todos.map((todo) => TodoWidget(
            todo: todo,
            toggle: toggle,
          )).toList()
        ),
      );
  }
}
