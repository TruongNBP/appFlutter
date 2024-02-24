import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_api/features/posts/models/post_data_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<BlocState> emit) async {
    var client = http.Client();
    List<PostDataModel> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10'),
      );

      List result = jsonDecode(response.body);

      for (var i = 0; i < result.length; i++) {
        PostDataModel post =
            PostDataModel.formMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      print(posts);

      emit(PostsFetchSuccessfulState(posts: posts));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
