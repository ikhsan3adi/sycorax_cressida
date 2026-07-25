import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/models/country.dart';
import 'package:sycorax_cressida/data/models/language.dart';
import 'package:sycorax_cressida/features/home/providers/channel_list_provider.dart';

final countryNamesProvider = Provider<Map<String, String>>((ref) {
  final countries = ref.watch(countryListProvider).value ?? const <Country>[];
  return {for (final c in countries) c.code: c.name};
});

final languageNamesProvider = Provider<Map<String, String>>((ref) {
  final languages = ref.watch(languageListProvider).value ?? const <Language>[];
  return {for (final l in languages) l.code: l.name};
});
