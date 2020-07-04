import 'package:json_annotation/json_annotation.dart';
import "storyExtraCount.dart";
part 'storyExtra.g.dart';

@JsonSerializable()
class StoryExtra {
    StoryExtra();

    StoryExtraCount count;
    num vote_status;
    bool favorite;
    
    factory StoryExtra.fromJson(Map<String,dynamic> json) => _$StoryExtraFromJson(json);
    Map<String, dynamic> toJson() => _$StoryExtraToJson(this);
}
