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

  static Future<TodosModel?> updateTodoStatus(String id) async {
    String url = 'https://api.nstack.in/v1/todos/$id';

    // Tạo dữ liệu body để gửi lên API để cập nhật trạng thái todo
    Map<String, dynamic> body = {
      'is_completed': true, // Cập nhật trạng thái is_completed thành true
    };

    var response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Nếu cập nhật thành công, trả về todo đã được cập nhật
      return TodosModel.fromJson(jsonDecode(response.body));
    } else {
      // Nếu có lỗi xảy ra, trả về null
      return null;
    }
  }
}
