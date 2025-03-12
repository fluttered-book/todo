import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/todo_cubit.dart';
import '../data/model.dart';

class UpdateTodoDialog extends StatefulWidget {
  final Future<Todo> todo;

  const UpdateTodoDialog({super.key, required this.todo});

  @override
  State<UpdateTodoDialog> createState() => _UpdateTodoDialogState();
}

class _UpdateTodoDialogState extends State<UpdateTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: FutureBuilder(
        future: widget.todo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final todo = snapshot.data!;
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please give it a title' : null,
                  initialValue: todo.title,
                  onChanged: (value) => _title = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  initialValue: todo.description,
                  onChanged: (value) => _description = value,
                ),
                SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    final update = todo.copyWith(
                      title: _title,
                      description: _description,
                    );
                    context.read<TodoCubit>().update(update);
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
