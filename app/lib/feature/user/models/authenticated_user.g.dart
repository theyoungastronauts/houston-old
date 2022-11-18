// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticatedUser _$$_AuthenticatedUserFromJson(Map<String, dynamic> json) =>
    _$_AuthenticatedUser(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_AuthenticatedUserToJson(
        _$_AuthenticatedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
    };
