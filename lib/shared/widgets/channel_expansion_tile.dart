import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/features/home/widgets/feed_list_tile.dart';
import 'package:sycorax_cressida/shared/widgets/widgets.dart';

class ChannelExpansionTile extends ConsumerWidget {
  final Channel channel;
  final Widget? trailing;
  final VoidCallback? onPlayStream;

  const ChannelExpansionTile({
    super.key,
    required this.channel,
    this.trailing,
    this.onPlayStream,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isEmpty = !channel.hasStreams;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: theme.colorScheme.surfaceContainer,
        child: Opacity(
          opacity: isEmpty ? 0.4 : 1.0,
          child: ExpansionTile(
            leading: ChannelLogoImage(imageUrl: channel.logoUrl),
            title: Text(
              channel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                  )
                : null,
            trailing: trailing,
            shape: Border.all(color: Colors.transparent),
            children: [
              _ChannelDetails(channel: channel, onPlayStream: onPlayStream),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChannelDetails extends ConsumerWidget {
  final Channel channel;
  final VoidCallback? onPlayStream;

  const _ChannelDetails({required this.channel, this.onPlayStream});

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
                      (stream) => _InlineStreamTile(
                        stream: stream,
                        channel: channel,
                        onPlayStream: onPlayStream,
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

class _InlineStreamTile extends ConsumerWidget {
  final ChannelStream stream;
  final Channel channel;
  final VoidCallback? onPlayStream;

  const _InlineStreamTile({
    required this.stream,
    required this.channel,
    this.onPlayStream,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream?.url == stream.url;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 32.0),
      leading: Icon(
        isPlaying ? Icons.play_circle_filled : Icons.play_circle_outline,
        color: isPlaying ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(stream.title.isNotEmpty ? stream.title : 'Stream'),
      subtitle: stream.quality != null || stream.label != null
          ? Text(
              [
                stream.quality,
                stream.label,
              ].where((e) => e != null).join(' · '),
            )
          : null,
      selected: isPlaying,
      onTap: () {
        ref.read(playerStateProvider.notifier).playStream(stream, channel);
        onPlayStream?.call();
      },
    );
  }
}
