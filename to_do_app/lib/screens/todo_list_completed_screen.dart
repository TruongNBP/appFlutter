import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/bloc/todos_bloc.dart';
import 'package:to_do_app/bloc/todos_event.dart';
import 'package:to_do_app/bloc/todos_state.dart';
import 'package:to_do_app/models/todos_model.dart';
import 'package:to_do_app/utils/enums.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  List<TodosModel>? previousTodoList;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Nếu danh sách trước đó và danh sách hiện tại không giống nhau, thì mới thực hiện tải lại
      if (!listEquals(
          previousTodoList, context.read<TodoBloc>().state.todoList)) {
        context.read<TodoBloc>().add(TodoFetched());
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    previousTodoList = context.read<TodoBloc>().state.todoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo completed List'),
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
                    title: Text(
                      firstItem.title ?? 'Không có tiêu đề',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      firstItem.description ?? 'Không có mô tả',
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
