// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uuid: json['uuid'] as String,
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
    };
