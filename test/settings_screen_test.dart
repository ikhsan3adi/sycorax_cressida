import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material3_expressive_loading_indicator/material3_expressive_loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sycorax_cressida/data/database/database.dart' as db;
import 'package:sycorax_cressida/data/providers.dart';
import 'package:sycorax_cressida/data/sync/sync_runner.dart';
import 'package:sycorax_cressida/features/settings/settings_screen.dart';

class _GatedSyncRunner extends SyncRunner {
  final Completer<void> gate;
  _GatedSyncRunner(this.gate);

  @override
  Future<void> runInBackground(int now) => gate.future;
}

Future<Widget> _buildApp(WidgetTester tester, _GatedSyncRunner runner) async {
  SharedPreferences.setMockInitialValues({});
  final database = db.AppDatabase(NativeDatabase.memory());
  addTearDown(database.close);
  final prefs = await SharedPreferences.getInstance();

  return ProviderScope(
    overrides: [
      appDatabaseProvider.overrideWithValue(database),
      syncRunnerProvider.overrideWithValue(runner),
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const MaterialApp(home: Scaffold(body: SettingsScreen())),
  );
}

void main() {
  testWidgets('Sync Now tile shows indicator while syncing', (tester) async {
    final gate = Completer<void>();
    await tester.pumpWidget(await _buildApp(tester, _GatedSyncRunner(gate)));
    await tester.pumpAndSettle();

    expect(find.byType(ExpressiveLoadingIndicator), findsNothing);

    await tester.tap(find.text('Sync Now'));
    await tester.pump();

    expect(find.byType(ExpressiveLoadingIndicator), findsOneWidget);

    gate.complete();
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(ExpressiveLoadingIndicator), findsNothing);
    expect(find.text('Sync complete'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
