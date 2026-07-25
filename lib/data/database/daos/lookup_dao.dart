import 'package:drift/drift.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/models/models.dart' as domain;

class LookupDao {
  final AppDatabase _db;
  LookupDao(this._db);

  Future<List<domain.Country>> getCountries() async {
    final rows = await _db.select(_db.countries).get();
    return rows.map(_mapCountry).toList();
  }

  Future<List<domain.Language>> getLanguages() async {
    final rows = await (_db.select(
      _db.languages,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
    return rows.map(_mapLanguage).toList();
  }

  Future<List<domain.Category>> getCategories() async {
    final rows = await (_db.select(
      _db.categories,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
    return rows.map(_mapCategory).toList();
  }

  Future<void> upsertCountries(List<domain.Country> countries) async {
    await _db.batch((batch) {
      for (final c in countries) {
        batch.insert(
          _db.countries,
          CountriesCompanion.insert(
            code: c.code,
            name: c.name,
            languages: AppDatabase.toJsonArray(c.languages),
            flag: Value(c.flag),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Future<void> upsertLanguages(List<domain.Language> languages) async {
    await _db.batch((batch) {
      for (final l in languages) {
        batch.insert(
          _db.languages,
          LanguagesCompanion.insert(code: l.code, name: l.name),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Future<void> upsertCategories(List<domain.Category> categories) async {
    await _db.batch((batch) {
      for (final c in categories) {
        batch.insert(
          _db.categories,
          CategoriesCompanion.insert(
            id: c.id,
            name: c.name,
            description: Value(c.description),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  domain.Country _mapCountry(Country r) => domain.Country(
    code: r.code,
    name: r.name,
    languages: AppDatabase.parseJsonArray(r.languages),
    flag: r.flag,
  );

  domain.Language _mapLanguage(Language r) =>
      domain.Language(code: r.code, name: r.name);

  domain.Category _mapCategory(Category r) =>
      domain.Category(id: r.id, name: r.name, description: r.description);
}
