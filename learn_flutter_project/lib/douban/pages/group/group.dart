import 'package:flutter/material.dart';
import 'group_content.dart';

class JRGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('小组', style: TextStyle(fontSize: 20),),
      ),
      body: JRGroupContent(),
    );
  }
}