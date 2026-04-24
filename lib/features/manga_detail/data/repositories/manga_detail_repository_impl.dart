import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/manga_detail/domain/repositories/manga_detail_repository.dart';
import 'package:social_network/features/manga_detail/data/models/manga_detail_model.dart';




class MangaDetailRepositoryImpl implements MangaDetailRepository {
  final Dio _dio;

  MangaDetailRepositoryImpl(this._dio);

  @override
  Future<MangaDetailModel> getMangaDetail(String slug) async {
    final response = await _dio.get('${ApiConstants.manga}/$slug');
    return MangaDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  @override
  Future<void> followManga(int mangaId) async {
    await _dio.post('${ApiConstants.manga}/$mangaId/follow');
  }

  @override
  Future<void> unfollowManga(int mangaId) async {
    await _dio.delete('${ApiConstants.manga}/$mangaId/follow');
  }
}
