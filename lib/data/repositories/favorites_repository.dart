import 'package:sycorax_cressida/data/database/daos/favorite_dao.dart';
import 'package:sycorax_cressida/data/models/channel.dart';

class FavoritesRepository {
  final FavoriteDao _favoriteDao;

  FavoritesRepository(this._favoriteDao);

  Future<List<Channel>> getFavorites() => _favoriteDao.getFavorites();

  Future<bool> isFavorite(String channelId) =>
      _favoriteDao.isFavorite(channelId);

  Future<void> toggleFavorite(String channelId) =>
      _favoriteDao.toggleFavorite(channelId);
}
