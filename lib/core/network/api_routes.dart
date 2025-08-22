class ApiRoutes {
  static const String posts = "/posts";
  static String postById(int id) => "/posts/$id";
  static String postComments(int id) => "/posts/$id/comments";

  static const String comments = "/comments";
  static String commentsByPost(int postId) => "/comments?postId=$postId";
}