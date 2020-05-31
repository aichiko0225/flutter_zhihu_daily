import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerView extends StatefulWidget {

  final List<String> images;

  BannerView({
    this.images,
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
        itemCount: widget.images.length,
        controller: _swiperController,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) {
          print('点击了第$index');
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
    return Image.network(
      (widget.images[index]),
      fit: BoxFit.fill,
    );
  }
}