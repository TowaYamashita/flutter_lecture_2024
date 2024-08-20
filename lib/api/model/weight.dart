import 'package:json_annotation/json_annotation.dart';

part 'weight.g.dart';

@JsonSerializable()
class Weight {
  final int max;
  final int min;

  Weight({required this.max, required this.min});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
