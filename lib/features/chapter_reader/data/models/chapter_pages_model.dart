import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_pages_model.freezed.dart';
part 'chapter_pages_model.g.dart';

@freezed
class ChapterPagesModel with _$ChapterPagesModel {
  const factory ChapterPagesModel({
    required int id,
    @JsonKey(name: 'chapter_number') required String chapterNumber,
    required List<String> images,
    @JsonKey(name: 'next_chapter_id') int? nextChapterId,
    @JsonKey(name: 'prev_chapter_id') int? prevChapterId,
  }) = _ChapterPagesModel;

  factory ChapterPagesModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterPagesModelFromJson(json);
}
