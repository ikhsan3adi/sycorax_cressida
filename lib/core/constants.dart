class Constants {
  static const String dbName = 'sycorax_cressida.sqlite';

  static const int cacheTtlSeconds = 24 * 60 * 60;

  static const int pageLimit = 50;
  static const int dbBusyTimeoutMs = 5000;
  static const double scrollThreshold = 200;
}

class AppConstants {
  static const String iptvApiBaseUrl = 'https://iptv-org.github.io/api';
  static const String appName = 'Sycorax Cressida';
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '0.0.0',
  );
  static const String githubRepoUrl = String.fromEnvironment(
    'GITHUB_REPO_URL',
    defaultValue: 'https://github.com/ikhsan3adi/sycorax_cressida',
  );
  static const String commitHash = String.fromEnvironment(
    'COMMIT_HASH',
    defaultValue: '',
  );
}
