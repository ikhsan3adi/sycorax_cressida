import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.mode, this.onSelectionChanged});

  final ThemeMode mode;
  final void Function(Set<ThemeMode>)? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SegmentedButton<ThemeMode>(
        style: SegmentedButton.styleFrom(
          iconSize: 16,
          visualDensity: VisualDensity.compact,
        ),
        segments: [
          const ButtonSegment(
            value: ThemeMode.system,
            label: Text('System'),
            icon: Icon(Icons.brightness_auto),
          ),
          const ButtonSegment(
            value: ThemeMode.light,
            label: Text('Light'),
            icon: Icon(Icons.light_mode),
          ),
          const ButtonSegment(
            value: ThemeMode.dark,
            label: Text('Dark'),
            icon: Icon(Icons.dark_mode),
          ),
        ],
        selected: {mode},
        onSelectionChanged: onSelectionChanged,
      ),
    );
  }
}
