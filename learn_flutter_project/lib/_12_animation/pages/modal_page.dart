import 'package:flutter/material.dart';

class JRModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Page'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
        child: Text('Modal Page'),
      ),
      ),
    );
  }
}