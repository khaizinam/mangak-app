import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/manga_card.dart';
import '../providers/search_provider.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final resultsAsync = ref.watch(searchResultsProvider);
    final keyword = ref.watch(searchKeywordProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1116),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: TextField(
          controller: searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Tìm kiếm truyện...',
            hintStyle: TextStyle(color: Colors.white.withAlpha(100)),
            border: InputBorder.none,
            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      searchController.clear();
                      ref.read(searchKeywordProvider.notifier).state = '';
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            ref.read(searchKeywordProvider.notifier).state = value;
          },
        ),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.white10, height: 1),
          Expanded(
            child: resultsAsync.when(
              data: (mangas) {
                if (keyword.isEmpty) {
                  return _buildEmptySearch();
                }
                if (mangas.isEmpty) {
                  return _buildNoResults();
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: mangas.length,
                  itemBuilder: (context, index) {
                    return MangaCard(
                      manga: mangas[index],
                      onTap: () => context.push('/manga/${mangas[index].id}'),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: Color(0xFF27AE60)),
              ),
              error: (e, s) => Center(
                child: Text('Lỗi: $e', style: const TextStyle(color: Colors.white54)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearch() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.white.withAlpha(20)),
          const SizedBox(height: 16),
          Text(
            'Nhập từ khóa để tìm truyện yêu thích',
            style: TextStyle(color: Colors.white.withAlpha(100), fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.white.withAlpha(20)),
          const SizedBox(height: 16),
          const Text(
            'Không tìm thấy truyện nào phù hợp',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
