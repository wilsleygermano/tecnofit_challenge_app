import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.avatarUrl,
    this.size = 48,
  });
  final String avatarUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          avatarUrl,
        ),
        onBackgroundImageError: (exception, stackTrace) =>
            const Icon(Icons.error),
      ),
    );
  }
}
