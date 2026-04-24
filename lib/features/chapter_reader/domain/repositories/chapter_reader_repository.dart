import '../../data/models/chapter_pages_model.dart';


abstract class ChapterReaderRepository {
  Future<ChapterPagesModel> getChapterPages(String chapterId);
  Future<void> markAsRead(String chapterId);
}
