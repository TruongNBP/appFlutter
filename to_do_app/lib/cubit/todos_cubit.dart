// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/apiServices/api_services.dart';
import 'package:to_do_app/models/todos_model.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());

  getDetails() {
    emit(TodosLoading());
    ApiServices.getData().then((value) {
      emit(TodosLoaded(value!));
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(TodosError(error.toString()));
    });
  }

  void addNewTodo(String title, String description) {
    emit(TodosLoading());
    // Gọi API để thêm todo mới
    ApiServices.addTodo(title, description).then((success) {
      if (success) {
        // Nếu thêm thành công, cập nhật trạng thái
        getDetails();
      } else {
        emit(TodosError('Failed to add new todo.'));
      }
    }).catchError((error) {
      emit(TodosError('Error: $error'));
    });
  }

  void deleteTodoById(String todoId) {
    emit(TodosLoading());
    ApiServices.deleteTodoById(todoId).then((success) {
      if (success) {
        // Nếu thêm thành công, cập nhật trạng thái
        getDetails();
      } else {
        emit(TodosError('Failed to add new todo.'));
      }
    }).onError((error, stackTrace) {
      emit(TodosError(error.toString()));
    });
  }

  void updateTodoByID(String id, String title, String description) {
    emit(TodosLoading());
    // Gọi API để thêm todo mới
    ApiServices.updateTodo(id, title, description).then((success) {
      if (success) {
        getDetails();
      } else {
        emit(TodosError('Failed to update new todo.'));
      }
    }).catchError((error) {
      emit(TodosError('Error: $error'));
    });
  }
}
