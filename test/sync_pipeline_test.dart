import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/models/models.dart' as models;
import 'package:sycorax_cressida/data/sync/sync_pipeline.dart';

class _FakeClient extends IptvClient {
  final List<models.Channel> _channels;
  final List<models.ChannelStream> _streams;
  final List<models.LogoEntry> _logos;
  final List<models.ChannelFeed> _feeds;
  final List<models.Country> _countries;
  final List<models.Language> _languages;
  final List<models.Category> _categories;

  _FakeClient({
    List<models.Channel>? channels,
    List<models.ChannelStream>? streams,
    List<models.LogoEntry>? logos,
    List<models.ChannelFeed>? feeds,
    List<models.Country>? countries,
    List<models.Language>? languages,
    List<models.Category>? categories,
  }) : _channels = channels ?? [],
       _streams = streams ?? [],
       _logos = logos ?? [],
       _feeds = feeds ?? [],
       _countries = countries ?? [],
       _languages = languages ?? [],
       _categories = categories ?? [];

  @override
  Future<List<models.Channel>> getChannels() async => _channels;
  @override
  Future<List<models.ChannelStream>> getStreams() async => _streams;
  @override
  Future<List<models.LogoEntry>> getLogos() async => _logos;
  @override
  Future<List<models.ChannelFeed>> getFeeds() async => _feeds;
  @override
  Future<List<models.Country>> getCountries() async => _countries;
  @override
  Future<List<models.Language>> getLanguages() async => _languages;
  @override
  Future<List<models.Category>> getCategories() async => _categories;
}

AppDatabase _createDb() => AppDatabase(NativeDatabase.memory());

models.Channel _ch(String id, {String? name}) =>
    models.Channel(id: id, name: name ?? 'Ch $id');

models.ChannelStream _stream(String channelId, String url) =>
    models.ChannelStream(channelId: channelId, url: url, title: url);

void main() {
  late AppDatabase db;

  setUp(() => db = _createDb());
  tearDown(() => db.close());

  SyncPipeline makePipeline(IptvClient client) => SyncPipeline(
    client: client,
    channelDao: ChannelDao(db),
    feedDao: FeedDao(db),
    streamDao: StreamDao(db),
    lookupDao: LookupDao(db),
  );

  group('upsert', () {
    test(
      'inserts all payload types and sets hasStreams + logoUrl + syncTime',
      () async {
        final client = _FakeClient(
          channels: [_ch('C1', name: 'Test Ch')],
          streams: [_stream('C1', 'http://s1'), _stream('C1', 'http://s2')],
          logos: [
            const models.LogoEntry(
              channel: 'C1',
              inUse: true,
              url: 'http://logo.png',
            ),
          ],
          feeds: [
            const models.ChannelFeed(
              id: 'F1',
              channelId: 'C1',
              name: 'Feed 1',
              isMain: true,
            ),
          ],
          countries: [const models.Country(code: 'ID', name: 'Indonesia')],
          languages: [const models.Language(code: 'id', name: 'Indonesian')],
          categories: [const models.Category(id: 'news', name: 'News')],
        );

        const now = 1000000;
        await makePipeline(client).run(now);

        final ch = await ChannelDao(db).getChannel('C1');
        expect(ch, isNotNull);
        expect(ch!.name, 'Test Ch');
        expect(ch.hasStreams, isTrue);

        final streams = await StreamDao(db).getStreamsByChannel('C1');
        expect(streams, hasLength(2));

        final feeds = await FeedDao(db).getFeeds('C1');
        expect(feeds, hasLength(1));

        final countries = await LookupDao(db).getCountries();
        expect(countries, hasLength(1));

        final languages = await LookupDao(db).getLanguages();
        expect(languages, hasLength(1));

        final categories = await LookupDao(db).getCategories();
        expect(categories, hasLength(1));

        final syncTime = await ChannelDao(db).getLastSyncTime();
        expect(syncTime, now);
      },
    );

    test('channel without streams gets hasStreams false', () async {
      final client = _FakeClient(channels: [_ch('C1')], streams: []);

      await makePipeline(client).run(100);

      final ch = await ChannelDao(db).getChannel('C1');
      expect(ch, isNotNull);
      expect(ch!.hasStreams, isFalse);
    });
  });

  group('resolvePrimaryLogos', () {
    late ChannelDao dao;

    setUp(() => dao = ChannelDao(db));

    test('inUse beats non-inUse regardless of order', () async {
      await dao.upsertChannels([_ch('C1')]);

      final logosA = [
        (channel: 'C1', inUse: false, url: 'http://old.png'),
        (channel: 'C1', inUse: true, url: 'http://new.png'),
      ];
      await dao.resolvePrimaryLogos(logosA);
      expect((await dao.getChannel('C1'))!.logoUrl, 'http://new.png');

      // Reverse source order — still picks inUse
      final logosB = [
        (channel: 'C1', inUse: true, url: 'http://new2.png'),
        (channel: 'C1', inUse: false, url: 'http://old2.png'),
      ];
      await dao.resolvePrimaryLogos(logosB);
      expect((await dao.getChannel('C1'))!.logoUrl, 'http://new2.png');
    });

    test('two inUse logos picks first in source order', () async {
      await dao.upsertChannels([_ch('C1')]);
      await dao.resolvePrimaryLogos([
        (channel: 'C1', inUse: true, url: 'http://first.png'),
        (channel: 'C1', inUse: true, url: 'http://second.png'),
      ]);
      expect((await dao.getChannel('C1'))!.logoUrl, 'http://first.png');
    });

    test('two non-inUse logos picks first in source order', () async {
      await dao.upsertChannels([_ch('C1')]);
      await dao.resolvePrimaryLogos([
        (channel: 'C1', inUse: false, url: 'http://a.png'),
        (channel: 'C1', inUse: false, url: 'http://b.png'),
      ]);
      expect((await dao.getChannel('C1'))!.logoUrl, 'http://a.png');
    });

    test('empty url is skipped', () async {
      await dao.upsertChannels([_ch('C1')]);
      await dao.resolvePrimaryLogos([
        (channel: 'C1', inUse: true, url: ''),
        (channel: 'C1', inUse: false, url: 'http://fallback.png'),
      ]);
      expect((await dao.getChannel('C1'))!.logoUrl, 'http://fallback.png');
    });

    test('no logos leaves logoUrl null', () async {
      await dao.upsertChannels([_ch('C1')]);
      await dao.resolvePrimaryLogos([]);
      expect((await dao.getChannel('C1'))!.logoUrl, isNull);
    });

    test('deterministic with shuffled input', () async {
      await dao.upsertChannels([_ch('C1')]);

      final logos = [
        (channel: 'C1', inUse: false, url: 'http://x.png'),
        (channel: 'C1', inUse: true, url: 'http://y.png'),
        (channel: 'C1', inUse: false, url: 'http://z.png'),
      ];

      final results = <String?>[];
      for (var i = 0; i < 10; i++) {
        logos.shuffle();
        await dao.resolvePrimaryLogos(logos);
        results.add((await dao.getChannel('C1'))!.logoUrl);
      }
      expect(results.every((r) => r == 'http://y.png'), isTrue);
    });
  });
}
