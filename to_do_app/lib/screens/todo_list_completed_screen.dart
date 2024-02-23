import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/todos_cubit.dart';
import 'package:to_do_app/widgets/list_todos.dart';

class TodoListCompletedScreen extends StatefulWidget {
  const TodoListCompletedScreen({super.key});

  @override
  State<TodoListCompletedScreen> createState() => _TodoListCompletedScreenState();
}

class _TodoListCompletedScreenState extends State<TodoListCompletedScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TodosCubit>().getDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List Completed"),
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
          } else if (state is TodosError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todosModel.items!
                  .where((element) => element.isCompleted)
                  .length,
              itemBuilder: (context, index) {
                final completedTodos = state.todosModel.items!
                    .where((element) => element.isCompleted)
                    .toList();
                final element = completedTodos[index];
                return CustomListTile(
                  color: Colors.green,
                  title: element.title!,
                  subtitle: element.description!,
                  onTap: () {
                    context
                        .read<TodosCubit>()
                        .deleteTodoById(state.todosModel.items![index].sId!);
                  },
                );
              },
            );
          }
          return const Text("Todos list is empty");
        },
      ),
    );
  }
}