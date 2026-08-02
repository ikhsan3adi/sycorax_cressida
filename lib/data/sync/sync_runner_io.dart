import 'dart:io';
import 'dart:isolate';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/database/daos/daos.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/sync/sync_pipeline.dart';

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
    NativeDatabase.createInBackground(File(dbPath), setup: _sqliteSetup),
  );
  try {
    final channelDao = ChannelDao(db);
    final feedDao = FeedDao(db);
    final streamDao = StreamDao(db);
    final lookupDao = LookupDao(db);

    await SyncPipeline(
      client: IptvClient(),
      channelDao: channelDao,
      feedDao: feedDao,
      streamDao: streamDao,
      lookupDao: lookupDao,
    ).run(now);
  } finally {
    await db.close();
  }
}

void _sqliteSetup(Database raw) {
  raw.execute('PRAGMA journal_mode=WAL');
  raw.execute('PRAGMA busy_timeout=${Constants.dbBusyTimeoutMs}');
}
