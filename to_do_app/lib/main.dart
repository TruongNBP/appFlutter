import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/todos_cubit.dart';
import 'package:to_do_app/router/router.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterCustom.router,
        // home: TodoListCompletedScreen(),
      ),
    );
  }
}