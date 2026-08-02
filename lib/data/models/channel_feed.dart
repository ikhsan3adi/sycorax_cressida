import 'package:sycorax_cressida/core/utils.dart';

class ChannelFeed {
  final String id;
  final String channelId;
  final String name;
  final List<String> altNames;
  final bool isMain;
  final List<String> broadcastArea;
  final List<String> timezones;
  final List<String> languages;
  final String? format;

  const ChannelFeed({
    required this.id,
    required this.channelId,
    required this.name,
    this.altNames = const [],
    this.isMain = false,
    this.broadcastArea = const [],
    this.timezones = const [],
    this.languages = const [],
    this.format,
  });

  factory ChannelFeed.fromJson(Map<String, dynamic> json) => ChannelFeed(
    channelId: json['channel'] as String? ?? '',
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    altNames: Utils.jsonStringList(json, 'alt_names'),
    isMain: json['is_main'] as bool? ?? false,
    broadcastArea: Utils.jsonStringList(json, 'broadcast_area'),
    timezones: Utils.jsonStringList(json, 'timezones'),
    languages: Utils.jsonStringList(json, 'languages'),
    format: json['format'] as String?,
  );
}
