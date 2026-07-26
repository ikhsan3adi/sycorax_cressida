import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/features/home/providers/channel_filter_provider.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';

class _IsSearchActive extends Notifier<bool> {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

final isSearchActiveProvider = NotifierProvider<_IsSearchActive, bool>(
  _IsSearchActive.new,
);

const _destinations = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.thumb_up_outlined),
    selectedIcon: Icon(Icons.thumb_up),
    label: 'Favorites',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

const _railDestinations = [
  NavigationRailDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: Text('Home'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.thumb_up_outlined),
    selectedIcon: Icon(Icons.thumb_up),
    label: Text('Favorites'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: Text('Settings'),
  ),
];

const _titles = [AppConstants.appName, 'Favorites', 'Settings'];

class ShellScaffold extends ConsumerStatefulWidget {
  const ShellScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ShellScaffold> createState() => _ShellScaffoldState();
}

class _ShellScaffoldState extends ConsumerState<ShellScaffold> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearchActive = ref.watch(isSearchActiveProvider);
    final isHome = widget.navigationShell.currentIndex == 0;
    final playerState = ref.watch(playerStateProvider);
    final isPlaying = playerState.currentStream != null;
    final isWide = MediaQuery.sizeOf(context).width >= 600;
    final isVeryWide = MediaQuery.sizeOf(context).width >= 960;

    return Scaffold(
      appBar: isHome && isSearchActive
          ? _searchAppBar()
          : _normalAppBar(
              context,
              !isPlaying && widget.navigationShell.currentIndex == 0,
            ),
      body: isWide ? _buildWideBody(isVeryWide) : widget.navigationShell,
      bottomNavigationBar: isWide ? null : _navigationBar(context),
    );
  }

  Widget _buildWideBody(bool extended) {
    return Row(
      children: [
        NavigationRail(
          extended: extended,
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (index) {
            widget.navigationShell.goBranch(
              index,
              initialLocation: index == widget.navigationShell.currentIndex,
            );
          },
          labelType: NavigationRailLabelType.none,
          destinations: _railDestinations,
        ),
        Expanded(child: widget.navigationShell),
      ],
    );
  }

  NavigationBar _navigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.navigationShell.currentIndex,
      onDestinationSelected: (index) {
        widget.navigationShell.goBranch(
          index,
          initialLocation: index == widget.navigationShell.currentIndex,
        );
      },
      destinations: _destinations,
    );
  }

  AppBar _normalAppBar(BuildContext context, bool hideTitle) {
    final index = widget.navigationShell.currentIndex;

    return AppBar(
      title: hideTitle
          ? null
          : Hero(
              tag: const Key('${AppConstants.appName}-widget'),
              child: Text(
                _titles[index],
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
      centerTitle: true,
      forceMaterialTransparency: true,
      actions: index == 0
          ? [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () =>
                    ref.read(isSearchActiveProvider.notifier).set(true),
              ),
            ]
          : null,
    );
  }

  AppBar _searchAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          _searchController.clear();
          ref.read(isSearchActiveProvider.notifier).set(false);
          ref.read(searchQueryProvider.notifier).update('');
          ref.read(channelListProvider.notifier).refresh();
        },
      ),
      title: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search channels...',
          border: InputBorder.none,
          filled: false,
        ),
        onChanged: (value) {
          _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 300), () {
            ref.read(searchQueryProvider.notifier).update(value);
            ref.read(channelListProvider.notifier).refresh();
          });
        },
      ),
      actions: [
        if (_searchController.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              ref.read(searchQueryProvider.notifier).update('');
              ref.read(channelListProvider.notifier).refresh();
            },
          ),
      ],
    );
  }
}
