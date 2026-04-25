import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/manga_card.dart';
import '../../data/models/manga_model.dart';
import '../providers/category_provider.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotManga = ref.watch(hotMangaProvider);
    final updatedManga = ref.watch(updatedMangaProvider);
    final featuredSections = ref.watch(featuredSectionsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(hotMangaProvider);
          ref.invalidate(updatedMangaProvider);
          ref.invalidate(featuredSectionsProvider);
          ref.invalidate(categoriesProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Text('MangaK', style: TextStyle(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
                IconButton(icon: const Icon(Icons.search), onPressed: () => context.push('/search')),
              ],
            ),
            
            // Category Badges
            SliverToBoxAdapter(child: _buildCategoryBadges(categoriesAsync, context)),

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

  Widget _buildCategoryBadges(AsyncValue<List<CategoryModel>> categoriesAsync, BuildContext context) {
    return SizedBox(
      height: 60,
      child: categoriesAsync.when(
        data: (list) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final cat = list[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.push('/category/${cat.id}?name=${cat.name}'),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF27AE60).withAlpha(30),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF27AE60).withAlpha(100)),
                    ),
                    child: Text(
                      cat.name,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        loading: () => const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF27AE60)),
          ),
        ),
        error: (e, s) => Center(
          child: Text(
            'Không tải được danh mục',
            style: TextStyle(color: Colors.white.withAlpha(50), fontSize: 12),
          ),
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
      height: 280,
      child: hotManga.when(
        data: (list) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 140,
              child: MangaCard(
                manga: list[index],
                onTap: () => context.push('/manga/${list[index].id}'),
              ),
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
            childAspectRatio: 0.55,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
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
