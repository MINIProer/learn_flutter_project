import 'package:flutter/material.dart';

class JRCommonSpacingItem extends StatelessWidget {
  
  final double height;
  final double widht;

  JRCommonSpacingItem({this.height, this.widht});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: this.height, width: this.widht,);
  }
}