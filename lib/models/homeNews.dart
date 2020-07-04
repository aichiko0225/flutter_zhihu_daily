import 'package:json_annotation/json_annotation.dart';
import "stories.dart";
import "topStories.dart";
part 'homeNews.g.dart';

@JsonSerializable()
class HomeNews {
    HomeNews();

    String date;
    List<Stories> stories;
    List<TopStories> top_stories;
    
    factory HomeNews.fromJson(Map<String,dynamic> json) => _$HomeNewsFromJson(json);
    Map<String, dynamic> toJson() => _$HomeNewsToJson(this);
}
