import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/AutoSize.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AutoSize.init(
        context: context,
        designWidth: 1080,
        designHeight: 1920,
        designDevicePixelRatio: 3.0,
        aspect: Aspect.aspectWidth);
    var devicePixelRatio = window.devicePixelRatio;
    print("devicePixelRatio : $devicePixelRatio");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var ratio = MediaQuery.of(context).devicePixelRatio;
    print("width : ${size.width} height : ${size.height} ratio : $ratio");
    // 设计稿是 wxh = 1080 x 1920 像素密度 3
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: AutoSize.covert.pxToDp(360),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.red,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(360),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.blue,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(360),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.red,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: AutoSize.covert.dpToDp(180),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.black,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(540),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.blue,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: AutoSize.covert.pxToDp(360),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.red,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(360),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.blue,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(360),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.red,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: AutoSize.covert.dpToDp(180),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.black,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(540),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.blue,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: AutoSize.covert.pxToDp(100),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.red,
                      ),
                      Container(
                        width: AutoSize.covert.pxToDp(980),
                        height: AutoSize.covert.pxToDp(300),
                        color: Colors.blue,
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
