import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/core/todo_cubit.dart';
import 'package:todo/core/todo_state.dart';
import 'package:todo/data/model.dart';

void main() {
  group("TodoCubit", () {
    blocTest(
      'create() add a new todo',
      build: () => TodoCubit(),
      act: (cubit) => cubit.create(id: "id"),
      expect: () => [
        TodoState(
          status: TodoStatus.ready,
          todos: [Todo.create(id: "id")],
        )
      ],
    );

    blocTest(
      'update() replaces existing todo',
      build: () => TodoCubit(),
      seed: () => TodoState.create(todos: [
        Todo.create(id: "1", title: "first"),
        Todo.create(id: "2", title: "second"),
        Todo.create(id: "3", title: "third"),
      ]),
      act: (cubit) =>
          cubit.update(Todo.create(id: '2', title: "updated second")),
      expect: () => [
        TodoState.create(todos: [
          Todo.create(id: "1", title: "first"),
          Todo.create(id: "2", title: "updated second"),
          Todo.create(id: "3", title: "third"),
        ])
      ],
    );

    blocTest(
      "delete() removes a todo",
      build: () => TodoCubit(),
      seed: () => TodoState.create(todos: [
        Todo.create(id: "1"),
        Todo.create(id: "2"),
      ]),
      act: (cubit) => cubit.delete("2"),
      expect: () => [
        TodoState.create(todos: [Todo.create(id: "1")])
      ],
    );
  });
}
