import 'package:dio/dio.dart';
import 'package:social_network/core/constants/api_constants.dart';
import 'package:social_network/features/chapter_reader/domain/repositories/chapter_reader_repository.dart';
import 'package:social_network/features/chapter_reader/data/models/chapter_pages_model.dart';



class ChapterReaderRepositoryImpl implements ChapterReaderRepository {
  final Dio _dio;

  ChapterReaderRepositoryImpl(this._dio);

  @override
  Future<ChapterPagesModel> getChapterPages(String chapterId) async {
    final response = await _dio.get('${ApiConstants.chapterDetail}/$chapterId');
    return ChapterPagesModel.fromJson(response.data['data'] ?? response.data);
  }

  @override
  Future<void> markAsRead(String chapterId) async {
    await _dio.post('${ApiConstants.chapterDetail}/$chapterId/read');
  }
}
