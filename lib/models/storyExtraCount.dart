import 'package:json_annotation/json_annotation.dart';

part 'storyExtraCount.g.dart';

@JsonSerializable()
class StoryExtraCount {
    StoryExtraCount();

    num long_comments;
    num short_comments;
    num comments;
    num likes;
    
    factory StoryExtraCount.fromJson(Map<String,dynamic> json) => _$StoryExtraCountFromJson(json);
    Map<String, dynamic> toJson() => _$StoryExtraCountToJson(this);
}
