import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/models/todos_model.dart';
import 'package:todo_app_bloc/utils/enums.dart';

class TodoStates extends Equatable {
  final TodoStatus todoStatus;
  final List<TodoModel> todoList;
  final String message;

  const TodoStates({
    this.todoStatus = TodoStatus.loading,
    this.todoList = const <TodoModel>[],
    this.message ='',
});

TodoStates copyWith({TodoStatus? todoStatus, List<TodoModel>? todoList, String? message}){
  return TodoStates(
    todoStatus: todoStatus ?? this.todoStatus,
    todoList: todoList ?? this.todoList,
    message: message ?? this.message,
  );
}

  @override
  List<Object?> get props => [todoStatus, todoStatus];
}
