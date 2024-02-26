import 'package:equatable/equatable.dart';
import 'package:to_do_app/models/todos_model.dart';
import 'package:to_do_app/utils/enums.dart';

class TodoStates extends Equatable {
  final TodoStatus todoStatus;
  final List<TodosModel> todoList;
  final String message;

  const TodoStates({
    this.todoStatus = TodoStatus.loading,
    this.todoList = const <TodosModel>[],
    this.message ='',
});

TodoStates copyWith({TodoStatus? todoStatus, List<TodosModel>? todoList, String? message}){
  return TodoStates(
    todoStatus: todoStatus ?? this.todoStatus,
    todoList: todoList ?? this.todoList,
    message: message ?? this.message,
  );
}

  @override
  List<Object?> get props => [todoStatus, todoStatus];
}
