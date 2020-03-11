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
    return PaddingButtonDemo();
  }
}

// 默认情况下，button上下存在一定间距
// 按钮大小变小：ButtonTheme(传入上下文)

class ButtonSupplementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {
        
          }, 
          child: Text('FlatButton1', style: TextStyle(color: Colors.white),),
          color: Colors.red,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // 控制button上下间距
        ),
        ButtonTheme(
          minWidth: 30,
          height: 30,
          child: FlatButton(
            onPressed: () {
          
            }, 
            child: Text('Flat2', style: TextStyle(color: Colors.white),),
            color: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        )
      ],
    );
  }
}


class PaddingButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      height: 5,
      child: FlatButton(
        onPressed: () {
      
        }, 
        child: Text('FlatButton1', style: TextStyle(color: Colors.white),),
        color: Colors.red,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // 控制button上下间距
        padding: EdgeInsets.all(0), // 设置内边距都为0，同时还要设置buttontheme的height属性才能看到效果
      ),
    );
  }
}