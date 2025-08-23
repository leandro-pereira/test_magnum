
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
}
 