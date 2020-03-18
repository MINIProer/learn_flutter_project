import 'package:flutter/material.dart';

class JRProfileContent extends StatefulWidget {
  @override
  _JRProfileContentState createState() => _JRProfileContentState();
}

class _JRProfileContentState extends State<JRProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的', style: TextStyle(fontSize: 20, color: Colors.green),),
    );
  }
}