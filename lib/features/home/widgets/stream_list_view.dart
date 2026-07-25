import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/shared/widgets/widgets.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';

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
    final channelName = state.selectedChannelName ?? 'Unknown Channel';

    if (feedId != null) {
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
                      .playStream(next.value!.first, channelName);
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
    final channelName = state.selectedChannelName ?? 'Unknown Channel';

    if (feedId == null) {
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
                  return _StreamTile(stream: stream, channelName: channelName);
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
                  state.selectedChannelName ?? 'Unknown Channel',
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
  final String channelName;

  const _StreamTile({required this.stream, required this.channelName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream?.url == stream.url;

    return ListTile(
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
        ref.read(playerStateProvider.notifier).playStream(stream, channelName);
      },
    );
  }
}
