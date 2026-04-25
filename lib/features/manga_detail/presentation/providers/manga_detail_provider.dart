import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/manga_detail_model.dart';
import '../../data/repositories/manga_detail_repository_impl.dart';
import '../../domain/repositories/manga_detail_repository.dart';
import '../../../../core/network/dio_provider.dart';

final mangaDetailRepositoryProvider = Provider<MangaDetailRepository>((ref) {
  final dioClient = ref.watch(dioProvider);
  return MangaDetailRepositoryImpl(dioClient.dio);
});

final mangaDetailProvider = FutureProvider.family<MangaDetailModel, String>((ref, id) async {
  return ref.watch(mangaDetailRepositoryProvider).getMangaDetail(id);
});

// ─── Paginated chapters ────────────────────────────────────────────────────

// ─── All chapters with local sorting ──────────────────────────────────────
class ChaptersState {
  final List<ChapterModel> chapters;
  final bool isLoading;
  final bool isAscending;

  const ChaptersState({
    this.chapters = const [],
    this.isLoading = false,
    this.isAscending = false,
  });

  ChaptersState copyWith({
    List<ChapterModel>? chapters,
    bool? isLoading,
    bool? isAscending,
  }) =>
      ChaptersState(
        chapters: chapters ?? this.chapters,
        isLoading: isLoading ?? this.isLoading,
        isAscending: isAscending ?? this.isAscending,
      );
}

class ChaptersNotifier extends StateNotifier<ChaptersState> {
  final MangaDetailRepository _repository;
  final String _mangaId;

  ChaptersNotifier(this._repository, this._mangaId) : super(const ChaptersState()) {
    fetchChapters();
  }

  Future<void> fetchChapters() async {
    state = state.copyWith(isLoading: true);
    try {
      final chapters = await _repository.getChapters(_mangaId);
      // API returns descending by default
      state = state.copyWith(
        chapters: chapters,
        isAscending: false,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void toggleSort() {
    final newIsAscending = !state.isAscending;
    final sortedChapters = List<ChapterModel>.from(state.chapters).reversed.toList();
    state = state.copyWith(
      chapters: sortedChapters,
      isAscending: newIsAscending,
    );
  }
}

final mangaChaptersProvider =
    StateNotifierProvider.family<ChaptersNotifier, ChaptersState, String>((ref, id) {
  return ChaptersNotifier(ref.watch(mangaDetailRepositoryProvider), id);
});
