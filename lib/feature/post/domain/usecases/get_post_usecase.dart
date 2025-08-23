
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class GetPostUseCase {
  final PostRepository repository;

  GetPostUseCase(this.repository);

  Future<Post> call(int id) async {
    return await repository.getPost(id);
  }
}
