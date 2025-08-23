import 'package:json_annotation/json_annotation.dart';
import 'package:teste_magnum/feature/post/domain/entities/post.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}