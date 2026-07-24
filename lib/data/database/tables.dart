import 'package:drift/drift.dart';

class Channels extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get altNames => text()();
  TextColumn get network => text().nullable()();
  TextColumn get owners => text()();
  TextColumn get country => text().nullable()();
  TextColumn get subdivision => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get broadcastArea => text()();
  TextColumn get languages => text()();
  TextColumn get categories => text()();
  BoolColumn get isNsfw => boolean()();
  TextColumn get launched => text().nullable()();
  TextColumn get closed => text().nullable()();
  TextColumn get replacedBy => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get logoUrl => text().nullable()();
  IntColumn get syncedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class Feeds extends Table {
  TextColumn get id => text()();
  TextColumn get channelId => text()();
  TextColumn get name => text()();
  TextColumn get altNames => text()();
  BoolColumn get isMain => boolean()();
  TextColumn get broadcastArea => text()();
  TextColumn get timezones => text()();
  TextColumn get languages => text()();
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
  TextColumn get languages => text()();
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
