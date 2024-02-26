import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:todo_app_bloc/models/todos_model.dart';

class TodoRepository {
  Future<List<TodoModel>> fetchTodo() async {
    try {
      final response = await http.get(Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load todos: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Error connecting to the internet');
    } on TimeoutException {
      throw Exception('Timeout while fetching data');
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }
}
