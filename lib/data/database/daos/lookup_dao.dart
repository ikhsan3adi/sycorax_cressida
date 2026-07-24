import 'package:drift/drift.dart';
import 'package:sycorax_cressida/data/database/database.dart';
import 'package:sycorax_cressida/data/models/category.dart' as cat;
import 'package:sycorax_cressida/data/models/country.dart' as cnt;
import 'package:sycorax_cressida/data/models/language.dart' as lang;

class LookupDao {
  final AppDatabase _db;
  LookupDao(this._db);

  Future<List<cnt.Country>> getCountries() async {
    final rows = await _db.select(_db.countries).get();
    return rows.map(_mapCountry).toList();
  }

  Future<List<lang.Language>> getLanguages() async {
    final rows = await _db.select(_db.languages).get();
    return rows.map(_mapLanguage).toList();
  }

  Future<List<cat.Category>> getCategories() async {
    final rows = await _db.select(_db.categories).get();
    return rows.map(_mapCategory).toList();
  }

  Future<void> upsertCountries(List<cnt.Country> countries) async {
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

  Future<void> upsertLanguages(List<lang.Language> languages) async {
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

  Future<void> upsertCategories(List<cat.Category> categories) async {
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

  cnt.Country _mapCountry(Country r) => cnt.Country(
    code: r.code,
    name: r.name,
    languages: AppDatabase.parseJsonArray(r.languages),
    flag: r.flag,
  );

  lang.Language _mapLanguage(Language r) =>
      lang.Language(code: r.code, name: r.name);

  cat.Category _mapCategory(Category r) =>
      cat.Category(id: r.id, name: r.name, description: r.description);
}
