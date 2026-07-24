import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sycorax_cressida/data/models/channel.dart';

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
  Widget build(BuildContext context) => ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: channel.logoUrl ?? '',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        errorWidget: (_, _, _) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const Icon(Icons.tv, size: 20),
        ),
      ),
    ),
    title: Text(channel.name, maxLines: 1, overflow: TextOverflow.ellipsis),
    subtitle: channel.categories.isNotEmpty || channel.country != null
        ? Text(
            [
              if (channel.categories.isNotEmpty) channel.categories.join(', '),
              if (channel.country != null) channel.country,
            ].join(' · '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        : null,
    trailing: trailing,
    onTap: onTap,
  );
}
