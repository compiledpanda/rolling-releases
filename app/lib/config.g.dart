// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      json['title'] as String,
      (json['initiatives'] as List<dynamic>)
          .map((e) => Initiative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'title': instance.title,
      'initiatives': instance.initiatives.map((e) => e.toJson()).toList(),
    };

Initiative _$InitiativeFromJson(Map<String, dynamic> json) => Initiative(
      json['title'] as String?,
      json['description'] as String?,
      (json['features'] as List<dynamic>?)
          ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..releases = (json['releases'] as List<dynamic>?)
        ?.map((e) => Release.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$InitiativeToJson(Initiative instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'features': instance.features?.map((e) => e.toJson()).toList(),
      'releases': instance.releases?.map((e) => e.toJson()).toList(),
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      json['id'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
      json['id'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
