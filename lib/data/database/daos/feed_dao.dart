import 'package:drift/drift.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart' as domain;

class FeedDao {
  final AppDatabase _db;
  FeedDao(this._db);

  Future<List<domain.ChannelFeed>> getFeeds(String channelId) async {
    final rows = await (_db.select(
      _db.feeds,
    )..where((t) => t.channelId.equals(channelId))).get();
    return rows.map(_mapRow).toList();
  }

  Future<void> upsertFeeds(List<domain.ChannelFeed> feeds) async {
    await _db.batch((batch) {
      for (final f in feeds) {
        batch.insert(
          _db.feeds,
          FeedsCompanion.insert(
            id: f.id,
            channelId: f.channelId,
            name: f.name,
            altNames: f.altNames,
            isMain: f.isMain,
            broadcastArea: f.broadcastArea,
            timezones: f.timezones,
            languages: f.languages,
            format: Value(f.format),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  domain.ChannelFeed _mapRow(Feed r) => domain.ChannelFeed(
    id: r.id,
    channelId: r.channelId,
    name: r.name,
    altNames: r.altNames,
    isMain: r.isMain,
    broadcastArea: r.broadcastArea,
    timezones: r.timezones,
    languages: r.languages,
    format: r.format,
  );
}
