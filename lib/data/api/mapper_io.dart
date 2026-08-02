import 'dart:convert';
import 'dart:isolate';

/// Decodes + maps a JSON array payload in a background isolate so large
/// iptv-org responses (100k+ rows) never block the UI isolate.
Future<List<T>> mapListInIsolate<T>(
  String json,
  T Function(Map<String, dynamic>) fromJson,
) {
  return Isolate.run(() => _mapList(json, fromJson));
}

List<T> _mapList<T>(String json, T Function(Map<String, dynamic>) fromJson) {
  final data = jsonDecode(json);
  if (data is! List) return [];
  return data
      .map((e) => e is Map<String, dynamic> ? fromJson(e) : null)
      .whereType<T>()
      .toList();
}
