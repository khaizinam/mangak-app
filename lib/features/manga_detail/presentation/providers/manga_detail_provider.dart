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

class ChaptersState {
  final List<ChapterModel> chapters;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;

  const ChaptersState({
    this.chapters = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
  });

  ChaptersState copyWith({
    List<ChapterModel>? chapters,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
  }) =>
      ChaptersState(
        chapters: chapters ?? this.chapters,
        isLoading: isLoading ?? this.isLoading,
        hasMore: hasMore ?? this.hasMore,
        currentPage: currentPage ?? this.currentPage,
      );
}

class ChaptersNotifier extends StateNotifier<ChaptersState> {
  final MangaDetailRepository _repository;
  final String _mangaId;

  ChaptersNotifier(this._repository, this._mangaId) : super(const ChaptersState()) {
    loadMore(); // Load first page on creation
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);
    try {
      final nextPage = state.currentPage + 1;
      final result = await _repository.getChapters(_mangaId, page: nextPage);

      state = state.copyWith(
        chapters: [...state.chapters, ...result.chapters],
        hasMore: result.hasMore,
        currentPage: nextPage,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final mangaChaptersProvider =
    StateNotifierProvider.family<ChaptersNotifier, ChaptersState, String>((ref, id) {
  return ChaptersNotifier(ref.watch(mangaDetailRepositoryProvider), id);
});
