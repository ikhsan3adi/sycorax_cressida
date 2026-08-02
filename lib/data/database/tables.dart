import 'package:drift/drift.dart';
import 'package:sycorax_cressida/data/database/type_converters.dart';

class Channels extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get altNames => text().map(stringListConverter)();
  TextColumn get network => text().nullable()();
  TextColumn get owners => text().map(stringListConverter)();
  TextColumn get country => text().nullable()();
  TextColumn get subdivision => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get broadcastArea => text().map(stringListConverter)();
  TextColumn get languages => text().map(stringListConverter)();
  TextColumn get categories => text().map(stringListConverter)();
  BoolColumn get isNsfw => boolean()();
  TextColumn get launched => text().nullable()();
  TextColumn get closed => text().nullable()();
  TextColumn get replacedBy => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get logoUrl => text().nullable()();
  IntColumn get syncedAt => integer()();
  BoolColumn get hasStreams => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

class Feeds extends Table {
  TextColumn get id => text()();
  TextColumn get channelId => text()();
  TextColumn get name => text()();
  TextColumn get altNames => text().map(stringListConverter)();
  BoolColumn get isMain => boolean()();
  TextColumn get broadcastArea => text().map(stringListConverter)();
  TextColumn get timezones => text().map(stringListConverter)();
  TextColumn get languages => text().map(stringListConverter)();
  TextColumn get format => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Streams extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get channelId => text()();
  TextColumn get feedId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get url => text()();
  TextColumn get referrer => text().nullable()();
  TextColumn get userAgent => text().nullable()();
  TextColumn get quality => text().nullable()();
  TextColumn get label => text().nullable()();
  TextColumn get status => text().nullable()();
}

class Countries extends Table {
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get languages => text().map(stringListConverter)();
  TextColumn get flag => text().nullable()();

  @override
  Set<Column> get primaryKey => {code};
}

class Languages extends Table {
  TextColumn get code => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {code};
}

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Favorites extends Table {
  TextColumn get channelId => text()();
  IntColumn get addedAt => integer()();

  @override
  Set<Column> get primaryKey => {channelId};
}
