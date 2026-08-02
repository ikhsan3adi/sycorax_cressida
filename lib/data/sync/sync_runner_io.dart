import 'dart:io';
import 'dart:isolate';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/database/sqlite_setup.dart';
import 'package:sycorax_cressida/data/sync/sync_runner_common.dart';

class SyncRunner {
  Future<String> resolveDbPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/${Constants.dbName}').path;
  }

  Future<void> runInBackground(String dbPath, int now) {
    return Isolate.run(() => runSync(dbPath, now));
  }
}

Future<void> runSync(String dbPath, int now) async {
  final db = AppDatabase(
    NativeDatabase.createInBackground(File(dbPath), setup: configureSqlite),
  );
  try {
    await runSyncWith(db, now);
  } finally {
    await db.close();
  }
}
