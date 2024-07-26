// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_photo_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseList _$ResponseListFromJson(Map<String, dynamic> json) => ResponseList(
      items: (json['items'] as List<dynamic>)
          .map((e) => ResponseElements.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseListToJson(ResponseList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

ResponseElements _$ResponseElementsFromJson(Map<String, dynamic> json) =>
    ResponseElements(
      items: json['items'] as List<dynamic>?,
    );

Map<String, dynamic> _$ResponseElementsToJson(ResponseElements instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
