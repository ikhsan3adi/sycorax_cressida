import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/database/daos/channel_dao.dart';
import 'package:sycorax_cressida/data/database/daos/feed_dao.dart';
import 'package:sycorax_cressida/data/database/daos/stream_dao.dart';
import 'package:sycorax_cressida/data/database/daos/lookup_dao.dart';
import 'package:sycorax_cressida/data/database/daos/favorite_dao.dart';
import 'package:sycorax_cressida/data/repositories/channel_repository.dart';
import 'package:sycorax_cressida/data/repositories/favorites_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw StateError('SharedPreferences not set. Override in main()');
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw StateError('AppDatabase not set. Override in main()');
});

final iptvClientProvider = Provider<IptvClient>((ref) => IptvClient());

final _channelDaoProvider = Provider<ChannelDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return ChannelDao(db);
});

final _feedDaoProvider = Provider<FeedDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return FeedDao(db);
});

final _streamDaoProvider = Provider<StreamDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return StreamDao(db);
});

final _lookupDaoProvider = Provider<LookupDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return LookupDao(db);
});

final _favoriteDaoProvider = Provider<FavoriteDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return FavoriteDao(db, ref.watch(_channelDaoProvider));
});

final channelRepositoryProvider = Provider<ChannelRepository>((ref) {
  final client = ref.watch(iptvClientProvider);
  final channelDao = ref.watch(_channelDaoProvider);
  final feedDao = ref.watch(_feedDaoProvider);
  final streamDao = ref.watch(_streamDaoProvider);
  final lookupDao = ref.watch(_lookupDaoProvider);
  return ChannelRepository(client, channelDao, feedDao, streamDao, lookupDao);
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository(ref.watch(_favoriteDaoProvider));
});
