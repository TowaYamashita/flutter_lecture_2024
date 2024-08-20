import 'package:flutter_lecture_2024/api/model/attributes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed.g.dart';

@JsonSerializable(explicitToJson: true)
class Breed {
  final String id;
  final Attributes attributes;

  Breed({
    required this.id,
    required this.attributes,
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);
}
