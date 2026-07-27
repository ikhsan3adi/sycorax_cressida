import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/providers.dart';

final hideEmptyStreamsProvider =
    AsyncNotifierProvider<HideEmptyStreamsNotifier, bool>(
      HideEmptyStreamsNotifier.new,
    );

final hideNsfwProvider = AsyncNotifierProvider<HideNsfwNotifier, bool>(
  HideNsfwNotifier.new,
);

class HideEmptyStreamsNotifier extends AsyncNotifier<bool> {
  static const String key = 'hide_empty_streams';

  @override
  FutureOr<bool> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    final value = prefs.getBool(key);
    return value ?? true;
  }

  Future<void> setHideEmptyStreams(bool value) async {
    state = AsyncValue.data(value);
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(key, value);
  }
}

class HideNsfwNotifier extends AsyncNotifier<bool> {
  static const String key = 'hide_nsfw';

  @override
  FutureOr<bool> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    final value = prefs.getBool(key);
    return value ?? true;
  }

  Future<void> setHideNsfw(bool value) async {
    state = AsyncValue.data(value);
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(key, value);
  }
}
