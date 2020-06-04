import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zhihu_daily/api/api.dart';
import 'package:flutter_zhihu_daily/models/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentState();
  }
}

class _ContentState extends State<NewsContentPage> {
  List<num> idArray;
  TopStories stories;

  NewsContent _newsContent;

  WebView _webView;

  String _webUrl = '';

  double height = 200;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    _controller.future.whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as Map;
    idArray = args['idArr'];
    stories = args['stories'];
    height = MediaQuery.of(context).size.width;
    requestContentData();
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              bottom: 44,
              top: -44,
              child: _webview(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 44,
              child: Container(color: Colors.red),
            )
          ],
        ),
    ));
  }

  Widget _imageView() {
    return Image.network(
      (stories.image),
      fit: BoxFit.fill,
    );
  }

  Widget _titleView() {
    if (_newsContent == null) {
      return Text('知乎日报');
    }
    return Text(
      _newsContent.title,
      maxLines: 1,
      style: TextStyle(),
    );
  }

  Widget _webview() {
    if (_webUrl != null) {
      _webView = WebView(
            onWebViewCreated: (WebViewController controller) {
              _controller.complete(controller);
            },
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _webUrl,
            onPageFinished: (url) {
              print('=======$url');
            },
          );
    }
    return _webUrl.isEmpty
        ? Container(
            color: Colors.white,
          )
        : _webView;
  }

  void requestContentData() async {
    if (_newsContent != null) {
      return;
    }
    var id = stories.id;
    var newsJson = await ZhihuApi.getNewsContentData(id);
    NewsContent content = NewsContent.fromJson(newsJson);
    String htmlStr = _getHtmlString(content.css, content.body);
    _writeDataFile(htmlStr, _fileName(content.id));
    setState(() {
      _newsContent = content;
    });
  }

  String _getHtmlString(List cssList, String body) {
    var _css = '';
    for (var css in cssList) {
      _css += '<link rel="stylesheet" type="text/css" href="$css">';
    }
    _css += '<link rel="stylesheet" type="text/css" href="./app.css">';

    var _header = '<head>'
        '<meta charset="UTF-8">'
        '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
        '$_css'
        '<title>Document</title>'
        '</head>';
    var _body = _bodyText(body);

    var str = '<!DOCTYPE html>'
        '<html lang="en">'
        '$_header'
        '<body>'
        '$_body'
        '</body>'
        '</html>';

    return str;
  }

  String _bodyText(String body) {
    if (!body.contains('img-place-holder')) {
      return body;
    }
    var image = stories.image;
    var img = '<img src="$image"/>';
    // Match match = body.matchAsPrefix('"img-place-holder\">');
    var newBody;
    var strArr = body.split('<div class="img-place-holder">');
    if (strArr.isNotEmpty) {
      newBody = strArr[0] + '<div class="img-place-holder">' + img + strArr[1];
    }else {
      newBody = body;
    }
    return newBody;
  }

  void _writeDataFile(String data, String fileName) async {
    File file = await _getLocalHtmlFile(fileName);
    File afterFile = await file.writeAsString(data);
    var cssStr = '.headline .img-place-holder {'
                  'height: auto'
                  '}';
    File cssFile = await _getLocalCssFile();
    File tafterFile = await cssFile.writeAsString(cssStr);
    setState(() {
      _webUrl = afterFile.uri.toString();
    });
    print('weburl ==== $_webUrl');
  }

  Future<File> _getLocalHtmlFile(String fileName) async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    // 返回本地文件目录
    return new File('$dir/$fileName');
  }

  String _fileName(num id) {
    return "file_html_$id.html";
  }

  Future<File> _getLocalCssFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    // 返回本地文件目录
    return File('$dir/app.css');
  }
}
