import 'package:json_annotation/json_annotation.dart';

part 'stories.g.dart';

@JsonSerializable()
class Stories {
    Stories();

    String image_hue;
    String title;
    String url;
    String hint;
    String ga_prefix;
    List<String> images;
    num type;
    num id;
    
    factory Stories.fromJson(Map<String,dynamic> json) => _$StoriesFromJson(json);
    Map<String, dynamic> toJson() => _$StoriesToJson(this);
}
