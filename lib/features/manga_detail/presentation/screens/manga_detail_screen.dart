import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/manga_detail_provider.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/models/manga_detail_model.dart';

class MangaDetailScreen extends ConsumerWidget {
  final String id;

  const MangaDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(mangaDetailProvider(id));
    final chaptersState = ref.watch(mangaChaptersProvider(id));

    return Scaffold(
      backgroundColor: const Color(0xFF0F1117),
      body: detailAsync.when(
        data: (manga) => _buildContent(context, ref, manga, chaptersState),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(
          child: Text('Lỗi: $e', style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    MangaDetailModel manga,
    ChaptersState chaptersState,
  ) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color(0xFF0F1117),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          title: const Text('Chi tiết truyện',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          pinned: true,
        ),
        SliverToBoxAdapter(child: _buildInfoCard(context, ref, manga, chaptersState)),
        SliverToBoxAdapter(child: _buildDescriptionCard(manga)),
        
        // Chapter Header
        SliverToBoxAdapter(
          child: _buildChapterHeader(context, ref, manga, chaptersState),
        ),

        // Chapters Grid/List
        if (chaptersState.isLoading && chaptersState.chapters.isEmpty)
          const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          )
        else if (chaptersState.chapters.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Text('Chưa có chương nào',
                    style: TextStyle(color: Colors.white54)),
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final chapter = chaptersState.chapters[index];
                  return GestureDetector(
                    onTap: () =>
                        context.push('/manga/${manga.id}/chapter/${chapter.id}'),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1D27),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Text(
                        'C. ${chapter.name}',
                        style: const TextStyle(color: Colors.white, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
                childCount: chaptersState.chapters.length,
              ),
            ),
          ),
        
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }

  // ─── INFO CARD ────────────────────────────────────────────────────────────

  Widget _buildInfoCard(
    BuildContext context,
    WidgetRef ref,
    MangaDetailModel manga,
    ChaptersState chaptersState,
  ) {
    final statusMap = {
      'ongoing': 'Đang tiến hành',
      'completed': 'Hoàn thành',
      'coming_soon': 'Sắp ra mắt',
    };
    final statusText = statusMap[manga.status] ?? manga.status ?? 'Đang cập nhật';
    final statusColor =
        manga.status == 'completed' ? Colors.blue : Colors.green;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail + Metadata
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: manga.thumbUrl,
                  width: 120,
                  height: 170,
                  fit: BoxFit.cover,
                  placeholder: (ctx, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[600]!,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (ctx, url, err) => Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      manga.name,
                      style: const TextStyle(
                        color: Color(0xFF4CAF50),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _metaRow('Tên gốc:', manga.originName ?? ''),
                    _metaRow('Cập nhật:', manga.updatedAt ?? ''),
                    _metaRow('Theo dõi:', manga.follows.toString()),
                    Row(
                      children: [
                        const Text('Trạng thái: ',
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                        Text(statusText,
                            style: TextStyle(
                                color: statusColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    _metaRow('Tác giả:',
                        manga.author.isEmpty ? 'Đang cập nhật' : manga.author.join(', ')),
                    _metaRow('Lượt thích:', manga.likes.toString()),
                    _metaRow('Lượt xem:', _formatViews(manga.views)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Genre chips
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: manga.category.map((cat) => _genreChip(context, cat)).toList(),
          ),
          const SizedBox(height: 14),

          // Continue Reading Button (Conditional)
          if (manga.lastReadAt != null && manga.lastReadAt!.id != null && manga.lastReadAt!.name != null) ...[
            AppButton(
              label: 'Đọc tiếp C.${manga.lastReadAt!.name}',
              icon: Icons.play_arrow,
              type: AppButtonType.primary,
              width: double.infinity,
              onTap: () => context.push('/manga/${manga.id}/chapter/${manga.lastReadAt!.id}'),
            ),
            const SizedBox(height: 10),
          ],

          // Action buttons row 1
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: manga.isFollowed ? 'Đã theo dõi' : 'Theo dõi',
                  icon: manga.isFollowed ? Icons.bookmark_added : Icons.bookmark_add_outlined,
                  type: manga.isFollowed ? AppButtonType.primary : AppButtonType.secondary,
                  onTap: () {
                    // TODO: Implement toggle follow
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppButton(
                  label: manga.isLiked ? 'Đã thích' : 'Thích',
                  icon: manga.isLiked ? Icons.favorite : Icons.favorite_border,
                  type: manga.isLiked ? AppButtonType.danger : AppButtonType.secondary,
                  onTap: () {
                    // TODO: Implement toggle like
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Action buttons row 2
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Chương đầu',
                  icon: Icons.first_page,
                  type: AppButtonType.outline,
                  onTap: () {
                    final chapters = chaptersState.chapters;
                    if (chapters.isNotEmpty) {
                      final firstChapter = chaptersState.isAscending ? chapters.first : chapters.last;
                      context.push('/manga/${manga.id}/chapter/${firstChapter.id}');
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppButton(
                  label: 'Mới nhất',
                  icon: Icons.last_page,
                  type: AppButtonType.secondary,
                  onTap: () {
                    final chapters = chaptersState.chapters;
                    if (chapters.isNotEmpty) {
                      final lastChapter = chaptersState.isAscending ? chapters.last : chapters.first;
                      context.push('/manga/${manga.id}/chapter/${lastChapter.id}');
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Action buttons row 3
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Báo Lỗi Truyện',
                  icon: Icons.warning_amber,
                  type: AppButtonType.danger,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── DESCRIPTION ──────────────────────────────────────────────────────────

  Widget _buildDescriptionCard(MangaDetailModel manga) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.info_outline, color: Color(0xFF27AE60), size: 18),
              SizedBox(width: 6),
              Text(
                'Mô Tả',
                style: TextStyle(
                  color: Color(0xFF27AE60),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            manga.description ?? 'Đang cập nhật...',
            style:
                const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  // ─── CHAPTER HEADER ───────────────────────────────────────────────────────

  Widget _buildChapterHeader(
    BuildContext context,
    WidgetRef ref,
    MangaDetailModel manga,
    ChaptersState chaptersState,
  ) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      padding: const EdgeInsets.fromLTRB(14, 12, 4, 12),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1D27),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        border: Border(
          top: BorderSide(color: Colors.white10),
          left: BorderSide(color: Colors.white10),
          right: BorderSide(color: Colors.white10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.list, color: Color(0xFF27AE60), size: 20),
              const SizedBox(width: 8),
              const Text(
                'DANH SÁCH CHƯƠNG',
                style: TextStyle(
                  color: Color(0xFF27AE60),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${chaptersState.chapters.length})',
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              chaptersState.isAscending ? Icons.south : Icons.north,
              color: const Color(0xFF27AE60),
              size: 20,
            ),
            tooltip: 'Sắp xếp',
            onPressed: () {
              ref.read(mangaChaptersProvider(manga.id).notifier).toggleSort();
            },
          ),
        ],
      ),
    );
  }

  // ─── HELPERS ──────────────────────────────────────────────────────────────

  Widget _metaRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(width: 4),
          Expanded(
              child:
                  Text(value, style: const TextStyle(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }

  Widget _genreChip(BuildContext context, DetailCategoryModel cat) {
    if (cat.id == null || cat.name == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => context.push('/category/${cat.id}?name=${cat.name}'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2F3D),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white12),
        ),
        child: Text(cat.name!,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ),
    );
  }


  String _formatViews(String? viewsStr) {
    if (viewsStr == null || viewsStr.isEmpty) return '0';
    final views = int.tryParse(viewsStr) ?? 0;
    if (views >= 1000000) {
      return '${(views / 1000000).toStringAsFixed(1).replaceAll('.0', '')}M';
    }
    if (views >= 1000) {
      return '${(views / 1000).toStringAsFixed(1).replaceAll('.0', '')}K';
    }
    return views.toString();
  }
}
