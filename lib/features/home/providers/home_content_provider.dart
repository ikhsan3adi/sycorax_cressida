import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/channel.dart';

final homeContentProvider =
    NotifierProvider<HomeContentNotifier, HomeContentState>(
      HomeContentNotifier.new,
    );

class HomeContentNotifier extends Notifier<HomeContentState> {
  @override
  HomeContentState build() => const HomeContentState();

  void setBrowseMode() {
    state = const HomeContentState(mode: HomeContentMode.browse);
  }

  void setStreamsMode({
    required Channel channel,
    required String feedId,
    required String feedName,
  }) {
    state = HomeContentState(
      mode: HomeContentMode.streams,
      channel: channel,
      selectedFeedId: feedId,
      selectedFeedName: feedName,
    );
  }
}

enum HomeContentMode { browse, streams }

class HomeContentState {
  final HomeContentMode mode;
  final Channel? channel;
  final String? selectedFeedId;
  final String? selectedFeedName;

  const HomeContentState({
    this.mode = HomeContentMode.browse,
    this.channel,
    this.selectedFeedId,
    this.selectedFeedName,
  });

  HomeContentState copyWith({
    HomeContentMode? mode,
    Channel? channel,
    String? selectedFeedId,
    String? selectedFeedName,
  }) {
    return HomeContentState(
      mode: mode ?? this.mode,
      channel: channel ?? this.channel,
      selectedFeedId: selectedFeedId ?? this.selectedFeedId,
      selectedFeedName: selectedFeedName ?? this.selectedFeedName,
    );
  }
}

class _IsPlayerMinimized extends Notifier<bool> {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

final isPlayerMinimizedProvider = NotifierProvider<_IsPlayerMinimized, bool>(
  _IsPlayerMinimized.new,
);

class _IsPlaceholderClosed extends Notifier<bool> {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

final isPlaceholderClosedProvider =
    NotifierProvider<_IsPlaceholderClosed, bool>(_IsPlaceholderClosed.new);
