import 'package:dio/dio.dart';
import 'package:teste_magnum/core/network/api_routes.dart';
import 'package:teste_magnum/feature/post/data/model/post_model.dart';
import 'package:teste_magnum/feature/post/domain/entities/post.dart';
import 'package:teste_magnum/feature/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final Dio dio;

  PostRepositoryImpl(this.dio);

  @override
  Future<List<Post>> getPosts() async {
    final response = await dio.get(ApiRoutes.posts);
    final List data = response.data;
    return data.map((json) => PostModel.fromJson(json)).toList();
  }

  @override
  Future<Post> getPost(int id) async {
    final response = await dio.get(ApiRoutes.postById(id));
    return PostModel.fromJson(response.data);
  }

  @override
  Future<Post> createPost(Post post) async {
    final model = PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
    final response = await dio.post(ApiRoutes.posts, data: model.toJson());
    return PostModel.fromJson(response.data);
  }

  @override
  Future<void> updatePost(int id, Post post) async {
    final model = PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
    await dio.put(ApiRoutes.postById(id), data: model.toJson());
  }

  @override
  Future<void> patchPost(int id, Post post) async {
    final model = PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
    await dio.patch(ApiRoutes.postById(id), data: model.toJson());
  }

  @override
  Future<void> deletePost(int id) async {
    await dio.delete(ApiRoutes.postById(id));
  }
}
