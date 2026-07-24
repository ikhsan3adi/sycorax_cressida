class LogoEntry {
  final String channel;
  final String? feed;
  final bool inUse;
  final String url;

  const LogoEntry({
    required this.channel,
    this.feed,
    this.inUse = false,
    required this.url,
  });

  factory LogoEntry.fromJson(Map<String, dynamic> json) => LogoEntry(
    channel: json['channel'] as String? ?? '',
    feed: json['feed'] as String?,
    inUse: json['in_use'] as bool? ?? false,
    url: json['url'] as String? ?? '',
  );
}
