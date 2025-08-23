
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class PathPostUseCase {
  final PostRepository repository;

  PathPostUseCase(this.repository);

  Future<void> call(int id, Post post) async {
    return repository.patchPost(id, post);
  }
}
