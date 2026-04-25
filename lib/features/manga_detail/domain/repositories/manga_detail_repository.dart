import '../../data/models/manga_detail_model.dart';


abstract class MangaDetailRepository {
  Future<MangaDetailModel> getMangaDetail(String id);
  Future<List<ChapterModel>> getChapters(String id);
  Future<void> followManga(String id);
  Future<void> unfollowManga(String id);
}
