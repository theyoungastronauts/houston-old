// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uuid: json['uuid'] as String,
      id: json['id'] as int,
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'bio': instance.bio,
      'following': instance.following,
      'followers': instance.followers,
      'created_at': instance.createdAt.toIso8601String(),
    };
