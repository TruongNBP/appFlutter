

// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:to_do_app/bloc/todos_event.dart';
import 'package:to_do_app/bloc/todos_state.dart';

import 'package:to_do_app/repository/todo_repository.dart';
import 'package:to_do_app/utils/enums.dart';

class TodoBloc extends Bloc<TodosEvent, TodoStates>{

  TodoRepository todoRepository = TodoRepository();
  TodoBloc():super(const TodoStates()){
    on<TodoFetched>(fetchTodoApi);
    
  }

  void fetchTodoApi(TodoFetched event, Emitter<TodoStates> emit) async{
    emit(state.copyWith(todoStatus: TodoStatus.loading));
    await todoRepository.fetchTodo().then((value) {
      emit(state.copyWith(
        todoStatus: TodoStatus.success, 
        message: 'Success',
        todoList: value));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(todoStatus: TodoStatus.failure, message: error.toString()));
    });
  }
}