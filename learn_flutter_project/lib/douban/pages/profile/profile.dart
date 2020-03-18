import 'package:flutter/material.dart';
import 'profile_content.dart';

class JRProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('我的', style: TextStyle(fontSize: 20),),
      ),
      body: JRProfileContent(),
    );
  }
}