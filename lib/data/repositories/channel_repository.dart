import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/data/sync/sync_service.dart';

class ChannelRepository {
  final ChannelDao _channelDao;
  final FeedDao _feedDao;
  final StreamDao _streamDao;
  final LookupDao _lookupDao;
  final SyncService _sync;

  ChannelRepository(
    this._channelDao,
    this._feedDao,
    this._streamDao,
    this._lookupDao,
    this._sync,
  );

  Future<List<Channel>> getChannels({
    String? country,
    String? category,
    String? search,
    bool hideEmptyStreams = false,
    bool hideNsfw = false,
    String? language,
    int limit = Constants.pageLimit,
    int offset = 0,
  }) async {
    await _sync.syncIfNeeded();
    return _channelDao.getChannels(
      country: country,
      category: category,
      search: search,
      hideEmptyStreams: hideEmptyStreams,
      hideNsfw: hideNsfw,
      language: language,
      limit: limit,
      offset: offset,
    );
  }

  Future<List<ChannelFeed>> getFeeds(String channelId) async {
    await _sync.syncIfNeeded();
    return _feedDao.getFeeds(channelId);
  }

  Future<List<ChannelStream>> getStreams(String feedId) async {
    await _sync.syncIfNeeded();
    return _streamDao.getStreams(feedId);
  }

  Future<List<ChannelStream>> getStreamsByChannel(String channelId) async {
    await _sync.syncIfNeeded();
    return _streamDao.getStreamsByChannel(channelId);
  }

  Future<Channel?> getChannel(String id) async {
    await _sync.syncIfNeeded();
    return _channelDao.getChannel(id);
  }

  Future<List<Category>> getCategories() async {
    await _sync.syncIfNeeded();
    return _lookupDao.getCategories();
  }

  Future<List<Country>> getCountries() async {
    await _sync.syncIfNeeded();
    return _lookupDao.getCountries();
  }

  Future<List<Language>> getLanguages() async {
    await _sync.syncIfNeeded();
    return _lookupDao.getLanguages();
  }
}
