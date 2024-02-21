// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/todos_cubit.dart';
import 'package:to_do_app/widgets/list_todos.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TodosCubit>().getDetails();
    });
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Add Todo'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Đóng AlertDialog
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addNewTodo();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Todo'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.add)),
      ),
      body: BlocConsumer<TodosCubit, TodosState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodosError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todosModel.items!
                  .where((element) => !element.isCompleted)
                  .length,
              itemBuilder: (context, index) {
                final completedTodos = state.todosModel.items!
                    .where((element) => !element.isCompleted)
                    .toList();
                final element = completedTodos[index];
                return CustomListTile(
                  title: element.title!,
                  subtitle: element.description!,
                  onTap: () {
                    context
                        .read<TodosCubit>()
                        .deleteTodoById(state.todosModel.items![index].sId!);
                  },
                  onTap1: () {context.read<TodosCubit>().updateTodoStatus(state.todosModel.items![index].sId!);
                  },
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  void _addNewTodo() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    if (title.isNotEmpty && description.isNotEmpty) {
      // Gửi thông tin todo mới lên Cubit để xử lý
      context.read<TodosCubit>().addNewTodo(title, description);
      // Xóa nội dung của TextField sau khi thêm todo
      _titleController.clear();
      _descriptionController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter title and description.'),
        ),
      );
    }
  }
}
