import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/chapter_pages_model.dart';
import '../../data/repositories/chapter_reader_repository_impl.dart';
import '../../domain/repositories/chapter_reader_repository.dart';
import '../../../../core/network/dio_provider.dart';

final chapterReaderRepositoryProvider = Provider<ChapterReaderRepository>((ref) {
  final dioClient = ref.watch(dioProvider);
  return ChapterReaderRepositoryImpl(dioClient.dio);
});

final chapterPagesProvider = FutureProvider.family<ChapterPagesModel, int>((ref, chapterId) async {
  final repository = ref.watch(chapterReaderRepositoryProvider);
  final pages = await repository.getChapterPages(chapterId);
  // Auto mark as read
  repository.markAsRead(chapterId);
  return pages;
});
