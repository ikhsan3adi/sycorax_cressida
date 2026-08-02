import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/native.dart';
import 'package:sycorax_cressida/app.dart';
import 'package:sycorax_cressida/data/database/database.dart' as db;
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/data/sync/sync_runner.dart';

class _NoopSyncRunner extends SyncRunner {
  @override
  Future<void> runInBackground(int now) async {}
}

void main() {
  MediaKit.ensureInitialized();
  testWidgets('App renders home screen', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.0;

    final database = db.AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          syncRunnerProvider.overrideWithValue(_NoopSyncRunner()),
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const SycoraxCressidaApp(),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Sycorax\nCressida'), findsOneWidget);
  });
}
