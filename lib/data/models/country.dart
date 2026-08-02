import 'package:sycorax_cressida/core/utils.dart';

class Country {
  final String code;
  final String name;
  final List<String> languages;
  final String? flag;

  const Country({
    required this.code,
    required this.name,
    this.languages = const [],
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '',
    languages: Utils.jsonStringList(json, 'languages'),
    flag: json['flag'] as String?,
  );
}
