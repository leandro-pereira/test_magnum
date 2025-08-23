
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class UpdatePostUseCase {
  final PostRepository repository;

  UpdatePostUseCase(this.repository);

  Future<void> call(int id, Post post) async {
    return repository.updatePost(id, post);
  }
}
