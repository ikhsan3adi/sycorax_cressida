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
            altNames: AppDatabase.toJsonArray(f.altNames),
            isMain: f.isMain,
            broadcastArea: AppDatabase.toJsonArray(f.broadcastArea),
            timezones: AppDatabase.toJsonArray(f.timezones),
            languages: AppDatabase.toJsonArray(f.languages),
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
    altNames: AppDatabase.parseJsonArray(r.altNames),
    isMain: r.isMain,
    broadcastArea: AppDatabase.parseJsonArray(r.broadcastArea),
    timezones: AppDatabase.parseJsonArray(r.timezones),
    languages: AppDatabase.parseJsonArray(r.languages),
    format: r.format,
  );
}
