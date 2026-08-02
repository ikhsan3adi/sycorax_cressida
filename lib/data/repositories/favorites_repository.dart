import 'package:sycorax_cressida/data/database/daos/channel_dao.dart';
import 'package:sycorax_cressida/data/database/daos/favorite_dao.dart';
import 'package:sycorax_cressida/data/models/channel.dart';

class FavoritesRepository {
  final FavoriteDao _favoriteDao;
  final ChannelDao _channelDao;

  FavoritesRepository(this._favoriteDao, this._channelDao);

  Future<List<Channel>> getFavorites() async {
    final ids = await _favoriteDao.getFavoriteChannelIds();
    if (ids.isEmpty) return [];
    final channels = await _channelDao.getChannelsByIds(ids);
    final map = {for (final ch in channels) ch.id: ch};
    return ids.map((id) => map[id]).whereType<Channel>().toList();
  }

  Future<bool> isFavorite(String channelId) =>
      _favoriteDao.isFavorite(channelId);

  Future<void> toggleFavorite(String channelId) =>
      _favoriteDao.toggleFavorite(channelId);
}
