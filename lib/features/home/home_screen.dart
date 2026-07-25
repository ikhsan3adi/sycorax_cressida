import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart' hide PlayerState;
import 'package:media_kit_video/media_kit_video.dart';
import 'package:sycorax_cressida/features/home/providers/home_content_provider.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/features/home/widgets/widgets.dart';
import 'package:sycorax_cressida/shared/widgets/channel_logo.dart';

class _IsPlayerMinimized extends Notifier<bool> {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

final isPlayerMinimizedProvider = NotifierProvider<_IsPlayerMinimized, bool>(
  _IsPlayerMinimized.new,
);

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
          const AspectRatio(aspectRatio: 16 / 9, child: PlayerPlaceholder())
        else if (isMinimized)
          _buildMiniPlayer(playerState)
        else ...[
          _buildFullPlayer(),
          _buildPlayerControls(),
        ],
        const CategoryFilter(),
        Expanded(
          child: homeState.mode == HomeContentMode.browse
              ? const ChannelList()
              : const StreamListView(),
        ),
      ],
    );
  }

  Widget _buildMiniPlayer(PlayerState playerState) {
    final theme = Theme.of(context);
    final channel = playerState.channel;
    final stream = playerState.currentStream;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          tileColor: theme.colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: ChannelLogoImage(imageUrl: channel?.logoUrl),
          title: Text(
            channel?.name ?? 'Playing',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            [
              stream?.title,
              stream?.quality,
            ].where((e) => e != null).join(' · '),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => ref.read(isPlayerMinimizedProvider.notifier).set(false),
          trailing: Badge(
            backgroundColor: theme.colorScheme.tertiaryContainer,
            label: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.radio_button_checked,
                    color: theme.colorScheme.onTertiaryContainer,
                    size: 14,
                  ),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullPlayer() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Video(controller: _controller, controls: MaterialVideoControls),
    );
  }

  Widget _buildPlayerControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.remove),
              label: const Text('Minimize Player'),
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
        ],
      ),
    );
  }
}
