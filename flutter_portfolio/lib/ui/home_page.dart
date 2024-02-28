import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portfolio/blocs/bloc/user_list_bloc.dart';
import 'package:flutter_portfolio/models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('CRUD using Bloc'),
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state is UserListUpdated && state.users.isNotEmpty) {
              final users = state.users;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return buildUserTile(context, user);
                },
              );
            }
          },
        ),
      );
}

Widget buildUserTile(BuildContext context, User user) {
  return ListTile(
    title: Text(user.name),
    subtitle: Text(user.email),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            userListBloc(context).add(DeleteUser(user: user));
          },
        ),
      ],
    ),
  );
}
