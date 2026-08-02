import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/sync/sync_runner_common.dart';

class SyncRunner {
  Future<String> resolveDbPath() async => '';

  Future<void> runInBackground(String dbPath, int now) {
    return runSync(now);
  }
}

Future<void> runSync(int now) async {
  final db = await AppDatabase.create();
  try {
    await runSyncWith(db, now);
  } finally {
    await db.close();
  }
}
