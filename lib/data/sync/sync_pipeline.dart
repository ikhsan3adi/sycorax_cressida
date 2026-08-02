import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';

class SyncPipeline {
  final IptvClient _client;
  final ChannelDao _channelDao;
  final FeedDao _feedDao;
  final StreamDao _streamDao;
  final LookupDao _lookupDao;

  SyncPipeline({
    required this._client,
    required this._channelDao,
    required this._feedDao,
    required this._streamDao,
    required this._lookupDao,
  });

  Future<void> run(int now) async {
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

    await _channelDao.upsertChannels(
      channels,
      syncedAt: now,
      channelIdsWithStreams: {for (final s in streams) s.channelId},
    );

    final logoTuples = logos
        .map((l) => (channel: l.channel, inUse: l.inUse, url: l.url))
        .toList();
    await _channelDao.resolvePrimaryLogos(logoTuples);

    await _feedDao.upsertFeeds(feeds);
    await _streamDao.upsertStreams(streams);
    await _lookupDao.upsertCountries(countries);
    await _lookupDao.upsertLanguages(languages);
    await _lookupDao.upsertCategories(categories);
  }
}
