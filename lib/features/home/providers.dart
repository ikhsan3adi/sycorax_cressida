import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/data/models/channel.dart';
import 'package:sycorax_cressida/data/models/category.dart';
import 'package:sycorax_cressida/data/models/country.dart';
import 'package:sycorax_cressida/data/models/language.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';

final categoryListProvider = FutureProvider<List<Category>>((ref) async {
  final repo = ref.watch(channelRepositoryProvider);
  return repo.getCategories();
});

final countryListProvider = FutureProvider<List<Country>>((ref) async {
  final repo = ref.watch(channelRepositoryProvider);
  return repo.getCountries();
});

final languageListProvider = FutureProvider<List<Language>>((ref) async {
  final repo = ref.watch(channelRepositoryProvider);
  return repo.getLanguages();
});

class SearchQuery extends Notifier<String> {
  @override
  String build() => '';
  void update(String value) => state = value;
}

final searchQueryProvider = NotifierProvider<SearchQuery, String>(
  SearchQuery.new,
);

class SelectedCategory extends Notifier<String?> {
  @override
  String? build() => null;
  void update(String? value) => state = value;
}

final selectedCategoryProvider = NotifierProvider<SelectedCategory, String?>(
  SelectedCategory.new,
);

class SelectedCountry extends Notifier<String?> {
  @override
  String? build() => null;
  void update(String? value) => state = value;
}

final selectedCountryProvider = NotifierProvider<SelectedCountry, String?>(
  SelectedCountry.new,
);

class ChannelListState {
  final List<Channel> channels;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const ChannelListState({
    this.channels = const [],
    this.isLoading = true,
    this.hasMore = true,
    this.error,
  });

  ChannelListState copyWith({
    List<Channel>? channels,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) => ChannelListState(
    channels: channels ?? this.channels,
    isLoading: isLoading ?? this.isLoading,
    hasMore: hasMore ?? this.hasMore,
    error: error,
  );
}

class ChannelListNotifier extends Notifier<ChannelListState> {
  int _page = 0;
  bool _initialized = false;

  @override
  ChannelListState build() => const ChannelListState();

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    await _loadPage(reset: true);
  }

  Future<void> _loadPage({bool reset = false}) async {
    if (reset) _page = 0;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(channelRepositoryProvider);
      final search = ref.read(searchQueryProvider);
      final category = ref.read(selectedCategoryProvider);
      final newChannels = await repo.getChannels(
        category: category,
        search: search.isNotEmpty ? search : null,
        limit: AppConstants.pageLimit,
        offset: _page * AppConstants.pageLimit,
      );
      if (reset) {
        state = ChannelListState(
          channels: newChannels,
          isLoading: false,
          hasMore: newChannels.length >= AppConstants.pageLimit,
        );
      } else {
        state = ChannelListState(
          channels: [...state.channels, ...newChannels],
          isLoading: false,
          hasMore: newChannels.length >= AppConstants.pageLimit,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    _page++;
    await _loadPage();
  }

  void refresh() => _loadPage(reset: true);
}

final channelListProvider =
    NotifierProvider<ChannelListNotifier, ChannelListState>(
      ChannelListNotifier.new,
    );

// --- Added for Embedded Player UX ---

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

final homeContentProvider =
    NotifierProvider<HomeContentNotifier, HomeContentState>(
      HomeContentNotifier.new,
    );

class PlayerState {
  final ChannelStream? currentStream;
  final String? channelName;

  const PlayerState({this.currentStream, this.channelName});
}

class PlayerStateNotifier extends Notifier<PlayerState> {
  @override
  PlayerState build() => const PlayerState();

  void playStream(ChannelStream stream, String channelName) {
    state = PlayerState(currentStream: stream, channelName: channelName);
  }

  void stop() {
    state = const PlayerState();
  }
}

final playerStateProvider = NotifierProvider<PlayerStateNotifier, PlayerState>(
  PlayerStateNotifier.new,
);

final channelFeedsProvider = FutureProvider.family<List<ChannelFeed>, String>((
  ref,
  channelId,
) async {
  final repo = ref.watch(channelRepositoryProvider);
  return repo.getFeeds(channelId);
});

final feedStreamsProvider = FutureProvider.family<List<ChannelStream>, String>((
  ref,
  feedId,
) async {
  final repo = ref.watch(channelRepositoryProvider);
  return repo.getStreams(feedId);
});

final channelStreamsProvider =
    FutureProvider.family<List<ChannelStream>, String>((ref, channelId) async {
      final repo = ref.watch(channelRepositoryProvider);
      return repo.getStreamsByChannel(channelId);
    });
