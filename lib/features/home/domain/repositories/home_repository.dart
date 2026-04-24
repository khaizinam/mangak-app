import 'package:social_network/features/home/data/models/manga_model.dart';


abstract class HomeRepository {
  Future<List<MangaModel>> getMangaList({String? sort, int? limit, int? page, String? category});
  Future<List<CategoryModel>> getCategories();
}
