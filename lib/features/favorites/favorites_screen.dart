import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/shared/widgets/channel_tile.dart';
import 'package:sycorax_cressida/shared/widgets/loading.dart';
import 'package:sycorax_cressida/features/favorites/providers.dart';
import 'package:sycorax_cressida/features/home/providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesListProvider);

    return favoritesAsync.when(
      data: (channels) {
        if (channels.isEmpty) {
          return const Center(child: Text('No favorites yet'));
        }
        return ListView.builder(
          itemCount: channels.length,
          itemBuilder: (context, index) {
            final channel = channels[index];
            return ChannelTile(
              channel: channel,
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () async {
                  await ref
                      .read(favoritesRepositoryProvider)
                      .toggleFavorite(channel.id);
                  ref.invalidate(favoritesListProvider);
                },
              ),
              onTap: () async {
                final repo = ref.read(channelRepositoryProvider);
                final streams = await repo.getStreamsByChannel(channel.id);
                if (streams.isNotEmpty && context.mounted) {
                  ref
                      .read(playerStateProvider.notifier)
                      .playStream(streams.first, channel.name);
                } else {
                  final feeds = await repo.getFeeds(channel.id);
                  if (feeds.isNotEmpty) {
                    final feedStreams = await repo.getStreams(feeds.first.id);
                    if (feedStreams.isNotEmpty && context.mounted) {
                      ref
                          .read(playerStateProvider.notifier)
                          .playStream(feedStreams.first, channel.name);
                    }
                  }
                }
                if (context.mounted) {
                  context.go('/');
                }
              },
            );
          },
        );
      },
      loading: () => const LoadingWidget(message: 'Loading favorites...'),
      error: (e, _) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            const Text('Failed to load favorites'),
            const SizedBox(height: 4),
            Text(
              e.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
