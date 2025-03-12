import 'package:dart_mappable/dart_mappable.dart';
import 'package:todo/data/model.dart';

part 'todo_state.mapper.dart';

enum TodoStatus {
  loading,
  saving,
  ready,
}

@MappableClass()
class TodoState with TodoStateMappable {
  final TodoStatus status;
  final List<Todo> todos;

  const TodoState({required this.status, required this.todos});

  const TodoState.create({
    this.status = TodoStatus.ready,
    this.todos = const [],
  });
}
