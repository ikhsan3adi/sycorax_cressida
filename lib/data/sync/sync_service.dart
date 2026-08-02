import 'dart:developer';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/core/utils.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/sync/sync_runner.dart';

class SyncService {
  final ChannelDao _channelDao;
  final SyncRunner _runner;
  Future<void>? _syncInProgress;

  SyncService({required this._channelDao, required this._runner});

  Future<void> syncIfNeeded() async {
    final inProgress = _syncInProgress;
    if (inProgress != null) {
      await inProgress;
      return;
    }

    if (!await _isStale()) return;

    final inProgress2 = _syncInProgress;
    if (inProgress2 != null) {
      await inProgress2;
      return;
    }

    final now = Utils.nowSeconds();
    final f = _syncInBackground(now);
    _syncInProgress = f;
    try {
      await f;
    } finally {
      _syncInProgress = null;
    }
  }

  Future<bool> _isStale() async {
    final lastSync = await _channelDao.getLastSyncTime();
    if (lastSync == null) return true;
    final cutoff = Utils.nowSeconds() - Constants.cacheTtlSeconds;
    return lastSync < cutoff;
  }

  Future<void> _syncInBackground(int now) async {
    try {
      final dbPath = await _runner.resolveDbPath();
      await _runner.runInBackground(dbPath, now);
    } catch (e) {
      log('[SYNC] background sync failed: $e');
    }
  }
}
