import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = NotifierProvider<SearchQuery, String>(
  SearchQuery.new,
);

final selectedCategoryProvider = NotifierProvider<SelectedCategory, String?>(
  SelectedCategory.new,
);

final selectedCountryProvider = NotifierProvider<SelectedCountry, String?>(
  SelectedCountry.new,
);

class SelectedCategory extends Notifier<String?> {
  @override
  String? build() => null;
  void update(String? value) => state = value;
}

class SelectedCountry extends Notifier<String?> {
  @override
  String? build() => null;
  void update(String? value) => state = value;
}

class SearchQuery extends Notifier<String> {
  @override
  String build() => '';
  void update(String value) => state = value;
}
