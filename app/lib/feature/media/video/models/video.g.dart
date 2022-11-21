// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Video _$$_VideoFromJson(Map<String, dynamic> json) => _$_Video(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String? ?? 'https://google.com',
      viewCount: json['view_count'] as int? ?? 0,
      owner: json['owner'],
    );

Map<String, dynamic> _$$_VideoToJson(_$_Video instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'view_count': instance.viewCount,
      'owner': instance.owner,
    };
