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
    );

Map<String, dynamic> _$InitiativeToJson(Initiative instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
