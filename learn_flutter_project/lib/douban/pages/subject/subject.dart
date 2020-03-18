import 'package:flutter/material.dart';
import 'subject_content.dart';

class JRSubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('书影音', style: TextStyle(fontSize: 20),),
      ),
      body: JRSubjectContent(),
    );
  }
}