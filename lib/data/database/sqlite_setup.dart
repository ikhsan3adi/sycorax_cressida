import 'package:sqlite3/sqlite3.dart';
import 'package:sycorax_cressida/core/constants.dart';

void configureSqlite(Database db) {
  db.execute('PRAGMA journal_mode=WAL');
  db.execute('PRAGMA busy_timeout=${Constants.dbBusyTimeoutMs}');
}
