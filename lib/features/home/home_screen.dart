import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:sycorax_cressida/features/home/providers.dart';
import 'package:sycorax_cressida/features/home/widgets/category_filter.dart';
import 'package:sycorax_cressida/features/home/widgets/channel_list.dart';
import 'package:sycorax_cressida/features/home/widgets/player_placeholder.dart';
import 'package:sycorax_cressida/features/home/widgets/stream_list_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final Player _player;
  late final VideoController _controller;
  final _searchController = TextEditingController();
  Timer? _debounce;
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
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(playerStateProvider);
    final homeState = ref.watch(homeContentProvider);

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: playerState.currentStream == null
              ? const PlayerPlaceholder()
              : Video(controller: _controller, controls: MaterialVideoControls),
        ),
        Expanded(
          child: homeState.mode == HomeContentMode.browse
              ? _buildBrowseMode()
              : const StreamListView(),
        ),
      ],
    );
  }

  Widget _buildBrowseMode() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search channels...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(searchQueryProvider.notifier).update('');
                        ref.read(channelListProvider.notifier).refresh();
                        setState(() {});
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
            onChanged: (value) {
              _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 300), () {
                ref.read(searchQueryProvider.notifier).update(value);
                ref.read(channelListProvider.notifier).refresh();
              });
              setState(() {});
            },
          ),
        ),
        const CategoryFilter(),
        const Expanded(child: ChannelList()),
      ],
    );
  }
}
