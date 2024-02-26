

import 'package:bloc/bloc.dart';
import 'package:todo_app_bloc/bloc/todos_event.dart';
import 'package:todo_app_bloc/bloc/todos_state.dart';

import 'package:todo_app_bloc/repository/todo_repository.dart';
import 'package:todo_app_bloc/utils/enums.dart';

class TodoBloc extends Bloc<TodosEvent, TodoStates>{

  TodoRepository todoRepository = TodoRepository();
  TodoBloc():super(const TodoStates()){
    on<TodoFetched>(fetchTodoApi);
  }

  void fetchTodoApi(TodoFetched event, Emitter<TodoStates> emit) async{

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