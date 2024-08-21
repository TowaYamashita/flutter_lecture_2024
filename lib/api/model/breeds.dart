import 'package:flutter_lecture_2024/api/model/breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeds.g.dart';

/// 犬種(複数)
@JsonSerializable(explicitToJson: true)
class Breeds {
  final List<Breed> data;

  Breeds({required this.data});

  factory Breeds.fromJson(Map<String, dynamic> json) => _$BreedsFromJson(json);

  Map<String, dynamic> toJson() => _$BreedsToJson(this);
}
