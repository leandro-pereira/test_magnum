import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teste_magnum/core/network/dio_client.dart';
import 'package:teste_magnum/feature/post/data/repositories/post_repository_imp.dart';
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';
import 'package:teste_magnum/feature/post/domain/usecases/get_posts_usecase.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_bloc.dart';
import 'package:teste_magnum/feature/post/presentation/widgets/list_post_widget.dart';

class ListPostPage extends StatelessWidget {
  const ListPostPage({super.key});

  @override
  Widget build(BuildContext context) {
      final dio = context.read<DioClient>();
    PostBloc postRepository = PostBloc(
    GetPostsUseCase(PostRepositoryImpl(dio.dio) as PostRepository
    ));
    return MultiProvider(
      providers: [
        BlocProvider<PostBloc>.value(value: postRepository..fetchPosts()),
      ],
      child: const ListPostsWidget(),
    );
   
  }
}
