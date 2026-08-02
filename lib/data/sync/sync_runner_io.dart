import 'dart:io';
import 'dart:isolate';

import 'package:drift/native.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/database/executor_io.dart';
import 'package:sycorax_cressida/data/database/sqlite_setup.dart';
import 'package:sycorax_cressida/data/sync/sync_runner_common.dart';

class SyncRunner {
  Future<void> runInBackground(int now) async {
    final dbPath = await resolveDbPath();
    await Isolate.run(() => runSync(dbPath, now));
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
