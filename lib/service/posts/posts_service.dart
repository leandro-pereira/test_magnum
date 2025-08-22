import 'package:dio/dio.dart';
import '../../core/network/api_routes.dart';
import '../../core/network/dio_client.dart';

class PostService {
  final Dio _dio;

  PostService(DioClient client) : _dio = client.dio;

  Future<Response> getPosts() async {
    return _dio.get(ApiRoutes.posts);
  }

  Future<Response> getPost(int id) async {
    return _dio.get(ApiRoutes.postById(id));
  }

  Future<Response> createPost(Map<String, dynamic> data) async {
    return _dio.post(ApiRoutes.posts, data: data);
  }

  Future<Response> updatePost(int id, Map<String, dynamic> data) async {
    return _dio.put(ApiRoutes.postById(id), data: data);
  }

  Future<Response> patchPost(int id, Map<String, dynamic> data) async {
    return _dio.patch(ApiRoutes.postById(id), data: data);
  }

  Future<Response> deletePost(int id) async {
    return _dio.delete(ApiRoutes.postById(id));
  }
}