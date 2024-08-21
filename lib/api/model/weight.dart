import 'package:json_annotation/json_annotation.dart';

part 'weight.g.dart';

/// 体重
@JsonSerializable()
class Weight {
  /// 体重(最大)
  final int max;

  /// 体重(最小)
  final int min;

  Weight({required this.max, required this.min});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
