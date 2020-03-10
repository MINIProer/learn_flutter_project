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
    return ButtonDemo();
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 1.凸起效果的Button
        RaisedButton(
            child: Text('RisedButton'),
            textColor: Colors.white,
            color: Colors.red,
            onPressed: () {
              print('这是一个RisedButton');
            }),

        // 2.FlatButton
        FlatButton(
          onPressed: () {
            print('这是一个FlatButton');
          },
          child: Text('FlatButton'),
          textColor: Colors.white,
          color: Colors.green,
        ),

        // 3.OutlineButton
        OutlineButton(
          onPressed: () {
            print('带有边框的Button');
          },
          child: Text('OutlineButton'),
          textColor: Colors.yellow,
        ),

        //4.FloatingButton
        FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton 浮动按钮');
          },
          child: Icon(Icons.favorite),
        ),

        // 5.自定义按钮
        FlatButton(onPressed: () {

        }, 
        child: Row(
          mainAxisSize: MainAxisSize.min, // 如果不设置这个属性，按钮会铺满整行
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red),
            Text('自定义按钮', style: TextStyle(color: Colors.cyan),)
          ],
        ),
        color: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      )
      ],
    );
  }
}
