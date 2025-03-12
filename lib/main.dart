import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/todo_cubit.dart';
import 'data/api_data_source.dart';
import 'ui/todo_list_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(ApiDataSource())..load(),
      child: MaterialApp(home: TodoListPage()),
    );
  }
}
