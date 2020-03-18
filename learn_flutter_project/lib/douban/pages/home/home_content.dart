import 'package:flutter/material.dart';

class JRHomeContent extends StatefulWidget {
  @override
  _JRHomeContentState createState() => _JRHomeContentState();
}

class _JRHomeContentState extends State<JRHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('首页', style: TextStyle(fontSize: 20, color: Colors.green),),
    );
  }
}