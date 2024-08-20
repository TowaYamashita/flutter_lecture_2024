import 'package:flutter_lecture_2024/api/model/life.dart';
import 'package:flutter_lecture_2024/api/model/weight.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable(explicitToJson: true)
class Attributes {
  final String name;
  final String description;
  final Life life;
  @JsonKey(name: 'male_weight')
  final Weight maleWeight;
  @JsonKey(name: 'female_weight')
  final Weight femaleWeight;
  final bool hypoallergenic;

  Attributes({
    required this.name,
    required this.description,
    required this.life,
    required this.maleWeight,
    required this.femaleWeight,
    required this.hypoallergenic,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
