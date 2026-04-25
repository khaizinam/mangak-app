// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaModelImpl _$$MangaModelImplFromJson(Map<String, dynamic> json) =>
    _$MangaModelImpl(
      id: _readId(json, 'id') as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      thumbUrl: json['thumb_url'] as String,
      totalChapters: _readTotalChapters(json, 'total_chapters') as String?,
      updatedAt: json['updatedAt'] as String?,
      author:
          (json['author'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      views: _readId(json, 'views') as String?,
      description: json['description'] as String?,
      chaptersLatest: (json['chaptersLatest'] as List<dynamic>?)
          ?.map((e) => ChapterLatestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MangaModelImplToJson(_$MangaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumb_url': instance.thumbUrl,
      'total_chapters': instance.totalChapters,
      'updatedAt': instance.updatedAt,
      'author': instance.author,
      'status': instance.status,
      'views': instance.views,
      'description': instance.description,
      'chaptersLatest': instance.chaptersLatest,
    };

_$ChapterLatestModelImpl _$$ChapterLatestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterLatestModelImpl(
      filename: json['filename'] as String?,
      chapterName: json['chapter_name'] as String?,
      chapterTitle: json['chapter_title'] as String?,
      chapterApiData: json['chapter_api_data'] as String?,
    );

Map<String, dynamic> _$$ChapterLatestModelImplToJson(
        _$ChapterLatestModelImpl instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'chapter_name': instance.chapterName,
      'chapter_title': instance.chapterTitle,
      'chapter_api_data': instance.chapterApiData,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: _readId(json, 'id') as String,
      name: json['name'] as String,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$FeaturedSectionModelImpl _$$FeaturedSectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeaturedSectionModelImpl(
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      stories: (json['stories'] as List<dynamic>)
          .map((e) => MangaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeaturedSectionModelImplToJson(
        _$FeaturedSectionModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'stories': instance.stories,
    };
