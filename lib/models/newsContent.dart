import 'package:json_annotation/json_annotation.dart';

part 'newsContent.g.dart';

@JsonSerializable()
class NewsContent {
    NewsContent();

    String body;
    String image_source;
    String title;
    String image;
    String share_url;
    List js;
    String ga_prefix;
    Map<String,dynamic> section;
    List images;
    num type;
    num id;
    List css;
    
    factory NewsContent.fromJson(Map<String,dynamic> json) => _$NewsContentFromJson(json);
    Map<String, dynamic> toJson() => _$NewsContentToJson(this);
}
