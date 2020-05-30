// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topStories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopStories _$TopStoriesFromJson(Map<String, dynamic> json) {
  return TopStories()
    ..image_hue = json['image_hue'] as String
    ..hint = json['hint'] as String
    ..url = json['url'] as String
    ..image = json['image'] as String
    ..title = json['title'] as String
    ..ga_prefix = json['ga_prefix'] as String
    ..type = json['type'] as num
    ..id = json['id'] as num;
}

Map<String, dynamic> _$TopStoriesToJson(TopStories instance) =>
    <String, dynamic>{
      'image_hue': instance.image_hue,
      'hint': instance.hint,
      'url': instance.url,
      'image': instance.image,
      'title': instance.title,
      'ga_prefix': instance.ga_prefix,
      'type': instance.type,
      'id': instance.id
    };
