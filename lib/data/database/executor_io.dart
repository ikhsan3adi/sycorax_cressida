import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sycorax_cressida/core/constants.dart';

Future<QueryExecutor> createExecutor() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File(p.join(dir.path, Constants.dbName));
  return NativeDatabase(file);
}
