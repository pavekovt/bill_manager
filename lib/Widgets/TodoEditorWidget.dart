
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native/Domain/Todo.dart';

typedef CreateTodoFunction(Todo todo);

class TodoEditorWidget extends StatelessWidget {
  String _title;
  String _description;

  CreateTodoFunction createTodo;

  TodoEditorWidget({Key key, @required this.createTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => _title = value,
          ),
          TextField(
            onChanged: (value) => _description = value,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CupertinoButton(
              color: Colors.blue,
              child: Text("Create Todo"),
              onPressed: () => createTodo(Todo(
                id: null,
                description: _description,
                title: _title
              ))
            )
          )
        ]
      )
    );
  }
}