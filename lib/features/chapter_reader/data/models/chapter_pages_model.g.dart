// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_pages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterPagesModelImpl _$$ChapterPagesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterPagesModelImpl(
      id: (json['id'] as num).toInt(),
      chapterNumber: json['chapter_number'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      nextChapterId: (json['next_chapter_id'] as num?)?.toInt(),
      prevChapterId: (json['prev_chapter_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChapterPagesModelImplToJson(
        _$ChapterPagesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapter_number': instance.chapterNumber,
      'images': instance.images,
      'next_chapter_id': instance.nextChapterId,
      'prev_chapter_id': instance.prevChapterId,
    };
