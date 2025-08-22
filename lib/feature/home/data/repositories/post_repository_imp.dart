import 'package:dio/dio.dart';
import 'package:teste_magnum/core/network/api_routes.dart';
import 'package:teste_magnum/feature/home/domain/repositores/post_repository.dart';
import '../../domain/entities/post.dart';
import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final Dio dio;

  PostRepositoryImpl(this.dio);

  @override
  Future<List<Post>> getPosts() async {
    final response = await dio.get(ApiRoutes.posts);
    final List data = response.data;
    return data.map((json) => PostModel.fromJson(json)).toList();
  }
}