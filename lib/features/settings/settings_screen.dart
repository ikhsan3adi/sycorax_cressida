import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sycorax_cressida/core/constants.dart';
import 'package:sycorax_cressida/features/settings/providers/settings_provider.dart';
import 'package:sycorax_cressida/features/settings/providers/theme_mode_provider.dart';
import 'package:sycorax_cressida/features/settings/widgets/widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeModeAsync = ref.watch(themeModeProvider);

    final hideEmptyStreamsAsync = ref.watch(hideEmptyStreamsProvider);
    final hideNsfwAsync = ref.watch(hideNsfwProvider);

    final children = [
      Column(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.palette)),
            title: const Text('Theme'),
            dense: true,
            subtitle: ThemeButton(
              mode: themeModeAsync.value ?? ThemeMode.system,
              onSelectionChanged: (Set<ThemeMode> newSelection) {
                ref
                    .read(themeModeProvider.notifier)
                    .setThemeMode(newSelection.first);
              },
            ),
          ),
        ],
      ),
      SwitchListTile(
        secondary: const CircleAvatar(child: Icon(Icons.video_collection)),
        title: const Text('Hide Channels with Empty Streams'),
        subtitle: const Text(
          'Channels with empty streams will be hidden from the main view.',
        ),
        value: hideEmptyStreamsAsync.value ?? true,
        onChanged: (bool value) {
          ref
              .read(hideEmptyStreamsProvider.notifier)
              .setHideEmptyStreams(value);
        },
      ),
      SwitchListTile(
        secondary: const CircleAvatar(child: Icon(Icons.block)),
        title: const Text('Hide NSFW Channels'),
        subtitle: const Text(
          'NSFW channels will be hidden from the main view.',
        ),
        value: hideNsfwAsync.value ?? false,
        onChanged: (bool value) {
          ref.read(hideNsfwProvider.notifier).setHideNsfw(value);
        },
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.info)),
        title: const Text('About'),
        subtitle: const Text(
          '${AppConstants.appName} v${AppConstants.appVersion}',
        ),
        onTap: () {},
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children.asMap().entries.map((entry) {
              final index = entry.key;
              final child = entry.value;
              return Card.filled(
                color: theme.colorScheme.surfaceContainer,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.symmetric(vertical: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: index == 0
                        ? const Radius.circular(12)
                        : const Radius.circular(4),
                    bottom: index == children.length - 1
                        ? const Radius.circular(12)
                        : const Radius.circular(4),
                  ),
                ),
                child: child,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
