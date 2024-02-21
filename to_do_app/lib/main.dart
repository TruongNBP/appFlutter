import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/todos_cubit.dart';
import 'package:to_do_app/screens/todo_list_completed_screen.dart';
import 'package:to_do_app/screens/todo_list_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoListScreen(),
        // home: TodoListCompletedScreen(),
      ),
    );
  }
}