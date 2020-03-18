import 'package:flutter/material.dart';
import 'mall_content.dart';

class JRMallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('市集', style: TextStyle(fontSize: 20),),
      ),
      body: JRMallContent(),
    );
  }
}