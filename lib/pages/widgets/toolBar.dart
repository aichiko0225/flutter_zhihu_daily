
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu_daily/api/api.dart';
import 'package:flutter_zhihu_daily/models/index.dart';

class ToolBar extends StatefulWidget {

  final num id;

  const ToolBar({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ToolBarState();
  }
}

class _ToolBarState extends State<ToolBar> {

  StoryExtra _storyExtra;

  @override
  Widget build(BuildContext context) {
    // var img = AssetImage("static/images/News_Navigation_Arrow@2x.png");
    var img = Image.asset(
      'static/images/News_Navigation_Arrow@2x.png',
      width: 56,
      height: 50,
    );
    return Container(
      color: Color(0xffF5F5F5),
      child: img
    );
  }

  @override
  void initState() {
    super.initState();
    requestCommentsData();
  }
  
  void requestCommentsData() async {
    if (_storyExtra != null) {
      return;
    }
    var newsJson = await ZhihuApi.getNewsStoryExtraData(widget.id.toInt());
    StoryExtra content = StoryExtra.fromJson(newsJson);
    setState(() {
      _storyExtra = content;
    });
  }
}
