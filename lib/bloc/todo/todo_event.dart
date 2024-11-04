import 'package:bloc_demo/model/todo_model.dart';

sealed class TodoEvent {
  const TodoEvent();
}

class AddTodoItem extends TodoEvent {
  final TodoModel todo;

  const AddTodoItem({required this.todo});
}

class DeleteTodoItem extends TodoEvent {
  final int index;

  const DeleteTodoItem({required this.index});
}

class UpdateTodoItem extends TodoEvent {
  final int index;
  final TodoModel todo;

  const UpdateTodoItem({required this.index, required this.todo});
}


