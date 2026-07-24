import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/features/home/widgets/channel_expansion_tile.dart';
import 'package:sycorax_cressida/shared/widgets/loading.dart';
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/features/favorites/providers.dart';
import 'package:sycorax_cressida/features/home/providers.dart';

class ChannelList extends ConsumerStatefulWidget {
  const ChannelList({super.key});

  @override
  ConsumerState<ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends ConsumerState<ChannelList> {
  @override
  void initState() {
    super.initState();
    ref.read(channelListProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(channelListProvider);

    if (state.isLoading && state.channels.isEmpty) {
      return const LoadingWidget(message: 'Loading channels...');
    }

    if (state.error != null && state.channels.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            const Text('Failed to load channels'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => ref.read(channelListProvider.notifier).refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scroll) {
        if (scroll is ScrollEndNotification &&
            scroll.metrics.pixels >=
                scroll.metrics.maxScrollExtent - AppConstants.scrollThreshold) {
          ref.read(channelListProvider.notifier).loadMore();
        }
        return false;
      },
      child: ListView.builder(
        itemCount: state.channels.length + (state.isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= state.channels.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final channel = state.channels[index];
          return ChannelExpansionTile(
            channel: channel,
            trailing: _FavoriteButton(channelId: channel.id),
          );
        },
      ),
    );
  }
}

class _FavoriteButton extends ConsumerWidget {
  final String channelId;
  const _FavoriteButton({required this.channelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(isFavoriteProvider(channelId));
    return isFav.when(
      data: (fav) => IconButton(
        icon: Icon(
          fav ? Icons.favorite : Icons.favorite_border,
          color: fav ? Colors.red : null,
        ),
        onPressed: () async {
          await ref.read(favoritesRepositoryProvider).toggleFavorite(channelId);
          ref.invalidate(isFavoriteProvider(channelId));
          ref.invalidate(favoritesListProvider);
        },
      ),
      loading: () => const SizedBox.shrink(),
      error: (Object e, StackTrace s) => const SizedBox.shrink(),
    );
  }
}
