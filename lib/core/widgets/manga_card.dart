import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
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

  @override
  Widget build(BuildContext context) {
    final latestChapter = manga.chaptersLatest?.isNotEmpty == true 
        ? manga.chaptersLatest!.first.chapterName ?? '0'
        : '0';

    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: const Color(0xFF1E2124), // Dark background for the card
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: manga.thumbUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(color: Colors.white),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    manga.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}
