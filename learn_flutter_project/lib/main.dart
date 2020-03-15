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
    return Scaffold(
      appBar: AppBar(title: Text('列表测试')), 
      body: JRHomeContent()
    );
  }
}

class JRHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
