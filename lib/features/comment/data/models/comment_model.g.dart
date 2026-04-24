// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: (json['id'] as num).toInt(),
      userName: json['user_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      likeCount: (json['like_count'] as num).toInt(),
      replyCount: (json['reply_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'avatar_url': instance.avatarUrl,
      'content': instance.content,
      'created_at': instance.createdAt,
      'like_count': instance.likeCount,
      'reply_count': instance.replyCount,
      'is_liked': instance.isLiked,
    };
