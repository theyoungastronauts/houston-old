// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      uuid: json['uuid'] as String,
      body: json['body'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'body': instance.body,
      'owner': instance.owner,
      'children': instance.children,
      'created_at': instance.createdAt.toIso8601String(),
    };
