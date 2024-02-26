import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/bloc/todos_bloc.dart';
import 'package:todo_app_bloc/bloc/todos_event.dart';
import 'package:todo_app_bloc/bloc/todos_state.dart';
import 'package:todo_app_bloc/utils/enums.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Công việc đã hoàn thành'),
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, state) {
          switch (state.todoStatus) {
            case TodoStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TodoStatus.failure:
              return Text(state.message.toString());
            case TodoStatus.success:
              return ListView.builder(
                itemCount: state.todoList
                    .where((todo) =>
                        todo.items != null &&
                        todo.items!.isNotEmpty &&
                        todo.items!.first.isCompleted == true)
                    .length,
                itemBuilder: (context, index) {
                  final todo = state.todoList
                      .where((todo) =>
                          todo.items != null &&
                          todo.items!.isNotEmpty &&
                          todo.items!.first.isCompleted == true)
                      .toList()[index];
                  final firstItem = todo.items!.first;
                  return ListTile(
                    title: Text(firstItem.title ?? 'Không có tiêu đề'),
                    subtitle: Text(firstItem.description ?? 'Không có mô tả'),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
