import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_network/features/home/data/models/manga_model.dart';


part 'manga_detail_model.freezed.dart';
part 'manga_detail_model.g.dart';

@freezed
class MangaDetailModel with _$MangaDetailModel {
  const factory MangaDetailModel({
    required int id,
    required String title,
    required String slug,
    @JsonKey(name: 'cover_url') required String coverUrl,
    required String description,
    required String author,
    required String status,
    required List<String> genres,
    required int views,
    required int follows,
    required double rating,
    @JsonKey(name: 'chapters') required List<ChapterModel> chapters,
    @JsonKey(name: 'is_followed') @Default(false) bool isFollowed,
  }) = _MangaDetailModel;

  factory MangaDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MangaDetailModelFromJson(json);
}

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    required int id,
    @JsonKey(name: 'chapter_number') required String chapterNumber,
    required String title,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
  }) = _ChapterModel;

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);
}
