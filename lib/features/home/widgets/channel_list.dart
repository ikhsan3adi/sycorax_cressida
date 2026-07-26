import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material3_expressive_loading_indicator/material3_expressive_loading_indicator.dart';

import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/models/models.dart';
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

  Widget _buildTile(Channel channel) {
    final isFav = ref.watch(isFavoriteProvider(channel.id));
    return ChannelExpansionTile(
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
    );
  }

  Widget _buildLoadingTile() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: ExpressiveLoadingIndicator()),
    );
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

    final isWide = MediaQuery.sizeOf(context).width >= 800;
    final childCount =
        state.channels.length + (state.isLoading ? 1 : 0) + (isWide ? 1 : 0);

    final masonryView = MasonryGridView.count(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: childCount,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) {
        if (index >= state.channels.length) return _buildLoadingTile();
        return _buildTile(state.channels[index]);
      },
    );

    final listView = ListView.builder(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      itemCount: childCount,
      itemBuilder: (context, index) {
        if (index >= state.channels.length) {
          return _buildLoadingTile();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: _buildTile(state.channels[index]),
        );
      },
    );

    if (widget.shrinkWrap) return isWide ? masonryView : listView;

    final scrollListener = NotificationListener<ScrollNotification>(
      onNotification: (scroll) {
        if (scroll is ScrollEndNotification &&
            scroll.metrics.pixels >=
                scroll.metrics.maxScrollExtent - Constants.scrollThreshold) {
          ref.read(channelListProvider.notifier).loadMore();
        }
        return false;
      },
      child: isWide ? masonryView : listView,
    );

    if (isWide) {
      return Scrollbar(child: scrollListener);
    }

    return scrollListener;
  }
}
