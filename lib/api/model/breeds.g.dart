// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breeds _$BreedsFromJson(Map<String, dynamic> json) => Breeds(
      data: (json['data'] as List<dynamic>)
          .map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreedsToJson(Breeds instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
