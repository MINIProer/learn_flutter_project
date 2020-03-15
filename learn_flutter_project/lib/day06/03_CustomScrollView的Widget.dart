import 'dart:math';

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
    return Scaffold(appBar: AppBar(title: Text('列表测试')), body: JRHomeContent());
  }
}

class JRHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JRCustomScrollViewDemo();
  }
}

// 可以尝试SliverSafeArea & SafeArea的使用
class JRCustomScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding( // 设置sliver的外边距(可以尝试使用Padding来观察二者区别)
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
                return Container(
                  color: Color.fromARGB(
                    255,
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                  ),
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10
            )
          ),
        )
        )
      ],
    );
  }
}
