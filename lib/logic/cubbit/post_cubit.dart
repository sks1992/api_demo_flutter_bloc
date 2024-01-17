import 'package:bloc_flutter_api_demo/data/model/post_model.dart';
import 'package:bloc_flutter_api_demo/data/repository/post_repository.dart';
import 'package:bloc_flutter_api_demo/logic/cubbit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
