import 'dart:async';

import 'package:bloc_demo/bloc/todo/todo_event.dart';
import 'package:bloc_demo/bloc/todo/todo_state.dart';
import 'package:bloc_demo/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  // List<TodoModel> todosList = [];

  TodoBloc() : super(const TodoInitialState(todos: [])) {
    on<AddTodoItem>(addItem);
    on<DeleteTodoItem>(delItem);
    on<UpdateTodoItem>(updateItem);
    // on<UpdateIconTodo>(updateIcon);
  }

  FutureOr<void> addItem(AddTodoItem event, Emitter<TodoState> emit) {
    final currState = state as TodoInitialState;
    final updatedList = List<TodoModel>.from(currState.todos)..add(event.todo);
    emit(TodoInitialState(todos: updatedList));
  }

  FutureOr<void> delItem(DeleteTodoItem event, Emitter<TodoState> emit) {
    final currState = state as TodoInitialState;
    final updatedList = List<TodoModel>.from(currState.todos)
      ..removeAt(event.index);
    emit(TodoInitialState(todos: updatedList));
  }

  FutureOr<void> updateItem(UpdateTodoItem event, Emitter<TodoState> emit) {
    final currState = state as TodoInitialState;
    final updatedList = List<TodoModel>.from(currState.todos)
      ..[event.index] = event.todo;
    emit(TodoInitialState(todos: updatedList));
  }
}
