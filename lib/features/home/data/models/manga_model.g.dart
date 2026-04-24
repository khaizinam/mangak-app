// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaModelImpl _$$MangaModelImplFromJson(Map<String, dynamic> json) =>
    _$MangaModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      coverUrl: json['cover_url'] as String,
      chapterCount: (json['chapter_count'] as num).toInt(),
      lastUpdate: json['last_update'] as String,
      author: json['author'] as String?,
      status: json['status'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MangaModelImplToJson(_$MangaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'cover_url': instance.coverUrl,
      'chapter_count': instance.chapterCount,
      'last_update': instance.lastUpdate,
      'author': instance.author,
      'status': instance.status,
      'genres': instance.genres,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
