import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
class MangaModel with _$MangaModel {
  const factory MangaModel({
    @JsonKey(readValue: _readId) required String id,
    required String name,
    required String slug,
    @JsonKey(name: 'thumb_url') required String thumbUrl,
    @JsonKey(readValue: _readTotalChapters, name: 'total_chapters') String? totalChapters,
    @JsonKey(name: 'updated_at') String? updatedAt,
    List<String>? author,
    String? status,
    @JsonKey(readValue: _readId) String? views,
    String? description,
    @JsonKey(name: 'chaptersLatest') List<ChapterLatestModel>? chaptersLatest,
  }) = _MangaModel;

  factory MangaModel.fromJson(Map<String, dynamic> json) =>
      _$MangaModelFromJson(json);
}

@freezed
class ChapterLatestModel with _$ChapterLatestModel {
  const factory ChapterLatestModel({
    @JsonKey(name: 'filename') String? filename,
    @JsonKey(name: 'chapter_name') String? chapterName,
    @JsonKey(name: 'chapter_title') String? chapterTitle,
    @JsonKey(name: 'chapter_api_data') String? chapterApiData,
  }) = _ChapterLatestModel;

  factory ChapterLatestModel.fromJson(Map<String, dynamic> json) => _$ChapterLatestModelFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(readValue: _readId) required String id,
    required String name,
    required String slug,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class FeaturedSectionModel with _$FeaturedSectionModel {
  const factory FeaturedSectionModel({
    required CategoryModel category,
    required List<MangaModel> stories,
  }) = _FeaturedSectionModel;

  factory FeaturedSectionModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturedSectionModelFromJson(json);
}


Object? _readId(Map json, String key) {
  final value = json[key];
  if (value is int) return value.toString();
  return value;
}

Object? _readTotalChapters(Map json, String key) {
  final value = json[key];
  if (value is int) return value.toString();
  return value;
}
