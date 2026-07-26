import 'package:flutter/material.dart';
import 'package:sycorax_cressida/features/home/providers/player_state_provider.dart';
import 'package:sycorax_cressida/shared/widgets/channel_logo.dart';

class NowPlayingTile extends StatelessWidget {
  const NowPlayingTile({super.key, required this.playerState, this.onTap});

  final PlayerState playerState;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final channel = playerState.channel;
    final stream = playerState.currentStream;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          tileColor: theme.colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: ChannelLogoImage(imageUrl: channel?.logoUrl),
          title: Text(
            channel?.name ?? 'Playing',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            [
              stream?.title,
              stream?.quality,
            ].where((e) => e != null).join(' · '),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: onTap,
          trailing: Badge(
            backgroundColor: theme.colorScheme.tertiaryContainer,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.radio_button_checked,
                    color: theme.colorScheme.onTertiaryContainer,
                    size: 14,
                  ),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
