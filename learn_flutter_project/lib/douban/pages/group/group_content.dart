import 'package:flutter/material.dart';

class JRGroupContent extends StatefulWidget {
  @override
  _JRGroupContentState createState() => _JRGroupContentState();
}

class _JRGroupContentState extends State<JRGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('小组', style: TextStyle(fontSize: 20, color: Colors.green),),
    );
  }
}