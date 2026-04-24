import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentSection extends ConsumerWidget {
  final int mangaId;

  const CommentSection({super.key, required this.mangaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Text(
                'Bình luận',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 10, // Placeholder count
                  itemBuilder: (context, index) => _buildCommentItem(index),
                ),
              ),
              _buildCommentInput(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommentItem(int index) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: const Text('User Name'),
      subtitle: const Text('Nội dung bình luận của người dùng...'),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.favorite_border, size: 20),
          Text('12', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Viết bình luận...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Helper to show the sheet
void showCommentSheet(BuildContext context, int mangaId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => CommentSection(mangaId: mangaId),
  );
}
