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
    try {
      await _run(force: false);
    } catch (e) {
      log('[SYNC] background sync failed: $e');
    }
  }

  Future<void> syncNow() => _run(force: true);

  Future<void> _run({required bool force}) async {
    final inProgress = _syncInProgress;
    if (inProgress != null) {
      await inProgress;
      return;
    }

    if (!force && !await _isStale()) return;

    final inProgress2 = _syncInProgress;
    if (inProgress2 != null) {
      await inProgress2;
      return;
    }

    final f = _runner.runInBackground(Utils.nowSeconds());
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
}
