// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storyExtra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryExtra _$StoryExtraFromJson(Map<String, dynamic> json) {
  return StoryExtra()
    ..count = json['count'] == null
        ? null
        : StoryExtraCount.fromJson(json['count'] as Map<String, dynamic>)
    ..vote_status = json['vote_status'] as num
    ..favorite = json['favorite'] as bool;
}

Map<String, dynamic> _$StoryExtraToJson(StoryExtra instance) =>
    <String, dynamic>{
      'count': instance.count,
      'vote_status': instance.vote_status,
      'favorite': instance.favorite
    };
