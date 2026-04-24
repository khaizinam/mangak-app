import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/home/domain/repositories/home_repository.dart';
import 'package:social_network/features/home/data/models/manga_model.dart';


class HomeRepositoryImpl implements HomeRepository {
  final Dio _dio;

  HomeRepositoryImpl(this._dio);

  @override
  Future<List<MangaModel>> getMangaList({String? sort, int? limit, int? page, String? category}) async {
    final response = await _dio.get(
      ApiConstants.manga,
      queryParameters: {
        if (sort != null) 'sort': sort,
        if (limit != null) 'limit': limit,
        if (page != null) 'page': page,
        if (category != null) 'category': category,
      },
    );
    final List data = response.data['data'] ?? response.data;
    return data.map((json) => MangaModel.fromJson(json)).toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get(ApiConstants.categories);
    final List data = response.data['data'] ?? response.data;
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
