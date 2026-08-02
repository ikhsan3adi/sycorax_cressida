import 'package:drift/drift.dart';
import 'package:sycorax_cressida/core/utils.dart';
import 'package:sycorax_cressida/data/database/database.dart';

class FavoriteDao {
  final AppDatabase _db;
  FavoriteDao(this._db);

  Future<List<String>> getFavoriteChannelIds() async {
    final rows =
        await (_db.select(_db.favorites)..orderBy([
              (t) =>
                  OrderingTerm(expression: t.addedAt, mode: OrderingMode.desc),
            ]))
            .get();
    return rows.map((r) => r.channelId).toList();
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
