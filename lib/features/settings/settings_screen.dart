import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_new_shapes/material_new_shapes.dart';
import 'package:sycorax_cressida/shared/paintings/morphing_shape_border.dart';
import 'package:url_launcher/url_launcher.dart';
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
        subtitle: Text(
          hideEmptyStreamsAsync.value ?? true
              ? 'Channels with empty streams will be hidden from the main view.'
              : 'Channels with empty streams will be shown in the main view.',
        ),
        value: hideEmptyStreamsAsync.value ?? true,
        onChanged: (bool value) {
          ref
              .read(hideEmptyStreamsProvider.notifier)
              .setHideEmptyStreams(value);
        },
      ),
      SwitchListTile(
        secondary: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutSine,
          decoration: ShapeDecoration(
            color: hideNsfwAsync.value ?? true
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.error,
            shape: MorphingShapeBorder(
              polygon: hideNsfwAsync.value ?? true
                  ? MaterialShapes.circle
                  : MaterialShapes.softBoom,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              hideNsfwAsync.value ?? true
                  ? Icons.health_and_safety
                  : Icons.no_adult_content,
              color: hideNsfwAsync.value ?? true
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onError,
            ),
          ),
        ),
        title: Text(
          'Hide NSFW Channels ${hideNsfwAsync.value ?? true ? '' : '🤨🤨🤨'}',
        ),
        subtitle: Text(
          hideNsfwAsync.value ?? true
              ? 'NSFW channels will be hidden from the main view.'
              : 'NSFW channels will be shown in the main view. 🤨',
        ),
        value: hideNsfwAsync.value ?? true,
        onChanged: (bool value) {
          ref.read(hideNsfwProvider.notifier).setHideNsfw(value);
          if (!value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pls touch some grass :)')),
            );
          }
        },
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.info)),
        title: const Text('About'),
        isThreeLine: AppConstants.commitHash.isNotEmpty,
        subtitle: Text(
          '${AppConstants.appName} v${AppConstants.appVersion}${AppConstants.commitHash.isNotEmpty ? '\nCommit: ${AppConstants.commitHash}' : ''}',
        ),
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.code)),
        title: const Text('Source Code'),
        subtitle: const Text('View the source code on GitHub.'),
        onTap: () {
          launchUrl(Uri.parse(AppConstants.githubRepoUrl));
        },
      ),
      ExpansionTile(
        leading: const CircleAvatar(child: Icon(Icons.monetization_on)),
        shape: Border.all(width: 0, color: Colors.transparent),
        title: const Text('Donate'),
        subtitle: const Text(
          'Support the development of ${AppConstants.appName}.',
        ),
        children: _donationLinks.map((link) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.volunteer_activism)),
            title: Text(link.name),
            subtitle: Text(link.url),
            onTap: () {
              launchUrl(Uri.parse(link.url));
            },
          );
        }).toList(),
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }

  static const _donationLinks = [
    _DonationLink(name: 'Saweria', url: 'https://saweria.co/xiboxann'),
    _DonationLink(name: 'Trakteer', url: 'https://trakteer.id/ikhsan3adi/tip'),
  ];
}

class _DonationLink {
  final String name;
  final String url;
  const _DonationLink({required this.name, required this.url});
}
