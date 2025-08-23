
import 'package:equatable/equatable.dart';
import 'package:teste_magnum/feature/post/domain/entities/post.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}
class PostLoading extends PostState {}
class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);
}
class PostError extends PostState {
  final String message;
  PostError(this.message);
}

class PostCreated extends PostState {}