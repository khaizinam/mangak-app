import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/manga_detail_model.dart';
import '../../data/repositories/manga_detail_repository_impl.dart';
import '../../domain/repositories/manga_detail_repository.dart';
import '../../../../core/network/dio_provider.dart';

final mangaDetailRepositoryProvider = Provider<MangaDetailRepository>((ref) {
  final dioClient = ref.watch(dioProvider);
  return MangaDetailRepositoryImpl(dioClient.dio);
});

final mangaDetailProvider = FutureProvider.family<MangaDetailModel, String>((ref, slug) async {
  return ref.watch(mangaDetailRepositoryProvider).getMangaDetail(slug);
});
