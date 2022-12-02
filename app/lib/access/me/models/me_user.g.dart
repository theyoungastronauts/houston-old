// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MeUser _$$_MeUserFromJson(Map<String, dynamic> json) => _$_MeUser(
      uuid: json['uuid'] as String,
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      bio: json['bio'] as String? ?? "",
      likes:
          (json['liked_posts'] as List<dynamic>).map((e) => e as int).toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_MeUserToJson(_$_MeUser instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'image': instance.image,
      'bio': instance.bio,
      'liked_posts': instance.likes,
      'created_at': instance.createdAt.toIso8601String(),
    };
