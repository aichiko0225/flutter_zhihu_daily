import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu_daily/api/api.dart';
import 'package:flutter_zhihu_daily/models/index.dart';
import 'package:flutter_zhihu_daily/pages/widgets/banner.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {

  List<String> items = [];
  ScrollController _scrollController = ScrollController();

  List<TopStories> _topStoriesArray = [];

  List<Stories> _storiesArray = [];

  int _itemCount() {
    if (items != null) {
      return items.length+1;
    }
    return 1;
  }

  @override
  void initState() {
    super.initState();
    _requestData();
    _scrollController.addListener(() {
      print(_scrollController.offset); //打印滚动位置
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('title'),
      ),
      child: ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildBannerView();
          }else {
            return _buildItemView(index);
          }
        }, 
        separatorBuilder: (context, index) {
          //下划线widget预定义以供复用。  
          Widget divider1 = Divider(color: Colors.blue);
          Widget divider2 = Divider(color: Colors.white);
          if (index == 0) {
            return divider2;
          }else {
            return divider1;
          }
        },
        itemCount: _itemCount()
      )
    );
  }

  Widget _buildBannerView() {
    var arr = _topStoriesArray.map((f) => f.image).toList();
    return BannerView(images: arr);
  }

  Widget _buildItemView(int index) {
    return Container(
      child: Text(items[index-1]),
    );
  }

  Future<void> _requestData() async {
    var newsJson = await ZhihuApi.getLatestNewsData();
    HomeNews newItem = HomeNews.fromJson(newsJson);
    setState(() {
      _topStoriesArray = newItem.top_stories;
      _storiesArray = newItem.stories;
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _scrollController.dispose();
    super.dispose();
  }
}