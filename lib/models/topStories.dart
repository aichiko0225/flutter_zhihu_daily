import 'package:json_annotation/json_annotation.dart';

part 'topStories.g.dart';

@JsonSerializable()
class TopStories {
    TopStories();

    String image_hue;
    String hint;
    String url;
    String image;
    String title;
    String ga_prefix;
    num type;
    num id;
    
    factory TopStories.fromJson(Map<String,dynamic> json) => _$TopStoriesFromJson(json);
    Map<String, dynamic> toJson() => _$TopStoriesToJson(this);
}
