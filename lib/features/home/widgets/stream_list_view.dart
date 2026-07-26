import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/shared/widgets/widgets.dart';

class StreamListView extends ConsumerStatefulWidget {
  const StreamListView({super.key});

  @override
  ConsumerState<StreamListView> createState() => _StreamListViewState();
}

class _StreamListViewState extends ConsumerState<StreamListView> {
  ProviderSubscription? _streamsSub;

  @override
  void initState() {
    super.initState();
    final state = ref.read(homeContentProvider);
    final feedId = state.selectedFeedId;

    if (feedId != null && state.channel != null) {
      _streamsSub = ref.listenManual<AsyncValue<List<ChannelStream>>>(
        feedStreamsProvider(feedId),
        (previous, next) {
          if (!next.isLoading && next.hasValue && next.value!.isNotEmpty) {
            final wasEmpty =
                previous == null ||
                previous.isLoading ||
                (previous.hasValue && previous.value!.isEmpty);
            if (wasEmpty) {
              Future(() {
                if (mounted) {
                  ref
                      .read(playerStateProvider.notifier)
                      .playStream(next.value!.first, state.channel!);
                }
              });
            }
          }
        },
        fireImmediately: true,
      );
    }
  }

  @override
  void dispose() {
    _streamsSub?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeContentProvider);
    final feedId = state.selectedFeedId;

    if (feedId == null || state.channel == null) {
      return const Center(child: Text('No feed selected'));
    }

    final streamsAsync = ref.watch(feedStreamsProvider(feedId));

    return Column(
      children: [
        _buildHeader(context, state),
        Expanded(
          child: streamsAsync.when(
            data: (streams) {
              if (streams.isEmpty) {
                return const Center(child: Text('No streams available'));
              }

              return ListView.builder(
                itemCount: streams.length,
                itemBuilder: (context, index) {
                  final stream = streams[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    child: _StreamTile(stream: stream, channel: state.channel!),
                  );
                },
              );
            },
            loading: () => const LoadingWidget(message: 'Loading streams...'),
            error: (e, _) => Center(child: Text('Failed to load streams: $e')),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, HomeContentState state) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.read(homeContentProvider.notifier).setBrowseMode();
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.channel?.name ?? 'Unknown Channel',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  state.selectedFeedName ?? 'Unknown Feed',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StreamTile extends ConsumerWidget {
  final ChannelStream stream;
  final Channel channel;

  const _StreamTile({required this.stream, required this.channel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream?.url == stream.url;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: isPlaying
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surfaceContainer,
        child: ListTile(
          key: Key('${channel.id}-${stream.url}'),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          leading: CircleAvatar(
            backgroundColor: isPlaying
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.surfaceContainerHigh,
            foregroundColor: isPlaying
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onSurface,
            child: Icon(isPlaying ? Icons.stream : Icons.live_tv),
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
          onTap: () {
            ref.read(playerStateProvider.notifier).playStream(stream, channel);
          },
        ),
      ),
    );
  }
}
