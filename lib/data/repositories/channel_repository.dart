import 'package:sycorax_cressida/core/utils.dart';
import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/database/daos/channel_dao.dart';
import 'package:sycorax_cressida/data/database/daos/feed_dao.dart';
import 'package:sycorax_cressida/data/database/daos/stream_dao.dart';
import 'package:sycorax_cressida/data/database/daos/lookup_dao.dart';
import 'package:sycorax_cressida/data/models/channel.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';
import 'package:sycorax_cressida/data/models/category.dart';
import 'package:sycorax_cressida/data/models/country.dart';
import 'package:sycorax_cressida/data/models/language.dart';

class ChannelRepository {
  final IptvClient _client;
  final ChannelDao _channelDao;
  final FeedDao _feedDao;
  final StreamDao _streamDao;
  final LookupDao _lookupDao;
  Future<void>? _syncInProgress;

  ChannelRepository(
    this._client,
    this._channelDao,
    this._feedDao,
    this._streamDao,
    this._lookupDao,
  );

  Future<List<Channel>> getChannels({
    String? country,
    String? category,
    String? search,
    int limit = Constants.pageLimit,
    int offset = 0,
  }) async {
    await _maybeSync();
    return _channelDao.getChannels(
      country: country,
      category: category,
      search: search,
      limit: limit,
      offset: offset,
    );
  }

  Future<List<ChannelFeed>> getFeeds(String channelId) async {
    await _maybeSync();
    return _feedDao.getFeeds(channelId);
  }

  Future<List<ChannelStream>> getStreams(String feedId) async {
    await _maybeSync();
    return _streamDao.getStreams(feedId);
  }

  Future<List<ChannelStream>> getStreamsByChannel(String channelId) async {
    await _maybeSync();
    return _streamDao.getStreamsByChannel(channelId);
  }

  Future<Channel?> getChannel(String id) async {
    await _maybeSync();
    return _channelDao.getChannel(id);
  }

  Future<List<Category>> getCategories() async {
    await _maybeSync();
    return _lookupDao.getCategories();
  }

  Future<List<Country>> getCountries() async {
    await _maybeSync();
    return _lookupDao.getCountries();
  }

  Future<List<Language>> getLanguages() async {
    await _maybeSync();
    return _lookupDao.getLanguages();
  }

  Future<void> _maybeSync() async {
    if (_syncInProgress != null) {
      await _syncInProgress;
      return;
    }
    final stale = await _isStale();
    if (!stale) return;

    _syncInProgress = _syncAll(Utils.nowSeconds());
    try {
      await _syncInProgress;
    } finally {
      _syncInProgress = null;
    }
  }

  Future<bool> _isStale() async {
    final lastSync = await _channelDao.getLastSyncTime();
    if (lastSync == null) return true;
    final cutoff = Utils.nowSeconds() - Constants.cacheTtlSeconds;
    return lastSync < cutoff;
  }

  Future<void> _syncAll(int now) async {
    final channelsF = _client.getChannels();
    final feedsF = _client.getFeeds();
    final logosF = _client.getLogos();
    final streamsF = _client.getStreams();
    final countriesF = _client.getCountries();
    final languagesF = _client.getLanguages();
    final categoriesF = _client.getCategories();

    await Future.wait([
      channelsF,
      feedsF,
      logosF,
      streamsF,
      countriesF,
      languagesF,
      categoriesF,
    ]);

    final channels = await channelsF;
    final feeds = await feedsF;
    final logos = await logosF;
    final streams = await streamsF;
    final countries = await countriesF;
    final languages = await languagesF;
    final categories = await categoriesF;

    await _channelDao.upsertChannels(channels, syncedAt: now);

    final logoTuples = logos
        .map((l) => (channel: l.channel, inUse: l.inUse, url: l.url))
        .toList();
    await _channelDao.resolvePrimaryLogos(logoTuples);

    await _feedDao.upsertFeeds(feeds);
    await _streamDao.upsertStreams(streams);
    await _lookupDao.upsertCountries(countries);
    await _lookupDao.upsertLanguages(languages);
    await _lookupDao.upsertCategories(categories);

    await _channelDao.setSyncTime(now);
  }
}
