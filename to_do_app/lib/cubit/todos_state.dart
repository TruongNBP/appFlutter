part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

final class TodosInitial extends TodosState {}
final class TodosLoading extends TodosState {}
final class TodosLoaded extends TodosState {
  final TodosModel todosModel;
  TodosLoaded(this.todosModel);
}
final class TodosError extends TodosState {
  final String errorMessage;
  TodosError(this.errorMessage);
}
