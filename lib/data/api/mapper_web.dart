import 'dart:convert';

/// Web has no isolate-backed parsing; DB writes already run in the
/// drift_worker Web Worker, so only this decode stays on the main thread.
Future<List<T>> mapListInIsolate<T>(
  String json,
  T Function(Map<String, dynamic>) fromJson,
) async {
  final data = jsonDecode(json);
  if (data is! List) return [];
  return data
      .map((e) => e is Map<String, dynamic> ? fromJson(e) : null)
      .whereType<T>()
      .toList();
}
