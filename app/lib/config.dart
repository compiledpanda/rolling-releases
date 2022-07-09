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
  Initiative(this.title, this.description);
  String? title;
  String? description;

  factory Initiative.fromJson(Map<String, dynamic> json) =>
      _$InitiativeFromJson(json);
  Map<String, dynamic> toJson() => _$InitiativeToJson(this);
}
