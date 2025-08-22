import 'package:dio/dio.dart';
import '../../core/network/api_routes.dart';
import '../../core/network/dio_client.dart';

class CommentService {
  final Dio _dio;

  CommentService(DioClient client) : _dio = client.dio;

  Future<Response> getCommentsByPost(int postId) async {
    return _dio.get(ApiRoutes.commentsByPost(postId));
  }

  Future<Response> getAllComments() async {
    return _dio.get(ApiRoutes.comments);
  }
}