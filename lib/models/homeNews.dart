import 'package:json_annotation/json_annotation.dart';
import "stories.dart";
import "topStories.dart";
part 'homeNews.g.dart';

@JsonSerializable()
class HomeNews {
    HomeNews();

    String date;
    /// 当日新闻
    List<Stories> stories;
    /// 界面顶部 ViewPager 滚动显示的显示内容（子项格式同上）
    List<TopStories> top_stories;
    
    factory HomeNews.fromJson(Map<String,dynamic> json) => _$HomeNewsFromJson(json);
    Map<String, dynamic> toJson() => _$HomeNewsToJson(this);
}
