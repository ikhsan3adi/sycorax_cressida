import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/features/settings/providers/theme_mode_provider.dart';
import 'package:sycorax_cressida/features/settings/widgets/widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const Divider(),
        ThemeButton(
          mode: themeModeAsync.value ?? ThemeMode.system,
          onSelectionChanged: (Set<ThemeMode> newSelection) {
            ref
                .read(themeModeProvider.notifier)
                .setThemeMode(newSelection.first);
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '${AppConstants.appName} v${AppConstants.appVersion}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
