// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      name: json['name'] as String,
      description: json['description'] as String,
      life: Life.fromJson(json['life'] as Map<String, dynamic>),
      maleWeight: Weight.fromJson(json['male_weight'] as Map<String, dynamic>),
      femaleWeight:
          Weight.fromJson(json['female_weight'] as Map<String, dynamic>),
      hypoallergenic: json['hypoallergenic'] as bool,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'life': instance.life.toJson(),
      'male_weight': instance.maleWeight.toJson(),
      'female_weight': instance.femaleWeight.toJson(),
      'hypoallergenic': instance.hypoallergenic,
    };
