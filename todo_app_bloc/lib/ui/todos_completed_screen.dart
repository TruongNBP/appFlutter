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
        title: const Text('Completed Todos'),
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, state) {
          switch (state.todoStatus) {
            case TodoStatus.loading:
              return const CircularProgressIndicator();
            case TodoStatus.failure:
              return Text(state.message.toString());
            case TodoStatus.success:
              return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  final item = state.todoList[index];
                  return ListTile(
                    title: Text(item.items![index].title!),
                    subtitle: Text(item.items![index].description!),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
