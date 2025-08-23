
import 'package:equatable/equatable.dart';
import 'package:teste_magnum/feature/post/domain/entities/post.dart';

abstract class PostCreateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostCreateInitial extends PostCreateState {}
class PostCreateLoading extends PostCreateState {}
class PostCreateLoaded extends PostCreateState {
  final Post post;
  PostCreateLoaded(this.post);
}
class PostCreateError extends PostCreateState {
  final String message;
  PostCreateError(this.message);
}

class PostCreateCreated extends PostCreateState {}