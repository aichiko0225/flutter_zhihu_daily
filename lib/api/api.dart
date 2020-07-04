import 'package:flutter_zhihu_daily/commons/network/http_manager.dart';
import 'package:flutter_zhihu_daily/commons/network/http_response.dart';

class ZhihuApi {
  static const API_HOST = "http://news-at.zhihu.com/api/4";
  static const API_HOST_7 = "http://news-at.zhihu.com/api/7";
  /// 最新消息
  static const API_LATEST = "$API_HOST/news/latest";

  // https://news-at.zhihu.com/api/7/story-extra/9725413

  // https://daily.zhihu.com/story/9725375

  /// 消息内容获取与离线下载
  static String apiContent(int id) {
    return "$API_HOST_7/news/$id";
  }

  static String apiStoryExtra(int id) {
    return "$API_HOST_7/story-extra/$id";
  }

  ///获取最新消息
  static getLatestNewsData() async  {
    HttpResponse response = await HttpManager.instance.request(API_LATEST);
    return response.data;
  }

  static getNewsContentData(num id) async  {
    HttpResponse response = await HttpManager.instance.request(apiContent(id));
    return response.data;
  }

  static getNewsStoryExtraData(num id) async  {
    HttpResponse response = await HttpManager.instance.request(apiStoryExtra(id));
    return response.data;
  }
}
