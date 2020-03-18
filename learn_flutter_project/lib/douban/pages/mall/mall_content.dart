import 'package:flutter/material.dart';

class JRMallContent extends StatefulWidget {
  @override
  _JRMallContentState createState() => _JRMallContentState();
}

class _JRMallContentState extends State<JRMallContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('市集', style: TextStyle(fontSize: 20, color: Colors.green),),
    );
  }
}