import '../../data/models/manga_detail_model.dart';


abstract class MangaDetailRepository {
  Future<MangaDetailModel> getMangaDetail(String slug);
  Future<void> followManga(int mangaId);
  Future<void> unfollowManga(int mangaId);
}
