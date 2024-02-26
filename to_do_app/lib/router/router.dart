import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/screens/todo_list_completed_screen.dart';
import 'package:to_do_app/screens/todo_list_screen.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TodoListScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'completed',
          builder: (BuildContext context, GoRouterState state) {
            return const CompletedScreen();
          },
        ),
      ],
    ),
  ],
);
}