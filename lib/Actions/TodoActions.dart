
import 'package:flutter_native/Domain/Todo.dart';

class RemoveTodoAction {
  String todoId;

  RemoveTodoAction({this.todoId});
}

class AddTodoAction {
  Todo payload;

  AddTodoAction({this.payload});
}

class CompleteTodoAction {
  String todoId;

  CompleteTodoAction({this.todoId});
}