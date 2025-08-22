import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teste_magnum/core/network/dio_client.dart';
import 'package:teste_magnum/feature/home/data/repositories/post_repository_imp.dart';
import 'package:teste_magnum/feature/home/domain/repositores/post_repository.dart';
import 'package:teste_magnum/feature/home/domain/usecases/get_posts_usecase.dart';
import 'package:teste_magnum/feature/home/presentation/bloc/home_bloc.dart';
import 'package:teste_magnum/feature/home/presentation/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dio = context.read<DioClient>();
    PostBloc postRepository = PostBloc(
        GetPostsUseCase(PostRepositoryImpl(dio.dio) as PostRepository));

    return MultiProvider(
      providers: [
        BlocProvider<PostBloc>.value(value: postRepository..fetchPosts()),
      ],
      child: HomeView(),
    );
  }
}
