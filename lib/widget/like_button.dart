import 'package:flutter/material.dart';
import 'package:flutter_lecture_2024/provider/liked_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeButton extends ConsumerWidget {
  const LikeButton({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked =
        ref.read(likedNotifierProvider.select((value) => value.contains(id)));

    return IconButton(
      onPressed: () {
        ref.read(likedNotifierProvider.notifier).toggle(id);
      },
      icon: isLiked
          ? const Icon(
              Icons.favorite,
              color: Colors.pink,
            )
          : const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
    );
  }
}
