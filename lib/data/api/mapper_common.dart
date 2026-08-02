import 'dart:convert';

List<T> mapJsonList<T>(String json, T Function(Map<String, dynamic>) fromJson) {
  final data = jsonDecode(json);
  if (data is! List) return [];
  return data
      .map((e) => e is Map<String, dynamic> ? fromJson(e) : null)
      .whereType<T>()
      .toList();
}
