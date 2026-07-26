import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart' hide PlayerState;
import 'package:media_kit_video/media_kit_video.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/features/home/providers/lookup_providers.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/features/home/widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final Player _player;
  late final VideoController _controller;
  ProviderSubscription? _playerSubscription;

  @override
  void initState() {
    super.initState();
    _player = Player();
    _controller = VideoController(_player);

    _playerSubscription = ref.listenManual(playerStateProvider, (
      previous,
      next,
    ) {
      if (next.currentStream != null &&
          previous?.currentStream?.url != next.currentStream?.url) {
        _player.open(Media(next.currentStream!.url));
      } else if (next.currentStream == null) {
        _player.stop();
      }
    });
  }

  @override
  void dispose() {
    _playerSubscription?.close();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(playerStateProvider);
    final homeState = ref.watch(homeContentProvider);
    final isMinimized = ref.watch(isPlayerMinimizedProvider);

    return Column(
      children: [
        if (playerState.currentStream == null)
          const SizedBox(height: 200, child: PlayerPlaceholder())
        else if (isMinimized)
          NowPlayingTile(
            playerState: playerState,
            onTap: () =>
                ref.read(isPlayerMinimizedProvider.notifier).set(false),
          )
        else ...[
          _buildFullPlayer(context),
          _PlayerControls(
            channel: playerState.channel!,
            chStream: playerState.currentStream!,
          ),
        ],
        const BrowseFilters(),
        Expanded(
          child: homeState.mode == HomeContentMode.browse
              ? const ChannelList()
              : const StreamListView(),
        ),
      ],
    );
  }

  Widget _buildFullPlayer(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Video(controller: _controller),
    );
  }
}

class _PlayerControls extends ConsumerWidget {
  const _PlayerControls({required this.channel, required this.chStream});

  final Channel channel;
  final ChannelStream chStream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.close_fullscreen),
              label: const Text('Minimize'),
              onPressed: () =>
                  ref.read(isPlayerMinimizedProvider.notifier).set(true),
            ),
          ),
          Expanded(
            child: FilledButton.tonalIcon(
              icon: const Icon(Icons.stop),
              label: const Text('Stop'),
              onPressed: () {
                ref.read(playerStateProvider.notifier).stop();
                ref.read(isPlayerMinimizedProvider.notifier).set(false);
              },
            ),
          ),
          IconButton.outlined(
            icon: const Icon(Icons.info),
            onPressed: () {
              ChannelFeed? feed;
              final feedsAsync = ref.read(channelFeedsProvider(channel.id));
              if (feedsAsync is AsyncData<List<ChannelFeed>>) {
                feed = feedsAsync.value.cast<ChannelFeed?>().firstWhere(
                  (f) => f!.id == chStream.feedId,
                  orElse: () => null,
                );
              }

              final countryNames = ref.read(countryNamesProvider);
              final languageNames = ref.read(languageNamesProvider);
              final resolvedCountry = channel.country != null
                  ? countryNames[channel.country]
                  : null;
              final resolvedLanguages = channel.languages.isNotEmpty
                  ? channel.languages.map((l) => languageNames[l] ?? l).toList()
                  : null;

              showDialog(
                context: context,
                builder: (context) => StreamDetailDialog(
                  channel: channel,
                  stream: chStream,
                  feed: feed,
                  country: resolvedCountry,
                  languages: resolvedLanguages,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
