import 'package:flutter/material.dart';
import 'package:learn_flutter_project/douban/pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent, // 移除按钮水波纹
        highlightColor: Colors.transparent // 移除按钮水波纹
      ),
      home: JRMainPage()
    );
  }
}