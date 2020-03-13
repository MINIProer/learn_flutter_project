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
    return JRPaddingDemo();
  }
}

class JRPaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('张三', style: TextStyle(fontSize: 30, color: Colors.black, backgroundColor: Colors.cyan),),
        Padding(
          padding: EdgeInsets.only(
            bottom: 10
          )
        ),
        Text('张三', style: TextStyle(fontSize: 30, color: Colors.black, backgroundColor: Colors.cyan),),
        SizedBox(
          height: 5,
        ),
        Text('张三', style: TextStyle(fontSize: 30, color: Colors.black, backgroundColor: Colors.cyan),),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 100, 0, 0)
        ),
        Text('张三', style: TextStyle(fontSize: 30, color: Colors.black, backgroundColor: Colors.cyan),),
        Padding(
          padding: EdgeInsets.only(
            bottom: 2
          )
        ),
        Text('张三', style: TextStyle(fontSize: 30, color: Colors.black, backgroundColor: Colors.cyan),),
      ],
    );
  }
}