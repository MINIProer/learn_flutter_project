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
    return JRTextToIconDemo();
  }
}

// 占位图：FadeImage
// 图片缓存：Flutter自行对网络图片进行缓存（内存），默认1000张，100M
class JRPlaceholderImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage('assets/images/fuck.jpg'),
      image: NetworkImage(
          'https://ali-fir-pro-icon.fir.im/570b84a6fe3432977da25c34fc8d61b7d3e3f5f1?auth_key=1583827983-0-0-0f715ca7cee15864116419f6f3d7cd3a'),
      fadeInDuration: Duration(seconds: 3),
      fadeOutDuration: Duration(seconds: 3),
    );
  }
}

// Icon字体图标和Image的区别
// 1. Icon是矢量图，放大缩小不会失贞
// 2. 字体图标可以设置颜色
// 3. 图标很多时，占据的空间会更小
class JRIconsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Icon(Icons.favorite, size: 300, color: Colors.red,);
    return Icon(IconData(0xe06d,
        fontFamily: 'MaterialIcons', matchTextDirection: true), size: 300, color: Colors.red,);
  }
}

// 使用Text组件来展示Icons字体图标注意：
// 1.需要把16进制转换成unicode编码格式
// 2.需要设置对应字体
class JRTextToIconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('\ue06d', style: TextStyle(color: Colors.red, fontFamily:'MaterialIcons'));
  }
}
