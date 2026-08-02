import 'package:sycorax_cressida/core/utils.dart';

class Channel {
  final String id;
  final String name;
  final List<String> altNames;
  final String? network;
  final List<String> owners;
  final String? country;
  final String? subdivision;
  final String? city;
  final List<String> broadcastArea;
  final List<String> languages;
  final List<String> categories;
  final bool isNsfw;
  final String? launched;
  final String? closed;
  final String? replacedBy;
  final String? website;
  final String? logoUrl;
  final bool hasStreams;

  const Channel({
    required this.id,
    required this.name,
    this.altNames = const [],
    this.network,
    this.owners = const [],
    this.country,
    this.subdivision,
    this.city,
    this.broadcastArea = const [],
    this.languages = const [],
    this.categories = const [],
    this.isNsfw = false,
    this.launched,
    this.closed,
    this.replacedBy,
    this.website,
    this.logoUrl,
    this.hasStreams = true,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    altNames: Utils.jsonStringList(json, 'alt_names'),
    network: json['network'] as String?,
    owners: Utils.jsonStringList(json, 'owners'),
    country: json['country'] as String?,
    subdivision: json['subdivision'] as String?,
    city: json['city'] as String?,
    broadcastArea: Utils.jsonStringList(json, 'broadcast_area'),
    languages: Utils.jsonStringList(json, 'languages'),
    categories: Utils.jsonStringList(json, 'categories'),
    isNsfw: json['is_nsfw'] as bool? ?? false,
    launched: json['launched'] as String?,
    closed: json['closed'] as String?,
    replacedBy: json['replaced_by'] as String?,
    website: json['website'] as String?,
  );
}
