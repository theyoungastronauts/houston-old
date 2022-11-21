// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewAsset _$$_NewAssetFromJson(Map<String, dynamic> json) => _$_NewAsset(
      url: json['url'] as String,
      fields: json['fields'] as Map<String, dynamic>,
      exists: json['exists'] as bool,
    );

Map<String, dynamic> _$$_NewAssetToJson(_$_NewAsset instance) =>
    <String, dynamic>{
      'url': instance.url,
      'fields': instance.fields,
      'exists': instance.exists,
    };
