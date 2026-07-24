class AppConstants {
  static const String iptvApiBaseUrl = 'https://iptv-org.github.io/api';
  static const String appName = 'Sycorax Cressida';
  static const String dbName = 'sycorax_cressida.sqlite';

  static const int pageLimit = 50;
  static const int syncDebounceSeconds = 60;
  static const int cacheTtlSeconds = 24 * 60 * 60;
  static const double scrollThreshold = 200;

  static int nowSeconds() => DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
