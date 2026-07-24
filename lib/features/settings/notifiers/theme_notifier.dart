import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/data/providers.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  static const String key = 'theme_mode';

  @override
  FutureOr<ThemeMode> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);

    final themeMode = prefs.getInt(key);
    return themeMode != null ? ThemeMode.values[themeMode] : ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode value) async {
    state = AsyncValue.data(value);

    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(key, value.index);
  }
}
