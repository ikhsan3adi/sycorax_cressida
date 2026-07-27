import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_new_shapes/material_new_shapes.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/shared/paintings/morphing_shape_border.dart';

class StreamTile extends ConsumerWidget {
  final ChannelStream stream;
  final Channel channel;
  final EdgeInsets? contentPadding;
  final ShapeBorder? shape;
  final Function()? onTap;

  const StreamTile({
    super.key,
    required this.stream,
    required this.channel,
    this.contentPadding,
    this.shape,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream?.url == stream.url;

    return ListTile(
      key: Key('${channel.id}-${stream.url}'),
      contentPadding: contentPadding,
      shape: shape,
      selectedTileColor: theme.colorScheme.secondaryContainer,
      tileColor: theme.colorScheme.surfaceContainer,
      leading: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
        decoration: ShapeDecoration(
          color: isPlaying
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.secondaryContainer,
          shape: MorphingShapeBorder(
            polygon: isPlaying
                ? MaterialShapes.cookie9Sided
                : MaterialShapes.pill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            isPlaying ? Icons.stream : Icons.live_tv,
            color: isPlaying
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      title: Text(
        stream.title.isNotEmpty ? stream.title : 'Stream',
        style: TextStyle(
          fontWeight: isPlaying ? FontWeight.bold : null,
          color: isPlaying ? theme.colorScheme.onSecondaryContainer : null,
        ),
      ),
      subtitle: stream.quality != null || stream.label != null
          ? Text(
              [
                stream.quality,
                stream.label,
              ].where((e) => e != null).join(' · '),
              style: TextStyle(
                color: isPlaying
                    ? theme.colorScheme.onSecondaryContainer
                    : null,
              ),
            )
          : null,
      selected: isPlaying,
      onTap: onTap,
    );
  }
}
