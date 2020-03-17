import 'package:flutter/material.dart';

class JRDashLinne extends StatelessWidget {
  final Axis axis;
  final double dashLineWidth;
  final double dashLineHeight;
  final int dotCount;
  final Color lineColor;

  JRDashLinne(
      {this.axis = Axis.horizontal,
      this.dashLineWidth = 5,
      this.dashLineHeight = 1,
      this.dotCount = 10,
      this.lineColor = Colors.red
      });

  @override
  Widget build(BuildContext context) {
    return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: axis,
        children: List.generate(dotCount, (_) {
          return SizedBox(
            width: dashLineWidth,
            height: dashLineHeight,
            child: DecoratedBox(decoration: BoxDecoration(color: lineColor)),
          );
        }
      )
    );
  }
}