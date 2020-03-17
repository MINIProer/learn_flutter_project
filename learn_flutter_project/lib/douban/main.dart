import 'package:flutter/material.dart';

import 'douban_widgets/dash_line.dart';
import 'douban_widgets/star_rating.dart';

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
    return Scaffold(
        appBar: AppBar(title: Text('豆瓣App')), body: JRHomeContent(context));
  }
}

class JRHomeContent extends StatefulWidget {
  JRHomeContent(BuildContext ctx);

  @override
  _JRHomeContentState createState() => _JRHomeContentState();
}

class _JRHomeContentState extends State<JRHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            child: JRDashLinne(lineColor: Colors.cyan, dashLineWidth: 5, dotCount: 15,),
          ),
          Container(
            height: 200,
            child: JRDashLinne(axis:Axis.vertical, dashLineHeight: 10, dashLineWidth: 1, dotCount: 10, lineColor: Colors.red,),
          )
        ],
      ),
    );
  }
}
