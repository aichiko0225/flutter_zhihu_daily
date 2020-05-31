// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeNews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNews _$HomeNewsFromJson(Map<String, dynamic> json) {
  return HomeNews()
    ..date = json['date'] as String
    ..stories = (json['stories'] as List)
        ?.map((e) =>
            e == null ? null : Stories.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..top_stories = (json['top_stories'] as List)
        ?.map((e) =>
            e == null ? null : TopStories.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeNewsToJson(HomeNews instance) => <String, dynamic>{
      'date': instance.date,
      'stories': instance.stories,
      'top_stories': instance.top_stories
    };
