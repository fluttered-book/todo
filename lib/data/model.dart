import 'package:dart_mappable/dart_mappable.dart';

part 'model.mapper.dart';

@MappableClass()
class Todo with TodoMappable {
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

  Todo toggleDone() => copyWith(done: !done);
}
