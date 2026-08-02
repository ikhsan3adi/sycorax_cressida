import 'package:sycorax_cressida/data/api/mapper_common.dart';

/// Web has no isolate-backed parsing; DB writes already run in the
/// drift_worker Web Worker, so only this decode stays on the main thread.
Future<List<T>> mapListInIsolate<T>(
  String json,
  T Function(Map<String, dynamic>) fromJson,
) async {
  return mapJsonList(json, fromJson);
}
