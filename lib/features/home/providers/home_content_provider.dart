import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    required String channelId,
    required String channelName,
    required String feedId,
    required String feedName,
  }) {
    state = HomeContentState(
      mode: HomeContentMode.streams,
      selectedChannelId: channelId,
      selectedChannelName: channelName,
      selectedFeedId: feedId,
      selectedFeedName: feedName,
    );
  }
}

enum HomeContentMode { browse, streams }

class HomeContentState {
  final HomeContentMode mode;
  final String? selectedChannelId;
  final String? selectedChannelName;
  final String? selectedFeedId;
  final String? selectedFeedName;

  const HomeContentState({
    this.mode = HomeContentMode.browse,
    this.selectedChannelId,
    this.selectedChannelName,
    this.selectedFeedId,
    this.selectedFeedName,
  });

  HomeContentState copyWith({
    HomeContentMode? mode,
    String? selectedChannelId,
    String? selectedChannelName,
    String? selectedFeedId,
    String? selectedFeedName,
  }) {
    return HomeContentState(
      mode: mode ?? this.mode,
      selectedChannelId: selectedChannelId ?? this.selectedChannelId,
      selectedChannelName: selectedChannelName ?? this.selectedChannelName,
      selectedFeedId: selectedFeedId ?? this.selectedFeedId,
      selectedFeedName: selectedFeedName ?? this.selectedFeedName,
    );
  }
}
