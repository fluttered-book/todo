import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/todo_state.dart';
import 'package:todo/data/data_source.dart';
import 'package:uuid/uuid.dart';

import '../data/model.dart';

class TodoCubit extends Cubit<TodoState> {
  final DataSource dataSource;
  TodoCubit(this.dataSource) : super(TodoState.create());

  Future<void> load() async {
    emit(state.copyWith(status: TodoStatus.loading));
    final todos = await dataSource.readAll();
    emit(state.copyWith(todos: todos, status: TodoStatus.ready));
  }

  Future<Todo> create({String? id}) async {
    final todo = Todo.create(id: id ?? Uuid().v4());
    emit(state.copyWith(status: TodoStatus.saving));
    final created = await dataSource.create(todo);
    emit(state.copyWith(
      todos: [...state.todos, created],
      status: TodoStatus.ready,
    ));
    return todo;
  }

  Future<void> update(Todo todo) async {
    emit(state.copyWith(status: TodoStatus.saving));
    final updated = await dataSource.update(todo);
    final index = state.todos.indexWhere((x) => x.id == todo.id);
    emit(state.copyWith(
      todos: [
        ...state.todos.take(index),
        updated,
        ...state.todos.skip(index + 1),
      ],
      status: TodoStatus.ready,
    ));
  }

  Future<void> delete(String id) async {
    emit(state.copyWith(status: TodoStatus.saving));
    final index = state.todos.indexWhere((x) => x.id == id);
    await dataSource.delete(state.todos[index]);
    emit(state.copyWith(
      todos: [
        ...state.todos.take(index),
        ...state.todos.skip(index + 1),
      ],
      status: TodoStatus.ready,
    ));
  }

  Future<void> toggle(String id) async {
    emit(state.copyWith(status: TodoStatus.saving));
    final index = state.todos.indexWhere((x) => x.id == id);
    final updated = await dataSource.toggle(state.todos[index]);
    emit(state.copyWith(
      todos: [
        ...state.todos.take(index),
        updated,
        ...state.todos.skip(index + 1),
      ],
      status: TodoStatus.ready,
    ));
  }
}
