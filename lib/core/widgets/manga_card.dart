import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../features/home/data/models/manga_model.dart';

class MangaCard extends StatelessWidget {
  final MangaModel manga;
  final VoidCallback onTap;

  const MangaCard({
    super.key,
    required this.manga,
    required this.onTap,
  });

  String _formatViews(String? viewsStr) {
    if (viewsStr == null || viewsStr.isEmpty) return '0';
    final views = int.tryParse(viewsStr) ?? 0;
    if (views >= 1000000) {
      return '${(views / 1000000).toStringAsFixed(1).replaceAll('.0', '')}M';
    } else if (views >= 1000) {
      return '${(views / 1000).toStringAsFixed(1).replaceAll('.0', '')}K';
    }
    return views.toString();
  }

  String _getTimeAgo(String? updatedAt) {
    if (updatedAt == null || updatedAt.isEmpty) return '';
    try {
      // API format: "2026-03-09 09:35:02"
      final dateTime = DateTime.parse(updatedAt.replaceAll(' ', 'T'));
      return timeago.format(dateTime);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final latestChapter = manga.chaptersLatest?.isNotEmpty == true 
        ? manga.chaptersLatest!.first.chapterName ?? '0'
        : '0';
    final timeAgo = _getTimeAgo(manga.updatedAt);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 200 / 267,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF1E2124),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: manga.thumbUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[600]!,
                        child: Container(color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.grey),
                    ),
                  ),
                  if (timeAgo.isNotEmpty)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(230),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          timeAgo,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 36, // Fixed height for 2 lines
            child: Text(
              manga.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 13,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chap. $latestChapter',
                style: TextStyle(color: Colors.grey[400], fontSize: 11),
              ),
              Row(
                children: [
                  const Icon(Icons.remove_red_eye, color: Colors.amber, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    _formatViews(manga.views),
                    style: TextStyle(color: Colors.grey[400], fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
