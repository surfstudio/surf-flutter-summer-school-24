// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      file: json['file'] as String,
      path: json['path'] as String,
      name: json['name'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'file': instance.file,
      'path': instance.path,
      'name': instance.name,
      'created': instance.created,
    };
