import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';

class FeedListTile extends ConsumerWidget {
  final ChannelFeed feed;
  final VoidCallback onTap;

  const FeedListTile({super.key, required this.feed, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream?.feedId == feed.id;

    return ListTile(
      key: Key('${feed.channelId}-${feed.id}'),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      selectedTileColor: theme.colorScheme.secondaryContainer,
      tileColor: theme.colorScheme.surfaceContainer,
      leading: CircleAvatar(
        backgroundColor: isPlaying
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.tertiaryContainer,
        foregroundColor: isPlaying
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onTertiaryContainer,
        child: const Icon(Icons.playlist_play),
      ),
      title: Text(
        feed.name.isNotEmpty ? feed.name : 'Default Feed',
        style: TextStyle(
          fontWeight: isPlaying ? FontWeight.bold : null,
          color: isPlaying
              ? theme.colorScheme.onSecondaryContainer
              : theme.colorScheme.tertiary,
        ),
      ),
      subtitle: feed.format != null
          ? Text(
              feed.format!,
              style: TextStyle(
                color: isPlaying
                    ? theme.colorScheme.onSecondaryContainer
                    : null,
              ),
            )
          : null,
      selected: isPlaying,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (feed.isMain)
            Badge(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              backgroundColor: theme.colorScheme.primaryContainer,
              label: const Text('Main'),
            ),
          if (isPlaying)
            Badge(
              backgroundColor: theme.colorScheme.tertiaryContainer,
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      color: theme.colorScheme.onTertiaryContainer,
                      size: 14,
                    ),
                    Text(
                      'Now Playing',
                      style: TextStyle(
                        color: theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
