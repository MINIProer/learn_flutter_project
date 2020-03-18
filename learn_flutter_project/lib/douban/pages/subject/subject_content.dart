import 'package:flutter/material.dart';

class JRSubjectContent extends StatefulWidget {
  @override
  _JRSubjectContentState createState() => _JRSubjectContentState();
}

class _JRSubjectContentState extends State<JRSubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('书影音', style: TextStyle(fontSize: 20, color: Colors.green),),
    );
  }
}