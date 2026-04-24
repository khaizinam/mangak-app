import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_detail_model.freezed.dart';
part 'manga_detail_model.g.dart';

@freezed
class MangaDetailModel with _$MangaDetailModel {
  const factory MangaDetailModel({
    @JsonKey(readValue: _readId) required String id,
    required String name,
    required String slug,
    @JsonKey(name: 'thumb_url') required String thumbUrl,
    @JsonKey(name: 'origin_name') String? originName,
    required String status,
    @JsonKey(readValue: _readId) String? views,
    String? description,
    @JsonKey(name: 'total_chapters', readValue: _readId) String? totalChapters,
    @Default([]) List<String> author,
    @Default([]) List<DetailCategoryModel> category,
    @JsonKey(name: 'chaptersLatest') @Default([]) List<DetailChapterLatestModel> chaptersLatest,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    // Non-API fields with defaults (user interaction state)
    @Default(false) bool isFollowed,
    @Default(false) bool isLiked,
    @Default(0) int follows,
    @Default(0) int likes,
  }) = _MangaDetailModel;

  factory MangaDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MangaDetailModelFromJson(json);
}

@freezed
class DetailCategoryModel with _$DetailCategoryModel {
  const factory DetailCategoryModel({
    @JsonKey(readValue: _readId) required String id,
    required String name,
    required String slug,
  }) = _DetailCategoryModel;

  factory DetailCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$DetailCategoryModelFromJson(json);
}

@freezed
class DetailChapterLatestModel with _$DetailChapterLatestModel {
  const factory DetailChapterLatestModel({
    @JsonKey(name: 'chapter_name') String? chapterName,
    @JsonKey(name: 'chapter_title') String? chapterTitle,
    String? filename,
  }) = _DetailChapterLatestModel;

  factory DetailChapterLatestModel.fromJson(Map<String, dynamic> json) =>
      _$DetailChapterLatestModelFromJson(json);
}

/// Simplified chapter model matching the /chapters API response: {id, name}
@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @JsonKey(readValue: _readId) required String id,
    required String name,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);
}

/// Holds a page of chapters + whether there are more pages
class ChapterListResult {
  final List<ChapterModel> chapters;
  final bool hasMore;

  const ChapterListResult({required this.chapters, required this.hasMore});
}

Object? _readId(Map json, String key) {
  final value = json[key];
  if (value is int) return value.toString();
  return value;
}
