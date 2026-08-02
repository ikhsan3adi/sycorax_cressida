import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sycorax_cressida/core/utils.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/models/models.dart' as models;
import 'package:sycorax_cressida/data/sync/sync_runner_io.dart';
import 'package:sycorax_cressida/data/sync/sync_service.dart';

class _FakeSyncRunner extends SyncRunner {
  int runCount = 0;
  int? lastNow;

  @override
  Future<void> runInBackground(int now) async {
    await Future<void>.delayed(Duration.zero);
    runCount++;
    lastNow = now;
  }
}

AppDatabase _createDb() => AppDatabase(NativeDatabase.memory());

void main() {
  late AppDatabase db;
  late ChannelDao channelDao;
  late _FakeSyncRunner runner;
  late SyncService service;

  setUp(() {
    db = _createDb();
    channelDao = ChannelDao(db);
    runner = _FakeSyncRunner();
    service = SyncService(channelDao: channelDao, runner: runner);
  });

  tearDown(() => db.close());

  group('syncIfNeeded', () {
    test('runs sync when DB is empty (first launch)', () async {
      await service.syncIfNeeded();
      expect(runner.runCount, 1);
    });

    test('skips sync when data is fresh', () async {
      await channelDao.upsertChannels([
        const models.Channel(id: 'C1', name: 'Test'),
      ]);
      await channelDao.setSyncTime(Utils.nowSeconds());

      await service.syncIfNeeded();
      expect(runner.runCount, 0);
    });

    test('runs sync when data is stale', () async {
      await channelDao.upsertChannels([
        const models.Channel(id: 'C1', name: 'Test'),
      ]);
      await channelDao.setSyncTime(Utils.nowSeconds() - 25 * 60 * 60);

      await service.syncIfNeeded();
      expect(runner.runCount, 1);
    });

    test('concurrent calls share the same future', () async {
      final calls = [
        service.syncIfNeeded(),
        service.syncIfNeeded(),
        service.syncIfNeeded(),
      ];
      await Future.wait(calls);
      expect(runner.runCount, 1);
    });
  });
}
