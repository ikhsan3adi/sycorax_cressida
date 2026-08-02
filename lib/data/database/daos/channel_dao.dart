import 'package:drift/drift.dart';
import 'package:sycorax_cressida/core/utils.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/models/channel.dart' as domain;

class ChannelDao {
  final AppDatabase _db;
  ChannelDao(this._db);

  Future<List<domain.Channel>> getChannels({
    String? country,
    String? category,
    String? search,
    bool hideEmptyStreams = false,
    bool hideNsfw = false,
    String? language,
    int limit = Constants.pageLimit,
    int offset = 0,
  }) async {
    final rows =
        await (_db.select(_db.channels)
              ..where((t) {
                Expression<bool>? filter;
                if (hideEmptyStreams) {
                  filter = t.hasStreams.equals(true);
                }
                if (country != null) {
                  final match = t.country.equals(country);
                  filter = (filter != null) ? filter & match : match;
                }
                if (category != null) {
                  final escaped = category
                      .replaceAll('%', r'\%')
                      .replaceAll('_', r'\_');
                  final match = t.categories.like('%"$escaped"%');
                  filter = (filter != null) ? filter & match : match;
                }
                if (hideNsfw) {
                  final match = t.isNsfw.equals(false);
                  filter = (filter != null) ? filter & match : match;
                }
                if (language != null) {
                  final escaped = language
                      .replaceAll('%', r'\%')
                      .replaceAll('_', r'\_');
                  final match = t.languages.like('%$escaped%');
                  filter = (filter != null) ? filter & match : match;
                }
                if (search != null && search.isNotEmpty) {
                  final q = search.toLowerCase();
                  final escaped = q
                      .replaceAll('%', r'\%')
                      .replaceAll('_', r'\_');

                  final matchId = t.id.like('$escaped%');
                  final matchName = t.name.like('%$escaped%');
                  final matchAlt = t.altNames.like('%$escaped%');
                  final matchReplacedBy = t.replacedBy.like('%$escaped%');

                  final merged =
                      matchName | matchId | matchAlt | matchReplacedBy;

                  filter = (filter != null) ? filter & merged : merged;
                }
                return filter ?? const Constant(true);
              })
              ..orderBy([(t) => OrderingTerm(expression: t.name)])
              ..limit(limit, offset: offset))
            .get();
    return rows.map(_mapRow).toList();
  }

  Future<domain.Channel?> getChannel(String id) async {
    final row = await (_db.select(
      _db.channels,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row != null ? _mapRow(row) : null;
  }

  Future<void> upsertChannels(
    List<domain.Channel> channels, {
    int? syncedAt,
    Set<String>? channelIdsWithStreams,
  }) async {
    final now = syncedAt ?? Utils.nowSeconds();
    await _db.batch((batch) {
      for (final ch in channels) {
        batch.insert(
          _db.channels,
          ChannelsCompanion.insert(
            id: ch.id,
            name: ch.name,
            altNames: AppDatabase.toJsonArray(ch.altNames),
            network: Value(ch.network),
            owners: AppDatabase.toJsonArray(ch.owners),
            country: Value(ch.country),
            subdivision: Value(ch.subdivision),
            city: Value(ch.city),
            broadcastArea: AppDatabase.toJsonArray(ch.broadcastArea),
            languages: AppDatabase.toJsonArray(ch.languages),
            categories: AppDatabase.toJsonArray(ch.categories),
            isNsfw: ch.isNsfw,
            launched: Value(ch.launched),
            closed: Value(ch.closed),
            replacedBy: Value(ch.replacedBy),
            website: Value(ch.website),
            syncedAt: now,
            hasStreams: Value(channelIdsWithStreams?.contains(ch.id) ?? true),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Future<void> resolvePrimaryLogos(
    List<({String channel, bool inUse, String url})> logos,
  ) async {
    final picked = <String, ({bool inUse, String url})>{};
    for (final l in logos) {
      if (l.url.isEmpty) continue;
      final cur = picked[l.channel];
      if (cur == null || (l.inUse && !cur.inUse)) {
        picked[l.channel] = (inUse: l.inUse, url: l.url);
      }
    }
    if (picked.isEmpty) return;
    await _db.batch((batch) {
      for (final entry in picked.entries) {
        batch.update(
          _db.channels,
          ChannelsCompanion(logoUrl: Value(entry.value.url)),
          where: (t) => t.id.equals(entry.key),
        );
      }
    });
  }

  Future<List<domain.Channel>> getChannelsByIds(List<String> ids) async {
    if (ids.isEmpty) return [];
    final rows = await (_db.select(
      _db.channels,
    )..where((t) => t.id.isIn(ids))).get();
    return rows.map(_mapRow).toList();
  }

  Future<int?> getLastSyncTime() async {
    final query = _db.selectOnly(_db.channels)
      ..addColumns([_db.channels.syncedAt.max()]);
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return row.read(_db.channels.syncedAt.max());
  }

  Future<void> setSyncTime(int now) async {
    await _db
        .update(_db.channels)
        .write(ChannelsCompanion(syncedAt: Value(now)));
  }

  domain.Channel _mapRow(Channel r) => domain.Channel(
    id: r.id,
    name: r.name,
    altNames: AppDatabase.parseJsonArray(r.altNames),
    network: r.network,
    owners: AppDatabase.parseJsonArray(r.owners),
    country: r.country,
    subdivision: r.subdivision,
    city: r.city,
    broadcastArea: AppDatabase.parseJsonArray(r.broadcastArea),
    languages: AppDatabase.parseJsonArray(r.languages),
    categories: AppDatabase.parseJsonArray(r.categories),
    isNsfw: r.isNsfw,
    launched: r.launched,
    closed: r.closed,
    replacedBy: r.replacedBy,
    website: r.website,
    logoUrl: r.logoUrl,
    hasStreams: r.hasStreams,
  );
}
