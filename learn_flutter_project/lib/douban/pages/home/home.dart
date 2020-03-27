import 'package:flutter/material.dart';
import 'home_content.dart';

class JRHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          '首页',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: JRHomeContent(),
    );
  }
}
