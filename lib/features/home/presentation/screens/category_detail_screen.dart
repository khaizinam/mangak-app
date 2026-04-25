import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../core/widgets/manga_card.dart';
import '../../../../core/widgets/app_button.dart';
import '../providers/category_provider.dart';

class CategoryDetailScreen extends HookConsumerWidget {
  final String categoryId;
  final String categoryName;

  const CategoryDetailScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryDetailProvider(categoryId));
    final categoriesAsync = ref.watch(categoriesProvider);
    
    final searchController = useTextEditingController(text: state.keyword);
    final selectedCategoryId = useState(state.categoryId);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1116),
      appBar: AppBar(
        title: Text(categoryName, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Bar
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(5),
              border: Border(bottom: BorderSide(color: Colors.white.withAlpha(10))),
            ),
            child: Row(
              children: [
                // Category Dropdown
                Expanded(
                  flex: 2,
                  child: categoriesAsync.when(
                    data: (list) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: list.any((c) => c.id == selectedCategoryId.value) 
                              ? selectedCategoryId.value 
                              : (list.isNotEmpty ? list.first.id : null),
                          dropdownColor: const Color(0xFF1A1D24),
                          isExpanded: true,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                          items: list.map((cat) => DropdownMenuItem(
                            value: cat.id,
                            child: Text(cat.name),
                          )).toList(),
                          onChanged: (val) {
                            if (val != null) selectedCategoryId.value = val;
                          },
                        ),
                      ),
                    ),
                    loading: () => const SizedBox(height: 40),
                    error: (_, __) => const SizedBox(),
                  ),
                ),
                const SizedBox(width: 8),
                // Search Input
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Tìm trong danh mục...',
                      hintStyle: TextStyle(color: Colors.white.withAlpha(40)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      filled: true,
                      fillColor: Colors.white.withAlpha(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Filter Button
                AppButton(
                  width: 80,
                  label: 'Lọc',
                  height: 40,
                  type: AppButtonType.secondary,
                  onTap: () {
                    ref.read(categoryDetailProvider(categoryId).notifier).loadFirstPage(
                      categoryId: selectedCategoryId.value,
                      keyword: searchController.text,
                    );
                  },
                ),
              ],
            ),
          ),
          
          Expanded(
            child: state.stories.when(
              data: (list) => list.isEmpty 
                ? _buildEmptyResults()
                : RefreshIndicator(
                  onRefresh: () => ref.read(categoryDetailProvider(categoryId).notifier).loadFirstPage(),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(12),
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
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                            child: AppButton(
                              label: 'Xem thêm',
                              type: AppButtonType.outline,
                              width: 150,
                              onTap: () => ref.read(categoryDetailProvider(categoryId).notifier).loadMore(),
                            ),
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 24)),
                    ],
                  ),
                ),
              loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFF27AE60))),
              error: (e, s) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.white.withAlpha(20)),
          const SizedBox(height: 16),
          const Text('Không tìm thấy truyện phù hợp', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
