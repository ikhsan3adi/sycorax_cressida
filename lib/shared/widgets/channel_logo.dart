import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChannelLogoImage extends StatelessWidget {
  const ChannelLogoImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            width: 54,
            height: 54,
            fit: BoxFit.contain,
            errorWidget: (_, _, _) =>
                Icon(Icons.tv, color: theme.colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
