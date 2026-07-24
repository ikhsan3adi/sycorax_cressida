import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.mode, this.onSelectionChanged});

  final ThemeMode mode;
  final void Function(Set<ThemeMode>)? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(
                value: ThemeMode.system,
                label: mode == ThemeMode.system ? const Text('System') : null,
                icon: const Icon(Icons.brightness_auto),
              ),
              ButtonSegment(
                value: ThemeMode.light,
                label: mode == ThemeMode.light ? const Text('Light') : null,
                icon: const Icon(Icons.light_mode),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: mode == ThemeMode.dark ? const Text('Dark') : null,
                icon: const Icon(Icons.dark_mode),
              ),
            ],
            selected: {mode},
            onSelectionChanged: onSelectionChanged,
          ),
        ],
      ),
    );
  }
}
