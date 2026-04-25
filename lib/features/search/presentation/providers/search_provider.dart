import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../features/home/data/models/manga_model.dart';
import '../../../../features/home/presentation/providers/home_provider.dart';

final searchKeywordProvider = StateProvider.autoDispose<String>((ref) => '');

final searchResultsProvider = FutureProvider.autoDispose<List<MangaModel>>((ref) async {
  final keyword = ref.watch(searchKeywordProvider);
  if (keyword.isEmpty) return [];

  // Wait for 1.5s (debounce)
  Timer? timer;
  
  final completer = Completer<List<MangaModel>>();
  
  timer = Timer(const Duration(milliseconds: 1500), () async {
    try {
      final repo = ref.read(homeRepositoryProvider);
      final results = await repo.getMangaList(keyword: keyword);
      completer.complete(results);
    } catch (e) {
      completer.completeError(e);
    }
  });

  ref.onDispose(() {
    timer?.cancel();
  });

  return completer.future;
});
