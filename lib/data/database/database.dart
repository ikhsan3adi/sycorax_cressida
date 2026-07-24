import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:sycorax_cressida/data/database/executor.dart';
import 'package:sycorax_cressida/data/database/tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Channels,
    Feeds,
    Streams,
    Countries,
    Languages,
    Categories,
    Favorites,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static Future<AppDatabase> create() async {
    final executor = await createExecutor();
    return AppDatabase(executor);
  }

  static List<String> parseJsonArray(String? json) {
    if (json == null || json.isEmpty) return [];
    return (jsonDecode(json) as List<dynamic>).cast<String>();
  }

  static String toJsonArray(List<String> list) {
    return jsonEncode(list);
  }
}
