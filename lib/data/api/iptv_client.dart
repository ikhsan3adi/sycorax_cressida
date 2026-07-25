import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/data/models/models.dart';

class IptvClient {
  final Dio _dio;

  IptvClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.iptvApiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 30),
        ),
      ) {
    _dio.interceptors.addAll([
      _LogInterceptor(),
      _RetryInterceptor(maxRetries: 3),
    ]);
  }

  Future<List<Channel>> getChannels() async =>
      _getList('/channels.json', Channel.fromJson);

  Future<List<ChannelStream>> getStreams() async =>
      _getList('/streams.json', ChannelStream.fromJson);

  Future<List<LogoEntry>> getLogos() async =>
      _getList('/logos.json', LogoEntry.fromJson);

  Future<List<ChannelFeed>> getFeeds() async =>
      _getList('/feeds.json', ChannelFeed.fromJson);

  Future<List<Country>> getCountries() async =>
      _getList('/countries.json', Country.fromJson);

  Future<List<Language>> getLanguages() async =>
      _getList('/languages.json', Language.fromJson);

  Future<List<Category>> getCategories() async =>
      _getList('/categories.json', Category.fromJson);

  Future<List<T>> _getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = await _dio.get(path);
    final data = response.data;
    if (data is! List) return [];
    return data
        .map((e) => e is Map<String, dynamic> ? fromJson(e) : null)
        .whereType<T>()
        .toList();
  }
}

class _LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    log('[API] ${options.method} ${options.path}');
    h.next(options);
  }

  @override
  void onResponse(Response r, ResponseInterceptorHandler h) {
    log(
      '[API] ${r.requestOptions.method} ${r.requestOptions.path} → ${r.statusCode}',
    );
    h.next(r);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler h) {
    log(
      '[API] ${e.requestOptions.method} ${e.requestOptions.path} → ${e.response?.statusCode ?? e.type}',
    );
    h.next(e);
  }
}

class _RetryInterceptor extends Interceptor {
  final int maxRetries;
  _RetryInterceptor({this.maxRetries = 3});

  @override
  void onError(DioException e, ErrorInterceptorHandler h) async {
    if (_shouldRetry(e) && _retryCount(e.requestOptions) < maxRetries) {
      final retryCount = _retryCount(e.requestOptions) + 1;
      e.requestOptions.headers['x-retry-count'] = retryCount.toString();
      log(
        '[API] Retry $retryCount/$maxRetries ${e.requestOptions.path} after ${_delay(retryCount)}ms',
      );
      await Future.delayed(Duration(milliseconds: _delay(retryCount)));
      try {
        final r = await Dio().fetch(e.requestOptions);
        h.resolve(r);
      } catch (fallback) {
        h.next(e);
      }
    } else {
      h.next(e);
    }
  }

  bool _shouldRetry(DioException e) =>
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError ||
      (e.response != null && e.response!.statusCode! >= 500);

  int _retryCount(RequestOptions r) =>
      int.tryParse(r.headers['x-retry-count']?.first ?? '') ?? 0;

  int _delay(int attempt) => (1 << (attempt - 1)) * 100;
}
