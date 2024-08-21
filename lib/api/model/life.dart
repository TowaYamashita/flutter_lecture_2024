import 'package:json_annotation/json_annotation.dart';

part 'life.g.dart';

/// 寿命
@JsonSerializable()
class Life {
  /// 寿命(最大)
  final int max;

  /// 寿命(最小)
  final int min;

  Life({required this.max, required this.min});

  factory Life.fromJson(Map<String, dynamic> json) => _$LifeFromJson(json);

  Map<String, dynamic> toJson() => _$LifeToJson(this);
}
