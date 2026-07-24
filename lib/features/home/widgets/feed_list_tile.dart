import 'package:flutter/material.dart';
import 'package:sycorax_cressida/data/models/channel_feed.dart';

class FeedListTile extends StatelessWidget {
  final ChannelFeed feed;
  final VoidCallback onTap;

  const FeedListTile({super.key, required this.feed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 32.0),
      leading: const Icon(Icons.playlist_play),
      title: Text(feed.name.isNotEmpty ? feed.name : 'Default Feed'),
      subtitle: feed.format != null ? Text(feed.format!) : null,
      trailing: feed.isMain
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Main',
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}
