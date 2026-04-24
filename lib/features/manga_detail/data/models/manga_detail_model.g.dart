// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaDetailModelImpl _$$MangaDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MangaDetailModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      coverUrl: json['cover_url'] as String,
      description: json['description'] as String,
      author: json['author'] as String,
      status: json['status'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      views: (json['views'] as num).toInt(),
      follows: (json['follows'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFollowed: json['is_followed'] as bool? ?? false,
    );

Map<String, dynamic> _$$MangaDetailModelImplToJson(
        _$MangaDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'cover_url': instance.coverUrl,
      'description': instance.description,
      'author': instance.author,
      'status': instance.status,
      'genres': instance.genres,
      'views': instance.views,
      'follows': instance.follows,
      'rating': instance.rating,
      'chapters': instance.chapters,
      'is_followed': instance.isFollowed,
    };

_$ChapterModelImpl _$$ChapterModelImplFromJson(Map<String, dynamic> json) =>
    _$ChapterModelImpl(
      id: (json['id'] as num).toInt(),
      chapterNumber: json['chapter_number'] as String,
      title: json['title'] as String,
      createdAt: json['created_at'] as String,
      isRead: json['is_read'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChapterModelImplToJson(_$ChapterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapter_number': instance.chapterNumber,
      'title': instance.title,
      'created_at': instance.createdAt,
      'is_read': instance.isRead,
    };
