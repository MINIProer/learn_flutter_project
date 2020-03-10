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
    return RichTextDemo();
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello World Hello World Hello World Hello World Hello World Hello World \n Hello World Hello World Hello World Hello World Hello World Hello World \n Hello World Hello World Hello World Hello World Hello World Hello World \n Hello World Hello World Hello World Hello World Hello World Hello World \n Hello World Hello World Hello World Hello World Hello World Hello World',   
      maxLines: 3,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontStyle: FontStyle.italic
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Hello Two', 
            style: TextStyle(color: Colors.red)
          ),
          WidgetSpan(
            child: Icon(Icons.fastfood)
          ),
          TextSpan(
            text: 'Hello Two', 
            style: TextStyle(color: Colors.green)
          ),
          WidgetSpan(
            child: Icon(Icons.featured_video)
          ),
          TextSpan(
            text: 'Hello Two', 
            style: TextStyle(color: Colors.blue)
          ),
        ]
      )
    );
  }
}