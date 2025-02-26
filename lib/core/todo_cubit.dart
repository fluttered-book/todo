import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/todo_state.dart';
import 'package:uuid/uuid.dart';

import '../data/model.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState.create());

  Todo create({String? id}) {
    final todo = Todo.create(id: id ?? Uuid().v4());
    final newState = state.copyWith(todos: [todo, ...state.todos]);
    emit(newState);
    return todo;
  }

  void update(Todo todo) {
    final index = state.todos.indexWhere((x) => x.id == todo.id);
    final newState = state.copyWith(
      todos: [
        ...state.todos.take(index),
        todo,
        ...state.todos.skip(index + 1),
      ],
      status: TodoStatus.saving,
    );
    emit(newState);
  }

  void delete(String id) {
    final index = state.todos.indexWhere((x) => x.id == id);
    final newState = state.copyWith(
      todos: [
        ...state.todos.take(index),
        ...state.todos.skip(index + 1),
      ],
      status: TodoStatus.saving,
    );
    emit(newState);
  }

  void toggle(String id) {
    final todo = state.todos.singleWhere((x) => x.id == id);
    update(todo.toggleDone());
  }
}
