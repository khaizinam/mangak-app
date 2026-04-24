import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/manga_detail_provider.dart';
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
        SliverToBoxAdapter(child: _buildChapterSection(context, ref, manga, chaptersState)),
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
    final latestChapter = manga.chaptersLatest.isNotEmpty
        ? manga.chaptersLatest.first.chapterName ?? ''
        : '';
    final statusMap = {
      'ongoing': 'Đang tiến hành',
      'completed': 'Hoàn thành',
      'coming_soon': 'Sắp ra mắt',
    };
    final statusText = statusMap[manga.status] ?? manga.status;
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
            children: manga.category.map((cat) => _genreChip(cat.name)).toList(),
          ),
          const SizedBox(height: 14),

          // Action buttons row 1
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  label: manga.isFollowed ? 'Đã theo dõi' : 'Theo dõi',
                  icon: Icons.bookmark,
                  color: const Color(0xFFE67E22),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _actionButton(
                  label: manga.isLiked ? 'Đã thích' : 'Thích',
                  icon: Icons.favorite,
                  color: const Color(0xFFE74C3C),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Action buttons row 2
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  label: latestChapter.isNotEmpty
                      ? 'Đọc tiếp C.$latestChapter'
                      : 'Đọc từ đầu',
                  icon: Icons.play_arrow,
                  color: const Color(0xFF27AE60),
                  onTap: () {
                    final chapters = chaptersState.chapters;
                    if (chapters.isNotEmpty) {
                      context.push('/manga/${manga.id}/chapter/${chapters.first.id}');
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _actionButton(
                  label: 'Báo Lỗi Truyện',
                  icon: Icons.warning_amber,
                  color: const Color(0xFFC0392B),
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

  // ─── CHAPTER SECTION (wrap buttons) ───────────────────────────────────────

  Widget _buildChapterSection(
    BuildContext context,
    WidgetRef ref,
    MangaDetailModel manga,
    ChaptersState chaptersState,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.list, color: Color(0xFF27AE60), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'DANH SÁCH CHƯƠNG',
                      style: TextStyle(
                        color: Color(0xFF27AE60),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                Text('${chaptersState.chapters.length} chương',
                    style: const TextStyle(color: Colors.white54, fontSize: 13)),
              ],
            ),
          ),

          const Divider(color: Colors.white10, height: 1),

          if (chaptersState.chapters.isEmpty && chaptersState.isLoading)
            const Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (chaptersState.chapters.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text('Chưa có chương nào',
                    style: TextStyle(color: Colors.white54)),
              ),
            )
          else
            // Chapter buttons in a Wrap layout
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: chaptersState.chapters.map((chapter) {
                  return GestureDetector(
                    onTap: () =>
                        context.push('/manga/${manga.id}/chapter/${chapter.id}'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF252836),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Text(
                        'Chương ${chapter.name}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 13),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

          // Load more button
          if (chaptersState.hasMore || chaptersState.isLoading)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 14),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: chaptersState.isLoading
                      ? null
                      : () =>
                          ref.read(mangaChaptersProvider(manga.id).notifier).loadMore(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF27AE60),
                    side: const BorderSide(color: Color(0xFF27AE60)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: chaptersState.isLoading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF27AE60)),
                        )
                      : const Text('Xem thêm chương'),
                ),
              ),
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

  Widget _genreChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2F3D),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(label,
          style: const TextStyle(color: Colors.white70, fontSize: 12)),
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
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
