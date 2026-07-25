import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:drift/native.dart';
import 'package:sycorax_cressida/app.dart';
import 'package:sycorax_cressida/data/database/database.dart' as db;
import 'package:sycorax_cressida/data/api/iptv_client.dart';
import 'package:sycorax_cressida/data/models/channel.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart';
import 'package:sycorax_cressida/data/models/channel_stream.dart';
import 'package:sycorax_cressida/data/models/category.dart';
import 'package:sycorax_cressida/data/models/country.dart';
import 'package:sycorax_cressida/data/models/language.dart';
import 'package:sycorax_cressida/data/models/logo_entry.dart';
import 'package:sycorax_cressida/data/providers.dart';

class FakeIptvClient extends IptvClient {
  @override
  Future<List<Channel>> getChannels() async => [];
  @override
  Future<List<ChannelStream>> getStreams() async => [];
  @override
  Future<List<LogoEntry>> getLogos() async => [];
  @override
  Future<List<ChannelFeed>> getFeeds() async => [];
  @override
  Future<List<Country>> getCountries() async => [];
  @override
  Future<List<Language>> getLanguages() async => [];
  @override
  Future<List<Category>> getCategories() async => [];
}

void main() {
  MediaKit.ensureInitialized();
  testWidgets('App renders home screen', (WidgetTester tester) async {
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 2.0;

    final database = db.AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          iptvClientProvider.overrideWithValue(FakeIptvClient()),
        ],
        child: const SycoraxCressidaApp(),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Sycorax Cressida'), findsOneWidget);
  });
}
