import 'package:flutter/cupertino.dart';
import 'package:flutter_native/Domain/Todo.dart';

class TodoWidget extends StatelessWidget {

  final Todo todo;
  final Function complete;

  TodoWidget({Key key, this.todo, this.complete}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Column(
      children: <Widget>[
        Text(todo.title),
        Text(todo.description),
        CupertinoButton(
          color: CupertinoColors.activeOrange,
          disabledColor: CupertinoColors.activeGreen,
          onPressed: () => todo.completed ? null : complete(),
          child: Icon(todo.completed ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.check_mark),
        )
      ],
    );
}