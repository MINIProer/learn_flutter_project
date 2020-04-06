import 'package:flutter/material.dart';

class JRImageDetailPage extends StatelessWidget {
  String imageUrl;
  JRImageDetailPage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Hero(
            tag: this.imageUrl,
            child: GestureDetector(
              child: Image.network(imageUrl),
              onTapDown: (details) {
                Navigator.of(context).pop();
              },
            )),
      ),
    );
  }
}
