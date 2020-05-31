import 'package:flutter_zhihu_daily/commons/network/http_manager.dart';
import 'package:flutter_zhihu_daily/commons/network/http_response.dart';

class ZhihuApi {
  static const API_HOST = "http://news-at.zhihu.com/api/4";
  /// 最新消息
  static const API_LATEST = "$API_HOST/news/latest";


  ///获取最新消息
  static getLatestNewsData() async  {
    HttpResponse response = await HttpManager.instance.request(API_LATEST);
    return response.data;
  }

}
