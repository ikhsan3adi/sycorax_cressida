import 'package:flutter/material.dart';
import 'package:sycorax_cressida/data/models/channel.dart';
import 'package:sycorax_cressida/shared/widgets/widgets.dart';

class ChannelTile extends StatelessWidget {
  final Channel channel;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ChannelTile({
    super.key,
    required this.channel,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          tileColor: theme.colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: ChannelLogoImage(channel: channel),
          title: Text(
            channel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: channel.categories.isNotEmpty || channel.country != null
              ? Text(
                  [
                    if (channel.categories.isNotEmpty)
                      channel.categories.join(', '),
                    if (channel.country != null) channel.country,
                  ].join(' · '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
}
