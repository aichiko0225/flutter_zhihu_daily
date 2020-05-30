// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stories _$StoriesFromJson(Map<String, dynamic> json) {
  return Stories()
    ..image_hue = json['image_hue'] as String
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..hint = json['hint'] as String
    ..ga_prefix = json['ga_prefix'] as String
    ..images = (json['images'] as List)?.map((e) => e as String)?.toList()
    ..type = json['type'] as num
    ..id = json['id'] as num;
}

Map<String, dynamic> _$StoriesToJson(Stories instance) => <String, dynamic>{
      'image_hue': instance.image_hue,
      'title': instance.title,
      'url': instance.url,
      'hint': instance.hint,
      'ga_prefix': instance.ga_prefix,
      'images': instance.images,
      'type': instance.type,
      'id': instance.id
    };
