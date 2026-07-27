import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sycorax_cressida/core/constants.dart';

Future<QueryExecutor> createExecutor() async {
  final result = await WasmDatabase.open(
    databaseName: Constants.dbName,
    sqlite3Uri: Uri.parse('sqlite3.wasm'),
    driftWorkerUri: Uri.parse('drift_worker.dart.js'),
  );
  return result.resolvedExecutor;
}
