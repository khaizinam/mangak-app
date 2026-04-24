import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/manga_card.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotManga = ref.watch(hotMangaProvider);
    final updatedManga = ref.watch(updatedMangaProvider);
    final categories = ref.watch(categoriesProvider);
    final recommendedManga = ref.watch(recommendedMangaProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(hotMangaProvider);
          ref.invalidate(updatedMangaProvider);
          ref.invalidate(categoriesProvider);
          ref.invalidate(recommendedMangaProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Text('MangaK', style: TextStyle(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              ],
            ),
            SliverToBoxAdapter(child: _buildSectionTitle('Truyện Hot 🔥')),
            SliverToBoxAdapter(child: _buildHorizontalList(hotManga, context)),
            
            SliverToBoxAdapter(child: _buildSectionTitle('Mới cập nhật 🕒')),
            SliverToBoxAdapter(child: _buildHorizontalList(updatedManga, context)),
            
            SliverToBoxAdapter(child: _buildSectionTitle('Thể loại')),
            SliverToBoxAdapter(child: _buildGenreChips(categories)),
            
            SliverToBoxAdapter(child: _buildSectionTitle('Đề xuất cho bạn ✨')),
            _buildRecommendedGrid(recommendedManga, context),
            
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHorizontalList(AsyncValue hotManga, BuildContext context) {
    return SizedBox(
      height: 220,
      child: hotManga.when(
        data: (list) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: list.length,
          itemBuilder: (context, index) => SizedBox(
            width: 140,
            child: MangaCard(
              manga: list[index],
              onTap: () => context.push('/manga/${list[index].slug}'),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  Widget _buildGenreChips(AsyncValue categories) {
    return SizedBox(
      height: 50,
      child: categories.when(
        data: (list) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ActionChip(
              label: Text(list[index].name),
              onPressed: () => context.push('/category/${list[index].slug}'),
            ),
          ),
        ),
        loading: () => const SizedBox(),
        error: (e, s) => const SizedBox(),
      ),
    );
  }

  Widget _buildRecommendedGrid(AsyncValue recommendedManga, BuildContext context) {
    return recommendedManga.when(
      data: (list) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => MangaCard(
              manga: list[index],
              onTap: () => context.push('/manga/${list[index].slug}'),
            ),
            childCount: list.length,
          ),
        ),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        )),
      ),
      error: (e, s) => SliverToBoxAdapter(
        child: Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}
