// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      id: json['id'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes.toJson(),
    };
