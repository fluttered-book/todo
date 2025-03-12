import 'package:uuid/uuid.dart';

import 'data_source.dart';
import 'model.dart';

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
