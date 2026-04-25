import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/manga_model.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/home_repository.dart';
import '../../../../core/network/dio_provider.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dioClient = ref.watch(dioProvider);
  return HomeRepositoryImpl(dioClient.dio);
});

final hotMangaProvider = FutureProvider<List<MangaModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getMangaList();
});

final featuredSectionsProvider = FutureProvider<List<FeaturedSectionModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getFeaturedSections();
});

class UpdatedMangaNotifier extends StateNotifier<AsyncValue<List<MangaModel>>> {
  final HomeRepository _repository;
  int _currentPage = 1;
  bool _isFetching = false;

  UpdatedMangaNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadFirstPage();
  }

  Future<void> loadFirstPage() async {
    _currentPage = 1;
    state = const AsyncValue.loading();
    try {
      final list = await _repository.getMangaList(page: _currentPage);
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> loadMore() async {
    if (_isFetching) return;
    _isFetching = true;
    _currentPage++;
    try {
      final list = await _repository.getMangaList(page: _currentPage);
      state = AsyncValue.data([...state.value ?? [], ...list]);
    } catch (e) {
      // Don't set error state to avoid losing existing data
    } finally {
      _isFetching = false;
    }
  }
}

final updatedMangaProvider = StateNotifierProvider<UpdatedMangaNotifier, AsyncValue<List<MangaModel>>>((ref) {
  return UpdatedMangaNotifier(ref.watch(homeRepositoryProvider));
});
