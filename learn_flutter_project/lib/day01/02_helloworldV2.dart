import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JRHomePage(),
    );
  }
}

// 封装首页代码，自定义首页部件JRHomePage
class JRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Flutter',
          textDirection: TextDirection.ltr,
        )
      ),
      body: JRHomePageContentBody(),
    );
  }
}

class JRHomePageContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello Flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 30, 
          color: Colors.red
        ),
      ),
    );
  }
}