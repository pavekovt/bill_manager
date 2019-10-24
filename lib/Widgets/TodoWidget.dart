import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/Domain/Todo.dart';

typedef ToggleTodoFunction(String id);

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final ToggleTodoFunction toggle;

  TodoWidget({Key key, this.todo, this.toggle}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                child: Text(
                  todo.title,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                )
              ),
              Container(
                width: 200,
                child: Text(
                  todo.description ?? "",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.left,
                )
              )
            ],
          ),
          Spacer(flex: 2),
          Expanded(
              child: CupertinoButton(
                padding:
                EdgeInsets.only(left: 20, top: 10.0, bottom: 10.0, right: 20.0),
                onPressed: () => toggle(todo.id),
                child: Icon(todo.completed
                ? CupertinoIcons.check_mark_circled_solid
                : CupertinoIcons.check_mark),
          )),
        ],
      ));
}
