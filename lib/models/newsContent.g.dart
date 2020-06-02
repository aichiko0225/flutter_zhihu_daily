// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsContent _$NewsContentFromJson(Map<String, dynamic> json) {
  return NewsContent()
    ..body = json['body'] as String
    ..image_source = json['image_source'] as String
    ..title = json['title'] as String
    ..image = json['image'] as String
    ..share_url = json['share_url'] as String
    ..js = json['js'] as List
    ..ga_prefix = json['ga_prefix'] as String
    ..section = json['section'] as Map<String, dynamic>
    ..images = json['images'] as List
    ..type = json['type'] as num
    ..id = json['id'] as num
    ..css = json['css'] as List;
}

Map<String, dynamic> _$NewsContentToJson(NewsContent instance) =>
    <String, dynamic>{
      'body': instance.body,
      'image_source': instance.image_source,
      'title': instance.title,
      'image': instance.image,
      'share_url': instance.share_url,
      'js': instance.js,
      'ga_prefix': instance.ga_prefix,
      'section': instance.section,
      'images': instance.images,
      'type': instance.type,
      'id': instance.id,
      'css': instance.css
    };
