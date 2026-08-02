// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChannelsTable extends Channels with TableInfo<$ChannelsTable, Channel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChannelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> altNames =
      GeneratedColumn<String>(
        'alt_names',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ChannelsTable.$converteraltNames);
  static const VerificationMeta _networkMeta = const VerificationMeta(
    'network',
  );
  @override
  late final GeneratedColumn<String> network = GeneratedColumn<String>(
    'network',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> owners =
      GeneratedColumn<String>(
        'owners',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ChannelsTable.$converterowners);
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subdivisionMeta = const VerificationMeta(
    'subdivision',
  );
  @override
  late final GeneratedColumn<String> subdivision = GeneratedColumn<String>(
    'subdivision',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  broadcastArea = GeneratedColumn<String>(
    'broadcast_area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($ChannelsTable.$converterbroadcastArea);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> languages =
      GeneratedColumn<String>(
        'languages',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ChannelsTable.$converterlanguages);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> categories =
      GeneratedColumn<String>(
        'categories',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ChannelsTable.$convertercategories);
  static const VerificationMeta _isNsfwMeta = const VerificationMeta('isNsfw');
  @override
  late final GeneratedColumn<bool> isNsfw = GeneratedColumn<bool>(
    'is_nsfw',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_nsfw" IN (0, 1))',
    ),
  );
  static const VerificationMeta _launchedMeta = const VerificationMeta(
    'launched',
  );
  @override
  late final GeneratedColumn<String> launched = GeneratedColumn<String>(
    'launched',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _closedMeta = const VerificationMeta('closed');
  @override
  late final GeneratedColumn<String> closed = GeneratedColumn<String>(
    'closed',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _replacedByMeta = const VerificationMeta(
    'replacedBy',
  );
  @override
  late final GeneratedColumn<String> replacedBy = GeneratedColumn<String>(
    'replaced_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<int> syncedAt = GeneratedColumn<int>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasStreamsMeta = const VerificationMeta(
    'hasStreams',
  );
  @override
  late final GeneratedColumn<bool> hasStreams = GeneratedColumn<bool>(
    'has_streams',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_streams" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    altNames,
    network,
    owners,
    country,
    subdivision,
    city,
    broadcastArea,
    languages,
    categories,
    isNsfw,
    launched,
    closed,
    replacedBy,
    website,
    logoUrl,
    syncedAt,
    hasStreams,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'channels';
  @override
  VerificationContext validateIntegrity(
    Insertable<Channel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('network')) {
      context.handle(
        _networkMeta,
        network.isAcceptableOrUnknown(data['network']!, _networkMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('subdivision')) {
      context.handle(
        _subdivisionMeta,
        subdivision.isAcceptableOrUnknown(
          data['subdivision']!,
          _subdivisionMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('is_nsfw')) {
      context.handle(
        _isNsfwMeta,
        isNsfw.isAcceptableOrUnknown(data['is_nsfw']!, _isNsfwMeta),
      );
    } else if (isInserting) {
      context.missing(_isNsfwMeta);
    }
    if (data.containsKey('launched')) {
      context.handle(
        _launchedMeta,
        launched.isAcceptableOrUnknown(data['launched']!, _launchedMeta),
      );
    }
    if (data.containsKey('closed')) {
      context.handle(
        _closedMeta,
        closed.isAcceptableOrUnknown(data['closed']!, _closedMeta),
      );
    }
    if (data.containsKey('replaced_by')) {
      context.handle(
        _replacedByMeta,
        replacedBy.isAcceptableOrUnknown(data['replaced_by']!, _replacedByMeta),
      );
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    if (data.containsKey('has_streams')) {
      context.handle(
        _hasStreamsMeta,
        hasStreams.isAcceptableOrUnknown(data['has_streams']!, _hasStreamsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Channel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Channel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      altNames: $ChannelsTable.$converteraltNames.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}alt_names'],
        )!,
      ),
      network: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}network'],
      ),
      owners: $ChannelsTable.$converterowners.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}owners'],
        )!,
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      subdivision: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subdivision'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      broadcastArea: $ChannelsTable.$converterbroadcastArea.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}broadcast_area'],
        )!,
      ),
      languages: $ChannelsTable.$converterlanguages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}languages'],
        )!,
      ),
      categories: $ChannelsTable.$convertercategories.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}categories'],
        )!,
      ),
      isNsfw: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_nsfw'],
      )!,
      launched: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}launched'],
      ),
      closed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}closed'],
      ),
      replacedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}replaced_by'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      ),
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synced_at'],
      )!,
      hasStreams: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_streams'],
      )!,
    );
  }

  @override
  $ChannelsTable createAlias(String alias) {
    return $ChannelsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteraltNames =
      stringListConverter;
  static TypeConverter<List<String>, String> $converterowners =
      stringListConverter;
  static TypeConverter<List<String>, String> $converterbroadcastArea =
      stringListConverter;
  static TypeConverter<List<String>, String> $converterlanguages =
      stringListConverter;
  static TypeConverter<List<String>, String> $convertercategories =
      stringListConverter;
}

