import 'package:flutter/material.dart';
import 'package:material_new_shapes/material_new_shapes.dart';
import 'package:sycorax_cressida/shared/widgets/m3e_shape_clipper.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.isFavorite, this.onPressed});

  final bool isFavorite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipPath(
      clipper: M3eShapeClipper(
        shape: isFavorite
            ? MaterialShapes.softBurst
            : MaterialShapes.cookie12Sided,
      ),
      child: IconButton.filled(
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
      ),
    );
  }
}
