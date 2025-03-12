import 'dart:convert';

import 'package:todo/data/model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

abstract class DataSource {
  Future<List<Todo>> readAll();
  Future<Todo> create(Todo todo);
  Future<Todo> update(Todo todo);
  Future<Todo> toggle(Todo todo);
  Future<void> delete(Todo todo);
}

class FakeDataSource extends DataSource {
  @override
  Future<List<Todo>> readAll() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Todo(
        id: Uuid().v4(),
        title: "Prepare for class",
        description: "Finish Mobile assignment",
        done: false,
      ),
      Todo(
        id: Uuid().v4(),
        title: "Pretend to be awake during lecture",
        description: "Omg, don't fall asleep like last time",
        done: false,
      ),
      Todo(
        id: Uuid().v4(),
        title: "Work extra shift so I can pay rent",
        description:
            "Study, work, sleep repeat. Is this really all there is to life?",
        done: false,
      ),
      Todo(
        id: Uuid().v4(),
        title: "Go to Black Sabbath concert",
        description: "If I can get tickets.",
        done: false,
      ),
    ];
  }

  @override
  Future<Todo> create(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));
    return Todo.create(id: Uuid().v4());
  }

  @override
  Future<void> delete(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<Todo> toggle(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));
    return todo.copyWith(done: true);
  }

  @override
  Future<Todo> update(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));
    return todo;
  }
}

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
