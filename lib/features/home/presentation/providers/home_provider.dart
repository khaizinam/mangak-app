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
  return ref.watch(homeRepositoryProvider).getMangaList(sort: 'popular', limit: 10);
});

final updatedMangaProvider = FutureProvider<List<MangaModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getMangaList(sort: 'updated', limit: 10);
});

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getCategories();
});

final recommendedMangaProvider = FutureProvider<List<MangaModel>>((ref) async {
  return ref.watch(homeRepositoryProvider).getMangaList(sort: 'recommend', limit: 20);
});
