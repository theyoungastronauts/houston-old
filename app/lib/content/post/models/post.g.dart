// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      body: json['body'] as String? ?? "",
      numAssets: json['num_assets'] as int? ?? 0,
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'owner': instance.owner,
      'body': instance.body,
      'num_assets': instance.numAssets,
      'assets': instance.assets,
      'created_at': instance.createdAt.toIso8601String(),
    };
