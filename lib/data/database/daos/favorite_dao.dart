import 'package:drift/drift.dart';
import 'package:sycorax_cressida/core/utils.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/database/daos/channel_dao.dart';
import 'package:sycorax_cressida/data/models/channel.dart' as domain;

class FavoriteDao {
  final AppDatabase _db;
  final ChannelDao _channelDao;
  FavoriteDao(this._db, this._channelDao);

  Future<List<domain.Channel>> getFavorites() async {
    final rows =
        await (_db.select(_db.favorites)..orderBy([
              (t) =>
                  OrderingTerm(expression: t.addedAt, mode: OrderingMode.desc),
            ]))
            .get();

    final ids = rows.map((r) => r.channelId).toList();
    if (ids.isEmpty) return [];
    final channels = await _channelDao.getChannelsByIds(ids);
    final map = {for (final ch in channels) ch.id: ch};
    return ids.map((id) => map[id]).whereType<domain.Channel>().toList();
  }

  Future<bool> isFavorite(String channelId) async {
    final row = await (_db.select(
      _db.favorites,
    )..where((t) => t.channelId.equals(channelId))).getSingleOrNull();
    return row != null;
  }

  Future<void> toggleFavorite(String channelId) async {
    final existing = await (_db.select(
      _db.favorites,
    )..where((t) => t.channelId.equals(channelId))).getSingleOrNull();

    if (existing != null) {
      await (_db.delete(
        _db.favorites,
      )..where((t) => t.channelId.equals(channelId))).go();
    } else {
      await _db
          .into(_db.favorites)
          .insert(
            FavoritesCompanion.insert(
              channelId: channelId,
              addedAt: Utils.nowSeconds(),
            ),
          );
    }
  }
}
