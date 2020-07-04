// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storyExtraCount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryExtraCount _$StoryExtraCountFromJson(Map<String, dynamic> json) {
  return StoryExtraCount()
    ..long_comments = json['long_comments'] as num
    ..short_comments = json['short_comments'] as num
    ..comments = json['comments'] as num
    ..likes = json['likes'] as num;
}

Map<String, dynamic> _$StoryExtraCountToJson(StoryExtraCount instance) =>
    <String, dynamic>{
      'long_comments': instance.long_comments,
      'short_comments': instance.short_comments,
      'comments': instance.comments,
      'likes': instance.likes
    };
