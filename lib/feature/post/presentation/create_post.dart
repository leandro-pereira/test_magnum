import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teste_magnum/core/network/dio_client.dart';
import 'package:teste_magnum/feature/post/data/repositories/post_repository_imp.dart';
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';
import 'package:teste_magnum/feature/post/domain/usecases/create_post_usecase.dart';
import 'package:teste_magnum/feature/post/domain/usecases/get_post_usecase.dart';
import 'package:teste_magnum/feature/post/domain/usecases/path_post_usecase.dart';
import 'package:teste_magnum/feature/post/presentation/bloc/post_create_bloc.dart';
import 'package:teste_magnum/feature/post/presentation/widgets/create_post_widget.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key, int? id}) : _id = id;
  final int? _id;

  @override
  Widget build(BuildContext context) {
    final dio = context.read<DioClient>();
    final repository = PostRepositoryImpl(dio.dio) as PostRepository;
    PostCreateBloc postRepository = PostCreateBloc(
      GetPostUseCase(repository),
      CreatePostUseCase(repository),
      PathPostUseCase(repository),
    );
    return MultiProvider(
      providers: [
        BlocProvider<PostCreateBloc>.value(
            value: _id != null && _id >= 0
                ? (postRepository..fetchPost(_id))
                : postRepository),
      ],
      child: const CreatePostWidget(),
    );
  }
}
