import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_do_app/models/todos_model.dart';

class ApiServices {
  static Future<TodosModel?> getData() async {
    String url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      TodosModel todosModel = TodosModel.fromJson(jsonDecode(response.body));

      return todosModel;
    }
    return null;
  }

  static Future<bool> addTodo(String title, String description) async {
    String url = 'https://api.nstack.in/v1/todos';
    var body = jsonEncode({'title': title, 'description': description});
    var response = await http.post(Uri.parse(url), body: body, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 201) {
      // Kiểm tra kết quả từ API và trả về true nếu thành công
      return true;
    } else {
      // Trả về false nếu có lỗi từ API
      return false;
    }
  }

  static Future<bool> deleteTodoById(String todoId) async {
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

  static Future<bool> updateTodo(
      String id, String title, String description) async {
    String url = 'https://api.nstack.in/v1/todos/$id';
    final body = jsonEncode(
        {"title": title, "description": description, "is_completed": true});
    final response = await http.put(Uri.parse(url), body: body, 
    headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      // Kiểm tra kết quả từ API và trả về true nếu thành công
      return true;
    } else {
      // Trả về false nếu có lỗi từ API
      return false;
    }
  }
}
