import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/home/domain/repositories/home_repository.dart';
import 'package:social_network/features/home/data/models/manga_model.dart';


class HomeRepositoryImpl implements HomeRepository {
  final Dio _dio;

  HomeRepositoryImpl(this._dio);

  @override
  Future<List<MangaModel>> getMangaList({int? page, String? keyword}) async {
    final response = await _dio.get(
      ApiConstants.storiesList,
      queryParameters: {
        if (page != null) 'page': page,
        if (keyword != null) 'keyword': keyword,
      },
    );
    
    final data = response.data['data'];
    List items = [];
    if (data is Map) {
      items = data['items'] ?? [];
    } else if (data is List) {
      items = data;
    }
    
    return items.map((json) => MangaModel.fromJson(json)).toList();
  }

  @override
  Future<List<CategoryModel>> getCategories({int? page}) async {
    final response = await _dio.get(
      ApiConstants.categories,
      queryParameters: {
        if (page != null) 'page': page,
      },
    );
    final List data = response.data['data'] ?? [];
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }

  @override
  Future<List<MangaModel>> getCategoryStories(String categoryId, {int? page, String? keyword}) async {
    final response = await _dio.get(
      '${ApiConstants.categoryDetail}/$categoryId',
      queryParameters: {
        if (page != null) 'page': page,
        if (keyword != null) 'keyword': keyword,
      },
    );
    
    final data = response.data['data'];
    List items = [];
    if (data is Map) {
      items = data['items'] ?? [];
    } else if (data is List) {
      items = data;
    }
    
    return items.map((json) => MangaModel.fromJson(json)).toList();
  }

  @override
  Future<List<FeaturedSectionModel>> getFeaturedSections() async {
    final response = await _dio.get(ApiConstants.storiesFeatured);
    final List data = response.data['data'] ?? [];
    return data.map((json) => FeaturedSectionModel.fromJson(json)).toList();
  }
}
