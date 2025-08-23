
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase(this.repository);

  Future<void> call(int id) async {
    return await repository.deletePost(id);
  }
}
