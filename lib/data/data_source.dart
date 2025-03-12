import 'package:todo/data/model.dart';

abstract class DataSource {
  Future<List<Todo>> readAll();
  Future<Todo> create(Todo todo);
  Future<Todo> update(Todo todo);
  Future<Todo> toggle(Todo todo);
  Future<void> delete(Todo todo);
}
