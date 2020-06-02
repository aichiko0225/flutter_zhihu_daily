import 'package:flutter/material.dart';

class RouteManager {

  static RouteManager get instance => _getInstance();
  static RouteManager _instance;

  RouteManager._init() {
    // 初始化
  }

  static RouteManager _getInstance() {
    if (_instance == null) {
      _instance = RouteManager._init();
    }
    return _instance;
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    // Navigator.pushNamed(context, HomePage.ROUTER_NAME);
  }
}