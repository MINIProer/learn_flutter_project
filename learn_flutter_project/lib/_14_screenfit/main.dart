import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_project/_14_screenfit/Tools/screen_fit_tool.dart';
import './Extensions/int_extension.dart';
import './Extensions/double_extension.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    JRScreenFitTool.initialize();
    // 1.拿到手机的物理分辨率
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    print('手机的物理分辨率 = $physicalWidth * $physicalHeight');

    // 2.拿到手机的逻辑分辨率（屏幕大小）
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // print('屏幕的宽高 = $width * $height');
    // 注意：上面写法在这里写会报错，因为MaterialApp还没有初始化

    // 2.1 获取dpr
    final dpr = window.devicePixelRatio;
    final width = physicalWidth / dpr;
    final height = physicalHeight / dpr;
    print('根据dpr算出屏幕的宽高 = $width * $height');

    // 3.获取状态栏的高度
    final statusHeight = window.padding.top / dpr;
    print('根据dpr算出状态栏的高度 = $statusHeight');

    return MaterialApp(home: JRHomePage());
  }
}

class JRHomePage extends StatefulWidget {
  @override
  _JRHomePageState createState() => _JRHomePageState();
}

class _JRHomePageState extends State<JRHomePage> {
  @override
  Widget build(BuildContext context) {
    // 2.拿到手机的逻辑分辨率（屏幕大小）
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print('屏幕的宽高 = $width * $height');

    // 3.获取状态栏的高度
    final statusHeight = MediaQuery.of(context).padding.top;
    print('状态栏的高度 = $statusHeight');

    return Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: Container(
          width: 200.px,
          height: 200.0.rpx(),
          color: Colors.red,
          child: Center(
            child: Text(
              '屏幕适配',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ));
  }
}
