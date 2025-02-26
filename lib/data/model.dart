import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool done;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });

  const Todo.create({
    required this.id,
    this.title = '',
    this.description = '',
    this.done = false,
  });

  Todo copyWith({
    String? title,
    String? description,
    bool? done,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }

  Todo toggleDone() => copyWith(done: !done);

  @override
  List<Object?> get props => [id, title, description, done];
}
