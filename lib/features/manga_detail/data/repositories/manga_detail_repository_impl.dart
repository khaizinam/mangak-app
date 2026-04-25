import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/manga_detail/domain/repositories/manga_detail_repository.dart';
import 'package:social_network/features/manga_detail/data/models/manga_detail_model.dart';


class MangaDetailRepositoryImpl implements MangaDetailRepository {
  final Dio _dio;

  MangaDetailRepositoryImpl(this._dio);

  @override
  Future<MangaDetailModel> getMangaDetail(String id) async {
    final response = await _dio.get('${ApiConstants.storyDetail}/$id');
    final responseData = response.data;
    final detailData = responseData['data'] ?? responseData;
    return MangaDetailModel.fromJson(detailData);
  }

  @override
  Future<List<ChapterModel>> getChapters(String id) async {
    final response = await _dio.get('${ApiConstants.storyChapters}/$id');
    final responseData = response.data;
    final List data = responseData['data'] ?? [];
    return data.map((j) => ChapterModel.fromJson(j)).toList();
  }

  @override
  Future<void> followManga(String id) async {
    await _dio.post('${ApiConstants.stories}/$id/follow');
  }

  @override
  Future<void> unfollowManga(String id) async {
    await _dio.delete('${ApiConstants.stories}/$id/follow');
  }
}
