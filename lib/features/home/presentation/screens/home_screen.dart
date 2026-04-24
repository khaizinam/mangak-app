import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/manga_card.dart';
import '../../data/models/manga_model.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotManga = ref.watch(hotMangaProvider);
    final updatedManga = ref.watch(updatedMangaProvider);
    final featuredSections = ref.watch(featuredSectionsProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(hotMangaProvider);
          ref.invalidate(updatedMangaProvider);
          ref.invalidate(featuredSectionsProvider);
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
            
            SliverToBoxAdapter(child: _buildFeaturedSections(featuredSections, context)),
            
            SliverToBoxAdapter(child: _buildSectionTitle('Mới cập nhật 🕒')),
            _buildUpdatedGrid(updatedManga, context),
            _buildLoadMoreButton(ref),
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

  Widget _buildHorizontalList(AsyncValue<List<MangaModel>> hotManga, BuildContext context) {
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
              onTap: () => context.push('/manga/${list[index].id}'),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  Widget _buildFeaturedSections(AsyncValue<List<FeaturedSectionModel>> featuredSections, BuildContext context) {
    return featuredSections.when(
      data: (sections) => Column(
        children: sections.map<Widget>((section) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(section.category.name),
            _buildHorizontalList(AsyncValue.data(section.stories), context),
          ],
        )).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => const SizedBox(),
    );
  }

  Widget _buildUpdatedGrid(AsyncValue<List<MangaModel>> updatedManga, BuildContext context) {
    return updatedManga.when(
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
              onTap: () => context.push('/manga/${list[index].id}'),
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

  Widget _buildLoadMoreButton(WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: OutlinedButton(
            onPressed: () => ref.read(updatedMangaProvider.notifier).loadMore(),
            child: const Text('Xem thêm'),
          ),
        ),
      ),
    );
  }
}
