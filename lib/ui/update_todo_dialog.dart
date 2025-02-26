import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/todo_cubit.dart';
import '../data/model.dart';

class UpdateTodoDialog extends StatefulWidget {
  final Todo todo;

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
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please give it a title' : null,
              initialValue: widget.todo.title,
              onChanged: (value) => _title = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              initialValue: widget.todo.description,
              onChanged: (value) => _description = value,
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final update = widget.todo.copyWith(
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
      ),
    );
  }
}
