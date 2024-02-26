import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:to_do_app/models/todos_model.dart';

class TodoRepository {
  Future<List<TodosModel>> fetchTodo() async {
  try {
    final response = await http.get(Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final List<Items> items = data['items'].map<Items>((json) => Items.fromJson(json)).toList();
      return items.map((item) => TodosModel(items: [item])).toList();
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

 Future<bool> deleteTodoById(String todoId) async {
    String url = 'https://api.nstack.in/v1/todos/$todoId';
    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      // Kiểm tra kết quả từ API và trả về true nếu thành công
      return true;
    } else {
      // Trả về false nếu có lỗi từ API
      return false;
    }
  }
}
