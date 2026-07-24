import 'package:drift/drift.dart' as drift;
import 'package:sycorax_cressida/data/database/database.dart' as db;
import 'package:sycorax_cressida/data/models/channel_stream.dart' as domain;

class StreamDao {
  final db.AppDatabase _db;
  StreamDao(this._db);

  Future<List<domain.ChannelStream>> getStreams(String? feedId) async {
    if (feedId == null) return [];
    final rows = await (_db.select(
      _db.streams,
    )..where((t) => t.feedId.equals(feedId))).get();
    return rows.map(_mapRow).toList();
  }

  Future<List<domain.ChannelStream>> getStreamsByChannel(
    String channelId,
  ) async {
    final rows = await (_db.select(
      _db.streams,
    )..where((t) => t.channelId.equals(channelId))).get();
    return rows.map(_mapRow).toList();
  }

  Future<void> upsertStreams(List<domain.ChannelStream> streams) async {
    await _db.delete(_db.streams).go();
    await _db.batch((batch) {
      for (final s in streams) {
        batch.insert(
          _db.streams,
          db.StreamsCompanion.insert(
            channelId: s.channelId,
            feedId: drift.Value(s.feedId),
            title: s.title,
            url: s.url,
            referrer: drift.Value(s.referrer),
            userAgent: drift.Value(s.userAgent),
            quality: drift.Value(s.quality),
            label: drift.Value(s.label),
            status: drift.Value(s.status),
          ),
        );
      }
    });
  }

  domain.ChannelStream _mapRow(db.Stream r) => domain.ChannelStream(
    channelId: r.channelId,
    feedId: r.feedId,
    url: r.url,
    title: r.title,
    quality: r.quality,
    label: r.label,
    referrer: r.referrer,
    userAgent: r.userAgent,
    status: r.status,
  );
}
