import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/features/settings/providers.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/core/theme.dart';
import 'package:sycorax_cressida/core/util.dart';
import 'package:sycorax_cressida/core/router.dart';

class SycoraxCressidaApp extends ConsumerWidget {
  const SycoraxCressidaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = createTextTheme(context, 'Inter Tight', 'Archivo Black');
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ref.watch(themeProvider).value,
      routerConfig: router,
    );
  }
}
