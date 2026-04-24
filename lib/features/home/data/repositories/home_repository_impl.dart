import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/home/domain/repositories/home_repository.dart';
import 'package:social_network/features/home/data/models/manga_model.dart';


class HomeRepositoryImpl implements HomeRepository {
  final Dio _dio;

  HomeRepositoryImpl(this._dio);

  @override
  Future<List<MangaModel>> getMangaList({String? sort, int? limit, int? page, String? category, String? keyword}) async {
    final endpoint = sort == 'popular' ? ApiConstants.storiesMostViewed : ApiConstants.storiesList;
    final response = await _dio.get(
      endpoint,
      queryParameters: {
        if (sort != null && sort != 'popular') 'sort': sort,
        if (sort == 'popular') 'type': 'weekly', // as per user request for weekly
        if (limit != null) 'limit': limit,
        if (page != null) 'page': page,
        if (category != null) 'category': category,
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
