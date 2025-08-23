import 'package:teste_magnum/feature/post/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
  Future<Post> createPost(Post post);
  Future<void> updatePost(int id, Post post);
  Future<void> patchPost(int id, Post post);
  Future<void> deletePost(int id);
}