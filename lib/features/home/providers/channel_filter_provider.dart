import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/providers.dart';

final searchQueryProvider = NotifierProvider<SearchQuery, String>(
  SearchQuery.new,
);

final selectedCategoryProvider =
    AsyncNotifierProvider<SelectedCategory, String?>(SelectedCategory.new);

final selectedCountryProvider = AsyncNotifierProvider<SelectedCountry, String?>(
  SelectedCountry.new,
);

final selectedLanguageProvider =
    AsyncNotifierProvider<SelectedLanguage, String?>(SelectedLanguage.new);

class SelectedCategory extends AsyncNotifier<String?> {
  static const _key = 'selected_category';

  @override
  FutureOr<String?> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_key);
  }

  void set(String? value) {
    state = AsyncValue.data(value);
    final prefs = ref.read(sharedPreferencesProvider);
    if (value == null) {
      prefs.remove(_key);
    } else {
      prefs.setString(_key, value);
    }
  }
}

class SelectedCountry extends AsyncNotifier<String?> {
  static const _key = 'selected_country';

  @override
  FutureOr<String?> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_key);
  }

  void set(String? value) {
    state = AsyncValue.data(value);
    final prefs = ref.read(sharedPreferencesProvider);
    if (value == null) {
      prefs.remove(_key);
    } else {
      prefs.setString(_key, value);
    }
  }
}

class SelectedLanguage extends AsyncNotifier<String?> {
  static const _key = 'selected_language';

  @override
  FutureOr<String?> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_key);
  }

  void set(String? value) {
    state = AsyncValue.data(value);
    final prefs = ref.read(sharedPreferencesProvider);
    if (value == null) {
      prefs.remove(_key);
    } else {
      prefs.setString(_key, value);
    }
  }
}

class SearchQuery extends Notifier<String> {
  @override
  String build() => '';
  void update(String value) => state = value;
}
