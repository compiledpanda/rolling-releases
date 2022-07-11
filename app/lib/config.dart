import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(explicitToJson: true)
class Config {
  Config(this.title, this.initiatives);
  String title;
  List<Initiative> initiatives;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Initiative {
  Initiative(this.title, this.description, this.features);
  String? title;
  String? description;
  List<Feature>? features;
  List<Release>? releases;

  factory Initiative.fromJson(Map<String, dynamic> json) =>
      _$InitiativeFromJson(json);
  Map<String, dynamic> toJson() => _$InitiativeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Feature {
  Feature(this.id, this.title);
  String? id;
  String? title;

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Release {
  Release(this.id, this.title);
  String? id;
  String? title;

  factory Release.fromJson(Map<String, dynamic> json) =>
      _$ReleaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}
