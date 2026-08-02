import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/database/sqlite_setup.dart';

Future<String> resolveDbPath() async {
  final dir = await getApplicationDocumentsDirectory();
  return p.join(dir.path, Constants.dbName);
}

Future<QueryExecutor> createExecutor() async {
  return NativeDatabase.createInBackground(
    File(await resolveDbPath()),
    setup: configureSqlite,
  );
}
