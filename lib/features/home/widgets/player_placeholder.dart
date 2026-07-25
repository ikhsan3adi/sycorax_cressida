import 'package:flutter/material.dart';

class PlayerPlaceholder extends StatelessWidget {
  const PlayerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.tv_off,
                size: 48,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              const SizedBox(height: 16),
              Text(
                'Select a channel to start watching',
                style: TextStyle(color: theme.colorScheme.onSecondaryContainer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
