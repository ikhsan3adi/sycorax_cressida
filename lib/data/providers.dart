import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/repositories/channel_repository.dart';
import 'package:sycorax_cressida/data/repositories/favorites_repository.dart';
import 'package:sycorax_cressida/data/sync/sync_runner.dart';
import 'package:sycorax_cressida/data/sync/sync_service.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw StateError('SharedPreferences not set. Override in main()');
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw StateError('AppDatabase not set. Override in main()');
});

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

final syncRunnerProvider = Provider<SyncRunner>((ref) => SyncRunner());

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(
    channelDao: ref.watch(_channelDaoProvider),
    runner: ref.watch(syncRunnerProvider),
  );
});

final channelRepositoryProvider = Provider<ChannelRepository>((ref) {
  return ChannelRepository(
    ref.watch(_channelDaoProvider),
    ref.watch(_feedDaoProvider),
    ref.watch(_streamDaoProvider),
    ref.watch(_lookupDaoProvider),
    ref.watch(syncServiceProvider),
  );
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository(ref.watch(_favoriteDaoProvider));
});
