import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/chapter_pages_model.dart';
import '../../data/repositories/chapter_reader_repository_impl.dart';
import '../../domain/repositories/chapter_reader_repository.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../manga_detail/presentation/providers/manga_detail_provider.dart';
import '../../../manga_detail/data/models/manga_detail_model.dart';

final chapterReaderRepositoryProvider = Provider<ChapterReaderRepository>((ref) {
  final dioClient = ref.watch(dioProvider);
  return ChapterReaderRepositoryImpl(dioClient.dio);
});

class ChapterNavigation {
  final ChapterPagesModel currentChapter;
  final List<ChapterModel> allChapters;
  final String? nextChapterId;
  final String? prevChapterId;

  ChapterNavigation({
    required this.currentChapter,
    required this.allChapters,
    this.nextChapterId,
    this.prevChapterId,
  });
}

final chapterPagesProvider = FutureProvider.autoDispose.family<ChapterNavigation, String>((ref, chapterId) async {
  final readerRepo = ref.watch(chapterReaderRepositoryProvider);
  final detailRepo = ref.watch(mangaDetailRepositoryProvider);
  
  // 1. Get current chapter detail (images, storyId)
  final pages = await readerRepo.getChapterPages(chapterId);
  
  // 2. Auto mark as read
  readerRepo.markAsRead(chapterId);

  // 3. Get all chapters to calculate navigation and show list
  final allChapters = await detailRepo.getChapters(pages.storyId);

  // 4. Find current index
  // API default: Descending (Newest to Oldest)
  final currentIndex = allChapters.indexWhere((c) => c.id == chapterId);
  
  String? nextId;
  String? prevId;

  if (currentIndex != -1) {
    // Next chapter (higher number) is at currentIndex - 1 in a descending list
    if (currentIndex > 0) {
      nextId = allChapters[currentIndex - 1].id;
    }
    // Prev chapter (lower number) is at currentIndex + 1 in a descending list
    if (currentIndex < allChapters.length - 1) {
      prevId = allChapters[currentIndex + 1].id;
    }
  }

  return ChapterNavigation(
    currentChapter: pages,
    allChapters: allChapters,
    nextChapterId: nextId,
    prevChapterId: prevId,
  );
});
