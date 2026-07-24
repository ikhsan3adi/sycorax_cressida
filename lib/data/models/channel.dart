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
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    List<String> list(String key) =>
        (json[key] as List<dynamic>?)?.cast<String>() ?? [];
    return Channel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      altNames: list('alt_names'),
      network: json['network'] as String?,
      owners: list('owners'),
      country: json['country'] as String?,
      subdivision: json['subdivision'] as String?,
      city: json['city'] as String?,
      broadcastArea: list('broadcast_area'),
      languages: list('languages'),
      categories: list('categories'),
      isNsfw: json['is_nsfw'] as bool? ?? false,
      launched: json['launched'] as String?,
      closed: json['closed'] as String?,
      replacedBy: json['replaced_by'] as String?,
      website: json['website'] as String?,
    );
  }
}
