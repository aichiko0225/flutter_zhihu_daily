import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu_daily/commons/manager/routes_manager.dart';
import 'package:flutter_zhihu_daily/config/gank_config.dart';
import 'package:flutter_zhihu_daily/models/index.dart';

class StoryCell extends StatefulWidget {

  final Stories stories;

  StoryCell({this.stories});

  @override
  State<StatefulWidget> createState() {
    return _StoryCellState();
  }}

class _StoryCellState extends State<StoryCell> {

  double imageWidth  = 70;

  double cellHeight = 100;

  @override
  Widget build(BuildContext context) {
    var title = widget.stories.title;
    var author = widget.stories.hint;
    var imageUrl = widget.stories.images.first;
    return GestureDetector(
      child: Container(
        height: cellHeight,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            _buildTextWidget(title, author),
            Positioned(
              right: 20,
              top: 15,
              child: _buildImageWidget(imageUrl)
            )
          ],
        ),
      ),
      onTap: () {
        var s = widget.stories;
        RouteManager.pushNamed(context, AppRoutes.news_content, arguments: {
          'stories': s,
        });
      },
    );
  }

  Widget _buildImageWidget(String imageUrl) {
    return Container(
      width: imageWidth,
      height: imageWidth,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTextWidget(String title, String author) {
    return Positioned(
      left: 20,
      bottom: 20,
      right: 135,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors. black,
              fontSize: 16
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              author,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14
              ),
            ),
          )
        ],
      )
    );
  }

}