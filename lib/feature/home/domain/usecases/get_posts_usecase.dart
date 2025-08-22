import 'package:teste_magnum/feature/home/domain/repositores/post_repository.dart';

import '../entities/post.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
}