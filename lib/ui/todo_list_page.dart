import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/todo_cubit.dart';
import '../core/todo_state.dart';
import 'update_todo_dialog.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo")),
      body: BlocConsumer<TodoCubit, TodoState>(
          listenWhen: (previous, current) => current.status != TodoStatus.ready,
          listener: (context, state) {
            final message = switch (state.status) {
              TodoStatus.saving => "Saving...",
              TodoStatus.loading => "Loading...",
              _ => null
            };
            if (message == null) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          buildWhen: (previous, current) => previous.todos != current.todos,
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return Dismissible(
                  key: Key(todo.id),
                  background: Container(color: Colors.redAccent),
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    trailing: Checkbox(
                      value: todo.done,
                      onChanged: (_) =>
                          context.read<TodoCubit>().toggle(todo.id),
                    ),
                  ),
                  onDismissed: (_) => context.read<TodoCubit>().delete(todo.id),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.todos.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                UpdateTodoDialog(todo: context.read<TodoCubit>().create()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
