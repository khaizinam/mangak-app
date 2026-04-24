import '../../data/models/manga_detail_model.dart';


abstract class MangaDetailRepository {
  Future<MangaDetailModel> getMangaDetail(String id);
  Future<ChapterListResult> getChapters(String id, {int page = 1});
  Future<void> followManga(String id);
  Future<void> unfollowManga(String id);
}
