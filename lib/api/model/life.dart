import 'package:json_annotation/json_annotation.dart';

part 'life.g.dart';

@JsonSerializable()
class Life {
  final int max;
  final int min;

  Life({required this.max, required this.min});

  factory Life.fromJson(Map<String, dynamic> json) => _$LifeFromJson(json);

  Map<String, dynamic> toJson() => _$LifeToJson(this);
}
