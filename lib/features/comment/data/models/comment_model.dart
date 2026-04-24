import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    @JsonKey(name: 'user_name') required String userName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    required String content,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'reply_count') required int replyCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
