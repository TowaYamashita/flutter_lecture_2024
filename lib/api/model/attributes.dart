import 'package:flutter_lecture_2024/api/model/life.dart';
import 'package:flutter_lecture_2024/api/model/weight.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

/// 犬種に関する情報
@JsonSerializable(explicitToJson: true)
class Attributes {
  /// 犬種名
  final String name;

  /// 犬種に関する説明
  final String description;

  /// 寿命
  final Life life;
  @JsonKey(name: 'male_weight')
  final Weight maleWeight;
  @JsonKey(name: 'female_weight')
  final Weight femaleWeight;

  /// 低アレルギー性かどうか
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
