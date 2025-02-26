import 'package:equatable/equatable.dart';
import 'package:todo/data/model.dart';

enum TodoStatus {
  loading,
  saving,
  ready,
}

class TodoState extends Equatable {
  final TodoStatus status;
  final List<Todo> todos;

  const TodoState({required this.status, required this.todos});

  const TodoState.create({
    this.status = TodoStatus.ready,
    this.todos = const [],
  });

  TodoState copyWith({TodoStatus? status, List<Todo>? todos}) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [status, todos];
}
