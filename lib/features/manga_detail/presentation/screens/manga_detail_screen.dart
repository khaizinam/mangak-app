import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../providers/manga_detail_provider.dart';
import '../../data/models/manga_detail_model.dart';


class MangaDetailScreen extends ConsumerWidget {
  final String slug;

  const MangaDetailScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(mangaDetailProvider(slug));

    return Scaffold(
      body: detailAsync.when(
        data: (manga) => _buildContent(context, manga),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, MangaDetailModel manga) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 400,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              manga.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 4, color: Colors.black)],
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: manga.coverUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatsRow(manga),
                const SizedBox(height: 16),
                _buildGenreChips(manga),
                const SizedBox(height: 24),
                _buildActionButtons(context, manga),
                const SizedBox(height: 24),
                const Text(
                  'Nội dung',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(manga.description),
                const SizedBox(height: 32),
                Text(
                  'Danh sách chương (${manga.chapters.length})',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final chapter = manga.chapters[index];
              return ListTile(
                title: Text('Chương ${chapter.chapterNumber}: ${chapter.title}'),
                subtitle: Text(chapter.createdAt),
                trailing: chapter.isRead ? const Icon(Icons.check_circle, color: Colors.green) : null,
                onTap: () => context.push('/manga/${manga.slug}/chapter/${chapter.id}'),
              );
            },
            childCount: manga.chapters.length,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }

  Widget _buildStatsRow(MangaDetailModel manga) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(Icons.remove_red_eye, manga.views.toString(), 'Lượt xem'),
        _buildStatItem(Icons.favorite, manga.follows.toString(), 'Theo dõi'),
        _buildStatItem(Icons.star, manga.rating.toString(), 'Đánh giá'),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildGenreChips(MangaDetailModel manga) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: manga.genres.map((g) => Chip(label: Text(g))).toList(),
    );
  }

  Widget _buildActionButtons(BuildContext context, MangaDetailModel manga) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => context.push('/manga/${manga.slug}/chapter/${manga.chapters.last.id}'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Đọc từ đầu'),
          ),
        ),
        const SizedBox(width: 12),
        IconButton.filledTonal(
          onPressed: () {},
          icon: Icon(manga.isFollowed ? Icons.favorite : Icons.favorite_border),
        ),
      ],
    );
  }
}
