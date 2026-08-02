import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/sync/sync_runner_common.dart';

class SyncRunner {
  Future<void> runInBackground(int now) async {
    final db = await AppDatabase.create();
    try {
      await runSyncWith(db, now);
    } finally {
      await db.close();
    }
  }
}
