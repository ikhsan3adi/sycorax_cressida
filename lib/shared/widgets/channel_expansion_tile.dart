import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/features/home/widgets/feed_list_tile.dart';
import 'package:sycorax_cressida/shared/widgets/channel_logo.dart';
import 'package:sycorax_cressida/shared/widgets/loading.dart';
import 'package:sycorax_cressida/shared/widgets/stream_tile.dart';

class ChannelExpansionTile extends ConsumerWidget {
  final Channel channel;
  final Widget? trailing;
  final Function(HomeContentMode mode)? onChildTap;
  final _controller = ExpansibleController();

  ChannelExpansionTile({
    super.key,
    required this.channel,
    this.trailing,
    this.onChildTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isEmpty = !channel.hasStreams;
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream?.channelId == channel.id;

    if (isPlaying) _controller.expand();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: isPlaying
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surfaceContainer,
        child: Opacity(
          opacity: isEmpty ? 0.4 : 1.0,
          child: ExpansionTile(
            key: Key('${channel.id}-${channel.name}'),
            leading: ChannelLogoImage(imageUrl: channel.logoUrl),
            controller: _controller,
            title: Text(
              channel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: isPlaying ? FontWeight.bold : null,
                color: isPlaying ? theme.colorScheme.onPrimaryContainer : null,
              ),
            ),
            subtitle: channel.categories.isNotEmpty || channel.country != null
                ? Text(
                    [
                      if (channel.categories.isNotEmpty)
                        channel.categories.join(', '),
                      if (channel.country != null) channel.country!,
                    ].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isPlaying
                          ? theme.colorScheme.onPrimaryContainer
                          : null,
                    ),
                  )
                : null,
            trailing: trailing,
            shape: Border.all(color: Colors.transparent, width: 0),
            children: [
              _ChannelDetails(channel: channel, onChildTap: onChildTap),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChannelDetails extends ConsumerWidget {
  final Channel channel;
  final Function(HomeContentMode mode)? onChildTap;

  const _ChannelDetails({required this.channel, this.onChildTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedsAsync = ref.watch(channelFeedsProvider(channel.id));

    return feedsAsync.when(
      data: (feeds) {
        if (feeds.length > 1) {
          return Column(
            children: feeds
                .map(
                  (feed) => FeedListTile(
                    feed: feed,
                    onTap: () {
                      ref
                          .read(homeContentProvider.notifier)
                          .setStreamsMode(
                            channel: channel,
                            feedId: feed.id,
                            feedName: feed.name.isNotEmpty
                                ? feed.name
                                : 'Default Feed',
                          );
                      onChildTap?.call(HomeContentMode.streams);
                    },
                  ),
                )
                .toList(),
          );
        } else {
          final streamsAsync = ref.watch(channelStreamsProvider(channel.id));
          return streamsAsync.when(
            data: (streams) {
              if (streams.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No streams available'),
                );
              }
              return Column(
                children: streams
                    .map(
                      (stream) => StreamTile(
                        stream: stream,
                        channel: channel,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        onTap: () {
                          ref
                              .read(playerStateProvider.notifier)
                              .playStream(stream, channel);
                          onChildTap?.call(HomeContentMode.browse);
                        },
                      ),
                    )
                    .toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16.0),
              child: LoadingWidget(),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error loading streams: $e'),
            ),
          );
        }
      },
      loading: () =>
          const Padding(padding: EdgeInsets.all(16.0), child: LoadingWidget()),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Error loading feeds: $e'),
      ),
    );
  }
}
