import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/manga_model.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_provider.dart';

final categoriesProvider = FutureProvider.autoDispose<List<CategoryModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getCategories();
});

class CategoryDetailState {
  final AsyncValue<List<MangaModel>> stories;
  final String categoryId;
  final String keyword;

  CategoryDetailState({
    required this.stories,
    required this.categoryId,
    this.keyword = '',
  });

  CategoryDetailState copyWith({
    AsyncValue<List<MangaModel>>? stories,
    String? categoryId,
    String? keyword,
  }) {
    return CategoryDetailState(
      stories: stories ?? this.stories,
      categoryId: categoryId ?? this.categoryId,
      keyword: keyword ?? this.keyword,
    );
  }
}

class CategoryDetailNotifier extends StateNotifier<CategoryDetailState> {
  final HomeRepository _repository;
  int _currentPage = 1;
  bool _isFetching = false;

  CategoryDetailNotifier(this._repository, String initialCategoryId)
      : super(CategoryDetailState(
          stories: const AsyncValue.loading(),
          categoryId: initialCategoryId,
        )) {
    loadFirstPage();
  }

  Future<void> loadFirstPage({String? categoryId, String? keyword}) async {
    final targetCategoryId = categoryId ?? state.categoryId;
    final targetKeyword = keyword ?? state.keyword;
    
    _currentPage = 1;
    state = state.copyWith(
      stories: const AsyncValue.loading(),
      categoryId: targetCategoryId,
      keyword: targetKeyword,
    );
    
    try {
      final list = await _repository.getCategoryStories(
        targetCategoryId,
        page: _currentPage,
        keyword: targetKeyword,
      );
      state = state.copyWith(stories: AsyncValue.data(list));
    } catch (e, s) {
      state = state.copyWith(stories: AsyncValue.error(e, s));
    }
  }

  Future<void> loadMore() async {
    if (_isFetching) return;
    _isFetching = true;
    _currentPage++;
    try {
      final list = await _repository.getCategoryStories(
        state.categoryId,
        page: _currentPage,
        keyword: state.keyword,
      );
      if (list.isEmpty) {
        _isFetching = false;
        return;
      }
      final currentList = state.stories.value ?? [];
      state = state.copyWith(stories: AsyncValue.data([...currentList, ...list]));
    } catch (e) {
      // Don't set error state to avoid losing existing data
    } finally {
      _isFetching = false;
    }
  }
}

final categoryDetailProvider = StateNotifierProvider.family.autoDispose<CategoryDetailNotifier, CategoryDetailState, String>((ref, categoryId) {
  return CategoryDetailNotifier(ref.watch(homeRepositoryProvider), categoryId);
});
