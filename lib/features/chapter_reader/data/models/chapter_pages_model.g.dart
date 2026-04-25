// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_pages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterPagesModelImpl _$$ChapterPagesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterPagesModelImpl(
      id: _readChapterId(json, 'id') as String,
      chapterName: _readChapterName(json, 'chapterName') as String,
      storyId: _readStoryId(json, 'storyId') as String,
      storyName: _readStoryName(json, 'storyName') as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ChapterPagesModelImplToJson(
        _$ChapterPagesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapterName': instance.chapterName,
      'storyId': instance.storyId,
      'storyName': instance.storyName,
      'images': instance.images,
    };
