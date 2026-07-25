import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/features/favorites/providers.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/settings/providers/settings_provider.dart';
import 'package:sycorax_cressida/shared/widgets/widgets.dart';

class ChannelList extends ConsumerStatefulWidget {
  final bool shrinkWrap;

  const ChannelList({super.key, this.shrinkWrap = false});

  @override
  ConsumerState<ChannelList> createState() => _ChannelListState();
}

class _ChannelListState extends ConsumerState<ChannelList> {
  @override
  void initState() {
    super.initState();
    Future(() {
      if (mounted) ref.read(channelListProvider.notifier).init();
    });
    _setupListeners();
  }

  @override
  void dispose() {
    _hideEmptyStreamsListener?.close();
    _hideNsfwListener?.close();
    super.dispose();
  }

  void _setupListeners() {
    _hideEmptyStreamsListener = ref.listenManual<bool>(
      hideEmptyStreamsProvider.select((v) => v.value ?? true),
      (_, next) {
        ref.read(channelListProvider.notifier).refresh();
      },
    );
    _hideNsfwListener = ref.listenManual<bool>(
      hideNsfwProvider.select((v) => v.value ?? false),
      (_, next) {
        ref.read(channelListProvider.notifier).refresh();
      },
    );
  }

  ProviderSubscription? _hideEmptyStreamsListener;
  ProviderSubscription? _hideNsfwListener;

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

    final listView = ListView.builder(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      itemCount: state.channels.length + (state.isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.channels.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final channel = state.channels[index];
        final isFav = ref.watch(isFavoriteProvider(channel.id));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: ChannelExpansionTile(
            channel: channel,
            trailing: isFav.when(
              data: (fav) => FavoriteButton(
                isFavorite: fav,
                onPressed: () async {
                  await ref
                      .read(favoritesRepositoryProvider)
                      .toggleFavorite(channel.id);
                  ref.invalidate(isFavoriteProvider(channel.id));
                  ref.invalidate(favoritesListProvider);
                },
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );

    if (widget.shrinkWrap) return listView;

    return NotificationListener<ScrollNotification>(
      onNotification: (scroll) {
        if (scroll is ScrollEndNotification &&
            scroll.metrics.pixels >=
                scroll.metrics.maxScrollExtent - Constants.scrollThreshold) {
          ref.read(channelListProvider.notifier).loadMore();
        }
        return false;
      },
      child: listView,
    );
  }
}
