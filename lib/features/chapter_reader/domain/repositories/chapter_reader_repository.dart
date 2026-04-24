import '../../data/models/chapter_pages_model.dart';


abstract class ChapterReaderRepository {
  Future<ChapterPagesModel> getChapterPages(int chapterId);
  Future<void> markAsRead(int chapterId);
}
