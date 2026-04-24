import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
class MangaModel with _$MangaModel {
  const factory MangaModel({
    required int id,
    required String title,
    required String slug,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @JsonKey(name: 'chapter_count') required int chapterCount,
    @JsonKey(name: 'last_update') required String lastUpdate,
    String? author,
    String? status,
    List<String>? genres,
  }) = _MangaModel;

  factory MangaModel.fromJson(Map<String, dynamic> json) =>
      _$MangaModelFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String slug,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
