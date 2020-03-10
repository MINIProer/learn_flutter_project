import 'dart:ui';

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: JRHomePage());
  }
}

class JRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: JRHomeContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class JRHomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JRHomeContentState();
  }
}

class _JRHomeContentState extends State<JRHomeContent> {
  @override
  Widget build(BuildContext context) {
    return AssetsImageDemo();
  }
}

class NetworkImageDemo extends StatelessWidget {
  final imageUrl = 'https://www.baidu.com/img/baidu_resultlogo@2.png';

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
      width: 300,
      height: 300,
      // fit: BoxFit.cover,
      color: Colors.red,
      colorBlendMode: BlendMode.colorBurn, // 颜色混入模式
      alignment: Alignment(0, 1),
    );
  }
}

class AssetsImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 1.在flutter项目中创建一个文件夹，来存储本地图片
    // 2.在pubspec.yaml进行配置
    // 3.使用图片

    return Image.asset('assets/images/fuck.jpg', width: 100, height: 100,);
  }
}