class Channel extends DataClass implements Insertable<Channel> {
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
  final int syncedAt;
  final bool hasStreams;
  const Channel({
    required this.id,
    required this.name,
    required this.altNames,
    this.network,
    required this.owners,
    this.country,
    this.subdivision,
    this.city,
    required this.broadcastArea,
    required this.languages,
    required this.categories,
    required this.isNsfw,
    this.launched,
    this.closed,
    this.replacedBy,
    this.website,
    this.logoUrl,
    required this.syncedAt,
    required this.hasStreams,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    {
      map['alt_names'] = Variable<String>(
        $ChannelsTable.$converteraltNames.toSql(altNames),
      );
    }
    if (!nullToAbsent || network != null) {
      map['network'] = Variable<String>(network);
    }
    {
      map['owners'] = Variable<String>(
        $ChannelsTable.$converterowners.toSql(owners),
      );
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || subdivision != null) {
      map['subdivision'] = Variable<String>(subdivision);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    {
      map['broadcast_area'] = Variable<String>(
        $ChannelsTable.$converterbroadcastArea.toSql(broadcastArea),
      );
    }
    {
      map['languages'] = Variable<String>(
        $ChannelsTable.$converterlanguages.toSql(languages),
      );
    }
    {
      map['categories'] = Variable<String>(
        $ChannelsTable.$convertercategories.toSql(categories),
      );
    }
    map['is_nsfw'] = Variable<bool>(isNsfw);
    if (!nullToAbsent || launched != null) {
      map['launched'] = Variable<String>(launched);
    }
    if (!nullToAbsent || closed != null) {
      map['closed'] = Variable<String>(closed);
    }
    if (!nullToAbsent || replacedBy != null) {
      map['replaced_by'] = Variable<String>(replacedBy);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    map['synced_at'] = Variable<int>(syncedAt);
    map['has_streams'] = Variable<bool>(hasStreams);
    return map;
  }

  ChannelsCompanion toCompanion(bool nullToAbsent) {
    return ChannelsCompanion(
      id: Value(id),
      name: Value(name),
      altNames: Value(altNames),
      network: network == null && nullToAbsent
          ? const Value.absent()
          : Value(network),
      owners: Value(owners),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      subdivision: subdivision == null && nullToAbsent
          ? const Value.absent()
          : Value(subdivision),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      broadcastArea: Value(broadcastArea),
      languages: Value(languages),
      categories: Value(categories),
      isNsfw: Value(isNsfw),
      launched: launched == null && nullToAbsent
          ? const Value.absent()
          : Value(launched),
      closed: closed == null && nullToAbsent
          ? const Value.absent()
          : Value(closed),
      replacedBy: replacedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(replacedBy),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      syncedAt: Value(syncedAt),
      hasStreams: Value(hasStreams),
    );
  }

  factory Channel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Channel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      altNames: serializer.fromJson<List<String>>(json['altNames']),
      network: serializer.fromJson<String?>(json['network']),
      owners: serializer.fromJson<List<String>>(json['owners']),
      country: serializer.fromJson<String?>(json['country']),
      subdivision: serializer.fromJson<String?>(json['subdivision']),
      city: serializer.fromJson<String?>(json['city']),
      broadcastArea: serializer.fromJson<List<String>>(json['broadcastArea']),
      languages: serializer.fromJson<List<String>>(json['languages']),
      categories: serializer.fromJson<List<String>>(json['categories']),
      isNsfw: serializer.fromJson<bool>(json['isNsfw']),
      launched: serializer.fromJson<String?>(json['launched']),
      closed: serializer.fromJson<String?>(json['closed']),
      replacedBy: serializer.fromJson<String?>(json['replacedBy']),
      website: serializer.fromJson<String?>(json['website']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      syncedAt: serializer.fromJson<int>(json['syncedAt']),
      hasStreams: serializer.fromJson<bool>(json['hasStreams']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'altNames': serializer.toJson<List<String>>(altNames),
      'network': serializer.toJson<String?>(network),
      'owners': serializer.toJson<List<String>>(owners),
      'country': serializer.toJson<String?>(country),
      'subdivision': serializer.toJson<String?>(subdivision),
      'city': serializer.toJson<String?>(city),
      'broadcastArea': serializer.toJson<List<String>>(broadcastArea),
      'languages': serializer.toJson<List<String>>(languages),
      'categories': serializer.toJson<List<String>>(categories),
      'isNsfw': serializer.toJson<bool>(isNsfw),
      'launched': serializer.toJson<String?>(launched),
      'closed': serializer.toJson<String?>(closed),
      'replacedBy': serializer.toJson<String?>(replacedBy),
      'website': serializer.toJson<String?>(website),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'syncedAt': serializer.toJson<int>(syncedAt),
      'hasStreams': serializer.toJson<bool>(hasStreams),
    };
  }

  Channel copyWith({
    String? id,
    String? name,
    List<String>? altNames,
    Value<String?> network = const Value.absent(),
    List<String>? owners,
    Value<String?> country = const Value.absent(),
    Value<String?> subdivision = const Value.absent(),
    Value<String?> city = const Value.absent(),
    List<String>? broadcastArea,
    List<String>? languages,
    List<String>? categories,
    bool? isNsfw,
    Value<String?> launched = const Value.absent(),
    Value<String?> closed = const Value.absent(),
    Value<String?> replacedBy = const Value.absent(),
    Value<String?> website = const Value.absent(),
    Value<String?> logoUrl = const Value.absent(),
    int? syncedAt,
    bool? hasStreams,
  }) => Channel(
    id: id ?? this.id,
    name: name ?? this.name,
    altNames: altNames ?? this.altNames,
    network: network.present ? network.value : this.network,
    owners: owners ?? this.owners,
    country: country.present ? country.value : this.country,
    subdivision: subdivision.present ? subdivision.value : this.subdivision,
    city: city.present ? city.value : this.city,
    broadcastArea: broadcastArea ?? this.broadcastArea,
    languages: languages ?? this.languages,
    categories: categories ?? this.categories,
    isNsfw: isNsfw ?? this.isNsfw,
    launched: launched.present ? launched.value : this.launched,
    closed: closed.present ? closed.value : this.closed,
    replacedBy: replacedBy.present ? replacedBy.value : this.replacedBy,
    website: website.present ? website.value : this.website,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    syncedAt: syncedAt ?? this.syncedAt,
    hasStreams: hasStreams ?? this.hasStreams,
  );
  Channel copyWithCompanion(ChannelsCompanion data) {
    return Channel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      altNames: data.altNames.present ? data.altNames.value : this.altNames,
      network: data.network.present ? data.network.value : this.network,
      owners: data.owners.present ? data.owners.value : this.owners,
      country: data.country.present ? data.country.value : this.country,
      subdivision: data.subdivision.present
          ? data.subdivision.value
          : this.subdivision,
      city: data.city.present ? data.city.value : this.city,
      broadcastArea: data.broadcastArea.present
          ? data.broadcastArea.value
          : this.broadcastArea,
      languages: data.languages.present ? data.languages.value : this.languages,
      categories: data.categories.present
          ? data.categories.value
          : this.categories,
      isNsfw: data.isNsfw.present ? data.isNsfw.value : this.isNsfw,
      launched: data.launched.present ? data.launched.value : this.launched,
      closed: data.closed.present ? data.closed.value : this.closed,
      replacedBy: data.replacedBy.present
          ? data.replacedBy.value
          : this.replacedBy,
      website: data.website.present ? data.website.value : this.website,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
      hasStreams: data.hasStreams.present
          ? data.hasStreams.value
          : this.hasStreams,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Channel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('altNames: $altNames, ')
          ..write('network: $network, ')
          ..write('owners: $owners, ')
          ..write('country: $country, ')
          ..write('subdivision: $subdivision, ')
          ..write('city: $city, ')
          ..write('broadcastArea: $broadcastArea, ')
          ..write('languages: $languages, ')
          ..write('categories: $categories, ')
          ..write('isNsfw: $isNsfw, ')
          ..write('launched: $launched, ')
          ..write('closed: $closed, ')
          ..write('replacedBy: $replacedBy, ')
          ..write('website: $website, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('hasStreams: $hasStreams')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    altNames,
    network,
    owners,
    country,
    subdivision,
    city,
    broadcastArea,
    languages,
    categories,
    isNsfw,
    launched,
    closed,
    replacedBy,
    website,
    logoUrl,
    syncedAt,
    hasStreams,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Channel &&
          other.id == this.id &&
          other.name == this.name &&
          other.altNames == this.altNames &&
          other.network == this.network &&
          other.owners == this.owners &&
          other.country == this.country &&
          other.subdivision == this.subdivision &&
          other.city == this.city &&
          other.broadcastArea == this.broadcastArea &&
          other.languages == this.languages &&
          other.categories == this.categories &&
          other.isNsfw == this.isNsfw &&
          other.launched == this.launched &&
          other.closed == this.closed &&
          other.replacedBy == this.replacedBy &&
          other.website == this.website &&
          other.logoUrl == this.logoUrl &&
          other.syncedAt == this.syncedAt &&
          other.hasStreams == this.hasStreams);
}

class ChannelsCompanion extends UpdateCompanion<Channel> {
  final Value<String> id;
  final Value<String> name;
  final Value<List<String>> altNames;
  final Value<String?> network;
  final Value<List<String>> owners;
  final Value<String?> country;
  final Value<String?> subdivision;
  final Value<String?> city;
  final Value<List<String>> broadcastArea;
  final Value<List<String>> languages;
  final Value<List<String>> categories;
  final Value<bool> isNsfw;
  final Value<String?> launched;
  final Value<String?> closed;
  final Value<String?> replacedBy;
  final Value<String?> website;
  final Value<String?> logoUrl;
  final Value<int> syncedAt;
  final Value<bool> hasStreams;
  final Value<int> rowid;
  const ChannelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.altNames = const Value.absent(),
    this.network = const Value.absent(),
    this.owners = const Value.absent(),
    this.country = const Value.absent(),
    this.subdivision = const Value.absent(),
    this.city = const Value.absent(),
    this.broadcastArea = const Value.absent(),
    this.languages = const Value.absent(),
    this.categories = const Value.absent(),
    this.isNsfw = const Value.absent(),
    this.launched = const Value.absent(),
    this.closed = const Value.absent(),
    this.replacedBy = const Value.absent(),
    this.website = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.hasStreams = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChannelsCompanion.insert({
    required String id,
    required String name,
    required List<String> altNames,
    this.network = const Value.absent(),
    required List<String> owners,
    this.country = const Value.absent(),
    this.subdivision = const Value.absent(),
    this.city = const Value.absent(),
    required List<String> broadcastArea,
    required List<String> languages,
    required List<String> categories,
    required bool isNsfw,
    this.launched = const Value.absent(),
    this.closed = const Value.absent(),
    this.replacedBy = const Value.absent(),
    this.website = const Value.absent(),
    this.logoUrl = const Value.absent(),
    required int syncedAt,
    this.hasStreams = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       altNames = Value(altNames),
       owners = Value(owners),
       broadcastArea = Value(broadcastArea),
       languages = Value(languages),
       categories = Value(categories),
       isNsfw = Value(isNsfw),
       syncedAt = Value(syncedAt);
  static Insertable<Channel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? altNames,
    Expression<String>? network,
    Expression<String>? owners,
    Expression<String>? country,
    Expression<String>? subdivision,
    Expression<String>? city,
    Expression<String>? broadcastArea,
    Expression<String>? languages,
    Expression<String>? categories,
    Expression<bool>? isNsfw,
    Expression<String>? launched,
    Expression<String>? closed,
    Expression<String>? replacedBy,
    Expression<String>? website,
    Expression<String>? logoUrl,
    Expression<int>? syncedAt,
    Expression<bool>? hasStreams,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (altNames != null) 'alt_names': altNames,
      if (network != null) 'network': network,
      if (owners != null) 'owners': owners,
      if (country != null) 'country': country,
      if (subdivision != null) 'subdivision': subdivision,
      if (city != null) 'city': city,
      if (broadcastArea != null) 'broadcast_area': broadcastArea,
      if (languages != null) 'languages': languages,
      if (categories != null) 'categories': categories,
      if (isNsfw != null) 'is_nsfw': isNsfw,
      if (launched != null) 'launched': launched,
      if (closed != null) 'closed': closed,
      if (replacedBy != null) 'replaced_by': replacedBy,
      if (website != null) 'website': website,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (hasStreams != null) 'has_streams': hasStreams,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChannelsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<List<String>>? altNames,
    Value<String?>? network,
    Value<List<String>>? owners,
    Value<String?>? country,
    Value<String?>? subdivision,
    Value<String?>? city,
    Value<List<String>>? broadcastArea,
    Value<List<String>>? languages,
    Value<List<String>>? categories,
    Value<bool>? isNsfw,
    Value<String?>? launched,
    Value<String?>? closed,
    Value<String?>? replacedBy,
    Value<String?>? website,
    Value<String?>? logoUrl,
    Value<int>? syncedAt,
    Value<bool>? hasStreams,
    Value<int>? rowid,
  }) {
    return ChannelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      altNames: altNames ?? this.altNames,
      network: network ?? this.network,
      owners: owners ?? this.owners,
      country: country ?? this.country,
      subdivision: subdivision ?? this.subdivision,
      city: city ?? this.city,
      broadcastArea: broadcastArea ?? this.broadcastArea,
      languages: languages ?? this.languages,
      categories: categories ?? this.categories,
      isNsfw: isNsfw ?? this.isNsfw,
      launched: launched ?? this.launched,
      closed: closed ?? this.closed,
      replacedBy: replacedBy ?? this.replacedBy,
      website: website ?? this.website,
      logoUrl: logoUrl ?? this.logoUrl,
      syncedAt: syncedAt ?? this.syncedAt,
      hasStreams: hasStreams ?? this.hasStreams,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (altNames.present) {
      map['alt_names'] = Variable<String>(
        $ChannelsTable.$converteraltNames.toSql(altNames.value),
      );
    }
    if (network.present) {
      map['network'] = Variable<String>(network.value);
    }
    if (owners.present) {
      map['owners'] = Variable<String>(
        $ChannelsTable.$converterowners.toSql(owners.value),
      );
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (subdivision.present) {
      map['subdivision'] = Variable<String>(subdivision.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (broadcastArea.present) {
      map['broadcast_area'] = Variable<String>(
        $ChannelsTable.$converterbroadcastArea.toSql(broadcastArea.value),
      );
    }
    if (languages.present) {
      map['languages'] = Variable<String>(
        $ChannelsTable.$converterlanguages.toSql(languages.value),
      );
    }
    if (categories.present) {
      map['categories'] = Variable<String>(
        $ChannelsTable.$convertercategories.toSql(categories.value),
      );
    }
    if (isNsfw.present) {
      map['is_nsfw'] = Variable<bool>(isNsfw.value);
    }
    if (launched.present) {
      map['launched'] = Variable<String>(launched.value);
    }
    if (closed.present) {
      map['closed'] = Variable<String>(closed.value);
    }
    if (replacedBy.present) {
      map['replaced_by'] = Variable<String>(replacedBy.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<int>(syncedAt.value);
    }
    if (hasStreams.present) {
      map['has_streams'] = Variable<bool>(hasStreams.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('altNames: $altNames, ')
          ..write('network: $network, ')
          ..write('owners: $owners, ')
          ..write('country: $country, ')
          ..write('subdivision: $subdivision, ')
          ..write('city: $city, ')
          ..write('broadcastArea: $broadcastArea, ')
          ..write('languages: $languages, ')
          ..write('categories: $categories, ')
          ..write('isNsfw: $isNsfw, ')
          ..write('launched: $launched, ')
          ..write('closed: $closed, ')
          ..write('replacedBy: $replacedBy, ')
          ..write('website: $website, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('hasStreams: $hasStreams, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeedsTable extends Feeds with TableInfo<$FeedsTable, Feed> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelIdMeta = const VerificationMeta(
    'channelId',
  );
  @override
  late final GeneratedColumn<String> channelId = GeneratedColumn<String>(
    'channel_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> altNames =
      GeneratedColumn<String>(
        'alt_names',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($FeedsTable.$converteraltNames);
  static const VerificationMeta _isMainMeta = const VerificationMeta('isMain');
  @override
  late final GeneratedColumn<bool> isMain = GeneratedColumn<bool>(
    'is_main',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_main" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  broadcastArea = GeneratedColumn<String>(
    'broadcast_area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<String>>($FeedsTable.$converterbroadcastArea);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> timezones =
      GeneratedColumn<String>(
        'timezones',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($FeedsTable.$convertertimezones);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> languages =
      GeneratedColumn<String>(
        'languages',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($FeedsTable.$converterlanguages);
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
    'format',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    channelId,
    name,
    altNames,
    isMain,
    broadcastArea,
    timezones,
    languages,
    format,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feeds';
  @override
  VerificationContext validateIntegrity(
    Insertable<Feed> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('channel_id')) {
      context.handle(
        _channelIdMeta,
        channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_channelIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_main')) {
      context.handle(
        _isMainMeta,
        isMain.isAcceptableOrUnknown(data['is_main']!, _isMainMeta),
      );
    } else if (isInserting) {
      context.missing(_isMainMeta);
    }
    if (data.containsKey('format')) {
      context.handle(
        _formatMeta,
        format.isAcceptableOrUnknown(data['format']!, _formatMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feed map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feed(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      channelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      altNames: $FeedsTable.$converteraltNames.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}alt_names'],
        )!,
      ),
      isMain: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_main'],
      )!,
      broadcastArea: $FeedsTable.$converterbroadcastArea.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}broadcast_area'],
        )!,
      ),
      timezones: $FeedsTable.$convertertimezones.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}timezones'],
        )!,
      ),
      languages: $FeedsTable.$converterlanguages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}languages'],
        )!,
      ),
      format: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}format'],
      ),
    );
  }

  @override
  $FeedsTable createAlias(String alias) {
    return $FeedsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteraltNames =
      stringListConverter;
  static TypeConverter<List<String>, String> $converterbroadcastArea =
      stringListConverter;
  static TypeConverter<List<String>, String> $convertertimezones =
      stringListConverter;
  static TypeConverter<List<String>, String> $converterlanguages =
      stringListConverter;
}

class Feed extends DataClass implements Insertable<Feed> {
  final String id;
  final String channelId;
  final String name;
  final List<String> altNames;
  final bool isMain;
  final List<String> broadcastArea;
  final List<String> timezones;
  final List<String> languages;
  final String? format;
  const Feed({
    required this.id,
    required this.channelId,
    required this.name,
    required this.altNames,
    required this.isMain,
    required this.broadcastArea,
    required this.timezones,
    required this.languages,
    this.format,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['channel_id'] = Variable<String>(channelId);
    map['name'] = Variable<String>(name);
    {
      map['alt_names'] = Variable<String>(
        $FeedsTable.$converteraltNames.toSql(altNames),
      );
    }
    map['is_main'] = Variable<bool>(isMain);
    {
      map['broadcast_area'] = Variable<String>(
        $FeedsTable.$converterbroadcastArea.toSql(broadcastArea),
      );
    }
    {
      map['timezones'] = Variable<String>(
        $FeedsTable.$convertertimezones.toSql(timezones),
      );
    }
    {
      map['languages'] = Variable<String>(
        $FeedsTable.$converterlanguages.toSql(languages),
      );
    }
    if (!nullToAbsent || format != null) {
      map['format'] = Variable<String>(format);
    }
    return map;
  }

  FeedsCompanion toCompanion(bool nullToAbsent) {
    return FeedsCompanion(
      id: Value(id),
      channelId: Value(channelId),
      name: Value(name),
      altNames: Value(altNames),
      isMain: Value(isMain),
      broadcastArea: Value(broadcastArea),
      timezones: Value(timezones),
      languages: Value(languages),
      format: format == null && nullToAbsent
          ? const Value.absent()
          : Value(format),
    );
  }

  factory Feed.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feed(
      id: serializer.fromJson<String>(json['id']),
      channelId: serializer.fromJson<String>(json['channelId']),
      name: serializer.fromJson<String>(json['name']),
      altNames: serializer.fromJson<List<String>>(json['altNames']),
      isMain: serializer.fromJson<bool>(json['isMain']),
      broadcastArea: serializer.fromJson<List<String>>(json['broadcastArea']),
      timezones: serializer.fromJson<List<String>>(json['timezones']),
      languages: serializer.fromJson<List<String>>(json['languages']),
      format: serializer.fromJson<String?>(json['format']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'channelId': serializer.toJson<String>(channelId),
      'name': serializer.toJson<String>(name),
      'altNames': serializer.toJson<List<String>>(altNames),
      'isMain': serializer.toJson<bool>(isMain),
      'broadcastArea': serializer.toJson<List<String>>(broadcastArea),
      'timezones': serializer.toJson<List<String>>(timezones),
      'languages': serializer.toJson<List<String>>(languages),
      'format': serializer.toJson<String?>(format),
    };
  }

  Feed copyWith({
    String? id,
    String? channelId,
    String? name,
    List<String>? altNames,
    bool? isMain,
    List<String>? broadcastArea,
    List<String>? timezones,
    List<String>? languages,
    Value<String?> format = const Value.absent(),
  }) => Feed(
    id: id ?? this.id,
    channelId: channelId ?? this.channelId,
    name: name ?? this.name,
    altNames: altNames ?? this.altNames,
    isMain: isMain ?? this.isMain,
    broadcastArea: broadcastArea ?? this.broadcastArea,
    timezones: timezones ?? this.timezones,
    languages: languages ?? this.languages,
    format: format.present ? format.value : this.format,
  );
  Feed copyWithCompanion(FeedsCompanion data) {
    return Feed(
      id: data.id.present ? data.id.value : this.id,
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      name: data.name.present ? data.name.value : this.name,
      altNames: data.altNames.present ? data.altNames.value : this.altNames,
      isMain: data.isMain.present ? data.isMain.value : this.isMain,
      broadcastArea: data.broadcastArea.present
          ? data.broadcastArea.value
          : this.broadcastArea,
      timezones: data.timezones.present ? data.timezones.value : this.timezones,
      languages: data.languages.present ? data.languages.value : this.languages,
      format: data.format.present ? data.format.value : this.format,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Feed(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('name: $name, ')
          ..write('altNames: $altNames, ')
          ..write('isMain: $isMain, ')
          ..write('broadcastArea: $broadcastArea, ')
          ..write('timezones: $timezones, ')
          ..write('languages: $languages, ')
          ..write('format: $format')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    channelId,
    name,
    altNames,
    isMain,
    broadcastArea,
    timezones,
    languages,
    format,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feed &&
          other.id == this.id &&
          other.channelId == this.channelId &&
          other.name == this.name &&
          other.altNames == this.altNames &&
          other.isMain == this.isMain &&
          other.broadcastArea == this.broadcastArea &&
          other.timezones == this.timezones &&
          other.languages == this.languages &&
          other.format == this.format);
}

class FeedsCompanion extends UpdateCompanion<Feed> {
  final Value<String> id;
  final Value<String> channelId;
  final Value<String> name;
  final Value<List<String>> altNames;
  final Value<bool> isMain;
  final Value<List<String>> broadcastArea;
  final Value<List<String>> timezones;
  final Value<List<String>> languages;
  final Value<String?> format;
  final Value<int> rowid;
  const FeedsCompanion({
    this.id = const Value.absent(),
    this.channelId = const Value.absent(),
    this.name = const Value.absent(),
    this.altNames = const Value.absent(),
    this.isMain = const Value.absent(),
    this.broadcastArea = const Value.absent(),
    this.timezones = const Value.absent(),
    this.languages = const Value.absent(),
    this.format = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedsCompanion.insert({
    required String id,
    required String channelId,
    required String name,
    required List<String> altNames,
    required bool isMain,
    required List<String> broadcastArea,
    required List<String> timezones,
    required List<String> languages,
    this.format = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       channelId = Value(channelId),
       name = Value(name),
       altNames = Value(altNames),
       isMain = Value(isMain),
       broadcastArea = Value(broadcastArea),
       timezones = Value(timezones),
       languages = Value(languages);
  static Insertable<Feed> custom({
    Expression<String>? id,
    Expression<String>? channelId,
    Expression<String>? name,
    Expression<String>? altNames,
    Expression<bool>? isMain,
    Expression<String>? broadcastArea,
    Expression<String>? timezones,
    Expression<String>? languages,
    Expression<String>? format,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channelId != null) 'channel_id': channelId,
      if (name != null) 'name': name,
      if (altNames != null) 'alt_names': altNames,
      if (isMain != null) 'is_main': isMain,
      if (broadcastArea != null) 'broadcast_area': broadcastArea,
      if (timezones != null) 'timezones': timezones,
      if (languages != null) 'languages': languages,
      if (format != null) 'format': format,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedsCompanion copyWith({
    Value<String>? id,
    Value<String>? channelId,
    Value<String>? name,
    Value<List<String>>? altNames,
    Value<bool>? isMain,
    Value<List<String>>? broadcastArea,
    Value<List<String>>? timezones,
    Value<List<String>>? languages,
    Value<String?>? format,
    Value<int>? rowid,
  }) {
    return FeedsCompanion(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      name: name ?? this.name,
      altNames: altNames ?? this.altNames,
      isMain: isMain ?? this.isMain,
      broadcastArea: broadcastArea ?? this.broadcastArea,
      timezones: timezones ?? this.timezones,
      languages: languages ?? this.languages,
      format: format ?? this.format,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<String>(channelId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (altNames.present) {
      map['alt_names'] = Variable<String>(
        $FeedsTable.$converteraltNames.toSql(altNames.value),
      );
    }
    if (isMain.present) {
      map['is_main'] = Variable<bool>(isMain.value);
    }
    if (broadcastArea.present) {
      map['broadcast_area'] = Variable<String>(
        $FeedsTable.$converterbroadcastArea.toSql(broadcastArea.value),
      );
    }
    if (timezones.present) {
      map['timezones'] = Variable<String>(
        $FeedsTable.$convertertimezones.toSql(timezones.value),
      );
    }
    if (languages.present) {
      map['languages'] = Variable<String>(
        $FeedsTable.$converterlanguages.toSql(languages.value),
      );
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedsCompanion(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('name: $name, ')
          ..write('altNames: $altNames, ')
          ..write('isMain: $isMain, ')
          ..write('broadcastArea: $broadcastArea, ')
          ..write('timezones: $timezones, ')
          ..write('languages: $languages, ')
          ..write('format: $format, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StreamsTable extends Streams with TableInfo<$StreamsTable, Stream> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _channelIdMeta = const VerificationMeta(
    'channelId',
  );
  @override
  late final GeneratedColumn<String> channelId = GeneratedColumn<String>(
    'channel_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feedIdMeta = const VerificationMeta('feedId');
  @override
  late final GeneratedColumn<String> feedId = GeneratedColumn<String>(
    'feed_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referrerMeta = const VerificationMeta(
    'referrer',
  );
  @override
  late final GeneratedColumn<String> referrer = GeneratedColumn<String>(
    'referrer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userAgentMeta = const VerificationMeta(
    'userAgent',
  );
  @override
  late final GeneratedColumn<String> userAgent = GeneratedColumn<String>(
    'user_agent',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qualityMeta = const VerificationMeta(
    'quality',
  );
  @override
  late final GeneratedColumn<String> quality = GeneratedColumn<String>(
    'quality',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    channelId,
    feedId,
    title,
    url,
    referrer,
    userAgent,
    quality,
    label,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streams';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stream> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('channel_id')) {
      context.handle(
        _channelIdMeta,
        channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_channelIdMeta);
    }
    if (data.containsKey('feed_id')) {
      context.handle(
        _feedIdMeta,
        feedId.isAcceptableOrUnknown(data['feed_id']!, _feedIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('referrer')) {
      context.handle(
        _referrerMeta,
        referrer.isAcceptableOrUnknown(data['referrer']!, _referrerMeta),
      );
    }
    if (data.containsKey('user_agent')) {
      context.handle(
        _userAgentMeta,
        userAgent.isAcceptableOrUnknown(data['user_agent']!, _userAgentMeta),
      );
    }
    if (data.containsKey('quality')) {
      context.handle(
        _qualityMeta,
        quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta),
      );
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stream map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stream(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      channelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel_id'],
      )!,
      feedId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feed_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      referrer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}referrer'],
      ),
      userAgent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_agent'],
      ),
      quality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quality'],
      ),
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $StreamsTable createAlias(String alias) {
    return $StreamsTable(attachedDatabase, alias);
  }
}

class Stream extends DataClass implements Insertable<Stream> {
  final int id;
  final String channelId;
  final String? feedId;
  final String title;
  final String url;
  final String? referrer;
  final String? userAgent;
  final String? quality;
  final String? label;
  final String? status;
  const Stream({
    required this.id,
    required this.channelId,
    this.feedId,
    required this.title,
    required this.url,
    this.referrer,
    this.userAgent,
    this.quality,
    this.label,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['channel_id'] = Variable<String>(channelId);
    if (!nullToAbsent || feedId != null) {
      map['feed_id'] = Variable<String>(feedId);
    }
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || referrer != null) {
      map['referrer'] = Variable<String>(referrer);
    }
    if (!nullToAbsent || userAgent != null) {
      map['user_agent'] = Variable<String>(userAgent);
    }
    if (!nullToAbsent || quality != null) {
      map['quality'] = Variable<String>(quality);
    }
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  StreamsCompanion toCompanion(bool nullToAbsent) {
    return StreamsCompanion(
      id: Value(id),
      channelId: Value(channelId),
      feedId: feedId == null && nullToAbsent
          ? const Value.absent()
          : Value(feedId),
      title: Value(title),
      url: Value(url),
      referrer: referrer == null && nullToAbsent
          ? const Value.absent()
          : Value(referrer),
      userAgent: userAgent == null && nullToAbsent
          ? const Value.absent()
          : Value(userAgent),
      quality: quality == null && nullToAbsent
          ? const Value.absent()
          : Value(quality),
      label: label == null && nullToAbsent
          ? const Value.absent()
          : Value(label),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory Stream.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stream(
      id: serializer.fromJson<int>(json['id']),
      channelId: serializer.fromJson<String>(json['channelId']),
      feedId: serializer.fromJson<String?>(json['feedId']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      referrer: serializer.fromJson<String?>(json['referrer']),
      userAgent: serializer.fromJson<String?>(json['userAgent']),
      quality: serializer.fromJson<String?>(json['quality']),
      label: serializer.fromJson<String?>(json['label']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'channelId': serializer.toJson<String>(channelId),
      'feedId': serializer.toJson<String?>(feedId),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'referrer': serializer.toJson<String?>(referrer),
      'userAgent': serializer.toJson<String?>(userAgent),
      'quality': serializer.toJson<String?>(quality),
      'label': serializer.toJson<String?>(label),
      'status': serializer.toJson<String?>(status),
    };
  }

  Stream copyWith({
    int? id,
    String? channelId,
    Value<String?> feedId = const Value.absent(),
    String? title,
    String? url,
    Value<String?> referrer = const Value.absent(),
    Value<String?> userAgent = const Value.absent(),
    Value<String?> quality = const Value.absent(),
    Value<String?> label = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => Stream(
    id: id ?? this.id,
    channelId: channelId ?? this.channelId,
    feedId: feedId.present ? feedId.value : this.feedId,
    title: title ?? this.title,
    url: url ?? this.url,
    referrer: referrer.present ? referrer.value : this.referrer,
    userAgent: userAgent.present ? userAgent.value : this.userAgent,
    quality: quality.present ? quality.value : this.quality,
    label: label.present ? label.value : this.label,
    status: status.present ? status.value : this.status,
  );
  Stream copyWithCompanion(StreamsCompanion data) {
    return Stream(
      id: data.id.present ? data.id.value : this.id,
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      feedId: data.feedId.present ? data.feedId.value : this.feedId,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      referrer: data.referrer.present ? data.referrer.value : this.referrer,
      userAgent: data.userAgent.present ? data.userAgent.value : this.userAgent,
      quality: data.quality.present ? data.quality.value : this.quality,
      label: data.label.present ? data.label.value : this.label,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stream(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('feedId: $feedId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('referrer: $referrer, ')
          ..write('userAgent: $userAgent, ')
          ..write('quality: $quality, ')
          ..write('label: $label, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    channelId,
    feedId,
    title,
    url,
    referrer,
    userAgent,
    quality,
    label,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stream &&
          other.id == this.id &&
          other.channelId == this.channelId &&
          other.feedId == this.feedId &&
          other.title == this.title &&
          other.url == this.url &&
          other.referrer == this.referrer &&
          other.userAgent == this.userAgent &&
          other.quality == this.quality &&
          other.label == this.label &&
          other.status == this.status);
}

class StreamsCompanion extends UpdateCompanion<Stream> {
  final Value<int> id;
  final Value<String> channelId;
  final Value<String?> feedId;
  final Value<String> title;
  final Value<String> url;
  final Value<String?> referrer;
  final Value<String?> userAgent;
  final Value<String?> quality;
  final Value<String?> label;
  final Value<String?> status;
  const StreamsCompanion({
    this.id = const Value.absent(),
    this.channelId = const Value.absent(),
    this.feedId = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.referrer = const Value.absent(),
    this.userAgent = const Value.absent(),
    this.quality = const Value.absent(),
    this.label = const Value.absent(),
    this.status = const Value.absent(),
  });
  StreamsCompanion.insert({
    this.id = const Value.absent(),
    required String channelId,
    this.feedId = const Value.absent(),
    required String title,
    required String url,
    this.referrer = const Value.absent(),
    this.userAgent = const Value.absent(),
    this.quality = const Value.absent(),
    this.label = const Value.absent(),
    this.status = const Value.absent(),
  }) : channelId = Value(channelId),
       title = Value(title),
       url = Value(url);
  static Insertable<Stream> custom({
    Expression<int>? id,
    Expression<String>? channelId,
    Expression<String>? feedId,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? referrer,
    Expression<String>? userAgent,
    Expression<String>? quality,
    Expression<String>? label,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channelId != null) 'channel_id': channelId,
      if (feedId != null) 'feed_id': feedId,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (referrer != null) 'referrer': referrer,
      if (userAgent != null) 'user_agent': userAgent,
      if (quality != null) 'quality': quality,
      if (label != null) 'label': label,
      if (status != null) 'status': status,
    });
  }

  StreamsCompanion copyWith({
    Value<int>? id,
    Value<String>? channelId,
    Value<String?>? feedId,
    Value<String>? title,
    Value<String>? url,
    Value<String?>? referrer,
    Value<String?>? userAgent,
    Value<String?>? quality,
    Value<String?>? label,
    Value<String?>? status,
  }) {
    return StreamsCompanion(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      feedId: feedId ?? this.feedId,
      title: title ?? this.title,
      url: url ?? this.url,
      referrer: referrer ?? this.referrer,
      userAgent: userAgent ?? this.userAgent,
      quality: quality ?? this.quality,
      label: label ?? this.label,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<String>(channelId.value);
    }
    if (feedId.present) {
      map['feed_id'] = Variable<String>(feedId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (referrer.present) {
      map['referrer'] = Variable<String>(referrer.value);
    }
    if (userAgent.present) {
      map['user_agent'] = Variable<String>(userAgent.value);
    }
    if (quality.present) {
      map['quality'] = Variable<String>(quality.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreamsCompanion(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('feedId: $feedId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('referrer: $referrer, ')
          ..write('userAgent: $userAgent, ')
          ..write('quality: $quality, ')
          ..write('label: $label, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CountriesTable extends Countries
    with TableInfo<$CountriesTable, Country> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> languages =
      GeneratedColumn<String>(
        'languages',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($CountriesTable.$converterlanguages);
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
    'flag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [code, name, languages, flag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Country> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
        _flagMeta,
        flag.isAcceptableOrUnknown(data['flag']!, _flagMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Country map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Country(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      languages: $CountriesTable.$converterlanguages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}languages'],
        )!,
      ),
      flag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flag'],
      ),
    );
  }

  @override
  $CountriesTable createAlias(String alias) {
    return $CountriesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterlanguages =
      stringListConverter;
}

class Country extends DataClass implements Insertable<Country> {
  final String code;
  final String name;
  final List<String> languages;
  final String? flag;
  const Country({
    required this.code,
    required this.name,
    required this.languages,
    this.flag,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    {
      map['languages'] = Variable<String>(
        $CountriesTable.$converterlanguages.toSql(languages),
      );
    }
    if (!nullToAbsent || flag != null) {
      map['flag'] = Variable<String>(flag);
    }
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      code: Value(code),
      name: Value(name),
      languages: Value(languages),
      flag: flag == null && nullToAbsent ? const Value.absent() : Value(flag),
    );
  }

  factory Country.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Country(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      languages: serializer.fromJson<List<String>>(json['languages']),
      flag: serializer.fromJson<String?>(json['flag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'languages': serializer.toJson<List<String>>(languages),
      'flag': serializer.toJson<String?>(flag),
    };
  }

  Country copyWith({
    String? code,
    String? name,
    List<String>? languages,
    Value<String?> flag = const Value.absent(),
  }) => Country(
    code: code ?? this.code,
    name: name ?? this.name,
    languages: languages ?? this.languages,
    flag: flag.present ? flag.value : this.flag,
  );
  Country copyWithCompanion(CountriesCompanion data) {
    return Country(
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      languages: data.languages.present ? data.languages.value : this.languages,
      flag: data.flag.present ? data.flag.value : this.flag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Country(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('languages: $languages, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name, languages, flag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          other.code == this.code &&
          other.name == this.name &&
          other.languages == this.languages &&
          other.flag == this.flag);
}

class CountriesCompanion extends UpdateCompanion<Country> {
  final Value<String> code;
  final Value<String> name;
  final Value<List<String>> languages;
  final Value<String?> flag;
  final Value<int> rowid;
  const CountriesCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.languages = const Value.absent(),
    this.flag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountriesCompanion.insert({
    required String code,
    required String name,
    required List<String> languages,
    this.flag = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       languages = Value(languages);
  static Insertable<Country> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? languages,
    Expression<String>? flag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (languages != null) 'languages': languages,
      if (flag != null) 'flag': flag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountriesCompanion copyWith({
    Value<String>? code,
    Value<String>? name,
    Value<List<String>>? languages,
    Value<String?>? flag,
    Value<int>? rowid,
  }) {
    return CountriesCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      languages: languages ?? this.languages,
      flag: flag ?? this.flag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (languages.present) {
      map['languages'] = Variable<String>(
        $CountriesTable.$converterlanguages.toSql(languages.value),
      );
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('languages: $languages, ')
          ..write('flag: $flag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LanguagesTable extends Languages
    with TableInfo<$LanguagesTable, Language> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LanguagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'languages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Language> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Language map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Language(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $LanguagesTable createAlias(String alias) {
    return $LanguagesTable(attachedDatabase, alias);
  }
}

class Language extends DataClass implements Insertable<Language> {
  final String code;
  final String name;
  const Language({required this.code, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  LanguagesCompanion toCompanion(bool nullToAbsent) {
    return LanguagesCompanion(code: Value(code), name: Value(name));
  }

  factory Language.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Language(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  Language copyWith({String? code, String? name}) =>
      Language(code: code ?? this.code, name: name ?? this.name);
  Language copyWithCompanion(LanguagesCompanion data) {
    return Language(
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Language(')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Language && other.code == this.code && other.name == this.name);
}

class LanguagesCompanion extends UpdateCompanion<Language> {
  final Value<String> code;
  final Value<String> name;
  final Value<int> rowid;
  const LanguagesCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LanguagesCompanion.insert({
    required String code,
    required String name,
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       name = Value(name);
  static Insertable<Language> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LanguagesCompanion copyWith({
    Value<String>? code,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return LanguagesCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguagesCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final String name;
  final String? description;
  const Category({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Category copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _channelIdMeta = const VerificationMeta(
    'channelId',
  );
  @override
  late final GeneratedColumn<String> channelId = GeneratedColumn<String>(
    'channel_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<int> addedAt = GeneratedColumn<int>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [channelId, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('channel_id')) {
      context.handle(
        _channelIdMeta,
        channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_channelIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {channelId};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      channelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final String channelId;
  final int addedAt;
  const Favorite({required this.channelId, required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['channel_id'] = Variable<String>(channelId);
    map['added_at'] = Variable<int>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      channelId: Value(channelId),
      addedAt: Value(addedAt),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      channelId: serializer.fromJson<String>(json['channelId']),
      addedAt: serializer.fromJson<int>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'channelId': serializer.toJson<String>(channelId),
      'addedAt': serializer.toJson<int>(addedAt),
    };
  }

  Favorite copyWith({String? channelId, int? addedAt}) => Favorite(
    channelId: channelId ?? this.channelId,
    addedAt: addedAt ?? this.addedAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('channelId: $channelId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(channelId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.channelId == this.channelId &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> channelId;
  final Value<int> addedAt;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.channelId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String channelId,
    required int addedAt,
    this.rowid = const Value.absent(),
  }) : channelId = Value(channelId),
       addedAt = Value(addedAt);
  static Insertable<Favorite> custom({
    Expression<String>? channelId,
    Expression<int>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (channelId != null) 'channel_id': channelId,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({
    Value<String>? channelId,
    Value<int>? addedAt,
    Value<int>? rowid,
  }) {
    return FavoritesCompanion(
      channelId: channelId ?? this.channelId,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (channelId.present) {
      map['channel_id'] = Variable<String>(channelId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<int>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('channelId: $channelId, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChannelsTable channels = $ChannelsTable(this);
  late final $FeedsTable feeds = $FeedsTable(this);
  late final $StreamsTable streams = $StreamsTable(this);
  late final $CountriesTable countries = $CountriesTable(this);
  late final $LanguagesTable languages = $LanguagesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    channels,
    feeds,
    streams,
    countries,
    languages,
    categories,
    favorites,
  ];
}

typedef $$ChannelsTableCreateCompanionBuilder =
    ChannelsCompanion Function({
      required String id,
      required String name,
      required List<String> altNames,
      Value<String?> network,
      required List<String> owners,
      Value<String?> country,
      Value<String?> subdivision,
      Value<String?> city,
      required List<String> broadcastArea,
      required List<String> languages,
      required List<String> categories,
      required bool isNsfw,
      Value<String?> launched,
      Value<String?> closed,
      Value<String?> replacedBy,
      Value<String?> website,
      Value<String?> logoUrl,
      required int syncedAt,
      Value<bool> hasStreams,
      Value<int> rowid,
    });
typedef $$ChannelsTableUpdateCompanionBuilder =
    ChannelsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<List<String>> altNames,
      Value<String?> network,
      Value<List<String>> owners,
      Value<String?> country,
      Value<String?> subdivision,
      Value<String?> city,
      Value<List<String>> broadcastArea,
      Value<List<String>> languages,
      Value<List<String>> categories,
      Value<bool> isNsfw,
      Value<String?> launched,
      Value<String?> closed,
      Value<String?> replacedBy,
      Value<String?> website,
      Value<String?> logoUrl,
      Value<int> syncedAt,
      Value<bool> hasStreams,
      Value<int> rowid,
    });

class $$ChannelsTableFilterComposer
    extends Composer<_$AppDatabase, $ChannelsTable> {
  $$ChannelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get altNames => $composableBuilder(
    column: $table.altNames,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get owners => $composableBuilder(
    column: $table.owners,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subdivision => $composableBuilder(
    column: $table.subdivision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get broadcastArea => $composableBuilder(
    column: $table.broadcastArea,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isNsfw => $composableBuilder(
    column: $table.isNsfw,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get launched => $composableBuilder(
    column: $table.launched,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get closed => $composableBuilder(
    column: $table.closed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get replacedBy => $composableBuilder(
    column: $table.replacedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasStreams => $composableBuilder(
    column: $table.hasStreams,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChannelsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChannelsTable> {
  $$ChannelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get altNames => $composableBuilder(
    column: $table.altNames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get owners => $composableBuilder(
    column: $table.owners,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subdivision => $composableBuilder(
    column: $table.subdivision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get broadcastArea => $composableBuilder(
    column: $table.broadcastArea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNsfw => $composableBuilder(
    column: $table.isNsfw,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get launched => $composableBuilder(
    column: $table.launched,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get closed => $composableBuilder(
    column: $table.closed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get replacedBy => $composableBuilder(
    column: $table.replacedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasStreams => $composableBuilder(
    column: $table.hasStreams,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChannelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChannelsTable> {
  $$ChannelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get altNames =>
      $composableBuilder(column: $table.altNames, builder: (column) => column);

  GeneratedColumn<String> get network =>
      $composableBuilder(column: $table.network, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get owners =>
      $composableBuilder(column: $table.owners, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get subdivision => $composableBuilder(
    column: $table.subdivision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get broadcastArea =>
      $composableBuilder(
        column: $table.broadcastArea,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>, String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get categories =>
      $composableBuilder(
        column: $table.categories,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isNsfw =>
      $composableBuilder(column: $table.isNsfw, builder: (column) => column);

  GeneratedColumn<String> get launched =>
      $composableBuilder(column: $table.launched, builder: (column) => column);

  GeneratedColumn<String> get closed =>
      $composableBuilder(column: $table.closed, builder: (column) => column);

  GeneratedColumn<String> get replacedBy => $composableBuilder(
    column: $table.replacedBy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<int> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  GeneratedColumn<bool> get hasStreams => $composableBuilder(
    column: $table.hasStreams,
    builder: (column) => column,
  );
}

class $$ChannelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChannelsTable,
          Channel,
          $$ChannelsTableFilterComposer,
          $$ChannelsTableOrderingComposer,
          $$ChannelsTableAnnotationComposer,
          $$ChannelsTableCreateCompanionBuilder,
          $$ChannelsTableUpdateCompanionBuilder,
          (Channel, BaseReferences<_$AppDatabase, $ChannelsTable, Channel>),
          Channel,
          PrefetchHooks Function()
        > {
  $$ChannelsTableTableManager(_$AppDatabase db, $ChannelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChannelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChannelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChannelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<List<String>> altNames = const Value.absent(),
                Value<String?> network = const Value.absent(),
                Value<List<String>> owners = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> subdivision = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<List<String>> broadcastArea = const Value.absent(),
                Value<List<String>> languages = const Value.absent(),
                Value<List<String>> categories = const Value.absent(),
                Value<bool> isNsfw = const Value.absent(),
                Value<String?> launched = const Value.absent(),
                Value<String?> closed = const Value.absent(),
                Value<String?> replacedBy = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int> syncedAt = const Value.absent(),
                Value<bool> hasStreams = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChannelsCompanion(
                id: id,
                name: name,
                altNames: altNames,
                network: network,
                owners: owners,
                country: country,
                subdivision: subdivision,
                city: city,
                broadcastArea: broadcastArea,
                languages: languages,
                categories: categories,
                isNsfw: isNsfw,
                launched: launched,
                closed: closed,
                replacedBy: replacedBy,
                website: website,
                logoUrl: logoUrl,
                syncedAt: syncedAt,
                hasStreams: hasStreams,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required List<String> altNames,
                Value<String?> network = const Value.absent(),
                required List<String> owners,
                Value<String?> country = const Value.absent(),
                Value<String?> subdivision = const Value.absent(),
                Value<String?> city = const Value.absent(),
                required List<String> broadcastArea,
                required List<String> languages,
                required List<String> categories,
                required bool isNsfw,
                Value<String?> launched = const Value.absent(),
                Value<String?> closed = const Value.absent(),
                Value<String?> replacedBy = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                required int syncedAt,
                Value<bool> hasStreams = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChannelsCompanion.insert(
                id: id,
                name: name,
                altNames: altNames,
                network: network,
                owners: owners,
                country: country,
                subdivision: subdivision,
                city: city,
                broadcastArea: broadcastArea,
                languages: languages,
                categories: categories,
                isNsfw: isNsfw,
                launched: launched,
                closed: closed,
                replacedBy: replacedBy,
                website: website,
                logoUrl: logoUrl,
                syncedAt: syncedAt,
                hasStreams: hasStreams,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChannelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChannelsTable,
      Channel,
      $$ChannelsTableFilterComposer,
      $$ChannelsTableOrderingComposer,
      $$ChannelsTableAnnotationComposer,
      $$ChannelsTableCreateCompanionBuilder,
      $$ChannelsTableUpdateCompanionBuilder,
      (Channel, BaseReferences<_$AppDatabase, $ChannelsTable, Channel>),
      Channel,
      PrefetchHooks Function()
    >;
typedef $$FeedsTableCreateCompanionBuilder =
    FeedsCompanion Function({
      required String id,
      required String channelId,
      required String name,
      required List<String> altNames,
      required bool isMain,
      required List<String> broadcastArea,
      required List<String> timezones,
      required List<String> languages,
      Value<String?> format,
      Value<int> rowid,
    });
typedef $$FeedsTableUpdateCompanionBuilder =
    FeedsCompanion Function({
      Value<String> id,
      Value<String> channelId,
      Value<String> name,
      Value<List<String>> altNames,
      Value<bool> isMain,
      Value<List<String>> broadcastArea,
      Value<List<String>> timezones,
      Value<List<String>> languages,
      Value<String?> format,
      Value<int> rowid,
    });

class $$FeedsTableFilterComposer extends Composer<_$AppDatabase, $FeedsTable> {
  $$FeedsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channelId => $composableBuilder(
    column: $table.channelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get altNames => $composableBuilder(
    column: $table.altNames,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isMain => $composableBuilder(
    column: $table.isMain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get broadcastArea => $composableBuilder(
    column: $table.broadcastArea,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get timezones => $composableBuilder(
    column: $table.timezones,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FeedsTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedsTable> {
  $$FeedsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channelId => $composableBuilder(
    column: $table.channelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get altNames => $composableBuilder(
    column: $table.altNames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMain => $composableBuilder(
    column: $table.isMain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get broadcastArea => $composableBuilder(
    column: $table.broadcastArea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezones => $composableBuilder(
    column: $table.timezones,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FeedsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedsTable> {
  $$FeedsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get channelId =>
      $composableBuilder(column: $table.channelId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get altNames =>
      $composableBuilder(column: $table.altNames, builder: (column) => column);

  GeneratedColumn<bool> get isMain =>
      $composableBuilder(column: $table.isMain, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get broadcastArea =>
      $composableBuilder(
        column: $table.broadcastArea,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>, String> get timezones =>
      $composableBuilder(column: $table.timezones, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);
}

class $$FeedsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeedsTable,
          Feed,
          $$FeedsTableFilterComposer,
          $$FeedsTableOrderingComposer,
          $$FeedsTableAnnotationComposer,
          $$FeedsTableCreateCompanionBuilder,
          $$FeedsTableUpdateCompanionBuilder,
          (Feed, BaseReferences<_$AppDatabase, $FeedsTable, Feed>),
          Feed,
          PrefetchHooks Function()
        > {
  $$FeedsTableTableManager(_$AppDatabase db, $FeedsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> channelId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<List<String>> altNames = const Value.absent(),
                Value<bool> isMain = const Value.absent(),
                Value<List<String>> broadcastArea = const Value.absent(),
                Value<List<String>> timezones = const Value.absent(),
                Value<List<String>> languages = const Value.absent(),
                Value<String?> format = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FeedsCompanion(
                id: id,
                channelId: channelId,
                name: name,
                altNames: altNames,
                isMain: isMain,
                broadcastArea: broadcastArea,
                timezones: timezones,
                languages: languages,
                format: format,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String channelId,
                required String name,
                required List<String> altNames,
                required bool isMain,
                required List<String> broadcastArea,
                required List<String> timezones,
                required List<String> languages,
                Value<String?> format = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FeedsCompanion.insert(
                id: id,
                channelId: channelId,
                name: name,
                altNames: altNames,
                isMain: isMain,
                broadcastArea: broadcastArea,
                timezones: timezones,
                languages: languages,
                format: format,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FeedsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeedsTable,
      Feed,
      $$FeedsTableFilterComposer,
      $$FeedsTableOrderingComposer,
      $$FeedsTableAnnotationComposer,
      $$FeedsTableCreateCompanionBuilder,
      $$FeedsTableUpdateCompanionBuilder,
      (Feed, BaseReferences<_$AppDatabase, $FeedsTable, Feed>),
      Feed,
      PrefetchHooks Function()
    >;
typedef $$StreamsTableCreateCompanionBuilder =
    StreamsCompanion Function({
      Value<int> id,
      required String channelId,
      Value<String?> feedId,
      required String title,
      required String url,
      Value<String?> referrer,
      Value<String?> userAgent,
      Value<String?> quality,
      Value<String?> label,
      Value<String?> status,
    });
typedef $$StreamsTableUpdateCompanionBuilder =
    StreamsCompanion Function({
      Value<int> id,
      Value<String> channelId,
      Value<String?> feedId,
      Value<String> title,
      Value<String> url,
      Value<String?> referrer,
      Value<String?> userAgent,
      Value<String?> quality,
      Value<String?> label,
      Value<String?> status,
    });

class $$StreamsTableFilterComposer
    extends Composer<_$AppDatabase, $StreamsTable> {
  $$StreamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channelId => $composableBuilder(
    column: $table.channelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feedId => $composableBuilder(
    column: $table.feedId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referrer => $composableBuilder(
    column: $table.referrer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userAgent => $composableBuilder(
    column: $table.userAgent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StreamsTableOrderingComposer
    extends Composer<_$AppDatabase, $StreamsTable> {
  $$StreamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channelId => $composableBuilder(
    column: $table.channelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedId => $composableBuilder(
    column: $table.feedId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referrer => $composableBuilder(
    column: $table.referrer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userAgent => $composableBuilder(
    column: $table.userAgent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreamsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreamsTable> {
  $$StreamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get channelId =>
      $composableBuilder(column: $table.channelId, builder: (column) => column);

  GeneratedColumn<String> get feedId =>
      $composableBuilder(column: $table.feedId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get referrer =>
      $composableBuilder(column: $table.referrer, builder: (column) => column);

  GeneratedColumn<String> get userAgent =>
      $composableBuilder(column: $table.userAgent, builder: (column) => column);

  GeneratedColumn<String> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$StreamsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreamsTable,
          Stream,
          $$StreamsTableFilterComposer,
          $$StreamsTableOrderingComposer,
          $$StreamsTableAnnotationComposer,
          $$StreamsTableCreateCompanionBuilder,
          $$StreamsTableUpdateCompanionBuilder,
          (Stream, BaseReferences<_$AppDatabase, $StreamsTable, Stream>),
          Stream,
          PrefetchHooks Function()
        > {
  $$StreamsTableTableManager(_$AppDatabase db, $StreamsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> channelId = const Value.absent(),
                Value<String?> feedId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> referrer = const Value.absent(),
                Value<String?> userAgent = const Value.absent(),
                Value<String?> quality = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<String?> status = const Value.absent(),
              }) => StreamsCompanion(
                id: id,
                channelId: channelId,
                feedId: feedId,
                title: title,
                url: url,
                referrer: referrer,
                userAgent: userAgent,
                quality: quality,
                label: label,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String channelId,
                Value<String?> feedId = const Value.absent(),
                required String title,
                required String url,
                Value<String?> referrer = const Value.absent(),
                Value<String?> userAgent = const Value.absent(),
                Value<String?> quality = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<String?> status = const Value.absent(),
              }) => StreamsCompanion.insert(
                id: id,
                channelId: channelId,
                feedId: feedId,
                title: title,
                url: url,
                referrer: referrer,
                userAgent: userAgent,
                quality: quality,
                label: label,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StreamsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreamsTable,
      Stream,
      $$StreamsTableFilterComposer,
      $$StreamsTableOrderingComposer,
      $$StreamsTableAnnotationComposer,
      $$StreamsTableCreateCompanionBuilder,
      $$StreamsTableUpdateCompanionBuilder,
      (Stream, BaseReferences<_$AppDatabase, $StreamsTable, Stream>),
      Stream,
      PrefetchHooks Function()
    >;
typedef $$CountriesTableCreateCompanionBuilder =
    CountriesCompanion Function({
      required String code,
      required String name,
      required List<String> languages,
      Value<String?> flag,
      Value<int> rowid,
    });
typedef $$CountriesTableUpdateCompanionBuilder =
    CountriesCompanion Function({
      Value<String> code,
      Value<String> name,
      Value<List<String>> languages,
      Value<String?> flag,
      Value<int> rowid,
    });

class $$CountriesTableFilterComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get flag => $composableBuilder(
    column: $table.flag,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CountriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flag => $composableBuilder(
    column: $table.flag,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumn<String> get flag =>
      $composableBuilder(column: $table.flag, builder: (column) => column);
}

class $$CountriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountriesTable,
          Country,
          $$CountriesTableFilterComposer,
          $$CountriesTableOrderingComposer,
          $$CountriesTableAnnotationComposer,
          $$CountriesTableCreateCompanionBuilder,
          $$CountriesTableUpdateCompanionBuilder,
          (Country, BaseReferences<_$AppDatabase, $CountriesTable, Country>),
          Country,
          PrefetchHooks Function()
        > {
  $$CountriesTableTableManager(_$AppDatabase db, $CountriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<List<String>> languages = const Value.absent(),
                Value<String?> flag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountriesCompanion(
                code: code,
                name: name,
                languages: languages,
                flag: flag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String name,
                required List<String> languages,
                Value<String?> flag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountriesCompanion.insert(
                code: code,
                name: name,
                languages: languages,
                flag: flag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CountriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountriesTable,
      Country,
      $$CountriesTableFilterComposer,
      $$CountriesTableOrderingComposer,
      $$CountriesTableAnnotationComposer,
      $$CountriesTableCreateCompanionBuilder,
      $$CountriesTableUpdateCompanionBuilder,
      (Country, BaseReferences<_$AppDatabase, $CountriesTable, Country>),
      Country,
      PrefetchHooks Function()
    >;
typedef $$LanguagesTableCreateCompanionBuilder =
    LanguagesCompanion Function({
      required String code,
      required String name,
      Value<int> rowid,
    });
typedef $$LanguagesTableUpdateCompanionBuilder =
    LanguagesCompanion Function({
      Value<String> code,
      Value<String> name,
      Value<int> rowid,
    });

class $$LanguagesTableFilterComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LanguagesTableOrderingComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LanguagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$LanguagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LanguagesTable,
          Language,
          $$LanguagesTableFilterComposer,
          $$LanguagesTableOrderingComposer,
          $$LanguagesTableAnnotationComposer,
          $$LanguagesTableCreateCompanionBuilder,
          $$LanguagesTableUpdateCompanionBuilder,
          (Language, BaseReferences<_$AppDatabase, $LanguagesTable, Language>),
          Language,
          PrefetchHooks Function()
        > {
  $$LanguagesTableTableManager(_$AppDatabase db, $LanguagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LanguagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LanguagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LanguagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LanguagesCompanion(code: code, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String code,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => LanguagesCompanion.insert(
                code: code,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LanguagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LanguagesTable,
      Language,
      $$LanguagesTableFilterComposer,
      $$LanguagesTableOrderingComposer,
      $$LanguagesTableAnnotationComposer,
      $$LanguagesTableCreateCompanionBuilder,
      $$LanguagesTableUpdateCompanionBuilder,
      (Language, BaseReferences<_$AppDatabase, $LanguagesTable, Language>),
      Language,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<int> rowid,
    });

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      required String channelId,
      required int addedAt,
      Value<int> rowid,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<String> channelId,
      Value<int> addedAt,
      Value<int> rowid,
    });

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get channelId => $composableBuilder(
    column: $table.channelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get channelId => $composableBuilder(
    column: $table.channelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get channelId =>
      $composableBuilder(column: $table.channelId, builder: (column) => column);

  GeneratedColumn<int> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> channelId = const Value.absent(),
                Value<int> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion(
                channelId: channelId,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String channelId,
                required int addedAt,
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion.insert(
                channelId: channelId,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChannelsTableTableManager get channels =>
      $$ChannelsTableTableManager(_db, _db.channels);
  $$FeedsTableTableManager get feeds =>
      $$FeedsTableTableManager(_db, _db.feeds);
  $$StreamsTableTableManager get streams =>
      $$StreamsTableTableManager(_db, _db.streams);
  $$CountriesTableTableManager get countries =>
      $$CountriesTableTableManager(_db, _db.countries);
  $$LanguagesTableTableManager get languages =>
      $$LanguagesTableTableManager(_db, _db.languages);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
