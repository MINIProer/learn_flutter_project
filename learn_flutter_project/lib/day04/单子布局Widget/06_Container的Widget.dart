import 'dart:collection';
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
    return JRContainerDemo();
  }
}

class JRContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyan,
      width: 200,
      height: 200,
      alignment: Alignment(-1, -1),
      padding: EdgeInsets.all(30), // 内边距
      margin: EdgeInsets.all(10), // 外边距
      child: Icon(Icons.people, size: 50, color: Colors.white,),
      transform: Matrix4.rotationZ(-50),
      // 注意：becoration属性和color属性冲突，所以只能设置其中的一个，根据需求而定
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.cyan,
          width: 5
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(20, 20),
            blurRadius: 5
          )
        ]
      ),
    );
  }
}