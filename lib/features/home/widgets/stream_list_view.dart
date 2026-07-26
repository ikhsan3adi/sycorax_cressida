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
                    child: StreamTile(
                      stream: stream,
                      channel: state.channel!,
                      onTap: () {
                        ref
                            .read(playerStateProvider.notifier)
                            .playStream(stream, state.channel!);
                      },
                    ),
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 16,
        children: [
          IconButton.filledTonal(
            color: theme.colorScheme.onTertiaryContainer,
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.tertiaryContainer,
            ),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.read(homeContentProvider.notifier).setBrowseMode();
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.channel?.name ?? 'Unknown Channel',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Feed: ${state.selectedFeedName ?? 'Unknown Feed'}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
