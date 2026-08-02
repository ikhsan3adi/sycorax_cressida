import 'package:drift/drift.dart';
import 'package:sycorax_cressida/data/database/executor.dart';
import 'package:sycorax_cressida/data/database/tables.dart';
import 'package:sycorax_cressida/data/database/type_converters.dart';

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

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {},
  );

  static Future<AppDatabase> create() async {
    final executor = await createExecutor();
    return AppDatabase(executor);
  }
}
