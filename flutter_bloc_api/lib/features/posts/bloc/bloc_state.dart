part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

class PostsFetchSuccessfulState extends BlocState {
  final List<PostDataModel> posts;

  PostsFetchSuccessfulState({required this.posts});
}
