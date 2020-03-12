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
    return JRAlignSizeFactorDemo();
  }
}

// 下面两个Demo可以看出，作用相同，因为Center组件就是继承自Align组件
class JRCenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Center组件',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20
        ),
      ),
    );
  }
}

class JRAlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.cyan,
      child: Align(
        alignment: Alignment(0, -1),
        child: Text(
          'Align组件',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}

// widthFactor & heightFactor的作用当前align组件size为child子组件的大小的宽高的倍数
class JRAlignSizeFactorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 10,
      heightFactor: 10,
      alignment: Alignment(-1, 1),
      child: Icon(
        Icons.people,
        size: 20,
      )
    );
  }
}