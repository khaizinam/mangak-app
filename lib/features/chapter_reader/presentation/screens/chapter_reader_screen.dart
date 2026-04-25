import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../providers/chapter_reader_provider.dart';

class ChapterReaderScreen extends HookConsumerWidget {
  final String id;
  final String chapterId;

  const ChapterReaderScreen({
    super.key,
    required this.id,
    required this.chapterId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagesAsync = ref.watch(chapterPagesProvider(chapterId));
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());
    
    // Smart Toolbar State
    final scrollController = useScrollController();
    final isToolbarVisible = useState(true);
    final lastOffset = useRef(0.0);

    // Auto Scroll State
    final isAutoScrolling = useState(false);
    final scrollSpeed = useState(20.0); // 1-100%
    final scrollTimer = useRef<Timer?>(null);

    void startAutoScroll() {
      scrollTimer.value?.cancel();
      isAutoScrolling.value = true;
      
      // Speed calculation: 1% = 10px/s, 100% = 1000px/s (approx)
      final pixelsPerTick = scrollSpeed.value / 2.0; 
      
      scrollTimer.value = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        if (!scrollController.hasClients) {
          timer.cancel();
          return;
        }

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        if (currentScroll >= maxScroll) {
          timer.cancel();
          isAutoScrolling.value = false;
        } else {
          scrollController.jumpTo(currentScroll + pixelsPerTick);
        }
      });
    }

    void stopAutoScroll() {
      scrollTimer.value?.cancel();
      isAutoScrolling.value = false;
    }

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      
      void scrollListener() {
        if (!scrollController.hasClients) return;
        
        final currentOffset = scrollController.offset;
        final delta = currentOffset - lastOffset.value;

        // Hide when scrolling down, show when scrolling up
        if (delta > 10 && isToolbarVisible.value && currentOffset > 100) {
          isToolbarVisible.value = false;
        } else if (delta < -10 && !isToolbarVisible.value) {
          isToolbarVisible.value = true;
        }
        
        lastOffset.value = currentOffset;
      }

      scrollController.addListener(scrollListener);
      return () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        scrollController.removeListener(scrollListener);
        scrollTimer.value?.cancel();
      };
    }, []);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      endDrawer: pagesAsync.when(
        data: (nav) => _buildSettingsDrawer(
          context, 
          nav, 
          isAutoScrolling.value, 
          scrollSpeed.value,
          (val) {
            scrollSpeed.value = val;
            if (isAutoScrolling.value) startAutoScroll();
          },
          () => isAutoScrolling.value ? stopAutoScroll() : startAutoScroll(),
        ),
        loading: () => const SizedBox(),
        error: (e, s) => const SizedBox(),
      ),
      body: pagesAsync.when(
        data: (nav) => Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                // Header (Block)
                SliverToBoxAdapter(
                  child: _buildHeaderBlock(context, nav),
                ),

                // Manga Images
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      // Precache next 2 images
                      if (index + 1 < nav.currentChapter.images.length) {
                        precacheImage(CachedNetworkImageProvider(nav.currentChapter.images[index + 1]), context);
                      }
                      if (index + 2 < nav.currentChapter.images.length) {
                        precacheImage(CachedNetworkImageProvider(nav.currentChapter.images[index + 2]), context);
                      }

                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 800),
                          child: CachedNetworkImage(
                            imageUrl: nav.currentChapter.images[index],
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                            placeholder: (context, url) => Container(
                              height: 300,
                              color: Colors.black12,
                              child: const Center(
                                child: CircularProgressIndicator(color: Colors.white24),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 200,
                              color: Colors.grey[900],
                              child: const Icon(Icons.broken_image, color: Colors.grey),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: nav.currentChapter.images.length,
                  ),
                ),

                // Footer (Block)
                SliverToBoxAdapter(
                  child: _buildFooterBlock(context, nav),
                ),

                // Bottom Spacing
                SliverToBoxAdapter(
                  child: SizedBox(height: MediaQuery.of(context).padding.bottom + 80),
                ),
              ],
            ),

            // Smart Floating Top Bar
            _buildSmartTopBar(context, nav, isToolbarVisible.value, () => scaffoldKey.currentState?.openEndDrawer()),

            // Auto Scroll HUD (Top)
            if (isAutoScrolling.value)
              _buildAutoScrollHUD(
                context, 
                scrollSpeed.value, 
                (newSpeed) {
                  scrollSpeed.value = newSpeed;
                  startAutoScroll();
                },
                stopAutoScroll,
              ),

            // Smart Floating Bottom Bar
            _buildSmartBottomBar(context, nav, isToolbarVisible.value),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget _buildAutoScrollHUD(
    BuildContext context, 
    double currentSpeed, 
    Function(double) onSpeedChanged,
    VoidCallback onStop,
  ) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 80,
      left: 0,
      right: 0,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(180),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.white),
                    onPressed: currentSpeed > 5 ? () => onSpeedChanged(currentSpeed - 5) : null,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Auto Scroll', style: TextStyle(color: Colors.white, fontSize: 10)),
                      Text('${currentSpeed.round()}%', style: const TextStyle(color: Color(0xFF27AE60), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                    onPressed: currentSpeed < 100 ? () => onSpeedChanged(currentSpeed + 5) : null,
                  ),
                  const SizedBox(width: 12),
                  Container(width: 1, height: 24, color: Colors.white24),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.redAccent),
                    onPressed: onStop,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmartTopBar(BuildContext context, ChapterNavigation nav, bool visible, VoidCallback onOpenSettings) {
    final topPadding = MediaQuery.of(context).padding.top;
    
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      top: visible ? 0 : -120 - topPadding,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.fromLTRB(8, topPadding + 4, 16, 12),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(150),
              border: const Border(bottom: BorderSide(color: Colors.white10)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nav.currentChapter.storyName,
                        style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Chương ${nav.currentChapter.chapterName}',
                        style: const TextStyle(color: Color(0xFF27AE60), fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 24),
                  onPressed: onOpenSettings,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsDrawer(
    BuildContext context, 
    ChapterNavigation nav, 
    bool autoScroll, 
    double speed,
    Function(double) onSpeedChanged,
    VoidCallback onToggleAutoScroll,
  ) {
    return Drawer(
      backgroundColor: const Color(0xFF1A1D27),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Icon(Icons.settings, color: Color(0xFF27AE60)),
                  const SizedBox(width: 12),
                  const Text(
                    'Cài đặt đọc truyện',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white10),
            
            // Auto Scroll
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tự động cuộn', style: TextStyle(color: Colors.white, fontSize: 16)),
                      Switch(
                        value: autoScroll,
                        onChanged: (_) => onToggleAutoScroll(),
                        activeTrackColor: const Color(0xFF27AE60),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Tốc độ:', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      Expanded(
                        child: Slider(
                          value: speed,
                          min: 1,
                          max: 100,
                          divisions: 100,
                          activeColor: const Color(0xFF27AE60),
                          label: '${speed.round()}%',
                          onChanged: onSpeedChanged,
                        ),
                      ),
                      Text('${speed.round()}%', style: const TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            
            const Divider(color: Colors.white10),
            
            _drawerItem(Icons.favorite_border, 'Thích truyện', () {}),
            _drawerItem(Icons.bookmark_border, 'Thêm vào yêu thích', () {}),
            _drawerItem(Icons.warning_amber_rounded, 'Báo lỗi chương', () {}),
            
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Chapter ID: ${nav.currentChapter.id}',
                style: const TextStyle(color: Colors.white24, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70, size: 22),
      title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 15)),
      onTap: onTap,
    );
  }

  Widget _buildSmartBottomBar(BuildContext context, ChapterNavigation nav, bool visible) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      bottom: visible ? 0 : -100 - bottomPadding,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + bottomPadding),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(150),
              border: const Border(top: BorderSide(color: Colors.white10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _floatingNavButton(
                  icon: Icons.arrow_back_ios,
                  enabled: nav.prevChapterId != null,
                  onTap: () => context.pushReplacement('/manga/$id/chapter/${nav.prevChapterId}'),
                ),
                
                // Chapter Selector Button
                InkWell(
                  onTap: () => _showChapterList(context, nav),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.list, color: Colors.white, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Chương ${nav.currentChapter.chapterName}',
                          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                _floatingNavButton(
                  icon: Icons.arrow_forward_ios,
                  enabled: nav.nextChapterId != null,
                  onTap: () => context.pushReplacement('/manga/$id/chapter/${nav.nextChapterId}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _floatingNavButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon, color: enabled ? Colors.white : Colors.white24, size: 20),
      onPressed: enabled ? onTap : null,
    );
  }

  Widget _buildHeaderBlock(BuildContext context, ChapterNavigation nav) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Image.asset('assets/images/logo.png', height: 24),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'MangaK - Truyện tranh miễn phí',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nav.currentChapter.storyName,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Chương ${nav.currentChapter.chapterName}',
                  style: const TextStyle(color: Color(0xFF27AE60), fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white12, height: 1),
        ],
      ),
    );
  }

  Widget _buildFooterBlock(BuildContext context, ChapterNavigation nav) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      color: Colors.black,
      child: Column(
        children: [
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navButton(
                icon: Icons.arrow_back_ios,
                label: 'Chương trước',
                enabled: nav.prevChapterId != null,
                onTap: () => context.pushReplacement('/manga/$id/chapter/${nav.prevChapterId}'),
              ),
              _navButton(
                icon: Icons.arrow_forward_ios,
                label: 'Chương sau',
                enabled: nav.nextChapterId != null,
                onTap: () => context.pushReplacement('/manga/$id/chapter/${nav.nextChapterId}'),
                isRight: true,
              ),
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _showChapterList(context, nav),
              icon: const Icon(Icons.list),
              label: const Text('DANH SÁCH CHƯƠNG'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white24),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
    required String label,
    required bool enabled,
    required VoidCallback onTap,
    bool isRight = false,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Opacity(
        opacity: enabled ? 1.0 : 0.2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withAlpha(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isRight) Icon(icon, color: Colors.white, size: 16),
              if (!isRight) const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              if (isRight) const SizedBox(width: 8),
              if (isRight) Icon(icon, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showChapterList(BuildContext context, ChapterNavigation nav) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1D27),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Chọn chương', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nav.allChapters.length,
              itemBuilder: (context, index) {
                final chapter = nav.allChapters[index];
                final isCurrent = chapter.id == chapterId;
                return ListTile(
                  title: Text(
                    'Chương ${chapter.name}',
                    style: TextStyle(
                      color: isCurrent ? const Color(0xFF27AE60) : Colors.white,
                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  trailing: isCurrent ? const Icon(Icons.check, color: Color(0xFF27AE60)) : null,
                  onTap: () {
                    Navigator.pop(context);
                    if (!isCurrent) {
                      context.pushReplacement('/manga/$id/chapter/${chapter.id}');
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
