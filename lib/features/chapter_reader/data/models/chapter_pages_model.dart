import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_pages_model.freezed.dart';
part 'chapter_pages_model.g.dart';

@freezed
class ChapterPagesModel with _$ChapterPagesModel {
  const factory ChapterPagesModel({
    @JsonKey(readValue: _readChapterId) required String id,
    @JsonKey(name: 'chapterName', readValue: _readChapterName) required String chapterName,
    @JsonKey(name: 'storyId', readValue: _readStoryId) required String storyId,
    @JsonKey(name: 'storyName', readValue: _readStoryName) required String storyName,
    required List<String> images,
  }) = _ChapterPagesModel;

  factory ChapterPagesModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterPagesModelFromJson(json);
}

Object? _readChapterId(Map json, String key) {
  return json['chapter']?['id']?.toString();
}

Object? _readChapterName(Map json, String key) {
  return json['chapter']?['chapter_name']?.toString();
}

Object? _readStoryId(Map json, String key) {
  return json['story']?['id']?.toString();
}

Object? _readStoryName(Map json, String key) {
  return json['story']?['name']?.toString();
}
