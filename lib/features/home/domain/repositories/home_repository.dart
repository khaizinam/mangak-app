import 'package:social_network/features/home/data/models/manga_model.dart';

abstract class HomeRepository {
  Future<List<MangaModel>> getMangaList({int? page, String? keyword});
  Future<List<FeaturedSectionModel>> getFeaturedSections();
  Future<List<CategoryModel>> getCategories({int? page});
  Future<List<MangaModel>> getCategoryStories(String categoryId, {int? page, String? keyword});
}
