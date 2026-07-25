import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.isFavorite, this.onPressed});

  final bool isFavorite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: isFavorite
            ? theme.colorScheme.tertiaryContainer
            : theme.colorScheme.surfaceContainerHighest,
        foregroundColor: isFavorite
            ? theme.colorScheme.onTertiaryContainer
            : theme.colorScheme.onSurface,
      ),
      icon: Icon(isFavorite ? Icons.thumb_up : Icons.thumb_up_outlined),
      onPressed: onPressed,
    );
  }
}
