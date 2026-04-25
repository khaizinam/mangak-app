// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaDetailModelImpl _$$MangaDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MangaDetailModelImpl(
      id: _readId(json, 'id') as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      thumbUrl: json['thumb_url'] as String,
      originName: json['origin_name'] as String?,
      status: json['status'] as String?,
      views: _readId(json, 'views') as String?,
      description: json['description'] as String?,
      totalChapters: _readId(json, 'total_chapters') as String?,
      author: (json['author'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      category: (json['category'] as List<dynamic>?)
              ?.map((e) =>
                  DetailCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chaptersLatest: (json['chaptersLatest'] as List<dynamic>?)
              ?.map((e) =>
                  DetailChapterLatestModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      updatedAt: json['updatedAt'] as String?,
      isFollowed: json['is_followed'] as bool? ?? false,
      isLiked: json['is_liked'] as bool? ?? false,
      lastReadAt: json['last_read_at'] == null
          ? null
          : LastReadModel.fromJson(
              json['last_read_at'] as Map<String, dynamic>),
      follows: (json['follows'] as num?)?.toInt() ?? 0,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MangaDetailModelImplToJson(
        _$MangaDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumb_url': instance.thumbUrl,
      'origin_name': instance.originName,
      'status': instance.status,
      'views': instance.views,
      'description': instance.description,
      'total_chapters': instance.totalChapters,
      'author': instance.author,
      'category': instance.category,
      'chaptersLatest': instance.chaptersLatest,
      'updatedAt': instance.updatedAt,
      'is_followed': instance.isFollowed,
      'is_liked': instance.isLiked,
      'last_read_at': instance.lastReadAt,
      'follows': instance.follows,
      'likes': instance.likes,
    };

_$LastReadModelImpl _$$LastReadModelImplFromJson(Map<String, dynamic> json) =>
    _$LastReadModelImpl(
      id: _readId(json, 'id') as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$LastReadModelImplToJson(_$LastReadModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$DetailCategoryModelImpl _$$DetailCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCategoryModelImpl(
      id: _readId(json, 'id') as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$DetailCategoryModelImplToJson(
        _$DetailCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$DetailChapterLatestModelImpl _$$DetailChapterLatestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailChapterLatestModelImpl(
      chapterName: json['chapter_name'] as String?,
      chapterTitle: json['chapter_title'] as String?,
      filename: json['filename'] as String?,
    );

Map<String, dynamic> _$$DetailChapterLatestModelImplToJson(
        _$DetailChapterLatestModelImpl instance) =>
    <String, dynamic>{
      'chapter_name': instance.chapterName,
      'chapter_title': instance.chapterTitle,
      'filename': instance.filename,
    };

_$ChapterModelImpl _$$ChapterModelImplFromJson(Map<String, dynamic> json) =>
    _$ChapterModelImpl(
      id: _readId(json, 'id') as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ChapterModelImplToJson(_$ChapterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
