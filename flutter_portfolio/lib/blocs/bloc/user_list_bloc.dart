import 'package:bloc/bloc.dart';
import 'package:flutter_portfolio/models/User.dart';
import 'package:meta/meta.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitial(users: [])) {
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  void _addUser(AddUser event, Emitter<UserListState> emit){
    state.users.add(event.user);
    emit(UserListUpdated(users: state.users));
  }

  void _deleteUser(DeleteUser event, Emitter<UserListState> emit){
    state.users.remove(event.user);
    emit(UserListUpdated(users: state.users));
  }

  void _updateUser(UpdateUser event, Emitter<UserListState> emit){
    state.users[state.users.indexWhere((element) => element.id == event.user.id)] = event.user;
    emit(UserListUpdated(users: state.users));
  }
}
