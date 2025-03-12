import 'dart:convert';

import 'package:http/http.dart' as http;
import 'data_source.dart';
import 'model.dart';

class ApiDataSource extends DataSource {
  final url = "http://localhost:3001";
  final headers = {"Content-Type": "application/json"};
  @override
  Future<Todo> create(Todo todo) async {
    final response = await http.post(Uri.parse("$url/todos"),
        headers: headers, body: todo.toJson());
    return TodoMapper.fromJson(response.body);
  }

  @override
  Future<void> delete(Todo todo) async {
    await http.delete(Uri.parse("$url/todos/${todo.id}"));
  }

  @override
  Future<List<Todo>> readAll() async {
    final response = await http.get(Uri.parse("$url/todos"));
    final list = jsonDecode(response.body) as List<dynamic>;
    return list.map((i) => TodoMapper.fromMap(i)).toList();
  }

  @override
  Future<Todo> toggle(Todo todo) async {
    final response = await http.patch(Uri.parse("$url/todos/${todo.id}"),
        headers: headers, body: jsonEncode({'done': !todo.done}));
    return TodoMapper.fromJson(response.body);
  }

  @override
  Future<Todo> update(Todo todo) async {
    final response = await http.put(Uri.parse("$url/todos/${todo.id}"),
        headers: headers, body: todo.toJson());
    return TodoMapper.fromJson(response.body);
  }
}
