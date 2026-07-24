import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/data/models/category.dart';
import 'package:sycorax_cressida/data/models/channel.dart';
import 'package:sycorax_cressida/data/models/country.dart';
import 'package:sycorax_cressida/data/models/language.dart';
import 'package:sycorax_cressida/features/home/providers/channel_filter_provider.dart';

final channelListProvider =
    NotifierProvider<ChannelListNotifier, ChannelListState>(
      ChannelListNotifier.new,
    );

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
        limit: Constants.pageLimit,
        offset: _page * Constants.pageLimit,
      );
      if (reset) {
        state = ChannelListState(
          channels: newChannels,
          isLoading: false,
          hasMore: newChannels.length >= Constants.pageLimit,
        );
      } else {
        state = ChannelListState(
          channels: [...state.channels, ...newChannels],
          isLoading: false,
          hasMore: newChannels.length >= Constants.pageLimit,
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
