import 'dart:isolate';
import 'package:sycorax_cressida/data/api/mapper_common.dart';

/// Decodes + maps a JSON array payload in a background isolate so large
/// iptv-org responses (100k+ rows) never block the UI isolate.
Future<List<T>> mapListInIsolate<T>(
  String json,
  T Function(Map<String, dynamic>) fromJson,
) {
  return Isolate.run(() => mapJsonList(json, fromJson));
}
