
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class CreatePostUseCase {
  final PostRepository repository;

  CreatePostUseCase(this.repository);

  Future<Post> call(Post post) async {
    return repository.createPost(post);
  }
}
