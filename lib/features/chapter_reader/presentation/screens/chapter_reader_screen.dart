import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../providers/chapter_reader_provider.dart';

class ChapterReaderScreen extends HookConsumerWidget {
  final String slug;
  final int chapterId;

  const ChapterReaderScreen({
    super.key,
    required this.slug,
    required this.chapterId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagesAsync = ref.watch(chapterPagesProvider(chapterId));
    final isOverlayVisible = useState(true);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      return () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      };
    }, []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: pagesAsync.when(
        data: (chapter) => Stack(
          children: [
            GestureDetector(
              onTap: () => isOverlayVisible.value = !isOverlayVisible.value,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: chapter.images.length,
                itemBuilder: (context, index) {
                  // Precache next 2 images
                  if (index + 1 < chapter.images.length) {
                    precacheImage(CachedNetworkImageProvider(chapter.images[index + 1]), context);
                  }
                  if (index + 2 < chapter.images.length) {
                    precacheImage(CachedNetworkImageProvider(chapter.images[index + 2]), context);
                  }

                  return CachedNetworkImage(
                    imageUrl: chapter.images[index],
                    fit: BoxFit.contain,
                    width: double.infinity,
                    placeholder: (context, url) => const SizedBox(
                      height: 400,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
              ),

            ),
            if (isOverlayVisible.value) ...[
              _buildTopBar(context, chapter.chapterNumber),
              _buildBottomBar(context, chapter.chapterNumber),
            ],
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, String chapterNumber) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: Text('Chương $chapterNumber'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, String chapterNumber) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black54,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {},
            ),
            Text(
              'Chương $chapterNumber',
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
