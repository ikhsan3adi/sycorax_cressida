class ChannelStream {
  final String channelId;
  final String? feedId;
  final String url;
  final String title;
  final String? quality;
  final String? label;
  final String? referrer;
  final String? userAgent;
  final String? status;

  const ChannelStream({
    required this.channelId,
    this.feedId,
    required this.url,
    required this.title,
    this.quality,
    this.label,
    this.referrer,
    this.userAgent,
    this.status,
  });

  factory ChannelStream.fromJson(Map<String, dynamic> json) => ChannelStream(
    channelId: json['channel'] as String? ?? '',
    feedId: json['feed'] as String?,
    url: json['url'] as String? ?? '',
    title: json['title'] as String? ?? '',
    quality: json['quality'] as String?,
    label: json['label'] as String?,
    referrer: json['referrer'] as String?,
    userAgent: json['user_agent'] as String?,
    status: json['status'] as String?,
  );
}
