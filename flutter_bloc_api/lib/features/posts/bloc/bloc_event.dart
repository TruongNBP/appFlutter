part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

class PostsInitialFetchEvent extends BlocEvent {}
