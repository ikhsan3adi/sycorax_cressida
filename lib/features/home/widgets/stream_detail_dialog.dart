import 'package:flutter/material.dart';
import 'package:sycorax_cressida/data/models/models.dart';
import 'package:sycorax_cressida/shared/widgets/channel_logo.dart';

class StreamDetailDialog extends StatelessWidget {
  const StreamDetailDialog({
    super.key,
    required this.channel,
    required this.stream,
    this.feed,
    this.country,
    this.languages,
  });

  final Channel channel;
  final ChannelStream stream;
  final ChannelFeed? feed;
  final String? country;
  final List<String>? languages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 440,
          maxHeight: MediaQuery.sizeOf(context).height * 0.85,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const _SectionHeader(label: 'Channel'),
                    const SizedBox(height: 8),
                    Center(child: ChannelLogoImage(imageUrl: channel.logoUrl)),
                    const SizedBox(height: 12),
                    Text(
                      channel.name,
                      style: theme.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    if (channel.altNames.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          'aka ${channel.altNames.join(', ')}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 12),
                    if (channel.network != null)
                      _InfoTile(
                        icon: Icons.business,
                        label: 'Network',
                        value: channel.network!,
                      ),
                    if (channel.owners.isNotEmpty)
                      _InfoTile(
                        icon: Icons.groups,
                        label: 'Owners',
                        value: channel.owners.join(', '),
                      ),
                    if (channel.country != null)
                      _InfoTile(
                        icon: Icons.location_on_outlined,
                        label: 'Location',
                        value: [
                          channel.city,
                          channel.subdivision,
                          country ?? channel.country,
                        ].where((e) => e != null).join(', '),
                      ),
                    if (channel.broadcastArea.isNotEmpty)
                      _InfoTile(
                        icon: Icons.map_outlined,
                        label: 'Broadcast Area',
                        value: channel.broadcastArea.join(', '),
                      ),
                    if (channel.categories.isNotEmpty)
                      _InfoTile(
                        icon: Icons.category_outlined,
                        label: 'Categories',
                        value: channel.categories.join(', '),
                      ),
                    if (channel.languages.isNotEmpty)
                      _InfoTile(
                        icon: Icons.translate,
                        label: 'Languages',
                        value: (languages ?? channel.languages).join(', '),
                      ),
                    if (channel.launched != null)
                      _InfoTile(
                        icon: Icons.rocket_launch_outlined,
                        label: 'Launched',
                        value: channel.launched!,
                      ),
                    if (channel.closed != null)
                      _InfoTile(
                        icon: Icons.cancel_outlined,
                        label: 'Closed',
                        value: channel.closed!,
                      ),
                    if (channel.replacedBy != null)
                      _InfoTile(
                        icon: Icons.swap_horiz,
                        label: 'Replaced By',
                        value: channel.replacedBy!,
                      ),
                    if (channel.isNsfw)
                      _InfoTile(
                        icon: Icons.warning_amber_outlined,
                        label: 'NSFW',
                        value: 'Yes',
                        valueColor: theme.colorScheme.error,
                      ),
                    if (channel.website != null)
                      _InfoTile(
                        icon: Icons.open_in_new,
                        label: 'Website',
                        value: channel.website!,
                      ),
                    const SizedBox(height: 16),
                    const Divider(height: 1),
                    const SizedBox(height: 16),
                    const _SectionHeader(label: 'Stream'),
                    const SizedBox(height: 16),
                    if (stream.title.isNotEmpty)
                      _InfoTile(
                        icon: Icons.title,
                        label: 'Title',
                        value: stream.title,
                      ),
                    if (stream.quality != null || stream.label != null)
                      _InfoTile(
                        icon: Icons.high_quality,
                        label: 'Quality',
                        value: [
                          stream.quality,
                          stream.label,
                        ].where((e) => e != null).join(' · '),
                      ),
                    if (stream.status != null)
                      _InfoTile(
                        icon: Icons.signal_cellular_alt,
                        label: 'Status',
                        value: stream.status!,
                      ),
                    if (stream.referrer != null)
                      _InfoTile(
                        icon: Icons.link,
                        label: 'Referrer',
                        value: stream.referrer!,
                      ),
                    if (stream.userAgent != null)
                      _InfoTile(
                        icon: Icons.computer,
                        label: 'User Agent',
                        value: stream.userAgent!,
                      ),
                    _InfoTile(
                      icon: Icons.language,
                      label: 'URL',
                      value: stream.url,
                      maxLines: 3,
                    ),
                    if (feed != null) ...[
                      const SizedBox(height: 16),
                      const Divider(height: 1),
                      const SizedBox(height: 16),
                      const _SectionHeader(label: 'Feed'),
                      const SizedBox(height: 8),
                      _InfoTile(
                        icon: Icons.label_outline,
                        label: 'Name',
                        value: feed!.name.isNotEmpty
                            ? feed!.name
                            : 'Default Feed',
                      ),
                      if (feed!.format != null)
                        _InfoTile(
                          icon: Icons.sd_card_outlined,
                          label: 'Format',
                          value: feed!.format!,
                        ),
                      if (feed!.languages.isNotEmpty)
                        _InfoTile(
                          icon: Icons.translate,
                          label: 'Languages',
                          value: feed!.languages.join(', '),
                        ),
                      if (feed!.broadcastArea.isNotEmpty)
                        _InfoTile(
                          icon: Icons.map_outlined,
                          label: 'Broadcast Area',
                          value: feed!.broadcastArea.join(', '),
                        ),
                      if (feed!.isMain)
                        const _InfoTile(
                          icon: Icons.star,
                          label: 'Main Feed',
                          value: 'Yes',
                        ),
                    ],
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;

  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.titleSmall?.copyWith(
        color: theme.colorScheme.primary,
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.maxLines = 1,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final int maxLines;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
