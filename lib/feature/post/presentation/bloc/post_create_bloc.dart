import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/feature/post/domain/entities/post.dart';
import 'package:teste_magnum/feature/post/domain/usecases/create_post_usecase.dart';
import 'package:teste_magnum/feature/post/domain/usecases/get_post_usecase.dart';
import 'package:teste_magnum/feature/post/domain/usecases/path_post_usecase.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_create_state.dart';

class PostCreateBloc extends Cubit<PostCreateState> {
  final GetPostUseCase getPostUseCase;
  final CreatePostUseCase createUseCase;
  final PathPostUseCase pathPostUseCase;

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  int? _id;
  PostCreateBloc(this.getPostUseCase, this.createUseCase, this.pathPostUseCase)
      : super(PostCreateInitial());

  Future<void> fetchPost(int id) async {
    try {
      _id = id;
      emit(PostCreateLoading());
      final post = await getPostUseCase(id);
      emit(PostCreateLoaded(post));
    } catch (e) {
      emit(PostCreateError(e.toString()));
    }
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      final post = Post(
        id: _id,
        userId: 1,
        title: titleController.text,
        body: bodyController.text,
      );
      emit(PostCreateLoading());
      try {
        await createUseCase(post);
        emit(PostCreateCreated());
      } catch (e) {
        emit(PostCreateError(e.toString()));
      }
    }
  }
}
