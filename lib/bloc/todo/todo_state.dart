import 'package:bloc_demo/model/todo_model.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitialState extends TodoState {
  final List<TodoModel> todos;

  const TodoInitialState({required this.todos});
}
