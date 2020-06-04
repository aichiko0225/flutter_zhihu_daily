import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu_daily/config/gank_config.dart';
import 'package:flutter_zhihu_daily/pages/home.dart';
import 'package:flutter_zhihu_daily/pages/news_content.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      routes: {
        AppRoutes.news_content: (context) => NewsContentPage()
      },
      theme: CupertinoThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        barBackgroundColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}
