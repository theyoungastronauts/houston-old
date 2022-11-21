// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Asset _$$_AssetFromJson(Map<String, dynamic> json) => _$_Asset(
      contentLength: json['content_length'] as int,
      contentType: json['content_type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      exists: json['exists'] as bool,
      isBlocked: json['is_blocked'] as bool,
      isVerified: json['is_verified'] as bool,
      key: json['key'] as String,
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      path: json['path'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$$_AssetToJson(_$_Asset instance) => <String, dynamic>{
      'content_length': instance.contentLength,
      'content_type': instance.contentType,
      'created_at': instance.createdAt.toIso8601String(),
      'exists': instance.exists,
      'is_blocked': instance.isBlocked,
      'is_verified': instance.isVerified,
      'key': instance.key,
      'metadata': instance.metadata,
      'path': instance.path,
      'uuid': instance.uuid,
    };
