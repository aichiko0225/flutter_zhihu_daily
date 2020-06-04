import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_zhihu_daily/commons/manager/routes_manager.dart';
import 'package:flutter_zhihu_daily/config/gank_config.dart';
import 'package:flutter_zhihu_daily/models/index.dart';

class BannerView extends StatefulWidget {

  final List<TopStories> storiesList;

  BannerView({
    this.storiesList,
  });

  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }

}

class _BannerState extends State<BannerView> {

  SwiperController _swiperController;
  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width; 
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _swiperView(height)
      ],
    );
  }

  Widget _swiperView(double height) {
    return Container(
      height: height,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: widget.storiesList.length,
        controller: _swiperController,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) {
          print('点击了第$index');
          var s = widget.storiesList[index];
          var arr = widget.storiesList.map((f) => f.id).toList();
          RouteManager.pushNamed(context, AppRoutes.news_content, arguments: {
            'stories': s,
            'idArr': arr
          });
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: Colors.blueAccent
            )
        ),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    var images = widget.storiesList.map((f) => f.image).toList();
    var title = widget.storiesList[index].title;
    var author = widget.storiesList[index].hint;
    return Stack(
      children: <Widget>[
        Image.network(
          (images[index]),
          fit: BoxFit.fill,
        ),
        Positioned(
          left: 20,
          bottom: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.none
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  author,
                  style: TextStyle(
                    color: Colors.white60,
                    decoration: TextDecoration.none,
                    fontSize: 14
                  ),
                ),
              )
            ],
          )
        ),
      ],
    );
  }
}