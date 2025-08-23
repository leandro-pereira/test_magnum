import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/feature/post/domain/usecases/get_posts_usecase.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_state.dart';

class PostBloc extends Cubit<PostState> {
  final GetPostsUseCase getPostsUseCase;

  PostBloc(this.getPostsUseCase) : super(PostInitial());

  Future<void> fetchPosts() async {
    try {
      emit(PostLoading());
      final posts = await getPostsUseCase();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}