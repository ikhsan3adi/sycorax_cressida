import 'package:flutter/material.dart';
import 'package:material_new_shapes/material_new_shapes.dart';
import 'package:sycorax_cressida/shared/paintings/morphing_shape_border.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.isFavorite, this.onPressed});

  final bool isFavorite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: MorphingShapeBorder(
        polygon: isFavorite
            ? MaterialShapes.softBurst
            : MaterialShapes.cookie12Sided,
      ),
      clipBehavior: Clip.antiAlias,
      color: isFavorite
          ? theme.colorScheme.tertiaryContainer
          : theme.colorScheme.surfaceContainerHighest,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            isFavorite ? Icons.thumb_up : Icons.thumb_up_outlined,
            color: isFavorite
                ? theme.colorScheme.onTertiaryContainer
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
